; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1226 () Bool)

(assert start!1226)

(declare-fun b!5563 () Bool)

(declare-fun res!6725 () Bool)

(declare-fun e!3596 () Bool)

(assert (=> b!5563 (=> res!6725 e!3596)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((List!81 0))(
  ( (Nil!78) (Cons!77 (h!196 Bool) (t!831 List!81)) )
))
(declare-fun lt!6783 () List!81)

(declare-datatypes ((array!420 0))(
  ( (array!421 (arr!574 (Array (_ BitVec 32) (_ BitVec 8))) (size!181 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!340 0))(
  ( (BitStream!341 (buf!505 array!420) (currentByte!1490 (_ BitVec 32)) (currentBit!1485 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!436 0))(
  ( (Unit!437) )
))
(declare-datatypes ((tuple2!742 0))(
  ( (tuple2!743 (_1!390 Unit!436) (_2!390 BitStream!340)) )
))
(declare-fun lt!6784 () tuple2!742)

(declare-fun srcBuffer!6 () array!420)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!340 array!420 (_ BitVec 64) (_ BitVec 64)) List!81)

(assert (=> b!5563 (= res!6725 (not (= lt!6783 (byteArrayBitContentToList!0 (_2!390 lt!6784) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5564 () Bool)

(declare-fun res!6729 () Bool)

(declare-fun e!3598 () Bool)

(assert (=> b!5564 (=> (not res!6729) (not e!3598))))

(declare-fun thiss!1486 () BitStream!340)

(assert (=> b!5564 (= res!6729 (= (size!181 (buf!505 thiss!1486)) (size!181 (buf!505 (_2!390 lt!6784)))))))

(declare-fun b!5565 () Bool)

(declare-fun res!6724 () Bool)

(assert (=> b!5565 (=> (not res!6724) (not e!3598))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5565 (= res!6724 (= (bitIndex!0 (size!181 (buf!505 (_2!390 lt!6784))) (currentByte!1490 (_2!390 lt!6784)) (currentBit!1485 (_2!390 lt!6784))) (bvadd (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)) nBits!460)))))

(declare-fun b!5566 () Bool)

(declare-fun res!6723 () Bool)

(assert (=> b!5566 (=> (not res!6723) (not e!3598))))

(declare-fun isPrefixOf!0 (BitStream!340 BitStream!340) Bool)

(assert (=> b!5566 (= res!6723 (isPrefixOf!0 thiss!1486 (_2!390 lt!6784)))))

(declare-fun b!5567 () Bool)

(declare-fun e!3594 () Bool)

(declare-fun array_inv!176 (array!420) Bool)

(assert (=> b!5567 (= e!3594 (array_inv!176 (buf!505 thiss!1486)))))

(declare-fun b!5568 () Bool)

(declare-fun e!3597 () Bool)

(assert (=> b!5568 (= e!3597 e!3598)))

(declare-fun res!6726 () Bool)

(assert (=> b!5568 (=> (not res!6726) (not e!3598))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5568 (= res!6726 (invariant!0 (currentBit!1485 (_2!390 lt!6784)) (currentByte!1490 (_2!390 lt!6784)) (size!181 (buf!505 (_2!390 lt!6784)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!340 array!420 (_ BitVec 64) (_ BitVec 64)) tuple2!742)

(assert (=> b!5568 (= lt!6784 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!6727 () Bool)

(assert (=> start!1226 (=> (not res!6727) (not e!3597))))

(assert (=> start!1226 (= res!6727 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!181 srcBuffer!6))))))))

(assert (=> start!1226 e!3597))

(assert (=> start!1226 true))

(assert (=> start!1226 (array_inv!176 srcBuffer!6)))

(declare-fun inv!12 (BitStream!340) Bool)

(assert (=> start!1226 (and (inv!12 thiss!1486) e!3594)))

(declare-fun b!5569 () Bool)

(declare-datatypes ((tuple2!744 0))(
  ( (tuple2!745 (_1!391 array!420) (_2!391 BitStream!340)) )
))
(declare-fun lt!6780 () tuple2!744)

(assert (=> b!5569 (= e!3596 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!181 (_1!391 lt!6780)))))))))

(declare-fun lt!6782 () Unit!436)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!340 array!420 array!420 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!436)

(assert (=> b!5569 (= lt!6782 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!390 lt!6784) srcBuffer!6 (_1!391 lt!6780) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5570 () Bool)

(assert (=> b!5570 (= e!3598 (not e!3596))))

(declare-fun res!6728 () Bool)

(assert (=> b!5570 (=> res!6728 e!3596)))

(assert (=> b!5570 (= res!6728 (not (= (byteArrayBitContentToList!0 (_2!390 lt!6784) (_1!391 lt!6780) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6783)))))

(declare-datatypes ((tuple2!746 0))(
  ( (tuple2!747 (_1!392 BitStream!340) (_2!392 BitStream!340)) )
))
(declare-fun lt!6781 () tuple2!746)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!340 BitStream!340 (_ BitVec 64)) List!81)

(assert (=> b!5570 (= lt!6783 (bitStreamReadBitsIntoList!0 (_2!390 lt!6784) (_1!392 lt!6781) nBits!460))))

(declare-fun readBits!0 (BitStream!340 (_ BitVec 64)) tuple2!744)

(assert (=> b!5570 (= lt!6780 (readBits!0 (_1!392 lt!6781) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5570 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!6784)))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) nBits!460)))

(declare-fun lt!6785 () Unit!436)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!340 array!420 (_ BitVec 64)) Unit!436)

(assert (=> b!5570 (= lt!6785 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!505 (_2!390 lt!6784)) nBits!460))))

(declare-fun reader!0 (BitStream!340 BitStream!340) tuple2!746)

(assert (=> b!5570 (= lt!6781 (reader!0 thiss!1486 (_2!390 lt!6784)))))

(declare-fun b!5571 () Bool)

(declare-fun res!6730 () Bool)

(assert (=> b!5571 (=> (not res!6730) (not e!3597))))

(assert (=> b!5571 (= res!6730 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 thiss!1486))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) nBits!460))))

(assert (= (and start!1226 res!6727) b!5571))

(assert (= (and b!5571 res!6730) b!5568))

(assert (= (and b!5568 res!6726) b!5564))

(assert (= (and b!5564 res!6729) b!5565))

(assert (= (and b!5565 res!6724) b!5566))

(assert (= (and b!5566 res!6723) b!5570))

(assert (= (and b!5570 (not res!6728)) b!5563))

(assert (= (and b!5563 (not res!6725)) b!5569))

(assert (= start!1226 b!5567))

(declare-fun m!6795 () Bool)

(assert (=> b!5569 m!6795))

(declare-fun m!6797 () Bool)

(assert (=> b!5565 m!6797))

(declare-fun m!6799 () Bool)

(assert (=> b!5565 m!6799))

(declare-fun m!6801 () Bool)

(assert (=> b!5567 m!6801))

(declare-fun m!6803 () Bool)

