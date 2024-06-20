; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1438 () Bool)

(assert start!1438)

(declare-fun b!6830 () Bool)

(declare-fun res!7732 () Bool)

(declare-fun e!4319 () Bool)

(assert (=> b!6830 (=> res!7732 e!4319)))

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> b!6830 (= res!7732 (bvsgt nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-fun b!6831 () Bool)

(declare-fun e!4314 () Bool)

(declare-datatypes ((array!476 0))(
  ( (array!477 (arr!605 (Array (_ BitVec 32) (_ BitVec 8))) (size!206 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!390 0))(
  ( (BitStream!391 (buf!536 array!476) (currentByte!1533 (_ BitVec 32)) (currentBit!1528 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!390)

(declare-fun array_inv!201 (array!476) Bool)

(assert (=> b!6831 (= e!4314 (array_inv!201 (buf!536 thiss!1486)))))

(declare-fun b!6832 () Bool)

(declare-fun res!7728 () Bool)

(declare-fun e!4315 () Bool)

(assert (=> b!6832 (=> (not res!7728) (not e!4315))))

(declare-datatypes ((Unit!534 0))(
  ( (Unit!535) )
))
(declare-datatypes ((tuple2!916 0))(
  ( (tuple2!917 (_1!483 Unit!534) (_2!483 BitStream!390)) )
))
(declare-fun lt!8781 () tuple2!916)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6832 (= res!7728 (= (bitIndex!0 (size!206 (buf!536 (_2!483 lt!8781))) (currentByte!1533 (_2!483 lt!8781)) (currentBit!1528 (_2!483 lt!8781))) (bvadd (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)) nBits!460)))))

(declare-fun res!7731 () Bool)

(declare-fun e!4318 () Bool)

(assert (=> start!1438 (=> (not res!7731) (not e!4318))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!476)

(assert (=> start!1438 (= res!7731 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!206 srcBuffer!6))))))))

(assert (=> start!1438 e!4318))

(assert (=> start!1438 true))

(assert (=> start!1438 (array_inv!201 srcBuffer!6)))

(declare-fun inv!12 (BitStream!390) Bool)

(assert (=> start!1438 (and (inv!12 thiss!1486) e!4314)))

(declare-fun b!6833 () Bool)

(declare-fun res!7725 () Bool)

(assert (=> b!6833 (=> (not res!7725) (not e!4318))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6833 (= res!7725 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 thiss!1486))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) nBits!460))))

(declare-fun b!6834 () Bool)

(declare-fun e!4317 () Bool)

(assert (=> b!6834 (= e!4315 (not e!4317))))

(declare-fun res!7723 () Bool)

(assert (=> b!6834 (=> res!7723 e!4317)))

(declare-datatypes ((List!106 0))(
  ( (Nil!103) (Cons!102 (h!221 Bool) (t!856 List!106)) )
))
(declare-fun lt!8782 () List!106)

(declare-datatypes ((tuple2!918 0))(
  ( (tuple2!919 (_1!484 array!476) (_2!484 BitStream!390)) )
))
(declare-fun lt!8783 () tuple2!918)

(declare-fun byteArrayBitContentToList!0 (BitStream!390 array!476 (_ BitVec 64) (_ BitVec 64)) List!106)

(assert (=> b!6834 (= res!7723 (not (= (byteArrayBitContentToList!0 (_2!483 lt!8781) (_1!484 lt!8783) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!8782)))))

(declare-datatypes ((tuple2!920 0))(
  ( (tuple2!921 (_1!485 BitStream!390) (_2!485 BitStream!390)) )
))
(declare-fun lt!8778 () tuple2!920)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!390 BitStream!390 (_ BitVec 64)) List!106)

(assert (=> b!6834 (= lt!8782 (bitStreamReadBitsIntoList!0 (_2!483 lt!8781) (_1!485 lt!8778) nBits!460))))

(declare-fun readBits!0 (BitStream!390 (_ BitVec 64)) tuple2!918)

(assert (=> b!6834 (= lt!8783 (readBits!0 (_1!485 lt!8778) nBits!460))))

(assert (=> b!6834 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!8781)))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) nBits!460)))

(declare-fun lt!8780 () Unit!534)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!390 array!476 (_ BitVec 64)) Unit!534)

(assert (=> b!6834 (= lt!8780 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!536 (_2!483 lt!8781)) nBits!460))))

(declare-fun reader!0 (BitStream!390 BitStream!390) tuple2!920)

(assert (=> b!6834 (= lt!8778 (reader!0 thiss!1486 (_2!483 lt!8781)))))

(declare-fun b!6835 () Bool)

(declare-fun res!7730 () Bool)

(assert (=> b!6835 (=> (not res!7730) (not e!4315))))

(assert (=> b!6835 (= res!7730 (= (size!206 (buf!536 thiss!1486)) (size!206 (buf!536 (_2!483 lt!8781)))))))

(declare-fun b!6836 () Bool)

(declare-fun res!7729 () Bool)

(assert (=> b!6836 (=> (not res!7729) (not e!4315))))

(declare-fun isPrefixOf!0 (BitStream!390 BitStream!390) Bool)

(assert (=> b!6836 (= res!7729 (isPrefixOf!0 thiss!1486 (_2!483 lt!8781)))))

(declare-fun b!6837 () Bool)

(assert (=> b!6837 (= e!4319 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_1!485 lt!8778)))) ((_ sign_extend 32) (currentByte!1533 (_1!485 lt!8778))) ((_ sign_extend 32) (currentBit!1528 (_1!485 lt!8778))) nBits!460))))

(declare-fun b!6838 () Bool)

(assert (=> b!6838 (= e!4317 e!4319)))

(declare-fun res!7724 () Bool)

(assert (=> b!6838 (=> res!7724 e!4319)))

