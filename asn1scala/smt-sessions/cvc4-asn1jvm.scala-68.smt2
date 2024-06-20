; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1320 () Bool)

(assert start!1320)

(declare-fun b!6060 () Bool)

(declare-fun e!3863 () Bool)

(declare-datatypes ((array!439 0))(
  ( (array!440 (arr!585 (Array (_ BitVec 32) (_ BitVec 8))) (size!189 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!356 0))(
  ( (BitStream!357 (buf!516 array!439) (currentByte!1507 (_ BitVec 32)) (currentBit!1502 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!356)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6060 (= e!3863 (invariant!0 (currentBit!1502 thiss!1486) (currentByte!1507 thiss!1486) (size!189 (buf!516 thiss!1486))))))

(declare-fun b!6061 () Bool)

(declare-fun e!3864 () Bool)

(declare-fun array_inv!184 (array!439) Bool)

(assert (=> b!6061 (= e!3864 (array_inv!184 (buf!516 thiss!1486)))))

(declare-fun res!7107 () Bool)

(declare-fun e!3861 () Bool)

(assert (=> start!1320 (=> (not res!7107) (not e!3861))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!439)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1320 (= res!7107 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!189 srcBuffer!6))))))))

(assert (=> start!1320 e!3861))

(assert (=> start!1320 true))

(assert (=> start!1320 (array_inv!184 srcBuffer!6)))

(declare-fun inv!12 (BitStream!356) Bool)

(assert (=> start!1320 (and (inv!12 thiss!1486) e!3864)))

(declare-fun b!6062 () Bool)

(declare-fun e!3862 () Bool)

(assert (=> b!6062 (= e!3862 e!3863)))

(declare-fun res!7108 () Bool)

(assert (=> b!6062 (=> res!7108 e!3863)))

(declare-datatypes ((tuple2!802 0))(
  ( (tuple2!803 (_1!423 array!439) (_2!423 BitStream!356)) )
))
(declare-fun lt!7703 () tuple2!802)

(declare-datatypes ((Unit!476 0))(
  ( (Unit!477) )
))
(declare-datatypes ((tuple2!804 0))(
  ( (tuple2!805 (_1!424 Unit!476) (_2!424 BitStream!356)) )
))
(declare-fun lt!7698 () tuple2!804)

(declare-fun checkByteArrayBitContent!0 (BitStream!356 array!439 array!439 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6062 (= res!7108 (not (checkByteArrayBitContent!0 (_2!424 lt!7698) srcBuffer!6 (_1!423 lt!7703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!7699 () Unit!476)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!356 array!439 array!439 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!476)

(assert (=> b!6062 (= lt!7699 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!424 lt!7698) srcBuffer!6 (_1!423 lt!7703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!6063 () Bool)

(declare-fun e!3865 () Bool)

(assert (=> b!6063 (= e!3865 (not e!3862))))

(declare-fun res!7100 () Bool)

(assert (=> b!6063 (=> res!7100 e!3862)))

(declare-datatypes ((List!89 0))(
  ( (Nil!86) (Cons!85 (h!204 Bool) (t!839 List!89)) )
))
(declare-fun lt!7700 () List!89)

(declare-fun byteArrayBitContentToList!0 (BitStream!356 array!439 (_ BitVec 64) (_ BitVec 64)) List!89)

(assert (=> b!6063 (= res!7100 (not (= (byteArrayBitContentToList!0 (_2!424 lt!7698) (_1!423 lt!7703) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7700)))))

(declare-datatypes ((tuple2!806 0))(
  ( (tuple2!807 (_1!425 BitStream!356) (_2!425 BitStream!356)) )
))
(declare-fun lt!7702 () tuple2!806)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!356 BitStream!356 (_ BitVec 64)) List!89)

(assert (=> b!6063 (= lt!7700 (bitStreamReadBitsIntoList!0 (_2!424 lt!7698) (_1!425 lt!7702) nBits!460))))

(declare-fun readBits!0 (BitStream!356 (_ BitVec 64)) tuple2!802)

(assert (=> b!6063 (= lt!7703 (readBits!0 (_1!425 lt!7702) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6063 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!7698)))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) nBits!460)))

(declare-fun lt!7701 () Unit!476)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!356 array!439 (_ BitVec 64)) Unit!476)

(assert (=> b!6063 (= lt!7701 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!516 (_2!424 lt!7698)) nBits!460))))

(declare-fun reader!0 (BitStream!356 BitStream!356) tuple2!806)

(assert (=> b!6063 (= lt!7702 (reader!0 thiss!1486 (_2!424 lt!7698)))))

(declare-fun b!6064 () Bool)

(declare-fun res!7106 () Bool)

(assert (=> b!6064 (=> (not res!7106) (not e!3865))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6064 (= res!7106 (= (bitIndex!0 (size!189 (buf!516 (_2!424 lt!7698))) (currentByte!1507 (_2!424 lt!7698)) (currentBit!1502 (_2!424 lt!7698))) (bvadd (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)) nBits!460)))))

(declare-fun b!6065 () Bool)

(declare-fun res!7103 () Bool)

(assert (=> b!6065 (=> res!7103 e!3862)))