(assert (=> b!5571 m!6803))

(declare-fun m!6805 () Bool)

(assert (=> b!5563 m!6805))

(declare-fun m!6807 () Bool)

(assert (=> b!5570 m!6807))

(declare-fun m!6809 () Bool)

(assert (=> b!5570 m!6809))

(declare-fun m!6811 () Bool)

(assert (=> b!5570 m!6811))

(declare-fun m!6813 () Bool)

(assert (=> b!5570 m!6813))

(declare-fun m!6815 () Bool)

(assert (=> b!5570 m!6815))

(declare-fun m!6817 () Bool)

(assert (=> b!5570 m!6817))

(declare-fun m!6819 () Bool)

(assert (=> start!1226 m!6819))

(declare-fun m!6821 () Bool)

(assert (=> start!1226 m!6821))

(declare-fun m!6823 () Bool)

(assert (=> b!5568 m!6823))

(declare-fun m!6825 () Bool)

(assert (=> b!5568 m!6825))

(declare-fun m!6827 () Bool)

(assert (=> b!5566 m!6827))

(push 1)

(assert (not b!5569))

(assert (not b!5566))

(assert (not b!5563))

(assert (not b!5570))

(assert (not start!1226))

(assert (not b!5568))

(assert (not b!5571))

(assert (not b!5567))

(assert (not b!5565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1910 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1910 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 thiss!1486))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!181 (buf!505 thiss!1486))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486))) nBits!460))))

(declare-fun bs!699 () Bool)

(assert (= bs!699 d!1910))

(declare-fun m!6921 () Bool)

(assert (=> bs!699 m!6921))

(assert (=> b!5571 d!1910))

(declare-fun lt!7018 () tuple2!746)

(declare-fun e!3663 () Bool)

(declare-fun lt!7021 () (_ BitVec 64))

(declare-fun lt!7017 () (_ BitVec 64))

(declare-fun b!5694 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!340 (_ BitVec 64)) BitStream!340)

(assert (=> b!5694 (= e!3663 (= (_1!392 lt!7018) (withMovedBitIndex!0 (_2!392 lt!7018) (bvsub lt!7017 lt!7021))))))

