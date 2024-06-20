; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1228 () Bool)

(assert start!1228)

(declare-fun b!5590 () Bool)

(declare-fun e!3613 () Bool)

(declare-fun e!3615 () Bool)

(assert (=> b!5590 (= e!3613 (not e!3615))))

(declare-fun res!6750 () Bool)

(assert (=> b!5590 (=> res!6750 e!3615)))

(declare-datatypes ((array!422 0))(
  ( (array!423 (arr!575 (Array (_ BitVec 32) (_ BitVec 8))) (size!182 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!342 0))(
  ( (BitStream!343 (buf!506 array!422) (currentByte!1491 (_ BitVec 32)) (currentBit!1486 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!438 0))(
  ( (Unit!439) )
))
(declare-datatypes ((tuple2!748 0))(
  ( (tuple2!749 (_1!393 Unit!438) (_2!393 BitStream!342)) )
))
(declare-fun lt!6798 () tuple2!748)

(declare-datatypes ((tuple2!750 0))(
  ( (tuple2!751 (_1!394 array!422) (_2!394 BitStream!342)) )
))
(declare-fun lt!6802 () tuple2!750)

(declare-datatypes ((List!82 0))(
  ( (Nil!79) (Cons!78 (h!197 Bool) (t!832 List!82)) )
))
(declare-fun lt!6799 () List!82)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!342 array!422 (_ BitVec 64) (_ BitVec 64)) List!82)

(assert (=> b!5590 (= res!6750 (not (= (byteArrayBitContentToList!0 (_2!393 lt!6798) (_1!394 lt!6802) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6799)))))

(declare-datatypes ((tuple2!752 0))(
  ( (tuple2!753 (_1!395 BitStream!342) (_2!395 BitStream!342)) )
))
(declare-fun lt!6801 () tuple2!752)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!342 BitStream!342 (_ BitVec 64)) List!82)

(assert (=> b!5590 (= lt!6799 (bitStreamReadBitsIntoList!0 (_2!393 lt!6798) (_1!395 lt!6801) nBits!460))))

(declare-fun readBits!0 (BitStream!342 (_ BitVec 64)) tuple2!750)

(assert (=> b!5590 (= lt!6802 (readBits!0 (_1!395 lt!6801) nBits!460))))

(declare-fun thiss!1486 () BitStream!342)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5590 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!6798)))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) nBits!460)))

(declare-fun lt!6803 () Unit!438)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!342 array!422 (_ BitVec 64)) Unit!438)

(assert (=> b!5590 (= lt!6803 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!506 (_2!393 lt!6798)) nBits!460))))

(declare-fun reader!0 (BitStream!342 BitStream!342) tuple2!752)

(assert (=> b!5590 (= lt!6801 (reader!0 thiss!1486 (_2!393 lt!6798)))))

(declare-fun b!5591 () Bool)

(assert (=> b!5591 (= e!3615 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!182 (_1!394 lt!6802)))))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun lt!6800 () Unit!438)

(declare-fun srcBuffer!6 () array!422)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!342 array!422 array!422 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!438)

(assert (=> b!5591 (= lt!6800 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!393 lt!6798) srcBuffer!6 (_1!394 lt!6802) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5592 () Bool)

(declare-fun res!6748 () Bool)

(declare-fun e!3614 () Bool)

(assert (=> b!5592 (=> (not res!6748) (not e!3614))))

(assert (=> b!5592 (= res!6748 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 thiss!1486))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) nBits!460))))

(declare-fun b!5593 () Bool)

(declare-fun res!6747 () Bool)

(assert (=> b!5593 (=> res!6747 e!3615)))

(assert (=> b!5593 (= res!6747 (not (= lt!6799 (byteArrayBitContentToList!0 (_2!393 lt!6798) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5594 () Bool)

(assert (=> b!5594 (= e!3614 e!3613)))

(declare-fun res!6752 () Bool)

(assert (=> b!5594 (=> (not res!6752) (not e!3613))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5594 (= res!6752 (invariant!0 (currentBit!1486 (_2!393 lt!6798)) (currentByte!1491 (_2!393 lt!6798)) (size!182 (buf!506 (_2!393 lt!6798)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!342 array!422 (_ BitVec 64) (_ BitVec 64)) tuple2!748)

(assert (=> b!5594 (= lt!6798 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!6751 () Bool)

(assert (=> start!1228 (=> (not res!6751) (not e!3614))))

(assert (=> start!1228 (= res!6751 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!182 srcBuffer!6))))))))

(assert (=> start!1228 e!3614))

(assert (=> start!1228 true))

(declare-fun array_inv!177 (array!422) Bool)

(assert (=> start!1228 (array_inv!177 srcBuffer!6)))

(declare-fun e!3616 () Bool)

(declare-fun inv!12 (BitStream!342) Bool)

(assert (=> start!1228 (and (inv!12 thiss!1486) e!3616)))

(declare-fun b!5595 () Bool)

(declare-fun res!6754 () Bool)

(assert (=> b!5595 (=> (not res!6754) (not e!3613))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5595 (= res!6754 (= (bitIndex!0 (size!182 (buf!506 (_2!393 lt!6798))) (currentByte!1491 (_2!393 lt!6798)) (currentBit!1486 (_2!393 lt!6798))) (bvadd (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)) nBits!460)))))

(declare-fun b!5596 () Bool)

(declare-fun res!6749 () Bool)

(assert (=> b!5596 (=> (not res!6749) (not e!3613))))

(assert (=> b!5596 (= res!6749 (= (size!182 (buf!506 thiss!1486)) (size!182 (buf!506 (_2!393 lt!6798)))))))

(declare-fun b!5597 () Bool)

(declare-fun res!6753 () Bool)

(assert (=> b!5597 (=> (not res!6753) (not e!3613))))

(declare-fun isPrefixOf!0 (BitStream!342 BitStream!342) Bool)

(assert (=> b!5597 (= res!6753 (isPrefixOf!0 thiss!1486 (_2!393 lt!6798)))))

(declare-fun b!5598 () Bool)

(assert (=> b!5598 (= e!3616 (array_inv!177 (buf!506 thiss!1486)))))

(assert (= (and start!1228 res!6751) b!5592))

(assert (= (and b!5592 res!6748) b!5594))

(assert (= (and b!5594 res!6752) b!5596))

(assert (= (and b!5596 res!6749) b!5595))

(assert (= (and b!5595 res!6754) b!5597))

(assert (= (and b!5597 res!6753) b!5590))

(assert (= (and b!5590 (not res!6750)) b!5593))

(assert (= (and b!5593 (not res!6747)) b!5591))

(assert (= start!1228 b!5598))

(declare-fun m!6829 () Bool)

(assert (=> b!5592 m!6829))

(declare-fun m!6831 () Bool)

(assert (=> b!5593 m!6831))

(declare-fun m!6833 () Bool)

(assert (=> b!5591 m!6833))

(declare-fun m!6835 () Bool)

(assert (=> start!1228 m!6835))

(declare-fun m!6837 () Bool)

(assert (=> start!1228 m!6837))

(declare-fun m!6839 () Bool)

(assert (=> b!5590 m!6839))

(declare-fun m!6841 () Bool)

(assert (=> b!5590 m!6841))

(declare-fun m!6843 () Bool)

(assert (=> b!5590 m!6843))

(declare-fun m!6845 () Bool)

(assert (=> b!5590 m!6845))

(declare-fun m!6847 () Bool)

(assert (=> b!5590 m!6847))

(declare-fun m!6849 () Bool)

(assert (=> b!5590 m!6849))

(declare-fun m!6851 () Bool)

(assert (=> b!5595 m!6851))

(declare-fun m!6853 () Bool)

(assert (=> b!5595 m!6853))

(declare-fun m!6855 () Bool)

(assert (=> b!5594 m!6855))

(declare-fun m!6857 () Bool)

(assert (=> b!5594 m!6857))

(declare-fun m!6859 () Bool)

(assert (=> b!5597 m!6859))

(declare-fun m!6861 () Bool)

(assert (=> b!5598 m!6861))

(check-sat (not b!5592) (not b!5594) (not b!5591) (not b!5597) (not start!1228) (not b!5595) (not b!5593) (not b!5598) (not b!5590))
(check-sat)
(get-model)

(declare-fun d!1888 () Bool)

(declare-fun e!3638 () Bool)

(assert (=> d!1888 e!3638))

(declare-fun res!6783 () Bool)

(assert (=> d!1888 (=> (not res!6783) (not e!3638))))

(declare-fun lt!6838 () (_ BitVec 64))

(declare-fun lt!6839 () (_ BitVec 64))

(declare-fun lt!6835 () (_ BitVec 64))

(assert (=> d!1888 (= res!6783 (= lt!6839 (bvsub lt!6838 lt!6835)))))

(assert (=> d!1888 (or (= (bvand lt!6838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6835 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6838 lt!6835) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1888 (= lt!6835 (remainingBits!0 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!6798)))) ((_ sign_extend 32) (currentByte!1491 (_2!393 lt!6798))) ((_ sign_extend 32) (currentBit!1486 (_2!393 lt!6798)))))))

(declare-fun lt!6834 () (_ BitVec 64))

(declare-fun lt!6836 () (_ BitVec 64))

(assert (=> d!1888 (= lt!6838 (bvmul lt!6834 lt!6836))))

(assert (=> d!1888 (or (= lt!6834 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!6836 (bvsdiv (bvmul lt!6834 lt!6836) lt!6834)))))

(assert (=> d!1888 (= lt!6836 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1888 (= lt!6834 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!6798)))))))