(assert (=> b!6065 (= res!7103 (not (= lt!7700 (byteArrayBitContentToList!0 (_2!424 lt!7698) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6066 () Bool)

(declare-fun res!7102 () Bool)

(assert (=> b!6066 (=> (not res!7102) (not e!3865))))

(assert (=> b!6066 (= res!7102 (= (size!189 (buf!516 thiss!1486)) (size!189 (buf!516 (_2!424 lt!7698)))))))

(declare-fun b!6067 () Bool)

(declare-fun res!7101 () Bool)

(assert (=> b!6067 (=> (not res!7101) (not e!3861))))

(assert (=> b!6067 (= res!7101 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 thiss!1486))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) nBits!460))))

(declare-fun b!6068 () Bool)

(assert (=> b!6068 (= e!3861 e!3865)))

(declare-fun res!7104 () Bool)

(assert (=> b!6068 (=> (not res!7104) (not e!3865))))

(assert (=> b!6068 (= res!7104 (invariant!0 (currentBit!1502 (_2!424 lt!7698)) (currentByte!1507 (_2!424 lt!7698)) (size!189 (buf!516 (_2!424 lt!7698)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!356 array!439 (_ BitVec 64) (_ BitVec 64)) tuple2!804)

(assert (=> b!6068 (= lt!7698 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6069 () Bool)

(declare-fun res!7105 () Bool)

(assert (=> b!6069 (=> (not res!7105) (not e!3865))))

(declare-fun isPrefixOf!0 (BitStream!356 BitStream!356) Bool)

(assert (=> b!6069 (= res!7105 (isPrefixOf!0 thiss!1486 (_2!424 lt!7698)))))

(assert (= (and start!1320 res!7107) b!6067))

(assert (= (and b!6067 res!7101) b!6068))

(assert (= (and b!6068 res!7104) b!6066))

(assert (= (and b!6066 res!7102) b!6064))

(assert (= (and b!6064 res!7106) b!6069))

(assert (= (and b!6069 res!7105) b!6063))

(assert (= (and b!6063 (not res!7100)) b!6065))

(assert (= (and b!6065 (not res!7103)) b!6062))

(assert (= (and b!6062 (not res!7108)) b!6060))

(assert (= start!1320 b!6061))

(declare-fun m!7561 () Bool)

(assert (=> b!6068 m!7561))

(declare-fun m!7563 () Bool)

(assert (=> b!6068 m!7563))

(declare-fun m!7565 () Bool)

(assert (=> b!6062 m!7565))

(declare-fun m!7567 () Bool)

(assert (=> b!6062 m!7567))

(declare-fun m!7569 () Bool)

(assert (=> b!6064 m!7569))

(declare-fun m!7571 () Bool)

(assert (=> b!6064 m!7571))

(declare-fun m!7573 () Bool)

(assert (=> b!6065 m!7573))

(declare-fun m!7575 () Bool)

(assert (=> start!1320 m!7575))

(declare-fun m!7577 () Bool)

(assert (=> start!1320 m!7577))

(declare-fun m!7579 () Bool)

(assert (=> b!6063 m!7579))

(declare-fun m!7581 () Bool)

(assert (=> b!6063 m!7581))

(declare-fun m!7583 () Bool)

(assert (=> b!6063 m!7583))

(declare-fun m!7585 () Bool)

(assert (=> b!6063 m!7585))

(declare-fun m!7587 () Bool)

(assert (=> b!6063 m!7587))

(declare-fun m!7589 () Bool)

(assert (=> b!6063 m!7589))

(declare-fun m!7591 () Bool)

(assert (=> b!6061 m!7591))

(declare-fun m!7593 () Bool)

(assert (=> b!6067 m!7593))

(declare-fun m!7595 () Bool)

(assert (=> b!6069 m!7595))

(declare-fun m!7597 () Bool)

(assert (=> b!6060 m!7597))

(push 1)

(assert (not b!6065))

(assert (not b!6060))

(assert (not b!6062))

(assert (not b!6067))

(assert (not b!6063))

(assert (not b!6064))

(assert (not b!6061))

(assert (not b!6069))

(assert (not start!1320))

(assert (not b!6068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1996 () Bool)

(declare-fun c!296 () Bool)

(assert (=> d!1996 (= c!296 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3869 () List!89)

(assert (=> d!1996 (= (byteArrayBitContentToList!0 (_2!424 lt!7698) srcBuffer!6 from!367 nBits!460) e!3869)))

(declare-fun b!6074 () Bool)

(assert (=> b!6074 (= e!3869 Nil!86)))

(declare-fun b!6075 () Bool)

(assert (=> b!6075 (= e!3869 (Cons!85 (not (= (bvand ((_ sign_extend 24) (select (arr!585 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!424 lt!7698) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1996 c!296) b!6074))

(assert (= (and d!1996 (not c!296)) b!6075))

(declare-fun m!7601 () Bool)

(assert (=> b!6075 m!7601))

(declare-fun m!7603 () Bool)

(assert (=> b!6075 m!7603))

(declare-fun m!7605 () Bool)

(assert (=> b!6075 m!7605))

(assert (=> b!6065 d!1996))

(declare-fun d!2000 () Bool)

(declare-fun e!3884 () Bool)

(assert (=> d!2000 e!3884))

(declare-fun res!7129 () Bool)

(assert (=> d!2000 (=> (not res!7129) (not e!3884))))

(declare-fun lt!7723 () (_ BitVec 64))

(declare-fun lt!7721 () (_ BitVec 64))

(declare-fun lt!7720 () (_ BitVec 64))

(assert (=> d!2000 (= res!7129 (= lt!7723 (bvsub lt!7721 lt!7720)))))

(assert (=> d!2000 (or (= (bvand lt!7721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7720 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7721 lt!7720) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2000 (= lt!7720 (remainingBits!0 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!7698)))) ((_ sign_extend 32) (currentByte!1507 (_2!424 lt!7698))) ((_ sign_extend 32) (currentBit!1502 (_2!424 lt!7698)))))))

(declare-fun lt!7724 () (_ BitVec 64))

(declare-fun lt!7719 () (_ BitVec 64))

(assert (=> d!2000 (= lt!7721 (bvmul lt!7724 lt!7719))))

(assert (=> d!2000 (or (= lt!7724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!7719 (bvsdiv (bvmul lt!7724 lt!7719) lt!7724)))))

(assert (=> d!2000 (= lt!7719 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2000 (= lt!7724 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!7698)))))))

(assert (=> d!2000 (= lt!7723 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1507 (_2!424 lt!7698))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1502 (_2!424 lt!7698)))))))

(assert (=> d!2000 (invariant!0 (currentBit!1502 (_2!424 lt!7698)) (currentByte!1507 (_2!424 lt!7698)) (size!189 (buf!516 (_2!424 lt!7698))))))

(assert (=> d!2000 (= (bitIndex!0 (size!189 (buf!516 (_2!424 lt!7698))) (currentByte!1507 (_2!424 lt!7698)) (currentBit!1502 (_2!424 lt!7698))) lt!7723)))

(declare-fun b!6095 () Bool)

(declare-fun res!7128 () Bool)

(assert (=> b!6095 (=> (not res!7128) (not e!3884))))

(assert (=> b!6095 (= res!7128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!7723))))

(declare-fun b!6096 () Bool)

(declare-fun lt!7722 () (_ BitVec 64))

(assert (=> b!6096 (= e!3884 (bvsle lt!7723 (bvmul lt!7722 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!6096 (or (= lt!7722 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!7722 #b0000000000000000000000000000000000000000000000000000000000001000) lt!7722)))))

(assert (=> b!6096 (= lt!7722 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!7698)))))))

(assert (= (and d!2000 res!7129) b!6095))

(assert (= (and b!6095 res!7128) b!6096))

(declare-fun m!7621 () Bool)

(assert (=> d!2000 m!7621))

(assert (=> d!2000 m!7561))

(assert (=> b!6064 d!2000))

(declare-fun d!2014 () Bool)

(declare-fun e!3885 () Bool)

(assert (=> d!2014 e!3885))

(declare-fun res!7131 () Bool)

(assert (=> d!2014 (=> (not res!7131) (not e!3885))))

(declare-fun lt!7729 () (_ BitVec 64))

(declare-fun lt!7727 () (_ BitVec 64))

(declare-fun lt!7726 () (_ BitVec 64))

(assert (=> d!2014 (= res!7131 (= lt!7729 (bvsub lt!7727 lt!7726)))))

(assert (=> d!2014 (or (= (bvand lt!7727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7726 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7727 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7727 lt!7726) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2014 (= lt!7726 (remainingBits!0 ((_ sign_extend 32) (size!189 (buf!516 thiss!1486))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486))))))

(declare-fun lt!7730 () (_ BitVec 64))

(declare-fun lt!7725 () (_ BitVec 64))

(assert (=> d!2014 (= lt!7727 (bvmul lt!7730 lt!7725))))

(assert (=> d!2014 (or (= lt!7730 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!7725 (bvsdiv (bvmul lt!7730 lt!7725) lt!7730)))))

(assert (=> d!2014 (= lt!7725 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2014 (= lt!7730 ((_ sign_extend 32) (size!189 (buf!516 thiss!1486))))))

(assert (=> d!2014 (= lt!7729 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1507 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1502 thiss!1486))))))

(assert (=> d!2014 (invariant!0 (currentBit!1502 thiss!1486) (currentByte!1507 thiss!1486) (size!189 (buf!516 thiss!1486)))))

(assert (=> d!2014 (= (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)) lt!7729)))

(declare-fun b!6097 () Bool)

(declare-fun res!7130 () Bool)

(assert (=> b!6097 (=> (not res!7130) (not e!3885))))

(assert (=> b!6097 (= res!7130 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!7729))))

(declare-fun b!6098 () Bool)

(declare-fun lt!7728 () (_ BitVec 64))

(assert (=> b!6098 (= e!3885 (bvsle lt!7729 (bvmul lt!7728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!6098 (or (= lt!7728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!7728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!7728)))))

(assert (=> b!6098 (= lt!7728 ((_ sign_extend 32) (size!189 (buf!516 thiss!1486))))))

(assert (= (and d!2014 res!7131) b!6097))

(assert (= (and b!6097 res!7130) b!6098))

(declare-fun m!7623 () Bool)

(assert (=> d!2014 m!7623))

(assert (=> d!2014 m!7597))

(assert (=> b!6064 d!2014))

(declare-fun d!2020 () Bool)

(assert (=> d!2020 (= (array_inv!184 (buf!516 thiss!1486)) (bvsge (size!189 (buf!516 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!6061 d!2020))

(declare-fun d!2022 () Bool)

(assert (=> d!2022 (= (invariant!0 (currentBit!1502 thiss!1486) (currentByte!1507 thiss!1486) (size!189 (buf!516 thiss!1486))) (and (bvsge (currentBit!1502 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1502 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1507 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1507 thiss!1486) (size!189 (buf!516 thiss!1486))) (and (= (currentBit!1502 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1507 thiss!1486) (size!189 (buf!516 thiss!1486)))))))))

(assert (=> b!6060 d!2022))

(declare-fun d!2024 () Bool)

(declare-fun res!7148 () Bool)

(declare-fun e!3899 () Bool)

(assert (=> d!2024 (=> res!7148 e!3899)))

(assert (=> d!2024 (= res!7148 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2024 (= (checkByteArrayBitContent!0 (_2!424 lt!7698) srcBuffer!6 (_1!423 lt!7703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3899)))

(declare-fun b!6115 () Bool)

(declare-fun e!3900 () Bool)

(assert (=> b!6115 (= e!3899 e!3900)))

(declare-fun res!7149 () Bool)

(assert (=> b!6115 (=> (not res!7149) (not e!3900))))

(assert (=> b!6115 (= res!7149 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!585 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!585 (_1!423 lt!7703)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!6116 () Bool)

(assert (=> b!6116 (= e!3900 (checkByteArrayBitContent!0 (_2!424 lt!7698) srcBuffer!6 (_1!423 lt!7703) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!2024 (not res!7148)) b!6115))

(assert (= (and b!6115 res!7149) b!6116))

(assert (=> b!6115 m!7601))

(assert (=> b!6115 m!7603))

(declare-fun m!7637 () Bool)

(assert (=> b!6115 m!7637))

(declare-fun m!7639 () Bool)

(assert (=> b!6115 m!7639))

(declare-fun m!7641 () Bool)

(assert (=> b!6116 m!7641))

(assert (=> b!6062 d!2024))

(declare-fun d!2030 () Bool)

(assert (=> d!2030 (checkByteArrayBitContent!0 (_2!424 lt!7698) srcBuffer!6 (_1!423 lt!7703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!7760 () Unit!476)

(declare-fun choose!65 (BitStream!356 array!439 array!439 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!476)

(assert (=> d!2030 (= lt!7760 (choose!65 (_2!424 lt!7698) srcBuffer!6 (_1!423 lt!7703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2030 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2030 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!424 lt!7698) srcBuffer!6 (_1!423 lt!7703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7760)))

(declare-fun bs!724 () Bool)

(assert (= bs!724 d!2030))

(assert (=> bs!724 m!7565))

(declare-fun m!7645 () Bool)

(assert (=> bs!724 m!7645))

(assert (=> b!6062 d!2030))

(declare-fun d!2040 () Bool)

(assert (=> d!2040 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 thiss!1486))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!189 (buf!516 thiss!1486))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486))) nBits!460))))

(declare-fun bs!725 () Bool)

(assert (= bs!725 d!2040))

(assert (=> bs!725 m!7623))

(assert (=> b!6067 d!2040))

(declare-fun d!2042 () Bool)

(assert (=> d!2042 (= (array_inv!184 srcBuffer!6) (bvsge (size!189 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1320 d!2042))

(declare-fun d!2044 () Bool)

(assert (=> d!2044 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1502 thiss!1486) (currentByte!1507 thiss!1486) (size!189 (buf!516 thiss!1486))))))

(declare-fun bs!726 () Bool)

(assert (= bs!726 d!2044))

(assert (=> bs!726 m!7597))

(assert (=> start!1320 d!2044))

(declare-fun d!2046 () Bool)

(declare-fun res!7167 () Bool)

(declare-fun e!3912 () Bool)

(assert (=> d!2046 (=> (not res!7167) (not e!3912))))

(assert (=> d!2046 (= res!7167 (= (size!189 (buf!516 thiss!1486)) (size!189 (buf!516 (_2!424 lt!7698)))))))

(assert (=> d!2046 (= (isPrefixOf!0 thiss!1486 (_2!424 lt!7698)) e!3912)))

(declare-fun b!6134 () Bool)

(declare-fun res!7168 () Bool)

(assert (=> b!6134 (=> (not res!7168) (not e!3912))))

(assert (=> b!6134 (= res!7168 (bvsle (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)) (bitIndex!0 (size!189 (buf!516 (_2!424 lt!7698))) (currentByte!1507 (_2!424 lt!7698)) (currentBit!1502 (_2!424 lt!7698)))))))

(declare-fun b!6135 () Bool)

(declare-fun e!3913 () Bool)

(assert (=> b!6135 (= e!3912 e!3913)))

(declare-fun res!7169 () Bool)

(assert (=> b!6135 (=> res!7169 e!3913)))

(assert (=> b!6135 (= res!7169 (= (size!189 (buf!516 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!6136 () Bool)

(declare-fun arrayBitRangesEq!0 (array!439 array!439 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6136 (= e!3913 (arrayBitRangesEq!0 (buf!516 thiss!1486) (buf!516 (_2!424 lt!7698)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486))))))

(assert (= (and d!2046 res!7167) b!6134))

(assert (= (and b!6134 res!7168) b!6135))

(assert (= (and b!6135 (not res!7169)) b!6136))

(assert (=> b!6134 m!7571))

(assert (=> b!6134 m!7569))

(assert (=> b!6136 m!7571))

(assert (=> b!6136 m!7571))

(declare-fun m!7649 () Bool)

(assert (=> b!6136 m!7649))

(assert (=> b!6069 d!2046))

(declare-fun d!2052 () Bool)

(assert (=> d!2052 (= (invariant!0 (currentBit!1502 (_2!424 lt!7698)) (currentByte!1507 (_2!424 lt!7698)) (size!189 (buf!516 (_2!424 lt!7698)))) (and (bvsge (currentBit!1502 (_2!424 lt!7698)) #b00000000000000000000000000000000) (bvslt (currentBit!1502 (_2!424 lt!7698)) #b00000000000000000000000000001000) (bvsge (currentByte!1507 (_2!424 lt!7698)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1507 (_2!424 lt!7698)) (size!189 (buf!516 (_2!424 lt!7698)))) (and (= (currentBit!1502 (_2!424 lt!7698)) #b00000000000000000000000000000000) (= (currentByte!1507 (_2!424 lt!7698)) (size!189 (buf!516 (_2!424 lt!7698))))))))))

(assert (=> b!6068 d!2052))

(declare-fun b!6233 () Bool)

(declare-fun res!7227 () Bool)

(declare-fun e!3954 () Bool)

(assert (=> b!6233 (=> (not res!7227) (not e!3954))))

(declare-fun lt!8085 () tuple2!804)

(assert (=> b!6233 (= res!7227 (= (size!189 (buf!516 (_2!424 lt!8085))) (size!189 (buf!516 thiss!1486))))))

(declare-fun b!6234 () Bool)

(declare-fun res!7231 () Bool)

(assert (=> b!6234 (=> (not res!7231) (not e!3954))))

(assert (=> b!6234 (= res!7231 (isPrefixOf!0 thiss!1486 (_2!424 lt!8085)))))

(declare-fun b!6235 () Bool)

(declare-fun res!7229 () Bool)

(assert (=> b!6235 (=> (not res!7229) (not e!3954))))

(assert (=> b!6235 (= res!7229 (invariant!0 (currentBit!1502 (_2!424 lt!8085)) (currentByte!1507 (_2!424 lt!8085)) (size!189 (buf!516 (_2!424 lt!8085)))))))

(declare-fun b!6236 () Bool)

(declare-fun e!3952 () tuple2!804)

(declare-fun Unit!481 () Unit!476)

(assert (=> b!6236 (= e!3952 (tuple2!805 Unit!481 thiss!1486))))

(assert (=> b!6236 (= (size!189 (buf!516 thiss!1486)) (size!189 (buf!516 thiss!1486)))))

(declare-fun lt!8075 () Unit!476)

(declare-fun Unit!482 () Unit!476)

(assert (=> b!6236 (= lt!8075 Unit!482)))

(declare-fun call!70 () tuple2!806)

(assert (=> b!6236 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!423 (readBits!0 (_1!425 call!70) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!6237 () Bool)

(declare-fun res!7228 () Bool)

(assert (=> b!6237 (=> (not res!7228) (not e!3954))))

(assert (=> b!6237 (= res!7228 (= (size!189 (buf!516 thiss!1486)) (size!189 (buf!516 (_2!424 lt!8085)))))))

(declare-fun b!6238 () Bool)

(declare-fun e!3953 () Bool)

(declare-fun lt!8090 () (_ BitVec 64))

(assert (=> b!6238 (= e!3953 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 thiss!1486))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) lt!8090))))

(declare-fun bm!67 () Bool)

(declare-fun c!317 () Bool)

(declare-fun lt!8087 () tuple2!804)

(assert (=> bm!67 (= call!70 (reader!0 thiss!1486 (ite c!317 (_2!424 lt!8087) thiss!1486)))))

(declare-fun b!6239 () Bool)

(declare-fun lt!8095 () tuple2!804)

(declare-fun Unit!483 () Unit!476)

(assert (=> b!6239 (= e!3952 (tuple2!805 Unit!483 (_2!424 lt!8095)))))

(declare-fun appendBitFromByte!0 (BitStream!356 (_ BitVec 8) (_ BitVec 32)) tuple2!804)

(assert (=> b!6239 (= lt!8087 (appendBitFromByte!0 thiss!1486 (select (arr!585 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!8100 () (_ BitVec 64))

(assert (=> b!6239 (= lt!8100 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8074 () (_ BitVec 64))

(assert (=> b!6239 (= lt!8074 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8070 () Unit!476)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!356 BitStream!356 (_ BitVec 64) (_ BitVec 64)) Unit!476)

(assert (=> b!6239 (= lt!8070 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!424 lt!8087) lt!8100 lt!8074))))

(assert (=> b!6239 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!8087)))) ((_ sign_extend 32) (currentByte!1507 (_2!424 lt!8087))) ((_ sign_extend 32) (currentBit!1502 (_2!424 lt!8087))) (bvsub lt!8100 lt!8074))))

(declare-fun lt!8094 () Unit!476)

(assert (=> b!6239 (= lt!8094 lt!8070)))

(declare-fun lt!8089 () tuple2!806)

(assert (=> b!6239 (= lt!8089 call!70)))

(declare-fun lt!8068 () (_ BitVec 64))

(assert (=> b!6239 (= lt!8068 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8076 () Unit!476)

(assert (=> b!6239 (= lt!8076 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!516 (_2!424 lt!8087)) lt!8068))))

(assert (=> b!6239 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!8087)))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) lt!8068)))

(declare-fun lt!8073 () Unit!476)

(assert (=> b!6239 (= lt!8073 lt!8076)))

(declare-fun head!26 (List!89) Bool)

(assert (=> b!6239 (= (head!26 (byteArrayBitContentToList!0 (_2!424 lt!8087) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!26 (bitStreamReadBitsIntoList!0 (_2!424 lt!8087) (_1!425 lt!8089) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8079 () Unit!476)

(declare-fun Unit!486 () Unit!476)

(assert (=> b!6239 (= lt!8079 Unit!486)))

(assert (=> b!6239 (= lt!8095 (appendBitsMSBFirstLoop!0 (_2!424 lt!8087) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!8093 () Unit!476)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!356 BitStream!356 BitStream!356) Unit!476)

(assert (=> b!6239 (= lt!8093 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!424 lt!8087) (_2!424 lt!8095)))))

(assert (=> b!6239 (isPrefixOf!0 thiss!1486 (_2!424 lt!8095))))

(declare-fun lt!8062 () Unit!476)

(assert (=> b!6239 (= lt!8062 lt!8093)))

(assert (=> b!6239 (= (size!189 (buf!516 (_2!424 lt!8095))) (size!189 (buf!516 thiss!1486)))))

(declare-fun lt!8103 () Unit!476)

(declare-fun Unit!489 () Unit!476)

(assert (=> b!6239 (= lt!8103 Unit!489)))

(assert (=> b!6239 (= (bitIndex!0 (size!189 (buf!516 (_2!424 lt!8095))) (currentByte!1507 (_2!424 lt!8095)) (currentBit!1502 (_2!424 lt!8095))) (bvsub (bvadd (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!8078 () Unit!476)

(declare-fun Unit!491 () Unit!476)

(assert (=> b!6239 (= lt!8078 Unit!491)))

(assert (=> b!6239 (= (bitIndex!0 (size!189 (buf!516 (_2!424 lt!8095))) (currentByte!1507 (_2!424 lt!8095)) (currentBit!1502 (_2!424 lt!8095))) (bvsub (bvsub (bvadd (bitIndex!0 (size!189 (buf!516 (_2!424 lt!8087))) (currentByte!1507 (_2!424 lt!8087)) (currentBit!1502 (_2!424 lt!8087))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!8061 () Unit!476)

(declare-fun Unit!492 () Unit!476)

(assert (=> b!6239 (= lt!8061 Unit!492)))

(declare-fun lt!8099 () tuple2!806)

(assert (=> b!6239 (= lt!8099 (reader!0 thiss!1486 (_2!424 lt!8095)))))

(declare-fun lt!8069 () (_ BitVec 64))

(assert (=> b!6239 (= lt!8069 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8066 () Unit!476)

(assert (=> b!6239 (= lt!8066 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!516 (_2!424 lt!8095)) lt!8069))))

(assert (=> b!6239 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!8095)))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) lt!8069)))

(declare-fun lt!8082 () Unit!476)

(assert (=> b!6239 (= lt!8082 lt!8066)))

(declare-fun lt!8088 () tuple2!806)

(assert (=> b!6239 (= lt!8088 (reader!0 (_2!424 lt!8087) (_2!424 lt!8095)))))

(declare-fun lt!8067 () (_ BitVec 64))

(assert (=> b!6239 (= lt!8067 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!8081 () Unit!476)

(assert (=> b!6239 (= lt!8081 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!424 lt!8087) (buf!516 (_2!424 lt!8095)) lt!8067))))

(assert (=> b!6239 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!8095)))) ((_ sign_extend 32) (currentByte!1507 (_2!424 lt!8087))) ((_ sign_extend 32) (currentBit!1502 (_2!424 lt!8087))) lt!8067)))

(declare-fun lt!8077 () Unit!476)

(assert (=> b!6239 (= lt!8077 lt!8081)))

(declare-fun lt!8086 () List!89)

(assert (=> b!6239 (= lt!8086 (byteArrayBitContentToList!0 (_2!424 lt!8095) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!8097 () List!89)

(assert (=> b!6239 (= lt!8097 (byteArrayBitContentToList!0 (_2!424 lt!8095) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8101 () List!89)

(assert (=> b!6239 (= lt!8101 (bitStreamReadBitsIntoList!0 (_2!424 lt!8095) (_1!425 lt!8099) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!8065 () List!89)

(assert (=> b!6239 (= lt!8065 (bitStreamReadBitsIntoList!0 (_2!424 lt!8095) (_1!425 lt!8088) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8092 () (_ BitVec 64))

(assert (=> b!6239 (= lt!8092 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8060 () Unit!476)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!356 BitStream!356 BitStream!356 BitStream!356 (_ BitVec 64) List!89) Unit!476)

(assert (=> b!6239 (= lt!8060 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!424 lt!8095) (_2!424 lt!8095) (_1!425 lt!8099) (_1!425 lt!8088) lt!8092 lt!8101))))

(declare-fun tail!35 (List!89) List!89)

(assert (=> b!6239 (= (bitStreamReadBitsIntoList!0 (_2!424 lt!8095) (_1!425 lt!8088) (bvsub lt!8092 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!35 lt!8101))))

(declare-fun lt!8102 () Unit!476)

(assert (=> b!6239 (= lt!8102 lt!8060)))

(declare-fun lt!8080 () (_ BitVec 64))

(declare-fun lt!8072 () Unit!476)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!439 array!439 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!476)

(assert (=> b!6239 (= lt!8072 (arrayBitRangesEqImpliesEq!0 (buf!516 (_2!424 lt!8087)) (buf!516 (_2!424 lt!8095)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!8080 (bitIndex!0 (size!189 (buf!516 (_2!424 lt!8087))) (currentByte!1507 (_2!424 lt!8087)) (currentBit!1502 (_2!424 lt!8087)))))))

(declare-fun bitAt!0 (array!439 (_ BitVec 64)) Bool)

(assert (=> b!6239 (= (bitAt!0 (buf!516 (_2!424 lt!8087)) lt!8080) (bitAt!0 (buf!516 (_2!424 lt!8095)) lt!8080))))

(declare-fun lt!8098 () Unit!476)

(assert (=> b!6239 (= lt!8098 lt!8072)))

(declare-fun b!6240 () Bool)

(declare-fun lt!8096 () tuple2!806)

(assert (=> b!6240 (= e!3954 (= (bitStreamReadBitsIntoList!0 (_2!424 lt!8085) (_1!425 lt!8096) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!424 lt!8085) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!6240 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6240 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!8084 () Unit!476)

(declare-fun lt!8064 () Unit!476)

(assert (=> b!6240 (= lt!8084 lt!8064)))

(assert (=> b!6240 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!8085)))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) lt!8090)))

(assert (=> b!6240 (= lt!8064 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!516 (_2!424 lt!8085)) lt!8090))))

(assert (=> b!6240 e!3953))

(declare-fun res!7230 () Bool)

(assert (=> b!6240 (=> (not res!7230) (not e!3953))))

(assert (=> b!6240 (= res!7230 (and (= (size!189 (buf!516 thiss!1486)) (size!189 (buf!516 (_2!424 lt!8085)))) (bvsge lt!8090 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6240 (= lt!8090 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!6240 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6240 (= lt!8096 (reader!0 thiss!1486 (_2!424 lt!8085)))))

(declare-fun d!2054 () Bool)

(assert (=> d!2054 e!3954))

(declare-fun res!7226 () Bool)

(assert (=> d!2054 (=> (not res!7226) (not e!3954))))

(declare-fun lt!8063 () (_ BitVec 64))

(assert (=> d!2054 (= res!7226 (= (bitIndex!0 (size!189 (buf!516 (_2!424 lt!8085))) (currentByte!1507 (_2!424 lt!8085)) (currentBit!1502 (_2!424 lt!8085))) (bvsub lt!8063 from!367)))))

(assert (=> d!2054 (or (= (bvand lt!8063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8063 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!8083 () (_ BitVec 64))

(assert (=> d!2054 (= lt!8063 (bvadd lt!8083 from!367 nBits!460))))

(assert (=> d!2054 (or (not (= (bvand lt!8083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!8083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!8083 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2054 (= lt!8083 (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)))))

(assert (=> d!2054 (= lt!8085 e!3952)))

(assert (=> d!2054 (= c!317 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!8071 () Unit!476)

(declare-fun lt!8091 () Unit!476)

(assert (=> d!2054 (= lt!8071 lt!8091)))

(assert (=> d!2054 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!356) Unit!476)

(assert (=> d!2054 (= lt!8091 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2054 (= lt!8080 (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)))))

(assert (=> d!2054 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2054 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!8085)))

(assert (= (and d!2054 c!317) b!6239))

(assert (= (and d!2054 (not c!317)) b!6236))

(assert (= (or b!6239 b!6236) bm!67))

(assert (= (and d!2054 res!7226) b!6235))

(assert (= (and b!6235 res!7229) b!6237))

(assert (= (and b!6237 res!7228) b!6234))

(assert (= (and b!6234 res!7231) b!6233))

(assert (= (and b!6233 res!7227) b!6240))

(assert (= (and b!6240 res!7230) b!6238))

(declare-fun m!7715 () Bool)

(assert (=> b!6234 m!7715))

(declare-fun m!7717 () Bool)

(assert (=> b!6236 m!7717))

(declare-fun m!7719 () Bool)

(assert (=> b!6236 m!7719))

(declare-fun m!7721 () Bool)

(assert (=> b!6235 m!7721))

(declare-fun m!7723 () Bool)

(assert (=> b!6238 m!7723))

(declare-fun m!7725 () Bool)

(assert (=> d!2054 m!7725))

(assert (=> d!2054 m!7571))

(declare-fun m!7727 () Bool)

(assert (=> d!2054 m!7727))

(declare-fun m!7729 () Bool)

(assert (=> d!2054 m!7729))

(declare-fun m!7731 () Bool)

(assert (=> b!6239 m!7731))

(declare-fun m!7733 () Bool)

(assert (=> b!6239 m!7733))

(declare-fun m!7735 () Bool)

(assert (=> b!6239 m!7735))

(declare-fun m!7737 () Bool)

(assert (=> b!6239 m!7737))

(declare-fun m!7739 () Bool)

(assert (=> b!6239 m!7739))

(declare-fun m!7741 () Bool)

(assert (=> b!6239 m!7741))

(declare-fun m!7743 () Bool)

(assert (=> b!6239 m!7743))

(declare-fun m!7745 () Bool)

(assert (=> b!6239 m!7745))

(declare-fun m!7747 () Bool)

(assert (=> b!6239 m!7747))

(declare-fun m!7749 () Bool)

(assert (=> b!6239 m!7749))

(declare-fun m!7751 () Bool)

(assert (=> b!6239 m!7751))

(declare-fun m!7753 () Bool)

(assert (=> b!6239 m!7753))

(assert (=> b!6239 m!7571))

(declare-fun m!7755 () Bool)

(assert (=> b!6239 m!7755))

(declare-fun m!7757 () Bool)

(assert (=> b!6239 m!7757))

(declare-fun m!7759 () Bool)

(assert (=> b!6239 m!7759))

(declare-fun m!7761 () Bool)

(assert (=> b!6239 m!7761))

(assert (=> b!6239 m!7601))

(declare-fun m!7763 () Bool)

(assert (=> b!6239 m!7763))

(declare-fun m!7765 () Bool)

(assert (=> b!6239 m!7765))

(declare-fun m!7767 () Bool)

(assert (=> b!6239 m!7767))

(assert (=> b!6239 m!7737))

(declare-fun m!7769 () Bool)

(assert (=> b!6239 m!7769))

(declare-fun m!7771 () Bool)

(assert (=> b!6239 m!7771))

(declare-fun m!7773 () Bool)

(assert (=> b!6239 m!7773))

(declare-fun m!7775 () Bool)

(assert (=> b!6239 m!7775))

(assert (=> b!6239 m!7601))

(declare-fun m!7777 () Bool)

(assert (=> b!6239 m!7777))

(declare-fun m!7779 () Bool)

(assert (=> b!6239 m!7779))

(declare-fun m!7781 () Bool)

(assert (=> b!6239 m!7781))

(declare-fun m!7783 () Bool)

(assert (=> b!6239 m!7783))

(declare-fun m!7785 () Bool)

(assert (=> b!6239 m!7785))

(assert (=> b!6239 m!7747))

(declare-fun m!7787 () Bool)

(assert (=> b!6239 m!7787))

(assert (=> b!6239 m!7757))

(declare-fun m!7789 () Bool)

(assert (=> b!6239 m!7789))

(declare-fun m!7791 () Bool)

(assert (=> bm!67 m!7791))

(declare-fun m!7793 () Bool)

(assert (=> b!6240 m!7793))

(declare-fun m!7795 () Bool)

(assert (=> b!6240 m!7795))

(declare-fun m!7797 () Bool)

(assert (=> b!6240 m!7797))

(declare-fun m!7799 () Bool)

(assert (=> b!6240 m!7799))

(declare-fun m!7801 () Bool)

(assert (=> b!6240 m!7801))

(assert (=> b!6068 d!2054))

(declare-fun e!3964 () Bool)

(declare-fun b!6261 () Bool)

(declare-fun lt!8202 () (_ BitVec 64))

(declare-fun lt!8191 () tuple2!806)

(declare-fun lt!8205 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!356 (_ BitVec 64)) BitStream!356)

(assert (=> b!6261 (= e!3964 (= (_1!425 lt!8191) (withMovedBitIndex!0 (_2!425 lt!8191) (bvsub lt!8205 lt!8202))))))

(assert (=> b!6261 (or (= (bvand lt!8205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8202 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8205 lt!8202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6261 (= lt!8202 (bitIndex!0 (size!189 (buf!516 (_2!424 lt!7698))) (currentByte!1507 (_2!424 lt!7698)) (currentBit!1502 (_2!424 lt!7698))))))

(assert (=> b!6261 (= lt!8205 (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)))))

(declare-fun b!6262 () Bool)

(declare-fun e!3963 () Unit!476)

(declare-fun Unit!501 () Unit!476)

(assert (=> b!6262 (= e!3963 Unit!501)))

(declare-fun b!6263 () Bool)

(declare-fun lt!8200 () Unit!476)

(assert (=> b!6263 (= e!3963 lt!8200)))

(declare-fun lt!8194 () (_ BitVec 64))

(assert (=> b!6263 (= lt!8194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!8199 () (_ BitVec 64))

(assert (=> b!6263 (= lt!8199 (bitIndex!0 (size!189 (buf!516 thiss!1486)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!439 array!439 (_ BitVec 64) (_ BitVec 64)) Unit!476)

(assert (=> b!6263 (= lt!8200 (arrayBitRangesEqSymmetric!0 (buf!516 thiss!1486) (buf!516 (_2!424 lt!7698)) lt!8194 lt!8199))))

(assert (=> b!6263 (arrayBitRangesEq!0 (buf!516 (_2!424 lt!7698)) (buf!516 thiss!1486) lt!8194 lt!8199)))

(declare-fun d!2084 () Bool)

(assert (=> d!2084 e!3964))

(declare-fun res!7245 () Bool)

(assert (=> d!2084 (=> (not res!7245) (not e!3964))))

(assert (=> d!2084 (= res!7245 (isPrefixOf!0 (_1!425 lt!8191) (_2!425 lt!8191)))))

(declare-fun lt!8196 () BitStream!356)

(assert (=> d!2084 (= lt!8191 (tuple2!807 lt!8196 (_2!424 lt!7698)))))

(declare-fun lt!8209 () Unit!476)

(declare-fun lt!8208 () Unit!476)

(assert (=> d!2084 (= lt!8209 lt!8208)))

(assert (=> d!2084 (isPrefixOf!0 lt!8196 (_2!424 lt!7698))))

(assert (=> d!2084 (= lt!8208 (lemmaIsPrefixTransitive!0 lt!8196 (_2!424 lt!7698) (_2!424 lt!7698)))))

(declare-fun lt!8201 () Unit!476)

(declare-fun lt!8197 () Unit!476)

(assert (=> d!2084 (= lt!8201 lt!8197)))

(assert (=> d!2084 (isPrefixOf!0 lt!8196 (_2!424 lt!7698))))

(assert (=> d!2084 (= lt!8197 (lemmaIsPrefixTransitive!0 lt!8196 thiss!1486 (_2!424 lt!7698)))))

(declare-fun lt!8192 () Unit!476)

(assert (=> d!2084 (= lt!8192 e!3963)))

(declare-fun c!322 () Bool)

(assert (=> d!2084 (= c!322 (not (= (size!189 (buf!516 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!8193 () Unit!476)

(declare-fun lt!8203 () Unit!476)

(assert (=> d!2084 (= lt!8193 lt!8203)))

(assert (=> d!2084 (isPrefixOf!0 (_2!424 lt!7698) (_2!424 lt!7698))))

(assert (=> d!2084 (= lt!8203 (lemmaIsPrefixRefl!0 (_2!424 lt!7698)))))

(declare-fun lt!8204 () Unit!476)

(declare-fun lt!8195 () Unit!476)

(assert (=> d!2084 (= lt!8204 lt!8195)))

(assert (=> d!2084 (= lt!8195 (lemmaIsPrefixRefl!0 (_2!424 lt!7698)))))

(declare-fun lt!8210 () Unit!476)

(declare-fun lt!8206 () Unit!476)

(assert (=> d!2084 (= lt!8210 lt!8206)))

(assert (=> d!2084 (isPrefixOf!0 lt!8196 lt!8196)))

(assert (=> d!2084 (= lt!8206 (lemmaIsPrefixRefl!0 lt!8196))))

(declare-fun lt!8207 () Unit!476)

(declare-fun lt!8198 () Unit!476)

(assert (=> d!2084 (= lt!8207 lt!8198)))

(assert (=> d!2084 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2084 (= lt!8198 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2084 (= lt!8196 (BitStream!357 (buf!516 (_2!424 lt!7698)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486)))))

(assert (=> d!2084 (isPrefixOf!0 thiss!1486 (_2!424 lt!7698))))

(assert (=> d!2084 (= (reader!0 thiss!1486 (_2!424 lt!7698)) lt!8191)))

(declare-fun b!6264 () Bool)

(declare-fun res!7244 () Bool)

(assert (=> b!6264 (=> (not res!7244) (not e!3964))))

(assert (=> b!6264 (= res!7244 (isPrefixOf!0 (_2!425 lt!8191) (_2!424 lt!7698)))))

(declare-fun b!6265 () Bool)

(declare-fun res!7246 () Bool)

(assert (=> b!6265 (=> (not res!7246) (not e!3964))))

(assert (=> b!6265 (= res!7246 (isPrefixOf!0 (_1!425 lt!8191) thiss!1486))))

(assert (= (and d!2084 c!322) b!6263))

(assert (= (and d!2084 (not c!322)) b!6262))

(assert (= (and d!2084 res!7245) b!6265))

(assert (= (and b!6265 res!7246) b!6264))

(assert (= (and b!6264 res!7244) b!6261))

(declare-fun m!7895 () Bool)

(assert (=> b!6265 m!7895))

(declare-fun m!7897 () Bool)

(assert (=> d!2084 m!7897))

(assert (=> d!2084 m!7595))

(declare-fun m!7899 () Bool)

(assert (=> d!2084 m!7899))

(declare-fun m!7901 () Bool)

(assert (=> d!2084 m!7901))

(declare-fun m!7903 () Bool)

(assert (=> d!2084 m!7903))

(declare-fun m!7905 () Bool)

(assert (=> d!2084 m!7905))

(assert (=> d!2084 m!7727))

(assert (=> d!2084 m!7729))

(declare-fun m!7907 () Bool)

(assert (=> d!2084 m!7907))

(declare-fun m!7909 () Bool)

(assert (=> d!2084 m!7909))

(declare-fun m!7911 () Bool)

(assert (=> d!2084 m!7911))

(declare-fun m!7913 () Bool)

(assert (=> b!6264 m!7913))

(declare-fun m!7915 () Bool)

(assert (=> b!6261 m!7915))

(assert (=> b!6261 m!7569))

(assert (=> b!6261 m!7571))

(assert (=> b!6263 m!7571))

(declare-fun m!7917 () Bool)

(assert (=> b!6263 m!7917))

(declare-fun m!7919 () Bool)

(assert (=> b!6263 m!7919))

(assert (=> b!6063 d!2084))

(declare-fun d!2092 () Bool)

(assert (=> d!2092 (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!7698)))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) nBits!460)))

(declare-fun lt!8213 () Unit!476)

(declare-fun choose!9 (BitStream!356 array!439 (_ BitVec 64) BitStream!356) Unit!476)

(assert (=> d!2092 (= lt!8213 (choose!9 thiss!1486 (buf!516 (_2!424 lt!7698)) nBits!460 (BitStream!357 (buf!516 (_2!424 lt!7698)) (currentByte!1507 thiss!1486) (currentBit!1502 thiss!1486))))))

(assert (=> d!2092 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!516 (_2!424 lt!7698)) nBits!460) lt!8213)))

(declare-fun bs!731 () Bool)

(assert (= bs!731 d!2092))

(assert (=> bs!731 m!7587))

(declare-fun m!7921 () Bool)

(assert (=> bs!731 m!7921))

(assert (=> b!6063 d!2092))

(declare-fun d!2094 () Bool)

(assert (=> d!2094 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!7698)))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!189 (buf!516 (_2!424 lt!7698)))) ((_ sign_extend 32) (currentByte!1507 thiss!1486)) ((_ sign_extend 32) (currentBit!1502 thiss!1486))) nBits!460))))

(declare-fun bs!732 () Bool)

(assert (= bs!732 d!2094))

(declare-fun m!7923 () Bool)

(assert (=> bs!732 m!7923))

(assert (=> b!6063 d!2094))

(declare-fun d!2096 () Bool)

(declare-fun c!323 () Bool)

(assert (=> d!2096 (= c!323 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3965 () List!89)

(assert (=> d!2096 (= (byteArrayBitContentToList!0 (_2!424 lt!7698) (_1!423 lt!7703) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3965)))

(declare-fun b!6266 () Bool)

(assert (=> b!6266 (= e!3965 Nil!86)))

(declare-fun b!6267 () Bool)

(assert (=> b!6267 (= e!3965 (Cons!85 (not (= (bvand ((_ sign_extend 24) (select (arr!585 (_1!423 lt!7703)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!424 lt!7698) (_1!423 lt!7703) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2096 c!323) b!6266))

(assert (= (and d!2096 (not c!323)) b!6267))

(assert (=> b!6267 m!7637))

(assert (=> b!6267 m!7639))

(declare-fun m!7925 () Bool)

(assert (=> b!6267 m!7925))

(assert (=> b!6063 d!2096))

(declare-fun d!2098 () Bool)

(declare-fun e!3977 () Bool)

(assert (=> d!2098 e!3977))

(declare-fun res!7288 () Bool)

(assert (=> d!2098 (=> (not res!7288) (not e!3977))))

(declare-fun lt!8351 () tuple2!802)

(assert (=> d!2098 (= res!7288 (= (buf!516 (_2!423 lt!8351)) (buf!516 (_1!425 lt!7702))))))

(declare-datatypes ((tuple3!48 0))(
  ( (tuple3!49 (_1!432 Unit!476) (_2!432 BitStream!356) (_3!24 array!439)) )
))
(declare-fun lt!8348 () tuple3!48)

(assert (=> d!2098 (= lt!8351 (tuple2!803 (_3!24 lt!8348) (_2!432 lt!8348)))))

(declare-fun readBitsLoop!0 (BitStream!356 (_ BitVec 64) array!439 (_ BitVec 64) (_ BitVec 64)) tuple3!48)

(assert (=> d!2098 (= lt!8348 (readBitsLoop!0 (_1!425 lt!7702) nBits!460 (array!440 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2098 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2098 (= (readBits!0 (_1!425 lt!7702) nBits!460) lt!8351)))

(declare-fun b!6309 () Bool)

(declare-fun res!7287 () Bool)

(assert (=> b!6309 (=> (not res!7287) (not e!3977))))

(assert (=> b!6309 (= res!7287 (bvsle (currentByte!1507 (_1!425 lt!7702)) (currentByte!1507 (_2!423 lt!8351))))))

(declare-fun b!6310 () Bool)

(declare-fun res!7285 () Bool)

(assert (=> b!6310 (=> (not res!7285) (not e!3977))))

(assert (=> b!6310 (= res!7285 (invariant!0 (currentBit!1502 (_2!423 lt!8351)) (currentByte!1507 (_2!423 lt!8351)) (size!189 (buf!516 (_2!423 lt!8351)))))))

(declare-fun b!6311 () Bool)

(declare-fun res!7286 () Bool)

(assert (=> b!6311 (=> (not res!7286) (not e!3977))))

(declare-fun lt!8354 () (_ BitVec 64))

(assert (=> b!6311 (= res!7286 (= (size!189 (_1!423 lt!8351)) ((_ extract 31 0) lt!8354)))))

(assert (=> b!6311 (and (bvslt lt!8354 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!8354 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!8349 () (_ BitVec 64))

(declare-fun lt!8350 () (_ BitVec 64))

(assert (=> b!6311 (= lt!8354 (bvsdiv lt!8349 lt!8350))))

(assert (=> b!6311 (and (not (= lt!8350 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!8349 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!8350 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!6311 (= lt!8350 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!8352 () (_ BitVec 64))

(declare-fun lt!8355 () (_ BitVec 64))

(assert (=> b!6311 (= lt!8349 (bvsub lt!8352 lt!8355))))

(assert (=> b!6311 (or (= (bvand lt!8352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8352 lt!8355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6311 (= lt!8355 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8353 () (_ BitVec 64))

(assert (=> b!6311 (= lt!8352 (bvadd nBits!460 lt!8353))))

(assert (=> b!6311 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!8353 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!8353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6311 (= lt!8353 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!6312 () Bool)

(declare-fun res!7284 () Bool)

(assert (=> b!6312 (=> (not res!7284) (not e!3977))))

(declare-fun lt!8347 () (_ BitVec 64))

(assert (=> b!6312 (= res!7284 (= (bvadd lt!8347 nBits!460) (bitIndex!0 (size!189 (buf!516 (_2!423 lt!8351))) (currentByte!1507 (_2!423 lt!8351)) (currentBit!1502 (_2!423 lt!8351)))))))

(assert (=> b!6312 (or (not (= (bvand lt!8347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!8347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!8347 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6312 (= lt!8347 (bitIndex!0 (size!189 (buf!516 (_1!425 lt!7702))) (currentByte!1507 (_1!425 lt!7702)) (currentBit!1502 (_1!425 lt!7702))))))

(declare-fun b!6313 () Bool)

(assert (=> b!6313 (= e!3977 (= (byteArrayBitContentToList!0 (_2!423 lt!8351) (_1!423 lt!8351) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!423 lt!8351) (_1!425 lt!7702) nBits!460)))))

(assert (= (and d!2098 res!7288) b!6312))

(assert (= (and b!6312 res!7284) b!6310))

(assert (= (and b!6310 res!7285) b!6311))

(assert (= (and b!6311 res!7286) b!6309))

(assert (= (and b!6309 res!7287) b!6313))

(declare-fun m!7941 () Bool)

(assert (=> d!2098 m!7941))

(declare-fun m!7943 () Bool)

(assert (=> b!6310 m!7943))

(declare-fun m!7945 () Bool)

(assert (=> b!6312 m!7945))

(declare-fun m!7947 () Bool)

(assert (=> b!6312 m!7947))

(declare-fun m!7949 () Bool)

(assert (=> b!6313 m!7949))

(declare-fun m!7951 () Bool)

(assert (=> b!6313 m!7951))

(assert (=> b!6063 d!2098))

(declare-fun b!6345 () Bool)

(declare-datatypes ((tuple2!816 0))(
  ( (tuple2!817 (_1!433 List!89) (_2!433 BitStream!356)) )
))
(declare-fun e!3992 () tuple2!816)

(assert (=> b!6345 (= e!3992 (tuple2!817 Nil!86 (_1!425 lt!7702)))))

(declare-fun b!6347 () Bool)

(declare-fun e!3991 () Bool)

(declare-fun lt!8466 () List!89)

(declare-fun isEmpty!18 (List!89) Bool)

(assert (=> b!6347 (= e!3991 (isEmpty!18 lt!8466))))

(declare-fun d!2104 () Bool)

(assert (=> d!2104 e!3991))

(declare-fun c!335 () Bool)

(assert (=> d!2104 (= c!335 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2104 (= lt!8466 (_1!433 e!3992))))

(declare-fun c!334 () Bool)

(assert (=> d!2104 (= c!334 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2104 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2104 (= (bitStreamReadBitsIntoList!0 (_2!424 lt!7698) (_1!425 lt!7702) nBits!460) lt!8466)))

(declare-fun b!6348 () Bool)

(declare-fun length!13 (List!89) Int)

(assert (=> b!6348 (= e!3991 (> (length!13 lt!8466) 0))))

(declare-fun lt!8468 () (_ BitVec 64))

(declare-datatypes ((tuple2!818 0))(
  ( (tuple2!819 (_1!434 Bool) (_2!434 BitStream!356)) )
))
(declare-fun lt!8467 () tuple2!818)

(declare-fun b!6346 () Bool)

(assert (=> b!6346 (= e!3992 (tuple2!817 (Cons!85 (_1!434 lt!8467) (bitStreamReadBitsIntoList!0 (_2!424 lt!7698) (_2!434 lt!8467) (bvsub nBits!460 lt!8468))) (_2!434 lt!8467)))))

(declare-fun readBit!0 (BitStream!356) tuple2!818)

(assert (=> b!6346 (= lt!8467 (readBit!0 (_1!425 lt!7702)))))

(assert (=> b!6346 (= lt!8468 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!2104 c!334) b!6345))

(assert (= (and d!2104 (not c!334)) b!6346))

(assert (= (and d!2104 c!335) b!6347))

(assert (= (and d!2104 (not c!335)) b!6348))

(declare-fun m!8063 () Bool)

(assert (=> b!6347 m!8063))

(declare-fun m!8065 () Bool)

(assert (=> b!6348 m!8065))

(declare-fun m!8067 () Bool)

(assert (=> b!6346 m!8067))

(declare-fun m!8069 () Bool)

(assert (=> b!6346 m!8069))

(assert (=> b!6063 d!2104))

(push 1)