(declare-fun checkByteArrayBitContent!0 (BitStream!390 array!476 array!476 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6838 (= res!7724 (not (checkByteArrayBitContent!0 (_2!483 lt!8781) srcBuffer!6 (_1!484 lt!8783) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!8779 () Unit!534)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!390 array!476 array!476 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!534)

(assert (=> b!6838 (= lt!8779 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!483 lt!8781) srcBuffer!6 (_1!484 lt!8783) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6839 () Bool)

(assert (=> b!6839 (= e!4318 e!4315)))

(declare-fun res!7727 () Bool)

(assert (=> b!6839 (=> (not res!7727) (not e!4315))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6839 (= res!7727 (invariant!0 (currentBit!1528 (_2!483 lt!8781)) (currentByte!1533 (_2!483 lt!8781)) (size!206 (buf!536 (_2!483 lt!8781)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!390 array!476 (_ BitVec 64) (_ BitVec 64)) tuple2!916)

(assert (=> b!6839 (= lt!8781 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6840 () Bool)

(declare-fun res!7726 () Bool)

(assert (=> b!6840 (=> res!7726 e!4317)))

(assert (=> b!6840 (= res!7726 (not (= lt!8782 (byteArrayBitContentToList!0 (_2!483 lt!8781) srcBuffer!6 from!367 nBits!460))))))

(assert (= (and start!1438 res!7731) b!6833))

(assert (= (and b!6833 res!7725) b!6839))

(assert (= (and b!6839 res!7727) b!6835))

(assert (= (and b!6835 res!7730) b!6832))

(assert (= (and b!6832 res!7728) b!6836))

(assert (= (and b!6836 res!7729) b!6834))

(assert (= (and b!6834 (not res!7723)) b!6840))

(assert (= (and b!6840 (not res!7726)) b!6838))

(assert (= (and b!6838 (not res!7724)) b!6830))

(assert (= (and b!6830 (not res!7732)) b!6837))

(assert (= start!1438 b!6831))

(declare-fun m!8633 () Bool)

(assert (=> b!6839 m!8633))

(declare-fun m!8635 () Bool)

(assert (=> b!6839 m!8635))

(declare-fun m!8637 () Bool)

(assert (=> start!1438 m!8637))

(declare-fun m!8639 () Bool)

(assert (=> start!1438 m!8639))

(declare-fun m!8641 () Bool)

(assert (=> b!6838 m!8641))

(declare-fun m!8643 () Bool)

(assert (=> b!6838 m!8643))

(declare-fun m!8645 () Bool)

(assert (=> b!6832 m!8645))

(declare-fun m!8647 () Bool)

(assert (=> b!6832 m!8647))

(declare-fun m!8649 () Bool)

(assert (=> b!6831 m!8649))

(declare-fun m!8651 () Bool)

(assert (=> b!6833 m!8651))

(declare-fun m!8653 () Bool)

(assert (=> b!6837 m!8653))

(declare-fun m!8655 () Bool)

(assert (=> b!6840 m!8655))

(declare-fun m!8657 () Bool)

(assert (=> b!6836 m!8657))

(declare-fun m!8659 () Bool)

(assert (=> b!6834 m!8659))

(declare-fun m!8661 () Bool)

(assert (=> b!6834 m!8661))

(declare-fun m!8663 () Bool)

(assert (=> b!6834 m!8663))

(declare-fun m!8665 () Bool)

(assert (=> b!6834 m!8665))

(declare-fun m!8667 () Bool)

(assert (=> b!6834 m!8667))

(declare-fun m!8669 () Bool)

(assert (=> b!6834 m!8669))

(check-sat (not b!6837) (not start!1438) (not b!6833) (not b!6831) (not b!6832) (not b!6834) (not b!6839) (not b!6836) (not b!6838) (not b!6840))
(check-sat)
(get-model)

(declare-fun d!2120 () Bool)

(declare-fun res!7770 () Bool)

(declare-fun e!4346 () Bool)

(assert (=> d!2120 (=> (not res!7770) (not e!4346))))

(assert (=> d!2120 (= res!7770 (= (size!206 (buf!536 thiss!1486)) (size!206 (buf!536 (_2!483 lt!8781)))))))

(assert (=> d!2120 (= (isPrefixOf!0 thiss!1486 (_2!483 lt!8781)) e!4346)))

(declare-fun b!6880 () Bool)

(declare-fun res!7771 () Bool)

(assert (=> b!6880 (=> (not res!7771) (not e!4346))))

(assert (=> b!6880 (= res!7771 (bvsle (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)) (bitIndex!0 (size!206 (buf!536 (_2!483 lt!8781))) (currentByte!1533 (_2!483 lt!8781)) (currentBit!1528 (_2!483 lt!8781)))))))

(declare-fun b!6881 () Bool)

(declare-fun e!4345 () Bool)

(assert (=> b!6881 (= e!4346 e!4345)))

(declare-fun res!7769 () Bool)

(assert (=> b!6881 (=> res!7769 e!4345)))

(assert (=> b!6881 (= res!7769 (= (size!206 (buf!536 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!6882 () Bool)

(declare-fun arrayBitRangesEq!0 (array!476 array!476 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6882 (= e!4345 (arrayBitRangesEq!0 (buf!536 thiss!1486) (buf!536 (_2!483 lt!8781)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486))))))

(assert (= (and d!2120 res!7770) b!6880))

(assert (= (and b!6880 res!7771) b!6881))

(assert (= (and b!6881 (not res!7769)) b!6882))

(assert (=> b!6880 m!8647))

(assert (=> b!6880 m!8645))

(assert (=> b!6882 m!8647))

(assert (=> b!6882 m!8647))

(declare-fun m!8711 () Bool)

(assert (=> b!6882 m!8711))

(assert (=> b!6836 d!2120))

(declare-fun d!2128 () Bool)

(assert (=> d!2128 (= (array_inv!201 (buf!536 thiss!1486)) (bvsge (size!206 (buf!536 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!6831 d!2128))

(declare-fun d!2130 () Bool)

(declare-fun c!344 () Bool)

(assert (=> d!2130 (= c!344 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4351 () List!106)

(assert (=> d!2130 (= (byteArrayBitContentToList!0 (_2!483 lt!8781) srcBuffer!6 from!367 nBits!460) e!4351)))

(declare-fun b!6889 () Bool)

(assert (=> b!6889 (= e!4351 Nil!103)))

(declare-fun b!6890 () Bool)

(assert (=> b!6890 (= e!4351 (Cons!102 (not (= (bvand ((_ sign_extend 24) (select (arr!605 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!483 lt!8781) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2130 c!344) b!6889))

(assert (= (and d!2130 (not c!344)) b!6890))

(declare-fun m!8713 () Bool)

(assert (=> b!6890 m!8713))

(declare-fun m!8715 () Bool)

(assert (=> b!6890 m!8715))

(declare-fun m!8717 () Bool)

(assert (=> b!6890 m!8717))

(assert (=> b!6840 d!2130))

(declare-fun d!2132 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2132 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 thiss!1486))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!206 (buf!536 thiss!1486))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486))) nBits!460))))

(declare-fun bs!753 () Bool)

(assert (= bs!753 d!2132))

(declare-fun m!8719 () Bool)

(assert (=> bs!753 m!8719))

(assert (=> b!6833 d!2132))

(declare-fun d!2134 () Bool)

(assert (=> d!2134 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!8781)))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) nBits!460)))

(declare-fun lt!8804 () Unit!534)

(declare-fun choose!9 (BitStream!390 array!476 (_ BitVec 64) BitStream!390) Unit!534)

(assert (=> d!2134 (= lt!8804 (choose!9 thiss!1486 (buf!536 (_2!483 lt!8781)) nBits!460 (BitStream!391 (buf!536 (_2!483 lt!8781)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486))))))

(assert (=> d!2134 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!536 (_2!483 lt!8781)) nBits!460) lt!8804)))

(declare-fun bs!754 () Bool)

(assert (= bs!754 d!2134))

(assert (=> bs!754 m!8665))

(declare-fun m!8731 () Bool)

(assert (=> bs!754 m!8731))

(assert (=> b!6834 d!2134))

(declare-fun d!2140 () Bool)

(declare-fun c!345 () Bool)

(assert (=> d!2140 (= c!345 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!4356 () List!106)

(assert (=> d!2140 (= (byteArrayBitContentToList!0 (_2!483 lt!8781) (_1!484 lt!8783) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4356)))

(declare-fun b!6895 () Bool)

(assert (=> b!6895 (= e!4356 Nil!103)))

(declare-fun b!6896 () Bool)

(assert (=> b!6896 (= e!4356 (Cons!102 (not (= (bvand ((_ sign_extend 24) (select (arr!605 (_1!484 lt!8783)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!483 lt!8781) (_1!484 lt!8783) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2140 c!345) b!6895))

(assert (= (and d!2140 (not c!345)) b!6896))

(declare-fun m!8733 () Bool)

(assert (=> b!6896 m!8733))

(declare-fun m!8735 () Bool)

(assert (=> b!6896 m!8735))

(declare-fun m!8737 () Bool)

(assert (=> b!6896 m!8737))

(assert (=> b!6834 d!2140))

(declare-fun d!2142 () Bool)

(assert (=> d!2142 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!8781)))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!8781)))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486))) nBits!460))))

(declare-fun bs!756 () Bool)

(assert (= bs!756 d!2142))

(declare-fun m!8739 () Bool)

(assert (=> bs!756 m!8739))

(assert (=> b!6834 d!2142))

(declare-fun d!2144 () Bool)

(declare-fun e!4380 () Bool)

(assert (=> d!2144 e!4380))

(declare-fun res!7800 () Bool)

(assert (=> d!2144 (=> (not res!7800) (not e!4380))))

(declare-fun lt!8869 () tuple2!920)

(assert (=> d!2144 (= res!7800 (isPrefixOf!0 (_1!485 lt!8869) (_2!485 lt!8869)))))

(declare-fun lt!8866 () BitStream!390)

(assert (=> d!2144 (= lt!8869 (tuple2!921 lt!8866 (_2!483 lt!8781)))))

(declare-fun lt!8856 () Unit!534)

(declare-fun lt!8864 () Unit!534)

(assert (=> d!2144 (= lt!8856 lt!8864)))

(assert (=> d!2144 (isPrefixOf!0 lt!8866 (_2!483 lt!8781))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!390 BitStream!390 BitStream!390) Unit!534)

(assert (=> d!2144 (= lt!8864 (lemmaIsPrefixTransitive!0 lt!8866 (_2!483 lt!8781) (_2!483 lt!8781)))))

(declare-fun lt!8855 () Unit!534)

(declare-fun lt!8860 () Unit!534)

(assert (=> d!2144 (= lt!8855 lt!8860)))

(assert (=> d!2144 (isPrefixOf!0 lt!8866 (_2!483 lt!8781))))

(assert (=> d!2144 (= lt!8860 (lemmaIsPrefixTransitive!0 lt!8866 thiss!1486 (_2!483 lt!8781)))))

(declare-fun lt!8861 () Unit!534)

(declare-fun e!4379 () Unit!534)

(assert (=> d!2144 (= lt!8861 e!4379)))

(declare-fun c!354 () Bool)

(assert (=> d!2144 (= c!354 (not (= (size!206 (buf!536 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!8859 () Unit!534)

(declare-fun lt!8870 () Unit!534)

(assert (=> d!2144 (= lt!8859 lt!8870)))

(assert (=> d!2144 (isPrefixOf!0 (_2!483 lt!8781) (_2!483 lt!8781))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!390) Unit!534)

(assert (=> d!2144 (= lt!8870 (lemmaIsPrefixRefl!0 (_2!483 lt!8781)))))

(declare-fun lt!8852 () Unit!534)

(declare-fun lt!8851 () Unit!534)

(assert (=> d!2144 (= lt!8852 lt!8851)))

(assert (=> d!2144 (= lt!8851 (lemmaIsPrefixRefl!0 (_2!483 lt!8781)))))

(declare-fun lt!8858 () Unit!534)

(declare-fun lt!8862 () Unit!534)

(assert (=> d!2144 (= lt!8858 lt!8862)))

(assert (=> d!2144 (isPrefixOf!0 lt!8866 lt!8866)))

(assert (=> d!2144 (= lt!8862 (lemmaIsPrefixRefl!0 lt!8866))))

(declare-fun lt!8863 () Unit!534)

(declare-fun lt!8867 () Unit!534)

(assert (=> d!2144 (= lt!8863 lt!8867)))

(assert (=> d!2144 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2144 (= lt!8867 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2144 (= lt!8866 (BitStream!391 (buf!536 (_2!483 lt!8781)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)))))

(assert (=> d!2144 (isPrefixOf!0 thiss!1486 (_2!483 lt!8781))))

(assert (=> d!2144 (= (reader!0 thiss!1486 (_2!483 lt!8781)) lt!8869)))

(declare-fun b!6934 () Bool)

(declare-fun lt!8865 () Unit!534)

(assert (=> b!6934 (= e!4379 lt!8865)))

(declare-fun lt!8868 () (_ BitVec 64))

(assert (=> b!6934 (= lt!8868 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!8854 () (_ BitVec 64))

(assert (=> b!6934 (= lt!8854 (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!476 array!476 (_ BitVec 64) (_ BitVec 64)) Unit!534)

(assert (=> b!6934 (= lt!8865 (arrayBitRangesEqSymmetric!0 (buf!536 thiss!1486) (buf!536 (_2!483 lt!8781)) lt!8868 lt!8854))))

(assert (=> b!6934 (arrayBitRangesEq!0 (buf!536 (_2!483 lt!8781)) (buf!536 thiss!1486) lt!8868 lt!8854)))

(declare-fun b!6935 () Bool)

(declare-fun Unit!538 () Unit!534)

(assert (=> b!6935 (= e!4379 Unit!538)))

(declare-fun b!6936 () Bool)

(declare-fun res!7799 () Bool)

(assert (=> b!6936 (=> (not res!7799) (not e!4380))))

(assert (=> b!6936 (= res!7799 (isPrefixOf!0 (_2!485 lt!8869) (_2!483 lt!8781)))))

(declare-fun lt!8857 () (_ BitVec 64))

(declare-fun lt!8853 () (_ BitVec 64))

(declare-fun b!6937 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!390 (_ BitVec 64)) BitStream!390)

(assert (=> b!6937 (= e!4380 (= (_1!485 lt!8869) (withMovedBitIndex!0 (_2!485 lt!8869) (bvsub lt!8857 lt!8853))))))

(assert (=> b!6937 (or (= (bvand lt!8857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8857 lt!8853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6937 (= lt!8853 (bitIndex!0 (size!206 (buf!536 (_2!483 lt!8781))) (currentByte!1533 (_2!483 lt!8781)) (currentBit!1528 (_2!483 lt!8781))))))

(assert (=> b!6937 (= lt!8857 (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)))))

(declare-fun b!6938 () Bool)

(declare-fun res!7801 () Bool)

(assert (=> b!6938 (=> (not res!7801) (not e!4380))))

(assert (=> b!6938 (= res!7801 (isPrefixOf!0 (_1!485 lt!8869) thiss!1486))))

(assert (= (and d!2144 c!354) b!6934))

(assert (= (and d!2144 (not c!354)) b!6935))

(assert (= (and d!2144 res!7800) b!6938))

(assert (= (and b!6938 res!7801) b!6936))

(assert (= (and b!6936 res!7799) b!6937))

(assert (=> b!6934 m!8647))

(declare-fun m!8763 () Bool)

(assert (=> b!6934 m!8763))

(declare-fun m!8765 () Bool)

(assert (=> b!6934 m!8765))

(declare-fun m!8767 () Bool)

(assert (=> b!6937 m!8767))

(assert (=> b!6937 m!8645))

(assert (=> b!6937 m!8647))

(declare-fun m!8769 () Bool)

(assert (=> b!6938 m!8769))

(declare-fun m!8771 () Bool)

(assert (=> d!2144 m!8771))

(declare-fun m!8773 () Bool)

(assert (=> d!2144 m!8773))

(declare-fun m!8775 () Bool)

(assert (=> d!2144 m!8775))

(declare-fun m!8777 () Bool)

(assert (=> d!2144 m!8777))

(declare-fun m!8779 () Bool)

(assert (=> d!2144 m!8779))

(declare-fun m!8781 () Bool)

(assert (=> d!2144 m!8781))

(declare-fun m!8783 () Bool)

(assert (=> d!2144 m!8783))

(declare-fun m!8785 () Bool)

(assert (=> d!2144 m!8785))

(declare-fun m!8787 () Bool)

(assert (=> d!2144 m!8787))

(declare-fun m!8789 () Bool)

(assert (=> d!2144 m!8789))

(assert (=> d!2144 m!8657))

(declare-fun m!8791 () Bool)

(assert (=> b!6936 m!8791))

(assert (=> b!6834 d!2144))

(declare-fun b!6949 () Bool)

(declare-fun res!7814 () Bool)

(declare-fun e!4383 () Bool)

(assert (=> b!6949 (=> (not res!7814) (not e!4383))))

(declare-fun lt!8891 () tuple2!918)

(assert (=> b!6949 (= res!7814 (bvsle (currentByte!1533 (_1!485 lt!8778)) (currentByte!1533 (_2!484 lt!8891))))))

(declare-fun d!2166 () Bool)

(assert (=> d!2166 e!4383))

(declare-fun res!7813 () Bool)

(assert (=> d!2166 (=> (not res!7813) (not e!4383))))

(assert (=> d!2166 (= res!7813 (= (buf!536 (_2!484 lt!8891)) (buf!536 (_1!485 lt!8778))))))

(declare-datatypes ((tuple3!50 0))(
  ( (tuple3!51 (_1!489 Unit!534) (_2!489 BitStream!390) (_3!25 array!476)) )
))
(declare-fun lt!8890 () tuple3!50)

(assert (=> d!2166 (= lt!8891 (tuple2!919 (_3!25 lt!8890) (_2!489 lt!8890)))))

(declare-fun readBitsLoop!0 (BitStream!390 (_ BitVec 64) array!476 (_ BitVec 64) (_ BitVec 64)) tuple3!50)

(assert (=> d!2166 (= lt!8890 (readBitsLoop!0 (_1!485 lt!8778) nBits!460 (array!477 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2166 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2166 (= (readBits!0 (_1!485 lt!8778) nBits!460) lt!8891)))

(declare-fun b!6950 () Bool)

(declare-fun res!7815 () Bool)

(assert (=> b!6950 (=> (not res!7815) (not e!4383))))

(declare-fun lt!8897 () (_ BitVec 64))

(assert (=> b!6950 (= res!7815 (= (size!206 (_1!484 lt!8891)) ((_ extract 31 0) lt!8897)))))

(assert (=> b!6950 (and (bvslt lt!8897 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!8897 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!8892 () (_ BitVec 64))

(declare-fun lt!8895 () (_ BitVec 64))

(assert (=> b!6950 (= lt!8897 (bvsdiv lt!8892 lt!8895))))

(assert (=> b!6950 (and (not (= lt!8895 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!8892 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!8895 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!6950 (= lt!8895 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!8894 () (_ BitVec 64))

(declare-fun lt!8893 () (_ BitVec 64))

(assert (=> b!6950 (= lt!8892 (bvsub lt!8894 lt!8893))))

(assert (=> b!6950 (or (= (bvand lt!8894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8893 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8894 lt!8893) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6950 (= lt!8893 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8889 () (_ BitVec 64))

(assert (=> b!6950 (= lt!8894 (bvadd nBits!460 lt!8889))))

(assert (=> b!6950 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8889 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!8889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6950 (= lt!8889 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!6951 () Bool)

(declare-fun res!7816 () Bool)

(assert (=> b!6951 (=> (not res!7816) (not e!4383))))

(assert (=> b!6951 (= res!7816 (invariant!0 (currentBit!1528 (_2!484 lt!8891)) (currentByte!1533 (_2!484 lt!8891)) (size!206 (buf!536 (_2!484 lt!8891)))))))

(declare-fun b!6952 () Bool)

(assert (=> b!6952 (= e!4383 (= (byteArrayBitContentToList!0 (_2!484 lt!8891) (_1!484 lt!8891) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!484 lt!8891) (_1!485 lt!8778) nBits!460)))))

(declare-fun b!6953 () Bool)

(declare-fun res!7812 () Bool)

(assert (=> b!6953 (=> (not res!7812) (not e!4383))))

(declare-fun lt!8896 () (_ BitVec 64))

(assert (=> b!6953 (= res!7812 (= (bvadd lt!8896 nBits!460) (bitIndex!0 (size!206 (buf!536 (_2!484 lt!8891))) (currentByte!1533 (_2!484 lt!8891)) (currentBit!1528 (_2!484 lt!8891)))))))

(assert (=> b!6953 (or (not (= (bvand lt!8896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!8896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!8896 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6953 (= lt!8896 (bitIndex!0 (size!206 (buf!536 (_1!485 lt!8778))) (currentByte!1533 (_1!485 lt!8778)) (currentBit!1528 (_1!485 lt!8778))))))

(assert (= (and d!2166 res!7813) b!6953))

(assert (= (and b!6953 res!7812) b!6951))

(assert (= (and b!6951 res!7816) b!6950))

(assert (= (and b!6950 res!7815) b!6949))

(assert (= (and b!6949 res!7814) b!6952))

(declare-fun m!8793 () Bool)

(assert (=> d!2166 m!8793))

(declare-fun m!8795 () Bool)

(assert (=> b!6951 m!8795))

(declare-fun m!8797 () Bool)

(assert (=> b!6952 m!8797))

(declare-fun m!8799 () Bool)

(assert (=> b!6952 m!8799))

(declare-fun m!8801 () Bool)

(assert (=> b!6953 m!8801))

(declare-fun m!8803 () Bool)

(assert (=> b!6953 m!8803))

(assert (=> b!6834 d!2166))

(declare-fun b!6965 () Bool)

(declare-fun e!4389 () Bool)

(declare-fun lt!8904 () List!106)

(declare-fun length!14 (List!106) Int)

(assert (=> b!6965 (= e!4389 (> (length!14 lt!8904) 0))))

(declare-fun b!6962 () Bool)

(declare-datatypes ((tuple2!928 0))(
  ( (tuple2!929 (_1!490 List!106) (_2!490 BitStream!390)) )
))
(declare-fun e!4388 () tuple2!928)

(assert (=> b!6962 (= e!4388 (tuple2!929 Nil!103 (_1!485 lt!8778)))))

(declare-fun b!6963 () Bool)

(declare-fun lt!8906 () (_ BitVec 64))

(declare-datatypes ((tuple2!930 0))(
  ( (tuple2!931 (_1!491 Bool) (_2!491 BitStream!390)) )
))
(declare-fun lt!8905 () tuple2!930)

(assert (=> b!6963 (= e!4388 (tuple2!929 (Cons!102 (_1!491 lt!8905) (bitStreamReadBitsIntoList!0 (_2!483 lt!8781) (_2!491 lt!8905) (bvsub nBits!460 lt!8906))) (_2!491 lt!8905)))))

(declare-fun readBit!0 (BitStream!390) tuple2!930)

(assert (=> b!6963 (= lt!8905 (readBit!0 (_1!485 lt!8778)))))

(assert (=> b!6963 (= lt!8906 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!2168 () Bool)

(assert (=> d!2168 e!4389))

(declare-fun c!359 () Bool)

(assert (=> d!2168 (= c!359 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2168 (= lt!8904 (_1!490 e!4388))))

(declare-fun c!360 () Bool)

(assert (=> d!2168 (= c!360 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2168 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2168 (= (bitStreamReadBitsIntoList!0 (_2!483 lt!8781) (_1!485 lt!8778) nBits!460) lt!8904)))

(declare-fun b!6964 () Bool)

(declare-fun isEmpty!19 (List!106) Bool)

(assert (=> b!6964 (= e!4389 (isEmpty!19 lt!8904))))

(assert (= (and d!2168 c!360) b!6962))

(assert (= (and d!2168 (not c!360)) b!6963))

(assert (= (and d!2168 c!359) b!6964))

(assert (= (and d!2168 (not c!359)) b!6965))

(declare-fun m!8805 () Bool)

(assert (=> b!6965 m!8805))

(declare-fun m!8807 () Bool)

(assert (=> b!6963 m!8807))

(declare-fun m!8809 () Bool)

(assert (=> b!6963 m!8809))

(declare-fun m!8811 () Bool)

(assert (=> b!6964 m!8811))

(assert (=> b!6834 d!2168))

(declare-fun d!2170 () Bool)

(assert (=> d!2170 (= (array_inv!201 srcBuffer!6) (bvsge (size!206 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1438 d!2170))

(declare-fun d!2172 () Bool)

(assert (=> d!2172 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1528 thiss!1486) (currentByte!1533 thiss!1486) (size!206 (buf!536 thiss!1486))))))

(declare-fun bs!759 () Bool)

(assert (= bs!759 d!2172))

(declare-fun m!8813 () Bool)

(assert (=> bs!759 m!8813))

(assert (=> start!1438 d!2172))

(declare-fun d!2174 () Bool)

(assert (=> d!2174 (= (invariant!0 (currentBit!1528 (_2!483 lt!8781)) (currentByte!1533 (_2!483 lt!8781)) (size!206 (buf!536 (_2!483 lt!8781)))) (and (bvsge (currentBit!1528 (_2!483 lt!8781)) #b00000000000000000000000000000000) (bvslt (currentBit!1528 (_2!483 lt!8781)) #b00000000000000000000000000001000) (bvsge (currentByte!1533 (_2!483 lt!8781)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1533 (_2!483 lt!8781)) (size!206 (buf!536 (_2!483 lt!8781)))) (and (= (currentBit!1528 (_2!483 lt!8781)) #b00000000000000000000000000000000) (= (currentByte!1533 (_2!483 lt!8781)) (size!206 (buf!536 (_2!483 lt!8781))))))))))

(assert (=> b!6839 d!2174))

(declare-fun b!7087 () Bool)

(declare-fun res!7912 () Bool)

(declare-fun e!4442 () Bool)

(assert (=> b!7087 (=> (not res!7912) (not e!4442))))

(declare-fun lt!9472 () tuple2!916)

(assert (=> b!7087 (= res!7912 (isPrefixOf!0 thiss!1486 (_2!483 lt!9472)))))

(declare-fun b!7088 () Bool)

(declare-fun e!4441 () tuple2!916)

(declare-fun Unit!548 () Unit!534)

(assert (=> b!7088 (= e!4441 (tuple2!917 Unit!548 thiss!1486))))

(assert (=> b!7088 (= (size!206 (buf!536 thiss!1486)) (size!206 (buf!536 thiss!1486)))))

(declare-fun lt!9470 () Unit!534)

(declare-fun Unit!549 () Unit!534)

(assert (=> b!7088 (= lt!9470 Unit!549)))

(declare-fun call!83 () tuple2!920)

(assert (=> b!7088 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!484 (readBits!0 (_1!485 call!83) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!7089 () Bool)

(declare-fun res!7913 () Bool)

(assert (=> b!7089 (=> (not res!7913) (not e!4442))))

(assert (=> b!7089 (= res!7913 (= (size!206 (buf!536 thiss!1486)) (size!206 (buf!536 (_2!483 lt!9472)))))))

(declare-fun b!7090 () Bool)

(declare-fun lt!9441 () tuple2!920)

(assert (=> b!7090 (= e!4442 (= (bitStreamReadBitsIntoList!0 (_2!483 lt!9472) (_1!485 lt!9441) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!483 lt!9472) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!7090 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7090 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!9451 () Unit!534)

(declare-fun lt!9458 () Unit!534)

(assert (=> b!7090 (= lt!9451 lt!9458)))

(declare-fun lt!9455 () (_ BitVec 64))

(assert (=> b!7090 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!9472)))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) lt!9455)))

(assert (=> b!7090 (= lt!9458 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!536 (_2!483 lt!9472)) lt!9455))))

(declare-fun e!4443 () Bool)

(assert (=> b!7090 e!4443))

(declare-fun res!7910 () Bool)

(assert (=> b!7090 (=> (not res!7910) (not e!4443))))

(assert (=> b!7090 (= res!7910 (and (= (size!206 (buf!536 thiss!1486)) (size!206 (buf!536 (_2!483 lt!9472)))) (bvsge lt!9455 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7090 (= lt!9455 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!7090 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!7090 (= lt!9441 (reader!0 thiss!1486 (_2!483 lt!9472)))))

(declare-fun lt!9460 () tuple2!916)

(declare-fun bm!80 () Bool)

(declare-fun c!376 () Bool)

(declare-fun lt!9462 () tuple2!916)

(assert (=> bm!80 (= call!83 (reader!0 (ite c!376 (_2!483 lt!9460) thiss!1486) (ite c!376 (_2!483 lt!9462) thiss!1486)))))

(declare-fun b!7091 () Bool)

(declare-fun res!7908 () Bool)

(assert (=> b!7091 (=> (not res!7908) (not e!4442))))

(assert (=> b!7091 (= res!7908 (= (size!206 (buf!536 (_2!483 lt!9472))) (size!206 (buf!536 thiss!1486))))))

(declare-fun b!7092 () Bool)

(declare-fun Unit!550 () Unit!534)

(assert (=> b!7092 (= e!4441 (tuple2!917 Unit!550 (_2!483 lt!9462)))))

(declare-fun appendBitFromByte!0 (BitStream!390 (_ BitVec 8) (_ BitVec 32)) tuple2!916)

(assert (=> b!7092 (= lt!9460 (appendBitFromByte!0 thiss!1486 (select (arr!605 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!9440 () (_ BitVec 64))

(assert (=> b!7092 (= lt!9440 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9445 () (_ BitVec 64))

(assert (=> b!7092 (= lt!9445 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9431 () Unit!534)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!390 BitStream!390 (_ BitVec 64) (_ BitVec 64)) Unit!534)

(assert (=> b!7092 (= lt!9431 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!483 lt!9460) lt!9440 lt!9445))))

(assert (=> b!7092 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!9460)))) ((_ sign_extend 32) (currentByte!1533 (_2!483 lt!9460))) ((_ sign_extend 32) (currentBit!1528 (_2!483 lt!9460))) (bvsub lt!9440 lt!9445))))

(declare-fun lt!9436 () Unit!534)

(assert (=> b!7092 (= lt!9436 lt!9431)))

(declare-fun lt!9433 () tuple2!920)

(assert (=> b!7092 (= lt!9433 (reader!0 thiss!1486 (_2!483 lt!9460)))))

(declare-fun lt!9464 () (_ BitVec 64))

(assert (=> b!7092 (= lt!9464 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!9463 () Unit!534)

(assert (=> b!7092 (= lt!9463 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!536 (_2!483 lt!9460)) lt!9464))))

(assert (=> b!7092 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!9460)))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) lt!9464)))

(declare-fun lt!9438 () Unit!534)

(assert (=> b!7092 (= lt!9438 lt!9463)))

(declare-fun head!30 (List!106) Bool)

(assert (=> b!7092 (= (head!30 (byteArrayBitContentToList!0 (_2!483 lt!9460) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!30 (bitStreamReadBitsIntoList!0 (_2!483 lt!9460) (_1!485 lt!9433) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9446 () Unit!534)

(declare-fun Unit!552 () Unit!534)

(assert (=> b!7092 (= lt!9446 Unit!552)))

(assert (=> b!7092 (= lt!9462 (appendBitsMSBFirstLoop!0 (_2!483 lt!9460) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!9467 () Unit!534)

(assert (=> b!7092 (= lt!9467 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!483 lt!9460) (_2!483 lt!9462)))))

(assert (=> b!7092 (isPrefixOf!0 thiss!1486 (_2!483 lt!9462))))

(declare-fun lt!9450 () Unit!534)

(assert (=> b!7092 (= lt!9450 lt!9467)))

(assert (=> b!7092 (= (size!206 (buf!536 (_2!483 lt!9462))) (size!206 (buf!536 thiss!1486)))))

(declare-fun lt!9449 () Unit!534)

(declare-fun Unit!553 () Unit!534)

(assert (=> b!7092 (= lt!9449 Unit!553)))

(assert (=> b!7092 (= (bitIndex!0 (size!206 (buf!536 (_2!483 lt!9462))) (currentByte!1533 (_2!483 lt!9462)) (currentBit!1528 (_2!483 lt!9462))) (bvsub (bvadd (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!9469 () Unit!534)

(declare-fun Unit!554 () Unit!534)

(assert (=> b!7092 (= lt!9469 Unit!554)))

(assert (=> b!7092 (= (bitIndex!0 (size!206 (buf!536 (_2!483 lt!9462))) (currentByte!1533 (_2!483 lt!9462)) (currentBit!1528 (_2!483 lt!9462))) (bvsub (bvsub (bvadd (bitIndex!0 (size!206 (buf!536 (_2!483 lt!9460))) (currentByte!1533 (_2!483 lt!9460)) (currentBit!1528 (_2!483 lt!9460))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!9468 () Unit!534)

(declare-fun Unit!555 () Unit!534)

(assert (=> b!7092 (= lt!9468 Unit!555)))

(declare-fun lt!9448 () tuple2!920)

(assert (=> b!7092 (= lt!9448 (reader!0 thiss!1486 (_2!483 lt!9462)))))

(declare-fun lt!9453 () (_ BitVec 64))

(assert (=> b!7092 (= lt!9453 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9457 () Unit!534)

(assert (=> b!7092 (= lt!9457 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!536 (_2!483 lt!9462)) lt!9453))))

(assert (=> b!7092 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!9462)))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) lt!9453)))

(declare-fun lt!9471 () Unit!534)

(assert (=> b!7092 (= lt!9471 lt!9457)))

(declare-fun lt!9432 () tuple2!920)

(assert (=> b!7092 (= lt!9432 call!83)))

(declare-fun lt!9452 () (_ BitVec 64))

(assert (=> b!7092 (= lt!9452 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!9435 () Unit!534)

(assert (=> b!7092 (= lt!9435 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!483 lt!9460) (buf!536 (_2!483 lt!9462)) lt!9452))))

(assert (=> b!7092 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!9462)))) ((_ sign_extend 32) (currentByte!1533 (_2!483 lt!9460))) ((_ sign_extend 32) (currentBit!1528 (_2!483 lt!9460))) lt!9452)))

(declare-fun lt!9430 () Unit!534)

(assert (=> b!7092 (= lt!9430 lt!9435)))

(declare-fun lt!9444 () List!106)

(assert (=> b!7092 (= lt!9444 (byteArrayBitContentToList!0 (_2!483 lt!9462) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!9465 () List!106)

(assert (=> b!7092 (= lt!9465 (byteArrayBitContentToList!0 (_2!483 lt!9462) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9443 () List!106)

(assert (=> b!7092 (= lt!9443 (bitStreamReadBitsIntoList!0 (_2!483 lt!9462) (_1!485 lt!9448) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!9461 () List!106)

(assert (=> b!7092 (= lt!9461 (bitStreamReadBitsIntoList!0 (_2!483 lt!9462) (_1!485 lt!9432) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!9456 () (_ BitVec 64))

(assert (=> b!7092 (= lt!9456 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!9439 () Unit!534)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!390 BitStream!390 BitStream!390 BitStream!390 (_ BitVec 64) List!106) Unit!534)

(assert (=> b!7092 (= lt!9439 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!483 lt!9462) (_2!483 lt!9462) (_1!485 lt!9448) (_1!485 lt!9432) lt!9456 lt!9443))))

(declare-fun tail!38 (List!106) List!106)

(assert (=> b!7092 (= (bitStreamReadBitsIntoList!0 (_2!483 lt!9462) (_1!485 lt!9432) (bvsub lt!9456 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!38 lt!9443))))

(declare-fun lt!9473 () Unit!534)

(assert (=> b!7092 (= lt!9473 lt!9439)))

(declare-fun lt!9459 () (_ BitVec 64))

(declare-fun lt!9442 () Unit!534)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!476 array!476 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!534)

(assert (=> b!7092 (= lt!9442 (arrayBitRangesEqImpliesEq!0 (buf!536 (_2!483 lt!9460)) (buf!536 (_2!483 lt!9462)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!9459 (bitIndex!0 (size!206 (buf!536 (_2!483 lt!9460))) (currentByte!1533 (_2!483 lt!9460)) (currentBit!1528 (_2!483 lt!9460)))))))

(declare-fun bitAt!0 (array!476 (_ BitVec 64)) Bool)

(assert (=> b!7092 (= (bitAt!0 (buf!536 (_2!483 lt!9460)) lt!9459) (bitAt!0 (buf!536 (_2!483 lt!9462)) lt!9459))))

(declare-fun lt!9454 () Unit!534)

(assert (=> b!7092 (= lt!9454 lt!9442)))

(declare-fun b!7093 () Bool)

(assert (=> b!7093 (= e!4443 (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 thiss!1486))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486)) lt!9455))))

(declare-fun d!2176 () Bool)

(assert (=> d!2176 e!4442))

(declare-fun res!7911 () Bool)

(assert (=> d!2176 (=> (not res!7911) (not e!4442))))

(declare-fun lt!9437 () (_ BitVec 64))

(assert (=> d!2176 (= res!7911 (= (bitIndex!0 (size!206 (buf!536 (_2!483 lt!9472))) (currentByte!1533 (_2!483 lt!9472)) (currentBit!1528 (_2!483 lt!9472))) (bvsub lt!9437 from!367)))))

(assert (=> d!2176 (or (= (bvand lt!9437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9437 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!9466 () (_ BitVec 64))

(assert (=> d!2176 (= lt!9437 (bvadd lt!9466 from!367 nBits!460))))

(assert (=> d!2176 (or (not (= (bvand lt!9466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!9466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!9466 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2176 (= lt!9466 (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)))))

(assert (=> d!2176 (= lt!9472 e!4441)))

(assert (=> d!2176 (= c!376 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!9447 () Unit!534)

(declare-fun lt!9434 () Unit!534)

(assert (=> d!2176 (= lt!9447 lt!9434)))

(assert (=> d!2176 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2176 (= lt!9434 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2176 (= lt!9459 (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)))))

(assert (=> d!2176 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2176 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!9472)))

(declare-fun b!7094 () Bool)

(declare-fun res!7909 () Bool)

(assert (=> b!7094 (=> (not res!7909) (not e!4442))))

(assert (=> b!7094 (= res!7909 (invariant!0 (currentBit!1528 (_2!483 lt!9472)) (currentByte!1533 (_2!483 lt!9472)) (size!206 (buf!536 (_2!483 lt!9472)))))))

(assert (= (and d!2176 c!376) b!7092))

(assert (= (and d!2176 (not c!376)) b!7088))

(assert (= (or b!7092 b!7088) bm!80))

(assert (= (and d!2176 res!7911) b!7094))

(assert (= (and b!7094 res!7909) b!7089))

(assert (= (and b!7089 res!7913) b!7087))

(assert (= (and b!7087 res!7912) b!7091))

(assert (= (and b!7091 res!7908) b!7090))

(assert (= (and b!7090 res!7910) b!7093))

(declare-fun m!9061 () Bool)

(assert (=> d!2176 m!9061))

(assert (=> d!2176 m!8647))

(assert (=> d!2176 m!8783))

(assert (=> d!2176 m!8775))

(declare-fun m!9063 () Bool)

(assert (=> b!7093 m!9063))

(declare-fun m!9065 () Bool)

(assert (=> b!7094 m!9065))

(declare-fun m!9067 () Bool)

(assert (=> b!7088 m!9067))

(declare-fun m!9069 () Bool)

(assert (=> b!7088 m!9069))

(declare-fun m!9071 () Bool)

(assert (=> bm!80 m!9071))

(assert (=> b!7092 m!8647))

(declare-fun m!9073 () Bool)

(assert (=> b!7092 m!9073))

(declare-fun m!9075 () Bool)

(assert (=> b!7092 m!9075))

(declare-fun m!9077 () Bool)

(assert (=> b!7092 m!9077))

(declare-fun m!9079 () Bool)

(assert (=> b!7092 m!9079))

(assert (=> b!7092 m!8713))

(declare-fun m!9081 () Bool)

(assert (=> b!7092 m!9081))

(declare-fun m!9083 () Bool)

(assert (=> b!7092 m!9083))

(declare-fun m!9085 () Bool)

(assert (=> b!7092 m!9085))

(declare-fun m!9087 () Bool)

(assert (=> b!7092 m!9087))

(declare-fun m!9089 () Bool)

(assert (=> b!7092 m!9089))

(declare-fun m!9091 () Bool)

(assert (=> b!7092 m!9091))

(declare-fun m!9093 () Bool)

(assert (=> b!7092 m!9093))

(declare-fun m!9095 () Bool)

(assert (=> b!7092 m!9095))

(declare-fun m!9097 () Bool)

(assert (=> b!7092 m!9097))

(declare-fun m!9099 () Bool)

(assert (=> b!7092 m!9099))

(declare-fun m!9101 () Bool)

(assert (=> b!7092 m!9101))

(declare-fun m!9103 () Bool)

(assert (=> b!7092 m!9103))

(declare-fun m!9105 () Bool)

(assert (=> b!7092 m!9105))

(declare-fun m!9107 () Bool)

(assert (=> b!7092 m!9107))

(declare-fun m!9109 () Bool)

(assert (=> b!7092 m!9109))

(declare-fun m!9111 () Bool)

(assert (=> b!7092 m!9111))

(declare-fun m!9113 () Bool)

(assert (=> b!7092 m!9113))

(assert (=> b!7092 m!9077))

(declare-fun m!9115 () Bool)

(assert (=> b!7092 m!9115))

(declare-fun m!9117 () Bool)

(assert (=> b!7092 m!9117))

(declare-fun m!9119 () Bool)

(assert (=> b!7092 m!9119))

(declare-fun m!9121 () Bool)

(assert (=> b!7092 m!9121))

(declare-fun m!9123 () Bool)

(assert (=> b!7092 m!9123))

(declare-fun m!9125 () Bool)

(assert (=> b!7092 m!9125))

(declare-fun m!9127 () Bool)

(assert (=> b!7092 m!9127))

(assert (=> b!7092 m!9085))

(declare-fun m!9129 () Bool)

(assert (=> b!7092 m!9129))

(assert (=> b!7092 m!9117))

(declare-fun m!9131 () Bool)

(assert (=> b!7092 m!9131))

(assert (=> b!7092 m!8713))

(declare-fun m!9133 () Bool)

(assert (=> b!7087 m!9133))

(declare-fun m!9135 () Bool)

(assert (=> b!7090 m!9135))

(declare-fun m!9137 () Bool)

(assert (=> b!7090 m!9137))

(declare-fun m!9139 () Bool)

(assert (=> b!7090 m!9139))

(declare-fun m!9141 () Bool)

(assert (=> b!7090 m!9141))

(declare-fun m!9143 () Bool)

(assert (=> b!7090 m!9143))

(assert (=> b!6839 d!2176))

(declare-fun d!2212 () Bool)

(declare-fun e!4446 () Bool)

(assert (=> d!2212 e!4446))

(declare-fun res!7919 () Bool)

(assert (=> d!2212 (=> (not res!7919) (not e!4446))))

(declare-fun lt!9490 () (_ BitVec 64))

(declare-fun lt!9491 () (_ BitVec 64))

(declare-fun lt!9487 () (_ BitVec 64))

(assert (=> d!2212 (= res!7919 (= lt!9491 (bvsub lt!9490 lt!9487)))))

(assert (=> d!2212 (or (= (bvand lt!9490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9490 lt!9487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2212 (= lt!9487 (remainingBits!0 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!8781)))) ((_ sign_extend 32) (currentByte!1533 (_2!483 lt!8781))) ((_ sign_extend 32) (currentBit!1528 (_2!483 lt!8781)))))))

(declare-fun lt!9488 () (_ BitVec 64))

(declare-fun lt!9486 () (_ BitVec 64))

(assert (=> d!2212 (= lt!9490 (bvmul lt!9488 lt!9486))))

(assert (=> d!2212 (or (= lt!9488 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!9486 (bvsdiv (bvmul lt!9488 lt!9486) lt!9488)))))

(assert (=> d!2212 (= lt!9486 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2212 (= lt!9488 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!8781)))))))

(assert (=> d!2212 (= lt!9491 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1533 (_2!483 lt!8781))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1528 (_2!483 lt!8781)))))))

(assert (=> d!2212 (invariant!0 (currentBit!1528 (_2!483 lt!8781)) (currentByte!1533 (_2!483 lt!8781)) (size!206 (buf!536 (_2!483 lt!8781))))))

(assert (=> d!2212 (= (bitIndex!0 (size!206 (buf!536 (_2!483 lt!8781))) (currentByte!1533 (_2!483 lt!8781)) (currentBit!1528 (_2!483 lt!8781))) lt!9491)))

(declare-fun b!7099 () Bool)

(declare-fun res!7918 () Bool)

(assert (=> b!7099 (=> (not res!7918) (not e!4446))))

(assert (=> b!7099 (= res!7918 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!9491))))

(declare-fun b!7100 () Bool)

(declare-fun lt!9489 () (_ BitVec 64))

(assert (=> b!7100 (= e!4446 (bvsle lt!9491 (bvmul lt!9489 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7100 (or (= lt!9489 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!9489 #b0000000000000000000000000000000000000000000000000000000000001000) lt!9489)))))

(assert (=> b!7100 (= lt!9489 ((_ sign_extend 32) (size!206 (buf!536 (_2!483 lt!8781)))))))

(assert (= (and d!2212 res!7919) b!7099))

(assert (= (and b!7099 res!7918) b!7100))

(declare-fun m!9145 () Bool)

(assert (=> d!2212 m!9145))

(assert (=> d!2212 m!8633))

(assert (=> b!6832 d!2212))

(declare-fun d!2214 () Bool)

(declare-fun e!4447 () Bool)

(assert (=> d!2214 e!4447))

(declare-fun res!7921 () Bool)

(assert (=> d!2214 (=> (not res!7921) (not e!4447))))

(declare-fun lt!9493 () (_ BitVec 64))

(declare-fun lt!9496 () (_ BitVec 64))

(declare-fun lt!9497 () (_ BitVec 64))

(assert (=> d!2214 (= res!7921 (= lt!9497 (bvsub lt!9496 lt!9493)))))

(assert (=> d!2214 (or (= (bvand lt!9496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!9493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!9496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!9496 lt!9493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2214 (= lt!9493 (remainingBits!0 ((_ sign_extend 32) (size!206 (buf!536 thiss!1486))) ((_ sign_extend 32) (currentByte!1533 thiss!1486)) ((_ sign_extend 32) (currentBit!1528 thiss!1486))))))

(declare-fun lt!9494 () (_ BitVec 64))

(declare-fun lt!9492 () (_ BitVec 64))

(assert (=> d!2214 (= lt!9496 (bvmul lt!9494 lt!9492))))

(assert (=> d!2214 (or (= lt!9494 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!9492 (bvsdiv (bvmul lt!9494 lt!9492) lt!9494)))))

(assert (=> d!2214 (= lt!9492 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2214 (= lt!9494 ((_ sign_extend 32) (size!206 (buf!536 thiss!1486))))))

(assert (=> d!2214 (= lt!9497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1533 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1528 thiss!1486))))))

(assert (=> d!2214 (invariant!0 (currentBit!1528 thiss!1486) (currentByte!1533 thiss!1486) (size!206 (buf!536 thiss!1486)))))

(assert (=> d!2214 (= (bitIndex!0 (size!206 (buf!536 thiss!1486)) (currentByte!1533 thiss!1486) (currentBit!1528 thiss!1486)) lt!9497)))

(declare-fun b!7101 () Bool)

(declare-fun res!7920 () Bool)

(assert (=> b!7101 (=> (not res!7920) (not e!4447))))

(assert (=> b!7101 (= res!7920 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!9497))))

(declare-fun b!7102 () Bool)

(declare-fun lt!9495 () (_ BitVec 64))

(assert (=> b!7102 (= e!4447 (bvsle lt!9497 (bvmul lt!9495 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!7102 (or (= lt!9495 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!9495 #b0000000000000000000000000000000000000000000000000000000000001000) lt!9495)))))

(assert (=> b!7102 (= lt!9495 ((_ sign_extend 32) (size!206 (buf!536 thiss!1486))))))

(assert (= (and d!2214 res!7921) b!7101))

(assert (= (and b!7101 res!7920) b!7102))

(assert (=> d!2214 m!8719))

(assert (=> d!2214 m!8813))

(assert (=> b!6832 d!2214))

(declare-fun d!2216 () Bool)

(assert (=> d!2216 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!206 (buf!536 (_1!485 lt!8778)))) ((_ sign_extend 32) (currentByte!1533 (_1!485 lt!8778))) ((_ sign_extend 32) (currentBit!1528 (_1!485 lt!8778))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!206 (buf!536 (_1!485 lt!8778)))) ((_ sign_extend 32) (currentByte!1533 (_1!485 lt!8778))) ((_ sign_extend 32) (currentBit!1528 (_1!485 lt!8778)))) nBits!460))))

(declare-fun bs!765 () Bool)

(assert (= bs!765 d!2216))

(declare-fun m!9147 () Bool)

(assert (=> bs!765 m!9147))

(assert (=> b!6837 d!2216))

(declare-fun d!2218 () Bool)

(declare-fun res!7956 () Bool)

(declare-fun e!4458 () Bool)

(assert (=> d!2218 (=> res!7956 e!4458)))

(assert (=> d!2218 (= res!7956 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2218 (= (checkByteArrayBitContent!0 (_2!483 lt!8781) srcBuffer!6 (_1!484 lt!8783) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!4458)))

(declare-fun b!7137 () Bool)

(declare-fun e!4459 () Bool)

(assert (=> b!7137 (= e!4458 e!4459)))

(declare-fun res!7957 () Bool)

(assert (=> b!7137 (=> (not res!7957) (not e!4459))))

(assert (=> b!7137 (= res!7957 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!605 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!605 (_1!484 lt!8783)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!7138 () Bool)

(assert (=> b!7138 (= e!4459 (checkByteArrayBitContent!0 (_2!483 lt!8781) srcBuffer!6 (_1!484 lt!8783) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2218 (not res!7956)) b!7137))

(assert (= (and b!7137 res!7957) b!7138))

(assert (=> b!7137 m!8713))

(assert (=> b!7137 m!8715))

(assert (=> b!7137 m!8733))

(assert (=> b!7137 m!8735))

(declare-fun m!9171 () Bool)

(assert (=> b!7138 m!9171))

(assert (=> b!6838 d!2218))

(declare-fun d!2222 () Bool)

(assert (=> d!2222 (checkByteArrayBitContent!0 (_2!483 lt!8781) srcBuffer!6 (_1!484 lt!8783) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!9554 () Unit!534)

(declare-fun choose!65 (BitStream!390 array!476 array!476 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!534)

(assert (=> d!2222 (= lt!9554 (choose!65 (_2!483 lt!8781) srcBuffer!6 (_1!484 lt!8783) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2222 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2222 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!483 lt!8781) srcBuffer!6 (_1!484 lt!8783) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!9554)))

(declare-fun bs!766 () Bool)

(assert (= bs!766 d!2222))

(assert (=> bs!766 m!8641))

(declare-fun m!9175 () Bool)

(assert (=> bs!766 m!9175))

(assert (=> b!6838 d!2222))

(check-sat (not b!6937) (not b!7093) (not b!7090) (not d!2214) (not d!2212) (not b!7138) (not b!6934) (not b!6963) (not b!6965) (not b!6882) (not d!2144) (not b!6890) (not b!7092) (not b!7087) (not d!2166) (not b!6880) (not d!2134) (not d!2222) (not b!6964) (not d!2172) (not b!6938) (not b!6953) (not d!2176) (not b!7088) (not d!2142) (not d!2132) (not b!6952) (not b!7094) (not b!6936) (not d!2216) (not b!6896) (not bm!80) (not b!6951))
(check-sat)