(assert (=> d!1888 (= lt!6839 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1491 (_2!393 lt!6798))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1486 (_2!393 lt!6798)))))))

(assert (=> d!1888 (invariant!0 (currentBit!1486 (_2!393 lt!6798)) (currentByte!1491 (_2!393 lt!6798)) (size!182 (buf!506 (_2!393 lt!6798))))))

(assert (=> d!1888 (= (bitIndex!0 (size!182 (buf!506 (_2!393 lt!6798))) (currentByte!1491 (_2!393 lt!6798)) (currentBit!1486 (_2!393 lt!6798))) lt!6839)))

(declare-fun b!5630 () Bool)

(declare-fun res!6784 () Bool)

(assert (=> b!5630 (=> (not res!6784) (not e!3638))))

(assert (=> b!5630 (= res!6784 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!6839))))

(declare-fun b!5631 () Bool)

(declare-fun lt!6837 () (_ BitVec 64))

(assert (=> b!5631 (= e!3638 (bvsle lt!6839 (bvmul lt!6837 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!5631 (or (= lt!6837 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!6837 #b0000000000000000000000000000000000000000000000000000000000001000) lt!6837)))))

(assert (=> b!5631 (= lt!6837 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!6798)))))))

(assert (= (and d!1888 res!6783) b!5630))

(assert (= (and b!5630 res!6784) b!5631))

(declare-fun m!6897 () Bool)

(assert (=> d!1888 m!6897))

(assert (=> d!1888 m!6855))

(assert (=> b!5595 d!1888))

(declare-fun d!1892 () Bool)

(declare-fun e!3639 () Bool)

(assert (=> d!1892 e!3639))

(declare-fun res!6785 () Bool)

(assert (=> d!1892 (=> (not res!6785) (not e!3639))))

(declare-fun lt!6841 () (_ BitVec 64))

(declare-fun lt!6844 () (_ BitVec 64))

(declare-fun lt!6845 () (_ BitVec 64))

(assert (=> d!1892 (= res!6785 (= lt!6845 (bvsub lt!6844 lt!6841)))))

(assert (=> d!1892 (or (= (bvand lt!6844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6844 lt!6841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1892 (= lt!6841 (remainingBits!0 ((_ sign_extend 32) (size!182 (buf!506 thiss!1486))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486))))))

(declare-fun lt!6840 () (_ BitVec 64))

(declare-fun lt!6842 () (_ BitVec 64))

(assert (=> d!1892 (= lt!6844 (bvmul lt!6840 lt!6842))))

(assert (=> d!1892 (or (= lt!6840 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!6842 (bvsdiv (bvmul lt!6840 lt!6842) lt!6840)))))

(assert (=> d!1892 (= lt!6842 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1892 (= lt!6840 ((_ sign_extend 32) (size!182 (buf!506 thiss!1486))))))

(assert (=> d!1892 (= lt!6845 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1491 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1486 thiss!1486))))))

(assert (=> d!1892 (invariant!0 (currentBit!1486 thiss!1486) (currentByte!1491 thiss!1486) (size!182 (buf!506 thiss!1486)))))

(assert (=> d!1892 (= (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)) lt!6845)))

(declare-fun b!5632 () Bool)

(declare-fun res!6786 () Bool)

(assert (=> b!5632 (=> (not res!6786) (not e!3639))))

(assert (=> b!5632 (= res!6786 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!6845))))

(declare-fun b!5633 () Bool)

(declare-fun lt!6843 () (_ BitVec 64))

(assert (=> b!5633 (= e!3639 (bvsle lt!6845 (bvmul lt!6843 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!5633 (or (= lt!6843 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!6843 #b0000000000000000000000000000000000000000000000000000000000001000) lt!6843)))))

(assert (=> b!5633 (= lt!6843 ((_ sign_extend 32) (size!182 (buf!506 thiss!1486))))))

(assert (= (and d!1892 res!6785) b!5632))

(assert (= (and b!5632 res!6786) b!5633))

(declare-fun m!6899 () Bool)

(assert (=> d!1892 m!6899))

(declare-fun m!6901 () Bool)

(assert (=> d!1892 m!6901))

(assert (=> b!5595 d!1892))

(declare-fun d!1894 () Bool)

(declare-fun c!248 () Bool)

(assert (=> d!1894 (= c!248 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3642 () List!82)

(assert (=> d!1894 (= (byteArrayBitContentToList!0 (_2!393 lt!6798) (_1!394 lt!6802) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3642)))

(declare-fun b!5638 () Bool)

(assert (=> b!5638 (= e!3642 Nil!79)))

(declare-fun b!5639 () Bool)

(assert (=> b!5639 (= e!3642 (Cons!78 (not (= (bvand ((_ sign_extend 24) (select (arr!575 (_1!394 lt!6802)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!393 lt!6798) (_1!394 lt!6802) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1894 c!248) b!5638))

(assert (= (and d!1894 (not c!248)) b!5639))

(declare-fun m!6903 () Bool)

(assert (=> b!5639 m!6903))

(declare-fun m!6905 () Bool)

(assert (=> b!5639 m!6905))

(declare-fun m!6907 () Bool)

(assert (=> b!5639 m!6907))

(assert (=> b!5590 d!1894))

(declare-fun b!5664 () Bool)

(declare-fun res!6802 () Bool)

(declare-fun e!3655 () Bool)

(assert (=> b!5664 (=> (not res!6802) (not e!3655))))

(declare-fun lt!6923 () tuple2!752)

(assert (=> b!5664 (= res!6802 (isPrefixOf!0 (_1!395 lt!6923) thiss!1486))))

(declare-fun lt!6917 () (_ BitVec 64))

(declare-fun b!5665 () Bool)

(declare-fun lt!6929 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!342 (_ BitVec 64)) BitStream!342)

(assert (=> b!5665 (= e!3655 (= (_1!395 lt!6923) (withMovedBitIndex!0 (_2!395 lt!6923) (bvsub lt!6929 lt!6917))))))

(assert (=> b!5665 (or (= (bvand lt!6929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6917 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6929 lt!6917) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5665 (= lt!6917 (bitIndex!0 (size!182 (buf!506 (_2!393 lt!6798))) (currentByte!1491 (_2!393 lt!6798)) (currentBit!1486 (_2!393 lt!6798))))))

(assert (=> b!5665 (= lt!6929 (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)))))

(declare-fun b!5666 () Bool)

(declare-fun e!3654 () Unit!438)

(declare-fun lt!6926 () Unit!438)

(assert (=> b!5666 (= e!3654 lt!6926)))

(declare-fun lt!6928 () (_ BitVec 64))

(assert (=> b!5666 (= lt!6928 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6920 () (_ BitVec 64))

(assert (=> b!5666 (= lt!6920 (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!422 array!422 (_ BitVec 64) (_ BitVec 64)) Unit!438)

(assert (=> b!5666 (= lt!6926 (arrayBitRangesEqSymmetric!0 (buf!506 thiss!1486) (buf!506 (_2!393 lt!6798)) lt!6928 lt!6920))))

(declare-fun arrayBitRangesEq!0 (array!422 array!422 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5666 (arrayBitRangesEq!0 (buf!506 (_2!393 lt!6798)) (buf!506 thiss!1486) lt!6928 lt!6920)))

(declare-fun b!5667 () Bool)

(declare-fun res!6801 () Bool)

(assert (=> b!5667 (=> (not res!6801) (not e!3655))))

(assert (=> b!5667 (= res!6801 (isPrefixOf!0 (_2!395 lt!6923) (_2!393 lt!6798)))))

(declare-fun b!5668 () Bool)

(declare-fun Unit!442 () Unit!438)

(assert (=> b!5668 (= e!3654 Unit!442)))

(declare-fun d!1896 () Bool)

(assert (=> d!1896 e!3655))

(declare-fun res!6803 () Bool)

(assert (=> d!1896 (=> (not res!6803) (not e!3655))))

(assert (=> d!1896 (= res!6803 (isPrefixOf!0 (_1!395 lt!6923) (_2!395 lt!6923)))))

(declare-fun lt!6919 () BitStream!342)

(assert (=> d!1896 (= lt!6923 (tuple2!753 lt!6919 (_2!393 lt!6798)))))

(declare-fun lt!6927 () Unit!438)

(declare-fun lt!6913 () Unit!438)

(assert (=> d!1896 (= lt!6927 lt!6913)))

(assert (=> d!1896 (isPrefixOf!0 lt!6919 (_2!393 lt!6798))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!342 BitStream!342 BitStream!342) Unit!438)

(assert (=> d!1896 (= lt!6913 (lemmaIsPrefixTransitive!0 lt!6919 (_2!393 lt!6798) (_2!393 lt!6798)))))

(declare-fun lt!6915 () Unit!438)

(declare-fun lt!6925 () Unit!438)

(assert (=> d!1896 (= lt!6915 lt!6925)))

(assert (=> d!1896 (isPrefixOf!0 lt!6919 (_2!393 lt!6798))))

(assert (=> d!1896 (= lt!6925 (lemmaIsPrefixTransitive!0 lt!6919 thiss!1486 (_2!393 lt!6798)))))

(declare-fun lt!6910 () Unit!438)

(assert (=> d!1896 (= lt!6910 e!3654)))

(declare-fun c!254 () Bool)

(assert (=> d!1896 (= c!254 (not (= (size!182 (buf!506 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!6916 () Unit!438)

(declare-fun lt!6922 () Unit!438)

(assert (=> d!1896 (= lt!6916 lt!6922)))

(assert (=> d!1896 (isPrefixOf!0 (_2!393 lt!6798) (_2!393 lt!6798))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!342) Unit!438)

(assert (=> d!1896 (= lt!6922 (lemmaIsPrefixRefl!0 (_2!393 lt!6798)))))

(declare-fun lt!6912 () Unit!438)

(declare-fun lt!6914 () Unit!438)

(assert (=> d!1896 (= lt!6912 lt!6914)))

(assert (=> d!1896 (= lt!6914 (lemmaIsPrefixRefl!0 (_2!393 lt!6798)))))

(declare-fun lt!6918 () Unit!438)

(declare-fun lt!6911 () Unit!438)

(assert (=> d!1896 (= lt!6918 lt!6911)))

(assert (=> d!1896 (isPrefixOf!0 lt!6919 lt!6919)))

(assert (=> d!1896 (= lt!6911 (lemmaIsPrefixRefl!0 lt!6919))))

(declare-fun lt!6924 () Unit!438)

(declare-fun lt!6921 () Unit!438)

(assert (=> d!1896 (= lt!6924 lt!6921)))

(assert (=> d!1896 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1896 (= lt!6921 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1896 (= lt!6919 (BitStream!343 (buf!506 (_2!393 lt!6798)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)))))

(assert (=> d!1896 (isPrefixOf!0 thiss!1486 (_2!393 lt!6798))))

(assert (=> d!1896 (= (reader!0 thiss!1486 (_2!393 lt!6798)) lt!6923)))

(assert (= (and d!1896 c!254) b!5666))

(assert (= (and d!1896 (not c!254)) b!5668))

(assert (= (and d!1896 res!6803) b!5664))

(assert (= (and b!5664 res!6802) b!5667))

(assert (= (and b!5667 res!6801) b!5665))

(declare-fun m!6923 () Bool)

(assert (=> b!5664 m!6923))

(declare-fun m!6925 () Bool)

(assert (=> b!5665 m!6925))

(assert (=> b!5665 m!6851))

(assert (=> b!5665 m!6853))

(assert (=> d!1896 m!6859))

(declare-fun m!6927 () Bool)

(assert (=> d!1896 m!6927))

(declare-fun m!6929 () Bool)

(assert (=> d!1896 m!6929))

(declare-fun m!6931 () Bool)

(assert (=> d!1896 m!6931))

(declare-fun m!6933 () Bool)

(assert (=> d!1896 m!6933))

(declare-fun m!6935 () Bool)

(assert (=> d!1896 m!6935))

(declare-fun m!6937 () Bool)

(assert (=> d!1896 m!6937))

(declare-fun m!6939 () Bool)

(assert (=> d!1896 m!6939))

(declare-fun m!6941 () Bool)

(assert (=> d!1896 m!6941))

(declare-fun m!6943 () Bool)

(assert (=> d!1896 m!6943))

(declare-fun m!6945 () Bool)

(assert (=> d!1896 m!6945))

(declare-fun m!6947 () Bool)

(assert (=> b!5667 m!6947))

(assert (=> b!5666 m!6853))

(declare-fun m!6949 () Bool)

(assert (=> b!5666 m!6949))

(declare-fun m!6951 () Bool)

(assert (=> b!5666 m!6951))

(assert (=> b!5590 d!1896))

(declare-fun d!1914 () Bool)

(assert (=> d!1914 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!6798)))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) nBits!460)))

(declare-fun lt!6932 () Unit!438)

(declare-fun choose!9 (BitStream!342 array!422 (_ BitVec 64) BitStream!342) Unit!438)

(assert (=> d!1914 (= lt!6932 (choose!9 thiss!1486 (buf!506 (_2!393 lt!6798)) nBits!460 (BitStream!343 (buf!506 (_2!393 lt!6798)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486))))))

(assert (=> d!1914 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!506 (_2!393 lt!6798)) nBits!460) lt!6932)))

(declare-fun bs!700 () Bool)

(assert (= bs!700 d!1914))

(assert (=> bs!700 m!6843))

(declare-fun m!6953 () Bool)

(assert (=> bs!700 m!6953))

(assert (=> b!5590 d!1914))

(declare-fun b!5723 () Bool)

(declare-fun res!6838 () Bool)

(declare-fun e!3674 () Bool)

(assert (=> b!5723 (=> (not res!6838) (not e!3674))))

(declare-fun lt!7054 () tuple2!750)

(declare-fun lt!7055 () (_ BitVec 64))

(assert (=> b!5723 (= res!6838 (= (size!182 (_1!394 lt!7054)) ((_ extract 31 0) lt!7055)))))

(assert (=> b!5723 (and (bvslt lt!7055 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!7055 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!7051 () (_ BitVec 64))

(declare-fun lt!7053 () (_ BitVec 64))

(assert (=> b!5723 (= lt!7055 (bvsdiv lt!7051 lt!7053))))

(assert (=> b!5723 (and (not (= lt!7053 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!7051 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7053 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!5723 (= lt!7053 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!7057 () (_ BitVec 64))

(declare-fun lt!7058 () (_ BitVec 64))

(assert (=> b!5723 (= lt!7051 (bvsub lt!7057 lt!7058))))

(assert (=> b!5723 (or (= (bvand lt!7057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7058 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7057 lt!7058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5723 (= lt!7058 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7050 () (_ BitVec 64))

(assert (=> b!5723 (= lt!7057 (bvadd nBits!460 lt!7050))))

(assert (=> b!5723 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7050 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!7050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5723 (= lt!7050 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!5724 () Bool)

(declare-fun res!6841 () Bool)

(assert (=> b!5724 (=> (not res!6841) (not e!3674))))

(assert (=> b!5724 (= res!6841 (bvsle (currentByte!1491 (_1!395 lt!6801)) (currentByte!1491 (_2!394 lt!7054))))))

(declare-fun b!5725 () Bool)

(declare-fun res!6839 () Bool)

(assert (=> b!5725 (=> (not res!6839) (not e!3674))))

(declare-fun lt!7052 () (_ BitVec 64))

(assert (=> b!5725 (= res!6839 (= (bvadd lt!7052 nBits!460) (bitIndex!0 (size!182 (buf!506 (_2!394 lt!7054))) (currentByte!1491 (_2!394 lt!7054)) (currentBit!1486 (_2!394 lt!7054)))))))

(assert (=> b!5725 (or (not (= (bvand lt!7052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!7052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!7052 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5725 (= lt!7052 (bitIndex!0 (size!182 (buf!506 (_1!395 lt!6801))) (currentByte!1491 (_1!395 lt!6801)) (currentBit!1486 (_1!395 lt!6801))))))

(declare-fun b!5726 () Bool)

(declare-fun res!6840 () Bool)

(assert (=> b!5726 (=> (not res!6840) (not e!3674))))

(assert (=> b!5726 (= res!6840 (invariant!0 (currentBit!1486 (_2!394 lt!7054)) (currentByte!1491 (_2!394 lt!7054)) (size!182 (buf!506 (_2!394 lt!7054)))))))

(declare-fun d!1916 () Bool)

(assert (=> d!1916 e!3674))

(declare-fun res!6842 () Bool)

(assert (=> d!1916 (=> (not res!6842) (not e!3674))))

(assert (=> d!1916 (= res!6842 (= (buf!506 (_2!394 lt!7054)) (buf!506 (_1!395 lt!6801))))))

(declare-datatypes ((tuple3!38 0))(
  ( (tuple3!39 (_1!399 Unit!438) (_2!399 BitStream!342) (_3!19 array!422)) )
))
(declare-fun lt!7056 () tuple3!38)

(assert (=> d!1916 (= lt!7054 (tuple2!751 (_3!19 lt!7056) (_2!399 lt!7056)))))

(declare-fun readBitsLoop!0 (BitStream!342 (_ BitVec 64) array!422 (_ BitVec 64) (_ BitVec 64)) tuple3!38)

(assert (=> d!1916 (= lt!7056 (readBitsLoop!0 (_1!395 lt!6801) nBits!460 (array!423 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1916 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1916 (= (readBits!0 (_1!395 lt!6801) nBits!460) lt!7054)))

(declare-fun b!5727 () Bool)

(assert (=> b!5727 (= e!3674 (= (byteArrayBitContentToList!0 (_2!394 lt!7054) (_1!394 lt!7054) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!394 lt!7054) (_1!395 lt!6801) nBits!460)))))

(assert (= (and d!1916 res!6842) b!5725))

(assert (= (and b!5725 res!6839) b!5726))

(assert (= (and b!5726 res!6840) b!5723))

(assert (= (and b!5723 res!6838) b!5724))

(assert (= (and b!5724 res!6841) b!5727))

(declare-fun m!7013 () Bool)

(assert (=> b!5725 m!7013))

(declare-fun m!7015 () Bool)

(assert (=> b!5725 m!7015))

(declare-fun m!7017 () Bool)

(assert (=> b!5726 m!7017))

(declare-fun m!7019 () Bool)

(assert (=> d!1916 m!7019))

(declare-fun m!7021 () Bool)

(assert (=> b!5727 m!7021))

(declare-fun m!7023 () Bool)

(assert (=> b!5727 m!7023))

(assert (=> b!5590 d!1916))

(declare-fun d!1928 () Bool)

(assert (=> d!1928 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!6798)))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!6798)))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486))) nBits!460))))

(declare-fun bs!702 () Bool)

(assert (= bs!702 d!1928))

(declare-fun m!7025 () Bool)

(assert (=> bs!702 m!7025))

(assert (=> b!5590 d!1928))

(declare-fun lt!7067 () (_ BitVec 64))

(declare-fun b!5737 () Bool)

(declare-datatypes ((tuple2!760 0))(
  ( (tuple2!761 (_1!401 Bool) (_2!401 BitStream!342)) )
))
(declare-fun lt!7065 () tuple2!760)

(declare-datatypes ((tuple2!762 0))(
  ( (tuple2!763 (_1!402 List!82) (_2!402 BitStream!342)) )
))
(declare-fun e!3680 () tuple2!762)

(assert (=> b!5737 (= e!3680 (tuple2!763 (Cons!78 (_1!401 lt!7065) (bitStreamReadBitsIntoList!0 (_2!393 lt!6798) (_2!401 lt!7065) (bvsub nBits!460 lt!7067))) (_2!401 lt!7065)))))

(declare-fun readBit!0 (BitStream!342) tuple2!760)

(assert (=> b!5737 (= lt!7065 (readBit!0 (_1!395 lt!6801)))))

(assert (=> b!5737 (= lt!7067 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!5736 () Bool)

(assert (=> b!5736 (= e!3680 (tuple2!763 Nil!79 (_1!395 lt!6801)))))

(declare-fun b!5739 () Bool)

(declare-fun e!3679 () Bool)

(declare-fun lt!7066 () List!82)

(declare-fun length!8 (List!82) Int)

(assert (=> b!5739 (= e!3679 (> (length!8 lt!7066) 0))))

(declare-fun d!1930 () Bool)

(assert (=> d!1930 e!3679))

(declare-fun c!270 () Bool)

(assert (=> d!1930 (= c!270 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1930 (= lt!7066 (_1!402 e!3680))))

(declare-fun c!269 () Bool)

(assert (=> d!1930 (= c!269 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1930 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1930 (= (bitStreamReadBitsIntoList!0 (_2!393 lt!6798) (_1!395 lt!6801) nBits!460) lt!7066)))

(declare-fun b!5738 () Bool)

(declare-fun isEmpty!13 (List!82) Bool)

(assert (=> b!5738 (= e!3679 (isEmpty!13 lt!7066))))

(assert (= (and d!1930 c!269) b!5736))

(assert (= (and d!1930 (not c!269)) b!5737))

(assert (= (and d!1930 c!270) b!5738))

(assert (= (and d!1930 (not c!270)) b!5739))

(declare-fun m!7027 () Bool)

(assert (=> b!5737 m!7027))

(declare-fun m!7029 () Bool)

(assert (=> b!5737 m!7029))

(declare-fun m!7031 () Bool)

(assert (=> b!5739 m!7031))

(declare-fun m!7033 () Bool)

(assert (=> b!5738 m!7033))

(assert (=> b!5590 d!1930))

(declare-fun d!1932 () Bool)

(assert (=> d!1932 (= (invariant!0 (currentBit!1486 (_2!393 lt!6798)) (currentByte!1491 (_2!393 lt!6798)) (size!182 (buf!506 (_2!393 lt!6798)))) (and (bvsge (currentBit!1486 (_2!393 lt!6798)) #b00000000000000000000000000000000) (bvslt (currentBit!1486 (_2!393 lt!6798)) #b00000000000000000000000000001000) (bvsge (currentByte!1491 (_2!393 lt!6798)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1491 (_2!393 lt!6798)) (size!182 (buf!506 (_2!393 lt!6798)))) (and (= (currentBit!1486 (_2!393 lt!6798)) #b00000000000000000000000000000000) (= (currentByte!1491 (_2!393 lt!6798)) (size!182 (buf!506 (_2!393 lt!6798))))))))))

(assert (=> b!5594 d!1932))

(declare-fun lt!7369 () tuple2!748)

(declare-fun call!59 () tuple2!752)

(declare-fun c!287 () Bool)

(declare-fun bm!56 () Bool)

(assert (=> bm!56 (= call!59 (reader!0 thiss!1486 (ite c!287 (_2!393 lt!7369) thiss!1486)))))

(declare-fun b!5825 () Bool)

(declare-fun lt!7334 () tuple2!752)

(declare-fun lt!7344 () tuple2!748)

(declare-fun e!3719 () Bool)

(assert (=> b!5825 (= e!3719 (= (bitStreamReadBitsIntoList!0 (_2!393 lt!7344) (_1!395 lt!7334) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!393 lt!7344) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!5825 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5825 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7359 () Unit!438)

(declare-fun lt!7340 () Unit!438)

(assert (=> b!5825 (= lt!7359 lt!7340)))

(declare-fun lt!7360 () (_ BitVec 64))

(assert (=> b!5825 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!7344)))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) lt!7360)))

(assert (=> b!5825 (= lt!7340 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!506 (_2!393 lt!7344)) lt!7360))))

(declare-fun e!3717 () Bool)

(assert (=> b!5825 e!3717))

(declare-fun res!6901 () Bool)

(assert (=> b!5825 (=> (not res!6901) (not e!3717))))

(assert (=> b!5825 (= res!6901 (and (= (size!182 (buf!506 thiss!1486)) (size!182 (buf!506 (_2!393 lt!7344)))) (bvsge lt!7360 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5825 (= lt!7360 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!5825 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5825 (= lt!7334 (reader!0 thiss!1486 (_2!393 lt!7344)))))

(declare-fun d!1934 () Bool)

(assert (=> d!1934 e!3719))

(declare-fun res!6896 () Bool)

(assert (=> d!1934 (=> (not res!6896) (not e!3719))))

(declare-fun lt!7348 () (_ BitVec 64))

(assert (=> d!1934 (= res!6896 (= (bitIndex!0 (size!182 (buf!506 (_2!393 lt!7344))) (currentByte!1491 (_2!393 lt!7344)) (currentBit!1486 (_2!393 lt!7344))) (bvsub lt!7348 from!367)))))

(assert (=> d!1934 (or (= (bvand lt!7348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7348 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7348 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7358 () (_ BitVec 64))

(assert (=> d!1934 (= lt!7348 (bvadd lt!7358 from!367 nBits!460))))

(assert (=> d!1934 (or (not (= (bvand lt!7358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!7358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!7358 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1934 (= lt!7358 (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)))))

(declare-fun e!3718 () tuple2!748)

(assert (=> d!1934 (= lt!7344 e!3718)))

(assert (=> d!1934 (= c!287 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!7352 () Unit!438)

(declare-fun lt!7368 () Unit!438)

(assert (=> d!1934 (= lt!7352 lt!7368)))

(assert (=> d!1934 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1934 (= lt!7368 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!7347 () (_ BitVec 64))

(assert (=> d!1934 (= lt!7347 (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)))))

(assert (=> d!1934 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1934 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!7344)))

(declare-fun b!5826 () Bool)

(declare-fun res!6898 () Bool)

(assert (=> b!5826 (=> (not res!6898) (not e!3719))))

(assert (=> b!5826 (= res!6898 (= (size!182 (buf!506 thiss!1486)) (size!182 (buf!506 (_2!393 lt!7344)))))))

(declare-fun b!5827 () Bool)

(declare-fun Unit!444 () Unit!438)

(assert (=> b!5827 (= e!3718 (tuple2!749 Unit!444 (_2!393 lt!7369)))))

(declare-fun lt!7373 () tuple2!748)

(declare-fun appendBitFromByte!0 (BitStream!342 (_ BitVec 8) (_ BitVec 32)) tuple2!748)

(assert (=> b!5827 (= lt!7373 (appendBitFromByte!0 thiss!1486 (select (arr!575 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!7357 () (_ BitVec 64))

(assert (=> b!5827 (= lt!7357 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7355 () (_ BitVec 64))

(assert (=> b!5827 (= lt!7355 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7337 () Unit!438)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!342 BitStream!342 (_ BitVec 64) (_ BitVec 64)) Unit!438)

(assert (=> b!5827 (= lt!7337 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!393 lt!7373) lt!7357 lt!7355))))

(assert (=> b!5827 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!7373)))) ((_ sign_extend 32) (currentByte!1491 (_2!393 lt!7373))) ((_ sign_extend 32) (currentBit!1486 (_2!393 lt!7373))) (bvsub lt!7357 lt!7355))))

(declare-fun lt!7336 () Unit!438)

(assert (=> b!5827 (= lt!7336 lt!7337)))

(declare-fun lt!7353 () tuple2!752)

(assert (=> b!5827 (= lt!7353 (reader!0 thiss!1486 (_2!393 lt!7373)))))

(declare-fun lt!7349 () (_ BitVec 64))

(assert (=> b!5827 (= lt!7349 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7362 () Unit!438)

(assert (=> b!5827 (= lt!7362 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!506 (_2!393 lt!7373)) lt!7349))))

(assert (=> b!5827 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!7373)))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) lt!7349)))

(declare-fun lt!7376 () Unit!438)

(assert (=> b!5827 (= lt!7376 lt!7362)))

(declare-fun head!23 (List!82) Bool)

(assert (=> b!5827 (= (head!23 (byteArrayBitContentToList!0 (_2!393 lt!7373) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!23 (bitStreamReadBitsIntoList!0 (_2!393 lt!7373) (_1!395 lt!7353) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7365 () Unit!438)

(declare-fun Unit!445 () Unit!438)

(assert (=> b!5827 (= lt!7365 Unit!445)))

(assert (=> b!5827 (= lt!7369 (appendBitsMSBFirstLoop!0 (_2!393 lt!7373) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!7366 () Unit!438)

(assert (=> b!5827 (= lt!7366 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!393 lt!7373) (_2!393 lt!7369)))))

(assert (=> b!5827 (isPrefixOf!0 thiss!1486 (_2!393 lt!7369))))

(declare-fun lt!7371 () Unit!438)

(assert (=> b!5827 (= lt!7371 lt!7366)))

(assert (=> b!5827 (= (size!182 (buf!506 (_2!393 lt!7369))) (size!182 (buf!506 thiss!1486)))))

(declare-fun lt!7338 () Unit!438)

(declare-fun Unit!446 () Unit!438)

(assert (=> b!5827 (= lt!7338 Unit!446)))

(assert (=> b!5827 (= (bitIndex!0 (size!182 (buf!506 (_2!393 lt!7369))) (currentByte!1491 (_2!393 lt!7369)) (currentBit!1486 (_2!393 lt!7369))) (bvsub (bvadd (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!7341 () Unit!438)

(declare-fun Unit!447 () Unit!438)

(assert (=> b!5827 (= lt!7341 Unit!447)))

(assert (=> b!5827 (= (bitIndex!0 (size!182 (buf!506 (_2!393 lt!7369))) (currentByte!1491 (_2!393 lt!7369)) (currentBit!1486 (_2!393 lt!7369))) (bvsub (bvsub (bvadd (bitIndex!0 (size!182 (buf!506 (_2!393 lt!7373))) (currentByte!1491 (_2!393 lt!7373)) (currentBit!1486 (_2!393 lt!7373))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!7345 () Unit!438)

(declare-fun Unit!448 () Unit!438)

(assert (=> b!5827 (= lt!7345 Unit!448)))

(declare-fun lt!7374 () tuple2!752)

(assert (=> b!5827 (= lt!7374 call!59)))

(declare-fun lt!7339 () (_ BitVec 64))

(assert (=> b!5827 (= lt!7339 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7361 () Unit!438)

(assert (=> b!5827 (= lt!7361 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!506 (_2!393 lt!7369)) lt!7339))))

(assert (=> b!5827 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!7369)))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) lt!7339)))

(declare-fun lt!7351 () Unit!438)

(assert (=> b!5827 (= lt!7351 lt!7361)))

(declare-fun lt!7372 () tuple2!752)

(assert (=> b!5827 (= lt!7372 (reader!0 (_2!393 lt!7373) (_2!393 lt!7369)))))

(declare-fun lt!7346 () (_ BitVec 64))

(assert (=> b!5827 (= lt!7346 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!7333 () Unit!438)

(assert (=> b!5827 (= lt!7333 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!393 lt!7373) (buf!506 (_2!393 lt!7369)) lt!7346))))

(assert (=> b!5827 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 (_2!393 lt!7369)))) ((_ sign_extend 32) (currentByte!1491 (_2!393 lt!7373))) ((_ sign_extend 32) (currentBit!1486 (_2!393 lt!7373))) lt!7346)))

(declare-fun lt!7356 () Unit!438)

(assert (=> b!5827 (= lt!7356 lt!7333)))

(declare-fun lt!7343 () List!82)

(assert (=> b!5827 (= lt!7343 (byteArrayBitContentToList!0 (_2!393 lt!7369) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!7350 () List!82)

(assert (=> b!5827 (= lt!7350 (byteArrayBitContentToList!0 (_2!393 lt!7369) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7354 () List!82)

(assert (=> b!5827 (= lt!7354 (bitStreamReadBitsIntoList!0 (_2!393 lt!7369) (_1!395 lt!7374) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!7375 () List!82)

(assert (=> b!5827 (= lt!7375 (bitStreamReadBitsIntoList!0 (_2!393 lt!7369) (_1!395 lt!7372) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7363 () (_ BitVec 64))

(assert (=> b!5827 (= lt!7363 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7342 () Unit!438)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!342 BitStream!342 BitStream!342 BitStream!342 (_ BitVec 64) List!82) Unit!438)

(assert (=> b!5827 (= lt!7342 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!393 lt!7369) (_2!393 lt!7369) (_1!395 lt!7374) (_1!395 lt!7372) lt!7363 lt!7354))))

(declare-fun tail!31 (List!82) List!82)

(assert (=> b!5827 (= (bitStreamReadBitsIntoList!0 (_2!393 lt!7369) (_1!395 lt!7372) (bvsub lt!7363 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!31 lt!7354))))

(declare-fun lt!7367 () Unit!438)

(assert (=> b!5827 (= lt!7367 lt!7342)))

(declare-fun lt!7370 () Unit!438)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!422 array!422 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!438)

(assert (=> b!5827 (= lt!7370 (arrayBitRangesEqImpliesEq!0 (buf!506 (_2!393 lt!7373)) (buf!506 (_2!393 lt!7369)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!7347 (bitIndex!0 (size!182 (buf!506 (_2!393 lt!7373))) (currentByte!1491 (_2!393 lt!7373)) (currentBit!1486 (_2!393 lt!7373)))))))

(declare-fun bitAt!0 (array!422 (_ BitVec 64)) Bool)

(assert (=> b!5827 (= (bitAt!0 (buf!506 (_2!393 lt!7373)) lt!7347) (bitAt!0 (buf!506 (_2!393 lt!7369)) lt!7347))))

(declare-fun lt!7364 () Unit!438)

(assert (=> b!5827 (= lt!7364 lt!7370)))

(declare-fun b!5828 () Bool)

(declare-fun Unit!450 () Unit!438)

(assert (=> b!5828 (= e!3718 (tuple2!749 Unit!450 thiss!1486))))

(assert (=> b!5828 (= (size!182 (buf!506 thiss!1486)) (size!182 (buf!506 thiss!1486)))))

(declare-fun lt!7335 () Unit!438)

(declare-fun Unit!451 () Unit!438)

(assert (=> b!5828 (= lt!7335 Unit!451)))

(declare-fun checkByteArrayBitContent!0 (BitStream!342 array!422 array!422 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5828 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!394 (readBits!0 (_1!395 call!59) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!5829 () Bool)

(declare-fun res!6897 () Bool)

(assert (=> b!5829 (=> (not res!6897) (not e!3719))))

(assert (=> b!5829 (= res!6897 (invariant!0 (currentBit!1486 (_2!393 lt!7344)) (currentByte!1491 (_2!393 lt!7344)) (size!182 (buf!506 (_2!393 lt!7344)))))))

(declare-fun b!5830 () Bool)

(declare-fun res!6899 () Bool)

(assert (=> b!5830 (=> (not res!6899) (not e!3719))))

(assert (=> b!5830 (= res!6899 (isPrefixOf!0 thiss!1486 (_2!393 lt!7344)))))

(declare-fun b!5831 () Bool)

(declare-fun res!6900 () Bool)

(assert (=> b!5831 (=> (not res!6900) (not e!3719))))

(assert (=> b!5831 (= res!6900 (= (size!182 (buf!506 (_2!393 lt!7344))) (size!182 (buf!506 thiss!1486))))))

(declare-fun b!5832 () Bool)

(assert (=> b!5832 (= e!3717 (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 thiss!1486))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) lt!7360))))

(assert (= (and d!1934 c!287) b!5827))

(assert (= (and d!1934 (not c!287)) b!5828))

(assert (= (or b!5827 b!5828) bm!56))

(assert (= (and d!1934 res!6896) b!5829))

(assert (= (and b!5829 res!6897) b!5826))

(assert (= (and b!5826 res!6898) b!5830))

(assert (= (and b!5830 res!6899) b!5831))

(assert (= (and b!5831 res!6900) b!5825))

(assert (= (and b!5825 res!6901) b!5832))

(declare-fun m!7111 () Bool)

(assert (=> b!5832 m!7111))

(declare-fun m!7113 () Bool)

(assert (=> b!5827 m!7113))

(declare-fun m!7115 () Bool)

(assert (=> b!5827 m!7115))

(declare-fun m!7117 () Bool)

(assert (=> b!5827 m!7117))

(declare-fun m!7119 () Bool)

(assert (=> b!5827 m!7119))

(declare-fun m!7121 () Bool)

(assert (=> b!5827 m!7121))

(declare-fun m!7123 () Bool)

(assert (=> b!5827 m!7123))

(declare-fun m!7125 () Bool)

(assert (=> b!5827 m!7125))

(declare-fun m!7127 () Bool)

(assert (=> b!5827 m!7127))

(declare-fun m!7129 () Bool)

(assert (=> b!5827 m!7129))

(declare-fun m!7131 () Bool)

(assert (=> b!5827 m!7131))

(declare-fun m!7133 () Bool)

(assert (=> b!5827 m!7133))

(declare-fun m!7135 () Bool)

(assert (=> b!5827 m!7135))

(declare-fun m!7137 () Bool)

(assert (=> b!5827 m!7137))

(declare-fun m!7139 () Bool)

(assert (=> b!5827 m!7139))

(declare-fun m!7141 () Bool)

(assert (=> b!5827 m!7141))

(assert (=> b!5827 m!7129))

(declare-fun m!7143 () Bool)

(assert (=> b!5827 m!7143))

(declare-fun m!7145 () Bool)

(assert (=> b!5827 m!7145))

(declare-fun m!7147 () Bool)

(assert (=> b!5827 m!7147))

(declare-fun m!7149 () Bool)

(assert (=> b!5827 m!7149))

(declare-fun m!7151 () Bool)

(assert (=> b!5827 m!7151))

(declare-fun m!7153 () Bool)

(assert (=> b!5827 m!7153))

(declare-fun m!7155 () Bool)

(assert (=> b!5827 m!7155))

(declare-fun m!7157 () Bool)

(assert (=> b!5827 m!7157))

(assert (=> b!5827 m!7135))

(assert (=> b!5827 m!6853))

(declare-fun m!7159 () Bool)

(assert (=> b!5827 m!7159))

(assert (=> b!5827 m!7115))

(declare-fun m!7161 () Bool)

(assert (=> b!5827 m!7161))

(declare-fun m!7163 () Bool)

(assert (=> b!5827 m!7163))

(declare-fun m!7165 () Bool)

(assert (=> b!5827 m!7165))

(assert (=> b!5827 m!7121))

(declare-fun m!7167 () Bool)

(assert (=> b!5827 m!7167))

(declare-fun m!7169 () Bool)

(assert (=> b!5827 m!7169))

(declare-fun m!7171 () Bool)

(assert (=> b!5827 m!7171))

(declare-fun m!7173 () Bool)

(assert (=> b!5827 m!7173))

(declare-fun m!7175 () Bool)

(assert (=> b!5830 m!7175))

(declare-fun m!7177 () Bool)

(assert (=> b!5829 m!7177))

(declare-fun m!7179 () Bool)

(assert (=> d!1934 m!7179))

(assert (=> d!1934 m!6853))

(assert (=> d!1934 m!6943))

(assert (=> d!1934 m!6935))

(declare-fun m!7181 () Bool)

(assert (=> bm!56 m!7181))

(declare-fun m!7183 () Bool)

(assert (=> b!5828 m!7183))

(declare-fun m!7185 () Bool)

(assert (=> b!5828 m!7185))

(declare-fun m!7187 () Bool)

(assert (=> b!5825 m!7187))

(declare-fun m!7189 () Bool)

(assert (=> b!5825 m!7189))

(declare-fun m!7191 () Bool)

(assert (=> b!5825 m!7191))

(declare-fun m!7193 () Bool)

(assert (=> b!5825 m!7193))

(declare-fun m!7195 () Bool)

(assert (=> b!5825 m!7195))

(assert (=> b!5594 d!1934))

(declare-fun d!1970 () Bool)

(declare-fun c!288 () Bool)

(assert (=> d!1970 (= c!288 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3724 () List!82)

(assert (=> d!1970 (= (byteArrayBitContentToList!0 (_2!393 lt!6798) srcBuffer!6 from!367 nBits!460) e!3724)))

(declare-fun b!5845 () Bool)

(assert (=> b!5845 (= e!3724 Nil!79)))

(declare-fun b!5846 () Bool)

(assert (=> b!5846 (= e!3724 (Cons!78 (not (= (bvand ((_ sign_extend 24) (select (arr!575 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!393 lt!6798) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1970 c!288) b!5845))

(assert (= (and d!1970 (not c!288)) b!5846))

(assert (=> b!5846 m!7121))

(declare-fun m!7197 () Bool)

(assert (=> b!5846 m!7197))

(declare-fun m!7199 () Bool)

(assert (=> b!5846 m!7199))

(assert (=> b!5593 d!1970))

(declare-fun d!1972 () Bool)

(assert (=> d!1972 (= (array_inv!177 (buf!506 thiss!1486)) (bvsge (size!182 (buf!506 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!5598 d!1972))

(declare-fun d!1974 () Bool)

(declare-fun res!6921 () Bool)

(declare-fun e!3729 () Bool)

(assert (=> d!1974 (=> (not res!6921) (not e!3729))))

(assert (=> d!1974 (= res!6921 (= (size!182 (buf!506 thiss!1486)) (size!182 (buf!506 (_2!393 lt!6798)))))))

(assert (=> d!1974 (= (isPrefixOf!0 thiss!1486 (_2!393 lt!6798)) e!3729)))

(declare-fun b!5853 () Bool)

(declare-fun res!6922 () Bool)

(assert (=> b!5853 (=> (not res!6922) (not e!3729))))

(assert (=> b!5853 (= res!6922 (bvsle (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486)) (bitIndex!0 (size!182 (buf!506 (_2!393 lt!6798))) (currentByte!1491 (_2!393 lt!6798)) (currentBit!1486 (_2!393 lt!6798)))))))

(declare-fun b!5854 () Bool)

(declare-fun e!3730 () Bool)

(assert (=> b!5854 (= e!3729 e!3730)))

(declare-fun res!6920 () Bool)

(assert (=> b!5854 (=> res!6920 e!3730)))

(assert (=> b!5854 (= res!6920 (= (size!182 (buf!506 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!5855 () Bool)

(assert (=> b!5855 (= e!3730 (arrayBitRangesEq!0 (buf!506 thiss!1486) (buf!506 (_2!393 lt!6798)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!182 (buf!506 thiss!1486)) (currentByte!1491 thiss!1486) (currentBit!1486 thiss!1486))))))

(assert (= (and d!1974 res!6921) b!5853))

(assert (= (and b!5853 res!6922) b!5854))

(assert (= (and b!5854 (not res!6920)) b!5855))

(assert (=> b!5853 m!6853))

(assert (=> b!5853 m!6851))

(assert (=> b!5855 m!6853))

(assert (=> b!5855 m!6853))

(declare-fun m!7201 () Bool)

(assert (=> b!5855 m!7201))

(assert (=> b!5597 d!1974))

(declare-fun d!1976 () Bool)

(assert (=> d!1976 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!182 (buf!506 thiss!1486))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!182 (buf!506 thiss!1486))) ((_ sign_extend 32) (currentByte!1491 thiss!1486)) ((_ sign_extend 32) (currentBit!1486 thiss!1486))) nBits!460))))

(declare-fun bs!710 () Bool)

(assert (= bs!710 d!1976))

(assert (=> bs!710 m!6899))

(assert (=> b!5592 d!1976))

(declare-fun d!1978 () Bool)

(assert (=> d!1978 (checkByteArrayBitContent!0 (_2!393 lt!6798) srcBuffer!6 (_1!394 lt!6802) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!7445 () Unit!438)

(declare-fun choose!65 (BitStream!342 array!422 array!422 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!438)

(assert (=> d!1978 (= lt!7445 (choose!65 (_2!393 lt!6798) srcBuffer!6 (_1!394 lt!6802) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1978 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1978 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!393 lt!6798) srcBuffer!6 (_1!394 lt!6802) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7445)))

(declare-fun bs!711 () Bool)

(assert (= bs!711 d!1978))

(declare-fun m!7203 () Bool)

(assert (=> bs!711 m!7203))

(declare-fun m!7205 () Bool)

(assert (=> bs!711 m!7205))

(assert (=> b!5591 d!1978))

(declare-fun d!1980 () Bool)

(assert (=> d!1980 (= (array_inv!177 srcBuffer!6) (bvsge (size!182 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1228 d!1980))

(declare-fun d!1982 () Bool)

(assert (=> d!1982 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1486 thiss!1486) (currentByte!1491 thiss!1486) (size!182 (buf!506 thiss!1486))))))

(declare-fun bs!712 () Bool)

(assert (= bs!712 d!1982))

(assert (=> bs!712 m!6901))

(assert (=> start!1228 d!1982))

(check-sat (not b!5853) (not d!1934) (not b!5727) (not b!5739) (not b!5725) (not d!1916) (not d!1928) (not d!1888) (not d!1978) (not b!5666) (not d!1982) (not b!5825) (not b!5737) (not d!1892) (not b!5667) (not b!5664) (not b!5829) (not b!5639) (not b!5726) (not d!1914) (not d!1976) (not bm!56) (not b!5855) (not b!5738) (not b!5846) (not b!5832) (not d!1896) (not b!5830) (not b!5827) (not b!5665) (not b!5828))
(check-sat)