(assert (=> b!5694 (or (= (bvand lt!7017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7017 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7017 lt!7021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5694 (= lt!7021 (bitIndex!0 (size!181 (buf!505 (_2!390 lt!6784))) (currentByte!1490 (_2!390 lt!6784)) (currentBit!1485 (_2!390 lt!6784))))))

(assert (=> b!5694 (= lt!7017 (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)))))

(declare-fun b!5695 () Bool)

(declare-fun res!6827 () Bool)

(assert (=> b!5695 (=> (not res!6827) (not e!3663))))

(assert (=> b!5695 (= res!6827 (isPrefixOf!0 (_2!392 lt!7018) (_2!390 lt!6784)))))

(declare-fun b!5696 () Bool)

(declare-fun e!3664 () Unit!436)

(declare-fun Unit!443 () Unit!436)

(assert (=> b!5696 (= e!3664 Unit!443)))

(declare-fun b!5697 () Bool)

(declare-fun res!6826 () Bool)

(assert (=> b!5697 (=> (not res!6826) (not e!3663))))

(assert (=> b!5697 (= res!6826 (isPrefixOf!0 (_1!392 lt!7018) thiss!1486))))

(declare-fun d!1912 () Bool)

(assert (=> d!1912 e!3663))

(declare-fun res!6825 () Bool)

(assert (=> d!1912 (=> (not res!6825) (not e!3663))))

(assert (=> d!1912 (= res!6825 (isPrefixOf!0 (_1!392 lt!7018) (_2!392 lt!7018)))))

(declare-fun lt!7019 () BitStream!340)

(assert (=> d!1912 (= lt!7018 (tuple2!747 lt!7019 (_2!390 lt!6784)))))

(declare-fun lt!7013 () Unit!436)

(declare-fun lt!7004 () Unit!436)

(assert (=> d!1912 (= lt!7013 lt!7004)))

(assert (=> d!1912 (isPrefixOf!0 lt!7019 (_2!390 lt!6784))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!340 BitStream!340 BitStream!340) Unit!436)

(assert (=> d!1912 (= lt!7004 (lemmaIsPrefixTransitive!0 lt!7019 (_2!390 lt!6784) (_2!390 lt!6784)))))

(declare-fun lt!7016 () Unit!436)

(declare-fun lt!7007 () Unit!436)

(assert (=> d!1912 (= lt!7016 lt!7007)))

(assert (=> d!1912 (isPrefixOf!0 lt!7019 (_2!390 lt!6784))))

(assert (=> d!1912 (= lt!7007 (lemmaIsPrefixTransitive!0 lt!7019 thiss!1486 (_2!390 lt!6784)))))

(declare-fun lt!7011 () Unit!436)

(assert (=> d!1912 (= lt!7011 e!3664)))

(declare-fun c!257 () Bool)

(assert (=> d!1912 (= c!257 (not (= (size!181 (buf!505 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!7009 () Unit!436)

(declare-fun lt!7005 () Unit!436)

(assert (=> d!1912 (= lt!7009 lt!7005)))

(assert (=> d!1912 (isPrefixOf!0 (_2!390 lt!6784) (_2!390 lt!6784))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!340) Unit!436)

(assert (=> d!1912 (= lt!7005 (lemmaIsPrefixRefl!0 (_2!390 lt!6784)))))

(declare-fun lt!7006 () Unit!436)

(declare-fun lt!7010 () Unit!436)

(assert (=> d!1912 (= lt!7006 lt!7010)))

(assert (=> d!1912 (= lt!7010 (lemmaIsPrefixRefl!0 (_2!390 lt!6784)))))

(declare-fun lt!7015 () Unit!436)

(declare-fun lt!7008 () Unit!436)

(assert (=> d!1912 (= lt!7015 lt!7008)))

(assert (=> d!1912 (isPrefixOf!0 lt!7019 lt!7019)))

(assert (=> d!1912 (= lt!7008 (lemmaIsPrefixRefl!0 lt!7019))))

(declare-fun lt!7022 () Unit!436)

(declare-fun lt!7003 () Unit!436)

(assert (=> d!1912 (= lt!7022 lt!7003)))

(assert (=> d!1912 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1912 (= lt!7003 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1912 (= lt!7019 (BitStream!341 (buf!505 (_2!390 lt!6784)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)))))

(assert (=> d!1912 (isPrefixOf!0 thiss!1486 (_2!390 lt!6784))))

(assert (=> d!1912 (= (reader!0 thiss!1486 (_2!390 lt!6784)) lt!7018)))

(declare-fun b!5698 () Bool)

(declare-fun lt!7012 () Unit!436)

(assert (=> b!5698 (= e!3664 lt!7012)))

(declare-fun lt!7020 () (_ BitVec 64))

(assert (=> b!5698 (= lt!7020 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7014 () (_ BitVec 64))

(assert (=> b!5698 (= lt!7014 (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!420 array!420 (_ BitVec 64) (_ BitVec 64)) Unit!436)

(assert (=> b!5698 (= lt!7012 (arrayBitRangesEqSymmetric!0 (buf!505 thiss!1486) (buf!505 (_2!390 lt!6784)) lt!7020 lt!7014))))

(declare-fun arrayBitRangesEq!0 (array!420 array!420 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5698 (arrayBitRangesEq!0 (buf!505 (_2!390 lt!6784)) (buf!505 thiss!1486) lt!7020 lt!7014)))

(assert (= (and d!1912 c!257) b!5698))

(assert (= (and d!1912 (not c!257)) b!5696))

(assert (= (and d!1912 res!6825) b!5697))

(assert (= (and b!5697 res!6826) b!5695))

(assert (= (and b!5695 res!6827) b!5694))

(declare-fun m!6969 () Bool)

(assert (=> b!5694 m!6969))

(assert (=> b!5694 m!6797))

(assert (=> b!5694 m!6799))

(assert (=> b!5698 m!6799))

(declare-fun m!6971 () Bool)

(assert (=> b!5698 m!6971))

(declare-fun m!6973 () Bool)

(assert (=> b!5698 m!6973))

(declare-fun m!6975 () Bool)

(assert (=> d!1912 m!6975))

(assert (=> d!1912 m!6827))

(declare-fun m!6977 () Bool)

(assert (=> d!1912 m!6977))

(declare-fun m!6979 () Bool)

(assert (=> d!1912 m!6979))

(declare-fun m!6981 () Bool)

(assert (=> d!1912 m!6981))

(declare-fun m!6983 () Bool)

(assert (=> d!1912 m!6983))

(declare-fun m!6985 () Bool)

(assert (=> d!1912 m!6985))

(declare-fun m!6987 () Bool)

(assert (=> d!1912 m!6987))

(declare-fun m!6989 () Bool)

(assert (=> d!1912 m!6989))

(declare-fun m!6991 () Bool)

(assert (=> d!1912 m!6991))

(declare-fun m!6993 () Bool)

(assert (=> d!1912 m!6993))

(declare-fun m!6995 () Bool)

(assert (=> b!5695 m!6995))

(declare-fun m!6997 () Bool)

(assert (=> b!5697 m!6997))

(assert (=> b!5570 d!1912))

(declare-fun b!5754 () Bool)

(declare-fun res!6855 () Bool)

(declare-fun e!3685 () Bool)

(assert (=> b!5754 (=> (not res!6855) (not e!3685))))

(declare-fun lt!7116 () tuple2!744)

(assert (=> b!5754 (= res!6855 (invariant!0 (currentBit!1485 (_2!391 lt!7116)) (currentByte!1490 (_2!391 lt!7116)) (size!181 (buf!505 (_2!391 lt!7116)))))))

(declare-fun b!5755 () Bool)

(declare-fun res!6856 () Bool)

(assert (=> b!5755 (=> (not res!6856) (not e!3685))))

(assert (=> b!5755 (= res!6856 (bvsle (currentByte!1490 (_1!392 lt!6781)) (currentByte!1490 (_2!391 lt!7116))))))

(declare-fun b!5756 () Bool)

(assert (=> b!5756 (= e!3685 (= (byteArrayBitContentToList!0 (_2!391 lt!7116) (_1!391 lt!7116) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!391 lt!7116) (_1!392 lt!6781) nBits!460)))))

(declare-fun d!1922 () Bool)

(assert (=> d!1922 e!3685))

(declare-fun res!6854 () Bool)

(assert (=> d!1922 (=> (not res!6854) (not e!3685))))

(assert (=> d!1922 (= res!6854 (= (buf!505 (_2!391 lt!7116)) (buf!505 (_1!392 lt!6781))))))

(declare-datatypes ((tuple3!42 0))(
  ( (tuple3!43 (_1!405 Unit!436) (_2!405 BitStream!340) (_3!21 array!420)) )
))
(declare-fun lt!7114 () tuple3!42)

(assert (=> d!1922 (= lt!7116 (tuple2!745 (_3!21 lt!7114) (_2!405 lt!7114)))))

(declare-fun readBitsLoop!0 (BitStream!340 (_ BitVec 64) array!420 (_ BitVec 64) (_ BitVec 64)) tuple3!42)

(assert (=> d!1922 (= lt!7114 (readBitsLoop!0 (_1!392 lt!6781) nBits!460 (array!421 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1922 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1922 (= (readBits!0 (_1!392 lt!6781) nBits!460) lt!7116)))

(declare-fun b!5757 () Bool)

(declare-fun res!6857 () Bool)

(assert (=> b!5757 (=> (not res!6857) (not e!3685))))

(declare-fun lt!7117 () (_ BitVec 64))

(assert (=> b!5757 (= res!6857 (= (bvadd lt!7117 nBits!460) (bitIndex!0 (size!181 (buf!505 (_2!391 lt!7116))) (currentByte!1490 (_2!391 lt!7116)) (currentBit!1485 (_2!391 lt!7116)))))))

(assert (=> b!5757 (or (not (= (bvand lt!7117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!7117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!7117 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5757 (= lt!7117 (bitIndex!0 (size!181 (buf!505 (_1!392 lt!6781))) (currentByte!1490 (_1!392 lt!6781)) (currentBit!1485 (_1!392 lt!6781))))))

(declare-fun b!5758 () Bool)

(declare-fun res!6853 () Bool)

(assert (=> b!5758 (=> (not res!6853) (not e!3685))))

(declare-fun lt!7122 () (_ BitVec 64))

(assert (=> b!5758 (= res!6853 (= (size!181 (_1!391 lt!7116)) ((_ extract 31 0) lt!7122)))))

(assert (=> b!5758 (and (bvslt lt!7122 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!7122 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!7115 () (_ BitVec 64))

(declare-fun lt!7119 () (_ BitVec 64))

(assert (=> b!5758 (= lt!7122 (bvsdiv lt!7115 lt!7119))))

(assert (=> b!5758 (and (not (= lt!7119 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!7115 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7119 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!5758 (= lt!7119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!7118 () (_ BitVec 64))

(declare-fun lt!7120 () (_ BitVec 64))

(assert (=> b!5758 (= lt!7115 (bvsub lt!7118 lt!7120))))

(assert (=> b!5758 (or (= (bvand lt!7118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7118 lt!7120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5758 (= lt!7120 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7121 () (_ BitVec 64))

(assert (=> b!5758 (= lt!7118 (bvadd nBits!460 lt!7121))))

(assert (=> b!5758 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7121 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!7121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5758 (= lt!7121 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (= (and d!1922 res!6854) b!5757))

(assert (= (and b!5757 res!6857) b!5754))

(assert (= (and b!5754 res!6855) b!5758))

(assert (= (and b!5758 res!6853) b!5755))

(assert (= (and b!5755 res!6856) b!5756))

(declare-fun m!7035 () Bool)

(assert (=> b!5754 m!7035))

(declare-fun m!7037 () Bool)

(assert (=> b!5756 m!7037))

(declare-fun m!7039 () Bool)

(assert (=> b!5756 m!7039))

(declare-fun m!7041 () Bool)

(assert (=> d!1922 m!7041))

(declare-fun m!7043 () Bool)

(assert (=> b!5757 m!7043))

(declare-fun m!7045 () Bool)

(assert (=> b!5757 m!7045))

(assert (=> b!5570 d!1922))

(declare-fun b!5781 () Bool)

(declare-fun e!3695 () Bool)

(declare-fun lt!7164 () List!81)

(declare-fun length!10 (List!81) Int)

(assert (=> b!5781 (= e!3695 (> (length!10 lt!7164) 0))))

(declare-fun b!5778 () Bool)

(declare-datatypes ((tuple2!768 0))(
  ( (tuple2!769 (_1!406 List!81) (_2!406 BitStream!340)) )
))
(declare-fun e!3694 () tuple2!768)

(assert (=> b!5778 (= e!3694 (tuple2!769 Nil!78 (_1!392 lt!6781)))))

(declare-fun b!5779 () Bool)

(declare-datatypes ((tuple2!770 0))(
  ( (tuple2!771 (_1!407 Bool) (_2!407 BitStream!340)) )
))
(declare-fun lt!7165 () tuple2!770)

(declare-fun lt!7166 () (_ BitVec 64))

(assert (=> b!5779 (= e!3694 (tuple2!769 (Cons!77 (_1!407 lt!7165) (bitStreamReadBitsIntoList!0 (_2!390 lt!6784) (_2!407 lt!7165) (bvsub nBits!460 lt!7166))) (_2!407 lt!7165)))))

(declare-fun readBit!0 (BitStream!340) tuple2!770)

(assert (=> b!5779 (= lt!7165 (readBit!0 (_1!392 lt!6781)))))

(assert (=> b!5779 (= lt!7166 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!5780 () Bool)

(declare-fun isEmpty!15 (List!81) Bool)

(assert (=> b!5780 (= e!3695 (isEmpty!15 lt!7164))))

(declare-fun d!1936 () Bool)

(assert (=> d!1936 e!3695))

(declare-fun c!279 () Bool)

(assert (=> d!1936 (= c!279 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1936 (= lt!7164 (_1!406 e!3694))))

(declare-fun c!278 () Bool)

(assert (=> d!1936 (= c!278 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1936 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1936 (= (bitStreamReadBitsIntoList!0 (_2!390 lt!6784) (_1!392 lt!6781) nBits!460) lt!7164)))

(assert (= (and d!1936 c!278) b!5778))

(assert (= (and d!1936 (not c!278)) b!5779))

(assert (= (and d!1936 c!279) b!5780))

(assert (= (and d!1936 (not c!279)) b!5781))

(declare-fun m!7083 () Bool)

(assert (=> b!5781 m!7083))

(declare-fun m!7085 () Bool)

(assert (=> b!5779 m!7085))

(declare-fun m!7087 () Bool)

(assert (=> b!5779 m!7087))

(declare-fun m!7089 () Bool)

(assert (=> b!5780 m!7089))

(assert (=> b!5570 d!1936))

(declare-fun d!1946 () Bool)

(assert (=> d!1946 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!6784)))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!6784)))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486))) nBits!460))))

(declare-fun bs!706 () Bool)

(assert (= bs!706 d!1946))

(declare-fun m!7091 () Bool)

(assert (=> bs!706 m!7091))

(assert (=> b!5570 d!1946))

(declare-fun d!1948 () Bool)

(assert (=> d!1948 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!6784)))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) nBits!460)))

(declare-fun lt!7169 () Unit!436)

(declare-fun choose!9 (BitStream!340 array!420 (_ BitVec 64) BitStream!340) Unit!436)

(assert (=> d!1948 (= lt!7169 (choose!9 thiss!1486 (buf!505 (_2!390 lt!6784)) nBits!460 (BitStream!341 (buf!505 (_2!390 lt!6784)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486))))))

(assert (=> d!1948 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!505 (_2!390 lt!6784)) nBits!460) lt!7169)))

(declare-fun bs!707 () Bool)

(assert (= bs!707 d!1948))

(assert (=> bs!707 m!6817))

(declare-fun m!7095 () Bool)

(assert (=> bs!707 m!7095))

(assert (=> b!5570 d!1948))

(declare-fun d!1952 () Bool)

(declare-fun c!282 () Bool)

(assert (=> d!1952 (= c!282 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3704 () List!81)

(assert (=> d!1952 (= (byteArrayBitContentToList!0 (_2!390 lt!6784) (_1!391 lt!6780) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3704)))

(declare-fun b!5795 () Bool)

(assert (=> b!5795 (= e!3704 Nil!78)))

(declare-fun b!5796 () Bool)

(assert (=> b!5796 (= e!3704 (Cons!77 (not (= (bvand ((_ sign_extend 24) (select (arr!574 (_1!391 lt!6780)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!390 lt!6784) (_1!391 lt!6780) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1952 c!282) b!5795))

(assert (= (and d!1952 (not c!282)) b!5796))

(declare-fun m!7097 () Bool)

(assert (=> b!5796 m!7097))

(declare-fun m!7099 () Bool)

(assert (=> b!5796 m!7099))

(declare-fun m!7101 () Bool)

(assert (=> b!5796 m!7101))

(assert (=> b!5570 d!1952))

(declare-fun d!1956 () Bool)

(declare-fun e!3707 () Bool)

(assert (=> d!1956 e!3707))

(declare-fun res!6880 () Bool)

(assert (=> d!1956 (=> (not res!6880) (not e!3707))))

(declare-fun lt!7187 () (_ BitVec 64))

(declare-fun lt!7184 () (_ BitVec 64))

(declare-fun lt!7183 () (_ BitVec 64))

(assert (=> d!1956 (= res!6880 (= lt!7183 (bvsub lt!7184 lt!7187)))))

(assert (=> d!1956 (or (= (bvand lt!7184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7187 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7184 lt!7187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1956 (= lt!7187 (remainingBits!0 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!6784)))) ((_ sign_extend 32) (currentByte!1490 (_2!390 lt!6784))) ((_ sign_extend 32) (currentBit!1485 (_2!390 lt!6784)))))))

(declare-fun lt!7182 () (_ BitVec 64))

(declare-fun lt!7185 () (_ BitVec 64))

(assert (=> d!1956 (= lt!7184 (bvmul lt!7182 lt!7185))))

(assert (=> d!1956 (or (= lt!7182 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!7185 (bvsdiv (bvmul lt!7182 lt!7185) lt!7182)))))

(assert (=> d!1956 (= lt!7185 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1956 (= lt!7182 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!6784)))))))

(assert (=> d!1956 (= lt!7183 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1490 (_2!390 lt!6784))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1485 (_2!390 lt!6784)))))))

(assert (=> d!1956 (invariant!0 (currentBit!1485 (_2!390 lt!6784)) (currentByte!1490 (_2!390 lt!6784)) (size!181 (buf!505 (_2!390 lt!6784))))))

(assert (=> d!1956 (= (bitIndex!0 (size!181 (buf!505 (_2!390 lt!6784))) (currentByte!1490 (_2!390 lt!6784)) (currentBit!1485 (_2!390 lt!6784))) lt!7183)))

(declare-fun b!5801 () Bool)

(declare-fun res!6881 () Bool)

(assert (=> b!5801 (=> (not res!6881) (not e!3707))))

(assert (=> b!5801 (= res!6881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!7183))))

(declare-fun b!5802 () Bool)

(declare-fun lt!7186 () (_ BitVec 64))

(assert (=> b!5802 (= e!3707 (bvsle lt!7183 (bvmul lt!7186 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!5802 (or (= lt!7186 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!7186 #b0000000000000000000000000000000000000000000000000000000000001000) lt!7186)))))

(assert (=> b!5802 (= lt!7186 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!6784)))))))

(assert (= (and d!1956 res!6880) b!5801))

(assert (= (and b!5801 res!6881) b!5802))

(declare-fun m!7103 () Bool)

(assert (=> d!1956 m!7103))

(assert (=> d!1956 m!6823))

(assert (=> b!5565 d!1956))

(declare-fun d!1958 () Bool)

(declare-fun e!3708 () Bool)

(assert (=> d!1958 e!3708))

(declare-fun res!6882 () Bool)

(assert (=> d!1958 (=> (not res!6882) (not e!3708))))

(declare-fun lt!7190 () (_ BitVec 64))

(declare-fun lt!7193 () (_ BitVec 64))

(declare-fun lt!7189 () (_ BitVec 64))

(assert (=> d!1958 (= res!6882 (= lt!7189 (bvsub lt!7190 lt!7193)))))

(assert (=> d!1958 (or (= (bvand lt!7190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7193 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7190 lt!7193) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1958 (= lt!7193 (remainingBits!0 ((_ sign_extend 32) (size!181 (buf!505 thiss!1486))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486))))))

(declare-fun lt!7188 () (_ BitVec 64))

(declare-fun lt!7191 () (_ BitVec 64))

(assert (=> d!1958 (= lt!7190 (bvmul lt!7188 lt!7191))))

(assert (=> d!1958 (or (= lt!7188 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!7191 (bvsdiv (bvmul lt!7188 lt!7191) lt!7188)))))

(assert (=> d!1958 (= lt!7191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1958 (= lt!7188 ((_ sign_extend 32) (size!181 (buf!505 thiss!1486))))))

(assert (=> d!1958 (= lt!7189 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1490 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1485 thiss!1486))))))

(assert (=> d!1958 (invariant!0 (currentBit!1485 thiss!1486) (currentByte!1490 thiss!1486) (size!181 (buf!505 thiss!1486)))))

(assert (=> d!1958 (= (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)) lt!7189)))

(declare-fun b!5803 () Bool)

(declare-fun res!6883 () Bool)

(assert (=> b!5803 (=> (not res!6883) (not e!3708))))

(assert (=> b!5803 (= res!6883 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!7189))))

(declare-fun b!5804 () Bool)

(declare-fun lt!7192 () (_ BitVec 64))

(assert (=> b!5804 (= e!3708 (bvsle lt!7189 (bvmul lt!7192 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!5804 (or (= lt!7192 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!7192 #b0000000000000000000000000000000000000000000000000000000000001000) lt!7192)))))

(assert (=> b!5804 (= lt!7192 ((_ sign_extend 32) (size!181 (buf!505 thiss!1486))))))

(assert (= (and d!1958 res!6882) b!5803))

(assert (= (and b!5803 res!6883) b!5804))

(assert (=> d!1958 m!6921))

(declare-fun m!7105 () Bool)

(assert (=> d!1958 m!7105))

(assert (=> b!5565 d!1958))

(declare-fun d!1960 () Bool)

(assert (=> d!1960 (= (array_inv!176 srcBuffer!6) (bvsge (size!181 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1226 d!1960))

(declare-fun d!1962 () Bool)

(assert (=> d!1962 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1485 thiss!1486) (currentByte!1490 thiss!1486) (size!181 (buf!505 thiss!1486))))))

(declare-fun bs!708 () Bool)

(assert (= bs!708 d!1962))

(assert (=> bs!708 m!7105))

(assert (=> start!1226 d!1962))

(declare-fun d!1964 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!340 array!420 array!420 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!1964 (checkByteArrayBitContent!0 (_2!390 lt!6784) srcBuffer!6 (_1!391 lt!6780) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!7196 () Unit!436)

(declare-fun choose!65 (BitStream!340 array!420 array!420 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!436)

(assert (=> d!1964 (= lt!7196 (choose!65 (_2!390 lt!6784) srcBuffer!6 (_1!391 lt!6780) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1964 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1964 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!390 lt!6784) srcBuffer!6 (_1!391 lt!6780) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7196)))

(declare-fun bs!709 () Bool)

(assert (= bs!709 d!1964))

(declare-fun m!7107 () Bool)

(assert (=> bs!709 m!7107))

(declare-fun m!7109 () Bool)

(assert (=> bs!709 m!7109))

(assert (=> b!5569 d!1964))

(declare-fun d!1966 () Bool)

(assert (=> d!1966 (= (invariant!0 (currentBit!1485 (_2!390 lt!6784)) (currentByte!1490 (_2!390 lt!6784)) (size!181 (buf!505 (_2!390 lt!6784)))) (and (bvsge (currentBit!1485 (_2!390 lt!6784)) #b00000000000000000000000000000000) (bvslt (currentBit!1485 (_2!390 lt!6784)) #b00000000000000000000000000001000) (bvsge (currentByte!1490 (_2!390 lt!6784)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1490 (_2!390 lt!6784)) (size!181 (buf!505 (_2!390 lt!6784)))) (and (= (currentBit!1485 (_2!390 lt!6784)) #b00000000000000000000000000000000) (= (currentByte!1490 (_2!390 lt!6784)) (size!181 (buf!505 (_2!390 lt!6784))))))))))

(assert (=> b!5568 d!1966))

(declare-fun b!5880 () Bool)

(declare-fun res!6946 () Bool)

(declare-fun e!3742 () Bool)

(assert (=> b!5880 (=> (not res!6946) (not e!3742))))

(declare-fun lt!7571 () tuple2!742)

(assert (=> b!5880 (= res!6946 (= (size!181 (buf!505 thiss!1486)) (size!181 (buf!505 (_2!390 lt!7571)))))))

(declare-fun d!1968 () Bool)

(assert (=> d!1968 e!3742))

(declare-fun res!6943 () Bool)

(assert (=> d!1968 (=> (not res!6943) (not e!3742))))

(declare-fun lt!7591 () (_ BitVec 64))

(assert (=> d!1968 (= res!6943 (= (bitIndex!0 (size!181 (buf!505 (_2!390 lt!7571))) (currentByte!1490 (_2!390 lt!7571)) (currentBit!1485 (_2!390 lt!7571))) (bvsub lt!7591 from!367)))))

(assert (=> d!1968 (or (= (bvand lt!7591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7591 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7578 () (_ BitVec 64))

(assert (=> d!1968 (= lt!7591 (bvadd lt!7578 from!367 nBits!460))))

(assert (=> d!1968 (or (not (= (bvand lt!7578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!7578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!7578 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1968 (= lt!7578 (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)))))

(declare-fun e!3741 () tuple2!742)

(assert (=> d!1968 (= lt!7571 e!3741)))

(declare-fun c!292 () Bool)

(assert (=> d!1968 (= c!292 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!7575 () Unit!436)

(declare-fun lt!7592 () Unit!436)

(assert (=> d!1968 (= lt!7575 lt!7592)))

(assert (=> d!1968 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1968 (= lt!7592 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!7566 () (_ BitVec 64))

(assert (=> d!1968 (= lt!7566 (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)))))

(assert (=> d!1968 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1968 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!7571)))

(declare-fun b!5881 () Bool)

(declare-fun lt!7583 () tuple2!746)

(assert (=> b!5881 (= e!3742 (= (bitStreamReadBitsIntoList!0 (_2!390 lt!7571) (_1!392 lt!7583) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!390 lt!7571) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!5881 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5881 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7555 () Unit!436)

(declare-fun lt!7577 () Unit!436)

(assert (=> b!5881 (= lt!7555 lt!7577)))

(declare-fun lt!7570 () (_ BitVec 64))

(assert (=> b!5881 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!7571)))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) lt!7570)))

(assert (=> b!5881 (= lt!7577 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!505 (_2!390 lt!7571)) lt!7570))))

(declare-fun e!3740 () Bool)

(assert (=> b!5881 e!3740))

(declare-fun res!6941 () Bool)

(assert (=> b!5881 (=> (not res!6941) (not e!3740))))

(assert (=> b!5881 (= res!6941 (and (= (size!181 (buf!505 thiss!1486)) (size!181 (buf!505 (_2!390 lt!7571)))) (bvsge lt!7570 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5881 (= lt!7570 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!5881 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5881 (= lt!7583 (reader!0 thiss!1486 (_2!390 lt!7571)))))

(declare-fun bm!62 () Bool)

(declare-fun call!65 () tuple2!746)

(declare-fun lt!7585 () tuple2!742)

(assert (=> bm!62 (= call!65 (reader!0 thiss!1486 (ite c!292 (_2!390 lt!7585) thiss!1486)))))

(declare-fun b!5882 () Bool)

(assert (=> b!5882 (= e!3740 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 thiss!1486))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) lt!7570))))

(declare-fun b!5883 () Bool)

(declare-fun res!6945 () Bool)

(assert (=> b!5883 (=> (not res!6945) (not e!3742))))

(assert (=> b!5883 (= res!6945 (isPrefixOf!0 thiss!1486 (_2!390 lt!7571)))))

(declare-fun b!5884 () Bool)

(declare-fun res!6944 () Bool)

(assert (=> b!5884 (=> (not res!6944) (not e!3742))))

(assert (=> b!5884 (= res!6944 (invariant!0 (currentBit!1485 (_2!390 lt!7571)) (currentByte!1490 (_2!390 lt!7571)) (size!181 (buf!505 (_2!390 lt!7571)))))))

(declare-fun b!5885 () Bool)

(declare-fun lt!7589 () tuple2!742)

(declare-fun Unit!455 () Unit!436)

(assert (=> b!5885 (= e!3741 (tuple2!743 Unit!455 (_2!390 lt!7589)))))

(declare-fun appendBitFromByte!0 (BitStream!340 (_ BitVec 8) (_ BitVec 32)) tuple2!742)

(assert (=> b!5885 (= lt!7585 (appendBitFromByte!0 thiss!1486 (select (arr!574 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!7554 () (_ BitVec 64))

(assert (=> b!5885 (= lt!7554 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7584 () (_ BitVec 64))

(assert (=> b!5885 (= lt!7584 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7586 () Unit!436)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!340 BitStream!340 (_ BitVec 64) (_ BitVec 64)) Unit!436)

(assert (=> b!5885 (= lt!7586 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!390 lt!7585) lt!7554 lt!7584))))

(assert (=> b!5885 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!7585)))) ((_ sign_extend 32) (currentByte!1490 (_2!390 lt!7585))) ((_ sign_extend 32) (currentBit!1485 (_2!390 lt!7585))) (bvsub lt!7554 lt!7584))))

(declare-fun lt!7588 () Unit!436)

(assert (=> b!5885 (= lt!7588 lt!7586)))

(declare-fun lt!7564 () tuple2!746)

(assert (=> b!5885 (= lt!7564 call!65)))

(declare-fun lt!7572 () (_ BitVec 64))

(assert (=> b!5885 (= lt!7572 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7560 () Unit!436)

(assert (=> b!5885 (= lt!7560 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!505 (_2!390 lt!7585)) lt!7572))))

(assert (=> b!5885 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!7585)))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) lt!7572)))

(declare-fun lt!7559 () Unit!436)

(assert (=> b!5885 (= lt!7559 lt!7560)))

(declare-fun head!24 (List!81) Bool)

(assert (=> b!5885 (= (head!24 (byteArrayBitContentToList!0 (_2!390 lt!7585) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!24 (bitStreamReadBitsIntoList!0 (_2!390 lt!7585) (_1!392 lt!7564) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7565 () Unit!436)

(declare-fun Unit!456 () Unit!436)

(assert (=> b!5885 (= lt!7565 Unit!456)))

(assert (=> b!5885 (= lt!7589 (appendBitsMSBFirstLoop!0 (_2!390 lt!7585) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!7593 () Unit!436)

(assert (=> b!5885 (= lt!7593 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!390 lt!7585) (_2!390 lt!7589)))))

(assert (=> b!5885 (isPrefixOf!0 thiss!1486 (_2!390 lt!7589))))

(declare-fun lt!7574 () Unit!436)

(assert (=> b!5885 (= lt!7574 lt!7593)))

(assert (=> b!5885 (= (size!181 (buf!505 (_2!390 lt!7589))) (size!181 (buf!505 thiss!1486)))))

(declare-fun lt!7595 () Unit!436)

(declare-fun Unit!458 () Unit!436)

(assert (=> b!5885 (= lt!7595 Unit!458)))

(assert (=> b!5885 (= (bitIndex!0 (size!181 (buf!505 (_2!390 lt!7589))) (currentByte!1490 (_2!390 lt!7589)) (currentBit!1485 (_2!390 lt!7589))) (bvsub (bvadd (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!7557 () Unit!436)

(declare-fun Unit!459 () Unit!436)

(assert (=> b!5885 (= lt!7557 Unit!459)))

(assert (=> b!5885 (= (bitIndex!0 (size!181 (buf!505 (_2!390 lt!7589))) (currentByte!1490 (_2!390 lt!7589)) (currentBit!1485 (_2!390 lt!7589))) (bvsub (bvsub (bvadd (bitIndex!0 (size!181 (buf!505 (_2!390 lt!7585))) (currentByte!1490 (_2!390 lt!7585)) (currentBit!1485 (_2!390 lt!7585))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!7562 () Unit!436)

(declare-fun Unit!461 () Unit!436)

(assert (=> b!5885 (= lt!7562 Unit!461)))

(declare-fun lt!7556 () tuple2!746)

(assert (=> b!5885 (= lt!7556 (reader!0 thiss!1486 (_2!390 lt!7589)))))

(declare-fun lt!7590 () (_ BitVec 64))

(assert (=> b!5885 (= lt!7590 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7582 () Unit!436)

(assert (=> b!5885 (= lt!7582 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!505 (_2!390 lt!7589)) lt!7590))))

(assert (=> b!5885 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!7589)))) ((_ sign_extend 32) (currentByte!1490 thiss!1486)) ((_ sign_extend 32) (currentBit!1485 thiss!1486)) lt!7590)))

(declare-fun lt!7561 () Unit!436)

(assert (=> b!5885 (= lt!7561 lt!7582)))

(declare-fun lt!7553 () tuple2!746)

(assert (=> b!5885 (= lt!7553 (reader!0 (_2!390 lt!7585) (_2!390 lt!7589)))))

(declare-fun lt!7576 () (_ BitVec 64))

(assert (=> b!5885 (= lt!7576 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!7573 () Unit!436)

(assert (=> b!5885 (= lt!7573 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!390 lt!7585) (buf!505 (_2!390 lt!7589)) lt!7576))))

(assert (=> b!5885 (validate_offset_bits!1 ((_ sign_extend 32) (size!181 (buf!505 (_2!390 lt!7589)))) ((_ sign_extend 32) (currentByte!1490 (_2!390 lt!7585))) ((_ sign_extend 32) (currentBit!1485 (_2!390 lt!7585))) lt!7576)))

(declare-fun lt!7558 () Unit!436)

(assert (=> b!5885 (= lt!7558 lt!7573)))

(declare-fun lt!7552 () List!81)

(assert (=> b!5885 (= lt!7552 (byteArrayBitContentToList!0 (_2!390 lt!7589) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!7569 () List!81)

(assert (=> b!5885 (= lt!7569 (byteArrayBitContentToList!0 (_2!390 lt!7589) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7580 () List!81)

(assert (=> b!5885 (= lt!7580 (bitStreamReadBitsIntoList!0 (_2!390 lt!7589) (_1!392 lt!7556) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!7594 () List!81)

(assert (=> b!5885 (= lt!7594 (bitStreamReadBitsIntoList!0 (_2!390 lt!7589) (_1!392 lt!7553) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7567 () (_ BitVec 64))

(assert (=> b!5885 (= lt!7567 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7587 () Unit!436)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!340 BitStream!340 BitStream!340 BitStream!340 (_ BitVec 64) List!81) Unit!436)

(assert (=> b!5885 (= lt!7587 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!390 lt!7589) (_2!390 lt!7589) (_1!392 lt!7556) (_1!392 lt!7553) lt!7567 lt!7580))))

(declare-fun tail!32 (List!81) List!81)

(assert (=> b!5885 (= (bitStreamReadBitsIntoList!0 (_2!390 lt!7589) (_1!392 lt!7553) (bvsub lt!7567 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!32 lt!7580))))

(declare-fun lt!7563 () Unit!436)

(assert (=> b!5885 (= lt!7563 lt!7587)))

(declare-fun lt!7579 () Unit!436)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!420 array!420 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!436)

(assert (=> b!5885 (= lt!7579 (arrayBitRangesEqImpliesEq!0 (buf!505 (_2!390 lt!7585)) (buf!505 (_2!390 lt!7589)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!7566 (bitIndex!0 (size!181 (buf!505 (_2!390 lt!7585))) (currentByte!1490 (_2!390 lt!7585)) (currentBit!1485 (_2!390 lt!7585)))))))

(declare-fun bitAt!0 (array!420 (_ BitVec 64)) Bool)

(assert (=> b!5885 (= (bitAt!0 (buf!505 (_2!390 lt!7585)) lt!7566) (bitAt!0 (buf!505 (_2!390 lt!7589)) lt!7566))))

(declare-fun lt!7568 () Unit!436)

(assert (=> b!5885 (= lt!7568 lt!7579)))

(declare-fun b!5886 () Bool)

(declare-fun res!6942 () Bool)

(assert (=> b!5886 (=> (not res!6942) (not e!3742))))

(assert (=> b!5886 (= res!6942 (= (size!181 (buf!505 (_2!390 lt!7571))) (size!181 (buf!505 thiss!1486))))))

(declare-fun b!5887 () Bool)

(declare-fun Unit!464 () Unit!436)

(assert (=> b!5887 (= e!3741 (tuple2!743 Unit!464 thiss!1486))))

(assert (=> b!5887 (= (size!181 (buf!505 thiss!1486)) (size!181 (buf!505 thiss!1486)))))

(declare-fun lt!7581 () Unit!436)

(declare-fun Unit!465 () Unit!436)

(assert (=> b!5887 (= lt!7581 Unit!465)))

(assert (=> b!5887 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!391 (readBits!0 (_1!392 call!65) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (= (and d!1968 c!292) b!5885))

(assert (= (and d!1968 (not c!292)) b!5887))

(assert (= (or b!5885 b!5887) bm!62))

(assert (= (and d!1968 res!6943) b!5884))

(assert (= (and b!5884 res!6944) b!5880))

(assert (= (and b!5880 res!6946) b!5883))

(assert (= (and b!5883 res!6945) b!5886))

(assert (= (and b!5886 res!6942) b!5881))

(assert (= (and b!5881 res!6941) b!5882))

(declare-fun m!7291 () Bool)

(assert (=> bm!62 m!7291))

(declare-fun m!7293 () Bool)

(assert (=> b!5884 m!7293))

(declare-fun m!7295 () Bool)

(assert (=> d!1968 m!7295))

(assert (=> d!1968 m!6799))

(assert (=> d!1968 m!6989))

(assert (=> d!1968 m!6977))

(declare-fun m!7297 () Bool)

(assert (=> b!5882 m!7297))

(declare-fun m!7299 () Bool)

(assert (=> b!5887 m!7299))

(declare-fun m!7301 () Bool)

(assert (=> b!5887 m!7301))

(declare-fun m!7303 () Bool)

(assert (=> b!5883 m!7303))

(declare-fun m!7305 () Bool)

(assert (=> b!5885 m!7305))

(assert (=> b!5885 m!6799))

(declare-fun m!7307 () Bool)

(assert (=> b!5885 m!7307))

(declare-fun m!7309 () Bool)

(assert (=> b!5885 m!7309))

(declare-fun m!7311 () Bool)

(assert (=> b!5885 m!7311))

(declare-fun m!7313 () Bool)

(assert (=> b!5885 m!7313))

(declare-fun m!7315 () Bool)

(assert (=> b!5885 m!7315))

(declare-fun m!7317 () Bool)

(assert (=> b!5885 m!7317))

(declare-fun m!7319 () Bool)

(assert (=> b!5885 m!7319))

(declare-fun m!7321 () Bool)

(assert (=> b!5885 m!7321))

(assert (=> b!5885 m!7321))

(declare-fun m!7323 () Bool)

(assert (=> b!5885 m!7323))

(declare-fun m!7325 () Bool)

(assert (=> b!5885 m!7325))

(declare-fun m!7327 () Bool)

(assert (=> b!5885 m!7327))

(declare-fun m!7329 () Bool)

(assert (=> b!5885 m!7329))

(declare-fun m!7331 () Bool)

(assert (=> b!5885 m!7331))

(declare-fun m!7333 () Bool)

(assert (=> b!5885 m!7333))

(declare-fun m!7335 () Bool)

(assert (=> b!5885 m!7335))

(assert (=> b!5885 m!7307))

(declare-fun m!7337 () Bool)

(assert (=> b!5885 m!7337))

(declare-fun m!7339 () Bool)

(assert (=> b!5885 m!7339))

(declare-fun m!7341 () Bool)

(assert (=> b!5885 m!7341))

(declare-fun m!7343 () Bool)

(assert (=> b!5885 m!7343))

(declare-fun m!7345 () Bool)

(assert (=> b!5885 m!7345))

(declare-fun m!7347 () Bool)

(assert (=> b!5885 m!7347))

(assert (=> b!5885 m!7313))

(declare-fun m!7349 () Bool)

(assert (=> b!5885 m!7349))

(declare-fun m!7351 () Bool)

(assert (=> b!5885 m!7351))

(declare-fun m!7353 () Bool)

(assert (=> b!5885 m!7353))

(declare-fun m!7355 () Bool)

(assert (=> b!5885 m!7355))

(assert (=> b!5885 m!7345))

(declare-fun m!7357 () Bool)

(assert (=> b!5885 m!7357))

(declare-fun m!7359 () Bool)

(assert (=> b!5885 m!7359))

(declare-fun m!7361 () Bool)

(assert (=> b!5885 m!7361))

(declare-fun m!7363 () Bool)

(assert (=> b!5885 m!7363))

(declare-fun m!7365 () Bool)

(assert (=> b!5885 m!7365))

(declare-fun m!7367 () Bool)

(assert (=> b!5881 m!7367))

(declare-fun m!7369 () Bool)

(assert (=> b!5881 m!7369))

(declare-fun m!7371 () Bool)

(assert (=> b!5881 m!7371))

(declare-fun m!7373 () Bool)

(assert (=> b!5881 m!7373))

(declare-fun m!7375 () Bool)

(assert (=> b!5881 m!7375))

(assert (=> b!5568 d!1968))

(declare-fun d!1984 () Bool)

(declare-fun c!293 () Bool)

(assert (=> d!1984 (= c!293 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3743 () List!81)

(assert (=> d!1984 (= (byteArrayBitContentToList!0 (_2!390 lt!6784) srcBuffer!6 from!367 nBits!460) e!3743)))

(declare-fun b!5888 () Bool)

(assert (=> b!5888 (= e!3743 Nil!78)))

(declare-fun b!5889 () Bool)

(assert (=> b!5889 (= e!3743 (Cons!77 (not (= (bvand ((_ sign_extend 24) (select (arr!574 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!390 lt!6784) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1984 c!293) b!5888))

(assert (= (and d!1984 (not c!293)) b!5889))

(assert (=> b!5889 m!7313))

(declare-fun m!7377 () Bool)

(assert (=> b!5889 m!7377))

(declare-fun m!7379 () Bool)

(assert (=> b!5889 m!7379))

(assert (=> b!5563 d!1984))

(declare-fun d!1986 () Bool)

(assert (=> d!1986 (= (array_inv!176 (buf!505 thiss!1486)) (bvsge (size!181 (buf!505 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!5567 d!1986))

(declare-fun d!1988 () Bool)

(declare-fun res!6953 () Bool)

(declare-fun e!3748 () Bool)

(assert (=> d!1988 (=> (not res!6953) (not e!3748))))

(assert (=> d!1988 (= res!6953 (= (size!181 (buf!505 thiss!1486)) (size!181 (buf!505 (_2!390 lt!6784)))))))

(assert (=> d!1988 (= (isPrefixOf!0 thiss!1486 (_2!390 lt!6784)) e!3748)))

(declare-fun b!5896 () Bool)

(declare-fun res!6955 () Bool)

(assert (=> b!5896 (=> (not res!6955) (not e!3748))))

(assert (=> b!5896 (= res!6955 (bvsle (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486)) (bitIndex!0 (size!181 (buf!505 (_2!390 lt!6784))) (currentByte!1490 (_2!390 lt!6784)) (currentBit!1485 (_2!390 lt!6784)))))))

(declare-fun b!5897 () Bool)

(declare-fun e!3749 () Bool)

(assert (=> b!5897 (= e!3748 e!3749)))

(declare-fun res!6954 () Bool)

(assert (=> b!5897 (=> res!6954 e!3749)))

(assert (=> b!5897 (= res!6954 (= (size!181 (buf!505 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!5898 () Bool)

(assert (=> b!5898 (= e!3749 (arrayBitRangesEq!0 (buf!505 thiss!1486) (buf!505 (_2!390 lt!6784)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!181 (buf!505 thiss!1486)) (currentByte!1490 thiss!1486) (currentBit!1485 thiss!1486))))))

(assert (= (and d!1988 res!6953) b!5896))

(assert (= (and b!5896 res!6955) b!5897))

(assert (= (and b!5897 (not res!6954)) b!5898))

(assert (=> b!5896 m!6799))

(assert (=> b!5896 m!6797))

(assert (=> b!5898 m!6799))

(assert (=> b!5898 m!6799))

(declare-fun m!7381 () Bool)

(assert (=> b!5898 m!7381))

(assert (=> b!5566 d!1988))

(push 1)

(assert (not b!5896))

(assert (not d!1958))

(assert (not b!5698))

(assert (not d!1946))

(assert (not b!5780))

(assert (not d!1948))

(assert (not b!5887))

(assert (not b!5779))

(assert (not b!5882))

(assert (not b!5796))

(assert (not d!1968))

(assert (not b!5883))

(assert (not b!5881))

(assert (not b!5694))

(assert (not b!5885))

(assert (not d!1964))

(assert (not b!5898))

(assert (not b!5889))

(assert (not b!5754))

(assert (not b!5756))

(assert (not d!1910))

(assert (not b!5884))

(assert (not b!5781))

(assert (not b!5697))

(assert (not b!5757))

(assert (not b!5695))

(assert (not d!1962))

(assert (not bm!62))

(assert (not d!1956))

(assert (not d!1922))

(assert (not d!1912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

