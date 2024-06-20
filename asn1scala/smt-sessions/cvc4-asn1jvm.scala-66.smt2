; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1230 () Bool)

(assert start!1230)

(declare-fun b!5617 () Bool)

(declare-fun res!6778 () Bool)

(declare-fun e!3635 () Bool)

(assert (=> b!5617 (=> (not res!6778) (not e!3635))))

(declare-datatypes ((array!424 0))(
  ( (array!425 (arr!576 (Array (_ BitVec 32) (_ BitVec 8))) (size!183 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!344 0))(
  ( (BitStream!345 (buf!507 array!424) (currentByte!1492 (_ BitVec 32)) (currentBit!1487 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!344)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5617 (= res!6778 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 thiss!1486))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) nBits!460))))

(declare-fun b!5618 () Bool)

(declare-fun res!6773 () Bool)

(declare-fun e!3633 () Bool)

(assert (=> b!5618 (=> (not res!6773) (not e!3633))))

(declare-datatypes ((Unit!440 0))(
  ( (Unit!441) )
))
(declare-datatypes ((tuple2!754 0))(
  ( (tuple2!755 (_1!396 Unit!440) (_2!396 BitStream!344)) )
))
(declare-fun lt!6816 () tuple2!754)

(assert (=> b!5618 (= res!6773 (= (size!183 (buf!507 thiss!1486)) (size!183 (buf!507 (_2!396 lt!6816)))))))

(declare-fun b!5619 () Bool)

(declare-fun res!6771 () Bool)

(declare-fun e!3632 () Bool)

(assert (=> b!5619 (=> res!6771 e!3632)))

(declare-fun srcBuffer!6 () array!424)

(declare-datatypes ((List!83 0))(
  ( (Nil!80) (Cons!79 (h!198 Bool) (t!833 List!83)) )
))
(declare-fun lt!6817 () List!83)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!344 array!424 (_ BitVec 64) (_ BitVec 64)) List!83)

(assert (=> b!5619 (= res!6771 (not (= lt!6817 (byteArrayBitContentToList!0 (_2!396 lt!6816) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!5620 () Bool)

(assert (=> b!5620 (= e!3635 e!3633)))

(declare-fun res!6774 () Bool)

(assert (=> b!5620 (=> (not res!6774) (not e!3633))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!5620 (= res!6774 (invariant!0 (currentBit!1487 (_2!396 lt!6816)) (currentByte!1492 (_2!396 lt!6816)) (size!183 (buf!507 (_2!396 lt!6816)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!344 array!424 (_ BitVec 64) (_ BitVec 64)) tuple2!754)

(assert (=> b!5620 (= lt!6816 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!6776 () Bool)

(assert (=> start!1230 (=> (not res!6776) (not e!3635))))

(assert (=> start!1230 (= res!6776 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!183 srcBuffer!6))))))))

(assert (=> start!1230 e!3635))

(assert (=> start!1230 true))

(declare-fun array_inv!178 (array!424) Bool)

(assert (=> start!1230 (array_inv!178 srcBuffer!6)))

(declare-fun e!3630 () Bool)

(declare-fun inv!12 (BitStream!344) Bool)

(assert (=> start!1230 (and (inv!12 thiss!1486) e!3630)))

(declare-fun b!5621 () Bool)

(declare-fun res!6777 () Bool)

(assert (=> b!5621 (=> (not res!6777) (not e!3633))))

(declare-fun isPrefixOf!0 (BitStream!344 BitStream!344) Bool)

(assert (=> b!5621 (= res!6777 (isPrefixOf!0 thiss!1486 (_2!396 lt!6816)))))

(declare-fun b!5622 () Bool)

(declare-datatypes ((tuple2!756 0))(
  ( (tuple2!757 (_1!397 array!424) (_2!397 BitStream!344)) )
))
(declare-fun lt!6819 () tuple2!756)

(assert (=> b!5622 (= e!3632 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!183 (_1!397 lt!6819)))))))))

(declare-fun lt!6820 () Unit!440)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!344 array!424 array!424 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!440)

(assert (=> b!5622 (= lt!6820 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!396 lt!6816) srcBuffer!6 (_1!397 lt!6819) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!5623 () Bool)

(assert (=> b!5623 (= e!3633 (not e!3632))))

(declare-fun res!6775 () Bool)

(assert (=> b!5623 (=> res!6775 e!3632)))

(assert (=> b!5623 (= res!6775 (not (= (byteArrayBitContentToList!0 (_2!396 lt!6816) (_1!397 lt!6819) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!6817)))))

(declare-datatypes ((tuple2!758 0))(
  ( (tuple2!759 (_1!398 BitStream!344) (_2!398 BitStream!344)) )
))
(declare-fun lt!6821 () tuple2!758)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!344 BitStream!344 (_ BitVec 64)) List!83)

(assert (=> b!5623 (= lt!6817 (bitStreamReadBitsIntoList!0 (_2!396 lt!6816) (_1!398 lt!6821) nBits!460))))

(declare-fun readBits!0 (BitStream!344 (_ BitVec 64)) tuple2!756)

(assert (=> b!5623 (= lt!6819 (readBits!0 (_1!398 lt!6821) nBits!460))))

(assert (=> b!5623 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!6816)))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) nBits!460)))

(declare-fun lt!6818 () Unit!440)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!344 array!424 (_ BitVec 64)) Unit!440)

(assert (=> b!5623 (= lt!6818 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!507 (_2!396 lt!6816)) nBits!460))))

(declare-fun reader!0 (BitStream!344 BitStream!344) tuple2!758)

(assert (=> b!5623 (= lt!6821 (reader!0 thiss!1486 (_2!396 lt!6816)))))

(declare-fun b!5624 () Bool)

(assert (=> b!5624 (= e!3630 (array_inv!178 (buf!507 thiss!1486)))))

(declare-fun b!5625 () Bool)

(declare-fun res!6772 () Bool)

(assert (=> b!5625 (=> (not res!6772) (not e!3633))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!5625 (= res!6772 (= (bitIndex!0 (size!183 (buf!507 (_2!396 lt!6816))) (currentByte!1492 (_2!396 lt!6816)) (currentBit!1487 (_2!396 lt!6816))) (bvadd (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)) nBits!460)))))

(assert (= (and start!1230 res!6776) b!5617))

(assert (= (and b!5617 res!6778) b!5620))

(assert (= (and b!5620 res!6774) b!5618))

(assert (= (and b!5618 res!6773) b!5625))

(assert (= (and b!5625 res!6772) b!5621))

(assert (= (and b!5621 res!6777) b!5623))

(assert (= (and b!5623 (not res!6775)) b!5619))

(assert (= (and b!5619 (not res!6771)) b!5622))

(assert (= start!1230 b!5624))

(declare-fun m!6863 () Bool)

(assert (=> b!5620 m!6863))

(declare-fun m!6865 () Bool)

(assert (=> b!5620 m!6865))

(declare-fun m!6867 () Bool)

(assert (=> b!5623 m!6867))

(declare-fun m!6869 () Bool)

(assert (=> b!5623 m!6869))

(declare-fun m!6871 () Bool)

(assert (=> b!5623 m!6871))

(declare-fun m!6873 () Bool)

(assert (=> b!5623 m!6873))

(declare-fun m!6875 () Bool)

(assert (=> b!5623 m!6875))

(declare-fun m!6877 () Bool)

(assert (=> b!5623 m!6877))

(declare-fun m!6879 () Bool)

(assert (=> b!5619 m!6879))

(declare-fun m!6881 () Bool)

(assert (=> start!1230 m!6881))

(declare-fun m!6883 () Bool)

(assert (=> start!1230 m!6883))

(declare-fun m!6885 () Bool)

(assert (=> b!5621 m!6885))

(declare-fun m!6887 () Bool)

(assert (=> b!5617 m!6887))

(declare-fun m!6889 () Bool)

(assert (=> b!5625 m!6889))

(declare-fun m!6891 () Bool)

(assert (=> b!5625 m!6891))

(declare-fun m!6893 () Bool)

(assert (=> b!5624 m!6893))

(declare-fun m!6895 () Bool)

(assert (=> b!5622 m!6895))

(push 1)

(assert (not b!5621))

(assert (not b!5619))

(assert (not b!5622))

(assert (not b!5625))

(assert (not start!1230))

(assert (not b!5624))

(assert (not b!5620))

(assert (not b!5623))

(assert (not b!5617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1890 () Bool)

(declare-fun e!3645 () Bool)

(assert (=> d!1890 e!3645))

(declare-fun res!6791 () Bool)

(assert (=> d!1890 (=> (not res!6791) (not e!3645))))

(declare-fun lt!6861 () (_ BitVec 64))

(declare-fun lt!6863 () (_ BitVec 64))

(declare-fun lt!6862 () (_ BitVec 64))

(assert (=> d!1890 (= res!6791 (= lt!6863 (bvsub lt!6861 lt!6862)))))

(assert (=> d!1890 (or (= (bvand lt!6861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6861 lt!6862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1890 (= lt!6862 (remainingBits!0 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!6816)))) ((_ sign_extend 32) (currentByte!1492 (_2!396 lt!6816))) ((_ sign_extend 32) (currentBit!1487 (_2!396 lt!6816)))))))

(declare-fun lt!6858 () (_ BitVec 64))

(declare-fun lt!6859 () (_ BitVec 64))

(assert (=> d!1890 (= lt!6861 (bvmul lt!6858 lt!6859))))

(assert (=> d!1890 (or (= lt!6858 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!6859 (bvsdiv (bvmul lt!6858 lt!6859) lt!6858)))))

(assert (=> d!1890 (= lt!6859 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1890 (= lt!6858 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!6816)))))))

(assert (=> d!1890 (= lt!6863 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1492 (_2!396 lt!6816))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1487 (_2!396 lt!6816)))))))

(assert (=> d!1890 (invariant!0 (currentBit!1487 (_2!396 lt!6816)) (currentByte!1492 (_2!396 lt!6816)) (size!183 (buf!507 (_2!396 lt!6816))))))

(assert (=> d!1890 (= (bitIndex!0 (size!183 (buf!507 (_2!396 lt!6816))) (currentByte!1492 (_2!396 lt!6816)) (currentBit!1487 (_2!396 lt!6816))) lt!6863)))

(declare-fun b!5644 () Bool)

(declare-fun res!6792 () Bool)

(assert (=> b!5644 (=> (not res!6792) (not e!3645))))

(assert (=> b!5644 (= res!6792 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!6863))))

(declare-fun b!5645 () Bool)

(declare-fun lt!6860 () (_ BitVec 64))

(assert (=> b!5645 (= e!3645 (bvsle lt!6863 (bvmul lt!6860 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!5645 (or (= lt!6860 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!6860 #b0000000000000000000000000000000000000000000000000000000000001000) lt!6860)))))

(assert (=> b!5645 (= lt!6860 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!6816)))))))

(assert (= (and d!1890 res!6791) b!5644))

(assert (= (and b!5644 res!6792) b!5645))

(declare-fun m!6909 () Bool)

(assert (=> d!1890 m!6909))

(assert (=> d!1890 m!6863))

(assert (=> b!5625 d!1890))

(declare-fun d!1898 () Bool)

(declare-fun e!3646 () Bool)

(assert (=> d!1898 e!3646))

(declare-fun res!6793 () Bool)

(assert (=> d!1898 (=> (not res!6793) (not e!3646))))

(declare-fun lt!6869 () (_ BitVec 64))

(declare-fun lt!6868 () (_ BitVec 64))

(declare-fun lt!6867 () (_ BitVec 64))

(assert (=> d!1898 (= res!6793 (= lt!6869 (bvsub lt!6867 lt!6868)))))

(assert (=> d!1898 (or (= (bvand lt!6867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6868 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6867 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6867 lt!6868) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1898 (= lt!6868 (remainingBits!0 ((_ sign_extend 32) (size!183 (buf!507 thiss!1486))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486))))))

(declare-fun lt!6864 () (_ BitVec 64))

(declare-fun lt!6865 () (_ BitVec 64))

(assert (=> d!1898 (= lt!6867 (bvmul lt!6864 lt!6865))))

(assert (=> d!1898 (or (= lt!6864 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!6865 (bvsdiv (bvmul lt!6864 lt!6865) lt!6864)))))

(assert (=> d!1898 (= lt!6865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1898 (= lt!6864 ((_ sign_extend 32) (size!183 (buf!507 thiss!1486))))))

(assert (=> d!1898 (= lt!6869 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1492 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1487 thiss!1486))))))

(assert (=> d!1898 (invariant!0 (currentBit!1487 thiss!1486) (currentByte!1492 thiss!1486) (size!183 (buf!507 thiss!1486)))))

(assert (=> d!1898 (= (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)) lt!6869)))

(declare-fun b!5646 () Bool)

(declare-fun res!6794 () Bool)

(assert (=> b!5646 (=> (not res!6794) (not e!3646))))

(assert (=> b!5646 (= res!6794 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!6869))))

(declare-fun b!5647 () Bool)

(declare-fun lt!6866 () (_ BitVec 64))

(assert (=> b!5647 (= e!3646 (bvsle lt!6869 (bvmul lt!6866 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!5647 (or (= lt!6866 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!6866 #b0000000000000000000000000000000000000000000000000000000000001000) lt!6866)))))

(assert (=> b!5647 (= lt!6866 ((_ sign_extend 32) (size!183 (buf!507 thiss!1486))))))

(assert (= (and d!1898 res!6793) b!5646))

(assert (= (and b!5646 res!6794) b!5647))

(declare-fun m!6911 () Bool)

(assert (=> d!1898 m!6911))

(declare-fun m!6913 () Bool)

(assert (=> d!1898 m!6913))

(assert (=> b!5625 d!1898))

(declare-fun d!1900 () Bool)

(assert (=> d!1900 (= (array_inv!178 (buf!507 thiss!1486)) (bvsge (size!183 (buf!507 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!5624 d!1900))

(declare-fun d!1902 () Bool)

(declare-fun c!251 () Bool)

(assert (=> d!1902 (= c!251 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3649 () List!83)

(assert (=> d!1902 (= (byteArrayBitContentToList!0 (_2!396 lt!6816) srcBuffer!6 from!367 nBits!460) e!3649)))

(declare-fun b!5652 () Bool)

(assert (=> b!5652 (= e!3649 Nil!80)))

(declare-fun b!5653 () Bool)

(assert (=> b!5653 (= e!3649 (Cons!79 (not (= (bvand ((_ sign_extend 24) (select (arr!576 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!396 lt!6816) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1902 c!251) b!5652))

(assert (= (and d!1902 (not c!251)) b!5653))

(declare-fun m!6915 () Bool)

(assert (=> b!5653 m!6915))

(declare-fun m!6917 () Bool)

(assert (=> b!5653 m!6917))

(declare-fun m!6919 () Bool)

(assert (=> b!5653 m!6919))

(assert (=> b!5619 d!1902))

(declare-fun d!1904 () Bool)

(assert (=> d!1904 (= (array_inv!178 srcBuffer!6) (bvsge (size!183 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1230 d!1904))

(declare-fun d!1906 () Bool)

(assert (=> d!1906 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1487 thiss!1486) (currentByte!1492 thiss!1486) (size!183 (buf!507 thiss!1486))))))

(declare-fun bs!698 () Bool)

(assert (= bs!698 d!1906))

(assert (=> bs!698 m!6913))

(assert (=> start!1230 d!1906))

(declare-fun b!5683 () Bool)

(declare-fun res!6816 () Bool)

(declare-fun e!3660 () Bool)

(assert (=> b!5683 (=> (not res!6816) (not e!3660))))

(declare-fun lt!6978 () tuple2!756)

(assert (=> b!5683 (= res!6816 (invariant!0 (currentBit!1487 (_2!397 lt!6978)) (currentByte!1492 (_2!397 lt!6978)) (size!183 (buf!507 (_2!397 lt!6978)))))))

(declare-fun b!5684 () Bool)

(declare-fun res!6814 () Bool)

(assert (=> b!5684 (=> (not res!6814) (not e!3660))))

(declare-fun lt!6982 () (_ BitVec 64))

(assert (=> b!5684 (= res!6814 (= (size!183 (_1!397 lt!6978)) ((_ extract 31 0) lt!6982)))))

(assert (=> b!5684 (and (bvslt lt!6982 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!6982 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!6977 () (_ BitVec 64))

(declare-fun lt!6976 () (_ BitVec 64))

(assert (=> b!5684 (= lt!6982 (bvsdiv lt!6977 lt!6976))))

(assert (=> b!5684 (and (not (= lt!6976 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!6977 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!6976 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!5684 (= lt!6976 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!6973 () (_ BitVec 64))

(declare-fun lt!6980 () (_ BitVec 64))

(assert (=> b!5684 (= lt!6977 (bvsub lt!6973 lt!6980))))

(assert (=> b!5684 (or (= (bvand lt!6973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6973 lt!6980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5684 (= lt!6980 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!6979 () (_ BitVec 64))

(assert (=> b!5684 (= lt!6973 (bvadd nBits!460 lt!6979))))

(assert (=> b!5684 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6979 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!6979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5684 (= lt!6979 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!5685 () Bool)

(declare-fun res!6818 () Bool)

(assert (=> b!5685 (=> (not res!6818) (not e!3660))))

(assert (=> b!5685 (= res!6818 (bvsle (currentByte!1492 (_1!398 lt!6821)) (currentByte!1492 (_2!397 lt!6978))))))

(declare-fun b!5687 () Bool)

(declare-fun res!6817 () Bool)

(assert (=> b!5687 (=> (not res!6817) (not e!3660))))

(declare-fun lt!6983 () (_ BitVec 64))

(assert (=> b!5687 (= res!6817 (= (bvadd lt!6983 nBits!460) (bitIndex!0 (size!183 (buf!507 (_2!397 lt!6978))) (currentByte!1492 (_2!397 lt!6978)) (currentBit!1487 (_2!397 lt!6978)))))))

(assert (=> b!5687 (or (not (= (bvand lt!6983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!6983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!6983 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5687 (= lt!6983 (bitIndex!0 (size!183 (buf!507 (_1!398 lt!6821))) (currentByte!1492 (_1!398 lt!6821)) (currentBit!1487 (_1!398 lt!6821))))))

(declare-fun d!1908 () Bool)

(assert (=> d!1908 e!3660))

(declare-fun res!6815 () Bool)

(assert (=> d!1908 (=> (not res!6815) (not e!3660))))

(assert (=> d!1908 (= res!6815 (= (buf!507 (_2!397 lt!6978)) (buf!507 (_1!398 lt!6821))))))

(declare-datatypes ((tuple3!40 0))(
  ( (tuple3!41 (_1!400 Unit!440) (_2!400 BitStream!344) (_3!20 array!424)) )
))
(declare-fun lt!6981 () tuple3!40)

(assert (=> d!1908 (= lt!6978 (tuple2!757 (_3!20 lt!6981) (_2!400 lt!6981)))))

(declare-fun readBitsLoop!0 (BitStream!344 (_ BitVec 64) array!424 (_ BitVec 64) (_ BitVec 64)) tuple3!40)

(assert (=> d!1908 (= lt!6981 (readBitsLoop!0 (_1!398 lt!6821) nBits!460 (array!425 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1908 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1908 (= (readBits!0 (_1!398 lt!6821) nBits!460) lt!6978)))

(declare-fun b!5686 () Bool)

(assert (=> b!5686 (= e!3660 (= (byteArrayBitContentToList!0 (_2!397 lt!6978) (_1!397 lt!6978) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!397 lt!6978) (_1!398 lt!6821) nBits!460)))))

(assert (= (and d!1908 res!6815) b!5687))

(assert (= (and b!5687 res!6817) b!5683))

(assert (= (and b!5683 res!6816) b!5684))

(assert (= (and b!5684 res!6814) b!5685))

(assert (= (and b!5685 res!6818) b!5686))

(declare-fun m!6955 () Bool)

(assert (=> b!5683 m!6955))

(declare-fun m!6957 () Bool)

(assert (=> b!5687 m!6957))

(declare-fun m!6959 () Bool)

(assert (=> b!5687 m!6959))

(declare-fun m!6961 () Bool)

(assert (=> d!1908 m!6961))

(declare-fun m!6963 () Bool)

(assert (=> b!5686 m!6963))

(declare-fun m!6965 () Bool)

(assert (=> b!5686 m!6965))

(assert (=> b!5623 d!1908))

(declare-fun d!1918 () Bool)

(assert (=> d!1918 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!6816)))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) nBits!460)))

(declare-fun lt!7002 () Unit!440)

(declare-fun choose!9 (BitStream!344 array!424 (_ BitVec 64) BitStream!344) Unit!440)

(assert (=> d!1918 (= lt!7002 (choose!9 thiss!1486 (buf!507 (_2!396 lt!6816)) nBits!460 (BitStream!345 (buf!507 (_2!396 lt!6816)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486))))))

(assert (=> d!1918 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!507 (_2!396 lt!6816)) nBits!460) lt!7002)))

(declare-fun bs!701 () Bool)

(assert (= bs!701 d!1918))

(assert (=> bs!701 m!6873))

(declare-fun m!6967 () Bool)

(assert (=> bs!701 m!6967))

(assert (=> b!5623 d!1918))

(declare-fun b!5709 () Bool)

(declare-fun e!3669 () Bool)

(declare-fun lt!7031 () List!83)

(declare-fun isEmpty!14 (List!83) Bool)

(assert (=> b!5709 (= e!3669 (isEmpty!14 lt!7031))))

(declare-datatypes ((tuple2!764 0))(
  ( (tuple2!765 (_1!403 List!83) (_2!403 BitStream!344)) )
))
(declare-fun e!3670 () tuple2!764)

(declare-fun lt!7029 () (_ BitVec 64))

(declare-fun b!5708 () Bool)

(declare-datatypes ((tuple2!766 0))(
  ( (tuple2!767 (_1!404 Bool) (_2!404 BitStream!344)) )
))
(declare-fun lt!7030 () tuple2!766)

(assert (=> b!5708 (= e!3670 (tuple2!765 (Cons!79 (_1!404 lt!7030) (bitStreamReadBitsIntoList!0 (_2!396 lt!6816) (_2!404 lt!7030) (bvsub nBits!460 lt!7029))) (_2!404 lt!7030)))))

(declare-fun readBit!0 (BitStream!344) tuple2!766)

(assert (=> b!5708 (= lt!7030 (readBit!0 (_1!398 lt!6821)))))

(assert (=> b!5708 (= lt!7029 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!5710 () Bool)

(declare-fun length!9 (List!83) Int)

(assert (=> b!5710 (= e!3669 (> (length!9 lt!7031) 0))))

(declare-fun d!1920 () Bool)

(assert (=> d!1920 e!3669))

(declare-fun c!263 () Bool)

(assert (=> d!1920 (= c!263 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1920 (= lt!7031 (_1!403 e!3670))))

(declare-fun c!262 () Bool)

(assert (=> d!1920 (= c!262 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1920 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1920 (= (bitStreamReadBitsIntoList!0 (_2!396 lt!6816) (_1!398 lt!6821) nBits!460) lt!7031)))

(declare-fun b!5707 () Bool)

(assert (=> b!5707 (= e!3670 (tuple2!765 Nil!80 (_1!398 lt!6821)))))

(assert (= (and d!1920 c!262) b!5707))

(assert (= (and d!1920 (not c!262)) b!5708))

(assert (= (and d!1920 c!263) b!5709))

(assert (= (and d!1920 (not c!263)) b!5710))

(declare-fun m!6999 () Bool)

(assert (=> b!5709 m!6999))

(declare-fun m!7001 () Bool)

(assert (=> b!5708 m!7001))

(declare-fun m!7003 () Bool)

(assert (=> b!5708 m!7003))

(declare-fun m!7005 () Bool)

(assert (=> b!5710 m!7005))

(assert (=> b!5623 d!1920))

(declare-fun d!1924 () Bool)

(declare-fun c!264 () Bool)

(assert (=> d!1924 (= c!264 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3671 () List!83)

(assert (=> d!1924 (= (byteArrayBitContentToList!0 (_2!396 lt!6816) (_1!397 lt!6819) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3671)))

(declare-fun b!5711 () Bool)

(assert (=> b!5711 (= e!3671 Nil!80)))

(declare-fun b!5712 () Bool)

(assert (=> b!5712 (= e!3671 (Cons!79 (not (= (bvand ((_ sign_extend 24) (select (arr!576 (_1!397 lt!6819)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!396 lt!6816) (_1!397 lt!6819) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1924 c!264) b!5711))

(assert (= (and d!1924 (not c!264)) b!5712))

(declare-fun m!7007 () Bool)

(assert (=> b!5712 m!7007))

(declare-fun m!7009 () Bool)

(assert (=> b!5712 m!7009))

(declare-fun m!7011 () Bool)

(assert (=> b!5712 m!7011))

(assert (=> b!5623 d!1924))

(declare-fun b!5765 () Bool)

(declare-fun e!3688 () Bool)

(declare-fun lt!7147 () tuple2!758)

(declare-fun lt!7151 () (_ BitVec 64))

(declare-fun lt!7154 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!344 (_ BitVec 64)) BitStream!344)

(assert (=> b!5765 (= e!3688 (= (_1!398 lt!7147) (withMovedBitIndex!0 (_2!398 lt!7147) (bvsub lt!7151 lt!7154))))))

(assert (=> b!5765 (or (= (bvand lt!7151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7154 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7151 lt!7154) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5765 (= lt!7154 (bitIndex!0 (size!183 (buf!507 (_2!396 lt!6816))) (currentByte!1492 (_2!396 lt!6816)) (currentBit!1487 (_2!396 lt!6816))))))

(assert (=> b!5765 (= lt!7151 (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)))))

(declare-fun b!5766 () Bool)

(declare-fun e!3689 () Unit!440)

(declare-fun lt!7153 () Unit!440)

(assert (=> b!5766 (= e!3689 lt!7153)))

(declare-fun lt!7144 () (_ BitVec 64))

(assert (=> b!5766 (= lt!7144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7136 () (_ BitVec 64))

(assert (=> b!5766 (= lt!7136 (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!424 array!424 (_ BitVec 64) (_ BitVec 64)) Unit!440)

(assert (=> b!5766 (= lt!7153 (arrayBitRangesEqSymmetric!0 (buf!507 thiss!1486) (buf!507 (_2!396 lt!6816)) lt!7144 lt!7136))))

(declare-fun arrayBitRangesEq!0 (array!424 array!424 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!5766 (arrayBitRangesEq!0 (buf!507 (_2!396 lt!6816)) (buf!507 thiss!1486) lt!7144 lt!7136)))

(declare-fun b!5767 () Bool)

(declare-fun res!6866 () Bool)

(assert (=> b!5767 (=> (not res!6866) (not e!3688))))

(assert (=> b!5767 (= res!6866 (isPrefixOf!0 (_1!398 lt!7147) thiss!1486))))

(declare-fun b!5768 () Bool)

(declare-fun Unit!449 () Unit!440)

(assert (=> b!5768 (= e!3689 Unit!449)))

(declare-fun d!1926 () Bool)

(assert (=> d!1926 e!3688))

(declare-fun res!6864 () Bool)

(assert (=> d!1926 (=> (not res!6864) (not e!3688))))

(assert (=> d!1926 (= res!6864 (isPrefixOf!0 (_1!398 lt!7147) (_2!398 lt!7147)))))

(declare-fun lt!7150 () BitStream!344)

(assert (=> d!1926 (= lt!7147 (tuple2!759 lt!7150 (_2!396 lt!6816)))))

(declare-fun lt!7149 () Unit!440)

(declare-fun lt!7141 () Unit!440)

(assert (=> d!1926 (= lt!7149 lt!7141)))

(assert (=> d!1926 (isPrefixOf!0 lt!7150 (_2!396 lt!6816))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!344 BitStream!344 BitStream!344) Unit!440)

(assert (=> d!1926 (= lt!7141 (lemmaIsPrefixTransitive!0 lt!7150 (_2!396 lt!6816) (_2!396 lt!6816)))))

(declare-fun lt!7142 () Unit!440)

(declare-fun lt!7152 () Unit!440)

(assert (=> d!1926 (= lt!7142 lt!7152)))

(assert (=> d!1926 (isPrefixOf!0 lt!7150 (_2!396 lt!6816))))

(assert (=> d!1926 (= lt!7152 (lemmaIsPrefixTransitive!0 lt!7150 thiss!1486 (_2!396 lt!6816)))))

(declare-fun lt!7148 () Unit!440)

(assert (=> d!1926 (= lt!7148 e!3689)))

(declare-fun c!273 () Bool)

(assert (=> d!1926 (= c!273 (not (= (size!183 (buf!507 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!7143 () Unit!440)

(declare-fun lt!7139 () Unit!440)

(assert (=> d!1926 (= lt!7143 lt!7139)))

(assert (=> d!1926 (isPrefixOf!0 (_2!396 lt!6816) (_2!396 lt!6816))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!344) Unit!440)

(assert (=> d!1926 (= lt!7139 (lemmaIsPrefixRefl!0 (_2!396 lt!6816)))))

(declare-fun lt!7137 () Unit!440)

(declare-fun lt!7145 () Unit!440)

(assert (=> d!1926 (= lt!7137 lt!7145)))

(assert (=> d!1926 (= lt!7145 (lemmaIsPrefixRefl!0 (_2!396 lt!6816)))))

(declare-fun lt!7146 () Unit!440)

(declare-fun lt!7140 () Unit!440)

(assert (=> d!1926 (= lt!7146 lt!7140)))

(assert (=> d!1926 (isPrefixOf!0 lt!7150 lt!7150)))

(assert (=> d!1926 (= lt!7140 (lemmaIsPrefixRefl!0 lt!7150))))

(declare-fun lt!7138 () Unit!440)

(declare-fun lt!7135 () Unit!440)

(assert (=> d!1926 (= lt!7138 lt!7135)))

(assert (=> d!1926 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1926 (= lt!7135 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1926 (= lt!7150 (BitStream!345 (buf!507 (_2!396 lt!6816)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)))))

(assert (=> d!1926 (isPrefixOf!0 thiss!1486 (_2!396 lt!6816))))

(assert (=> d!1926 (= (reader!0 thiss!1486 (_2!396 lt!6816)) lt!7147)))

(declare-fun b!5769 () Bool)

(declare-fun res!6865 () Bool)

(assert (=> b!5769 (=> (not res!6865) (not e!3688))))

(assert (=> b!5769 (= res!6865 (isPrefixOf!0 (_2!398 lt!7147) (_2!396 lt!6816)))))

(assert (= (and d!1926 c!273) b!5766))

(assert (= (and d!1926 (not c!273)) b!5768))

(assert (= (and d!1926 res!6864) b!5767))

(assert (= (and b!5767 res!6866) b!5769))

(assert (= (and b!5769 res!6865) b!5765))

(declare-fun m!7047 () Bool)

(assert (=> d!1926 m!7047))

(declare-fun m!7049 () Bool)

(assert (=> d!1926 m!7049))

(declare-fun m!7051 () Bool)

(assert (=> d!1926 m!7051))

(declare-fun m!7053 () Bool)

(assert (=> d!1926 m!7053))

(assert (=> d!1926 m!6885))

(declare-fun m!7055 () Bool)

(assert (=> d!1926 m!7055))

(declare-fun m!7057 () Bool)

(assert (=> d!1926 m!7057))

(declare-fun m!7059 () Bool)

(assert (=> d!1926 m!7059))

(declare-fun m!7061 () Bool)

(assert (=> d!1926 m!7061))

(declare-fun m!7063 () Bool)

(assert (=> d!1926 m!7063))

(declare-fun m!7065 () Bool)

(assert (=> d!1926 m!7065))

(declare-fun m!7067 () Bool)

(assert (=> b!5769 m!7067))

(declare-fun m!7069 () Bool)

(assert (=> b!5765 m!7069))

(assert (=> b!5765 m!6889))

(assert (=> b!5765 m!6891))

(assert (=> b!5766 m!6891))

(declare-fun m!7071 () Bool)

(assert (=> b!5766 m!7071))

(declare-fun m!7073 () Bool)

(assert (=> b!5766 m!7073))

(declare-fun m!7075 () Bool)

(assert (=> b!5767 m!7075))

(assert (=> b!5623 d!1926))

(declare-fun d!1938 () Bool)

(assert (=> d!1938 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!6816)))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!6816)))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486))) nBits!460))))

(declare-fun bs!703 () Bool)

(assert (= bs!703 d!1938))

(declare-fun m!7077 () Bool)

(assert (=> bs!703 m!7077))

(assert (=> b!5623 d!1938))

(declare-fun d!1940 () Bool)

(declare-fun checkByteArrayBitContent!0 (BitStream!344 array!424 array!424 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!1940 (checkByteArrayBitContent!0 (_2!396 lt!6816) srcBuffer!6 (_1!397 lt!6819) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!7163 () Unit!440)

(declare-fun choose!65 (BitStream!344 array!424 array!424 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!440)

(assert (=> d!1940 (= lt!7163 (choose!65 (_2!396 lt!6816) srcBuffer!6 (_1!397 lt!6819) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1940 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1940 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!396 lt!6816) srcBuffer!6 (_1!397 lt!6819) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7163)))

(declare-fun bs!704 () Bool)

(assert (= bs!704 d!1940))

(declare-fun m!7079 () Bool)

(assert (=> bs!704 m!7079))

(declare-fun m!7081 () Bool)

(assert (=> bs!704 m!7081))

(assert (=> b!5622 d!1940))

(declare-fun d!1942 () Bool)

(assert (=> d!1942 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 thiss!1486))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!183 (buf!507 thiss!1486))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486))) nBits!460))))

(declare-fun bs!705 () Bool)

(assert (= bs!705 d!1942))

(assert (=> bs!705 m!6911))

(assert (=> b!5617 d!1942))

(declare-fun d!1944 () Bool)

(declare-fun res!6875 () Bool)

(declare-fun e!3700 () Bool)

(assert (=> d!1944 (=> (not res!6875) (not e!3700))))

(assert (=> d!1944 (= res!6875 (= (size!183 (buf!507 thiss!1486)) (size!183 (buf!507 (_2!396 lt!6816)))))))

(assert (=> d!1944 (= (isPrefixOf!0 thiss!1486 (_2!396 lt!6816)) e!3700)))

(declare-fun b!5788 () Bool)

(declare-fun res!6873 () Bool)

(assert (=> b!5788 (=> (not res!6873) (not e!3700))))

(assert (=> b!5788 (= res!6873 (bvsle (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)) (bitIndex!0 (size!183 (buf!507 (_2!396 lt!6816))) (currentByte!1492 (_2!396 lt!6816)) (currentBit!1487 (_2!396 lt!6816)))))))

(declare-fun b!5789 () Bool)

(declare-fun e!3701 () Bool)

(assert (=> b!5789 (= e!3700 e!3701)))

(declare-fun res!6874 () Bool)

(assert (=> b!5789 (=> res!6874 e!3701)))

(assert (=> b!5789 (= res!6874 (= (size!183 (buf!507 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!5790 () Bool)

(assert (=> b!5790 (= e!3701 (arrayBitRangesEq!0 (buf!507 thiss!1486) (buf!507 (_2!396 lt!6816)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486))))))

(assert (= (and d!1944 res!6875) b!5788))

(assert (= (and b!5788 res!6873) b!5789))

(assert (= (and b!5789 (not res!6874)) b!5790))

(assert (=> b!5788 m!6891))

(assert (=> b!5788 m!6889))

(assert (=> b!5790 m!6891))

(assert (=> b!5790 m!6891))

(declare-fun m!7093 () Bool)

(assert (=> b!5790 m!7093))

(assert (=> b!5621 d!1944))

(declare-fun d!1950 () Bool)

(assert (=> d!1950 (= (invariant!0 (currentBit!1487 (_2!396 lt!6816)) (currentByte!1492 (_2!396 lt!6816)) (size!183 (buf!507 (_2!396 lt!6816)))) (and (bvsge (currentBit!1487 (_2!396 lt!6816)) #b00000000000000000000000000000000) (bvslt (currentBit!1487 (_2!396 lt!6816)) #b00000000000000000000000000001000) (bvsge (currentByte!1492 (_2!396 lt!6816)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1492 (_2!396 lt!6816)) (size!183 (buf!507 (_2!396 lt!6816)))) (and (= (currentBit!1487 (_2!396 lt!6816)) #b00000000000000000000000000000000) (= (currentByte!1492 (_2!396 lt!6816)) (size!183 (buf!507 (_2!396 lt!6816))))))))))

(assert (=> b!5620 d!1950))

(declare-fun b!5860 () Bool)

(declare-fun e!3735 () tuple2!754)

(declare-fun Unit!452 () Unit!440)

(assert (=> b!5860 (= e!3735 (tuple2!755 Unit!452 thiss!1486))))

(assert (=> b!5860 (= (size!183 (buf!507 thiss!1486)) (size!183 (buf!507 thiss!1486)))))

(declare-fun lt!7484 () Unit!440)

(declare-fun Unit!453 () Unit!440)

(assert (=> b!5860 (= lt!7484 Unit!453)))

(declare-fun call!62 () tuple2!758)

(assert (=> b!5860 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!397 (readBits!0 (_1!398 call!62) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7482 () tuple2!754)

(declare-fun bm!59 () Bool)

(declare-fun c!291 () Bool)

(assert (=> bm!59 (= call!62 (reader!0 thiss!1486 (ite c!291 (_2!396 lt!7482) thiss!1486)))))

(declare-fun lt!7473 () tuple2!758)

(declare-fun lt!7503 () tuple2!754)

(declare-fun e!3734 () Bool)

(declare-fun b!5861 () Bool)

(assert (=> b!5861 (= e!3734 (= (bitStreamReadBitsIntoList!0 (_2!396 lt!7503) (_1!398 lt!7473) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!396 lt!7503) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!5861 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5861 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7507 () Unit!440)

(declare-fun lt!7487 () Unit!440)

(assert (=> b!5861 (= lt!7507 lt!7487)))

(declare-fun lt!7496 () (_ BitVec 64))

(assert (=> b!5861 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!7503)))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) lt!7496)))

(assert (=> b!5861 (= lt!7487 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!507 (_2!396 lt!7503)) lt!7496))))

(declare-fun e!3733 () Bool)

(assert (=> b!5861 e!3733))

(declare-fun res!6924 () Bool)

(assert (=> b!5861 (=> (not res!6924) (not e!3733))))

(assert (=> b!5861 (= res!6924 (and (= (size!183 (buf!507 thiss!1486)) (size!183 (buf!507 (_2!396 lt!7503)))) (bvsge lt!7496 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5861 (= lt!7496 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!5861 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!5861 (= lt!7473 (reader!0 thiss!1486 (_2!396 lt!7503)))))

(declare-fun b!5862 () Bool)

(declare-fun lt!7501 () tuple2!754)

(declare-fun Unit!454 () Unit!440)

(assert (=> b!5862 (= e!3735 (tuple2!755 Unit!454 (_2!396 lt!7501)))))

(declare-fun appendBitFromByte!0 (BitStream!344 (_ BitVec 8) (_ BitVec 32)) tuple2!754)

(assert (=> b!5862 (= lt!7482 (appendBitFromByte!0 thiss!1486 (select (arr!576 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!7486 () (_ BitVec 64))

(assert (=> b!5862 (= lt!7486 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7475 () (_ BitVec 64))

(assert (=> b!5862 (= lt!7475 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7481 () Unit!440)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!344 BitStream!344 (_ BitVec 64) (_ BitVec 64)) Unit!440)

(assert (=> b!5862 (= lt!7481 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!396 lt!7482) lt!7486 lt!7475))))

(assert (=> b!5862 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!7482)))) ((_ sign_extend 32) (currentByte!1492 (_2!396 lt!7482))) ((_ sign_extend 32) (currentBit!1487 (_2!396 lt!7482))) (bvsub lt!7486 lt!7475))))

(declare-fun lt!7483 () Unit!440)

(assert (=> b!5862 (= lt!7483 lt!7481)))

(declare-fun lt!7476 () tuple2!758)

(assert (=> b!5862 (= lt!7476 call!62)))

(declare-fun lt!7510 () (_ BitVec 64))

(assert (=> b!5862 (= lt!7510 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7485 () Unit!440)

(assert (=> b!5862 (= lt!7485 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!507 (_2!396 lt!7482)) lt!7510))))

(assert (=> b!5862 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!7482)))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) lt!7510)))

(declare-fun lt!7511 () Unit!440)

(assert (=> b!5862 (= lt!7511 lt!7485)))

(declare-fun head!25 (List!83) Bool)

(assert (=> b!5862 (= (head!25 (byteArrayBitContentToList!0 (_2!396 lt!7482) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!25 (bitStreamReadBitsIntoList!0 (_2!396 lt!7482) (_1!398 lt!7476) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7474 () Unit!440)

(declare-fun Unit!457 () Unit!440)

(assert (=> b!5862 (= lt!7474 Unit!457)))

(assert (=> b!5862 (= lt!7501 (appendBitsMSBFirstLoop!0 (_2!396 lt!7482) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!7490 () Unit!440)

(assert (=> b!5862 (= lt!7490 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!396 lt!7482) (_2!396 lt!7501)))))

(assert (=> b!5862 (isPrefixOf!0 thiss!1486 (_2!396 lt!7501))))

(declare-fun lt!7492 () Unit!440)

(assert (=> b!5862 (= lt!7492 lt!7490)))

(assert (=> b!5862 (= (size!183 (buf!507 (_2!396 lt!7501))) (size!183 (buf!507 thiss!1486)))))

(declare-fun lt!7508 () Unit!440)

(declare-fun Unit!460 () Unit!440)

(assert (=> b!5862 (= lt!7508 Unit!460)))

(assert (=> b!5862 (= (bitIndex!0 (size!183 (buf!507 (_2!396 lt!7501))) (currentByte!1492 (_2!396 lt!7501)) (currentBit!1487 (_2!396 lt!7501))) (bvsub (bvadd (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!7478 () Unit!440)

(declare-fun Unit!462 () Unit!440)

(assert (=> b!5862 (= lt!7478 Unit!462)))

(assert (=> b!5862 (= (bitIndex!0 (size!183 (buf!507 (_2!396 lt!7501))) (currentByte!1492 (_2!396 lt!7501)) (currentBit!1487 (_2!396 lt!7501))) (bvsub (bvsub (bvadd (bitIndex!0 (size!183 (buf!507 (_2!396 lt!7482))) (currentByte!1492 (_2!396 lt!7482)) (currentBit!1487 (_2!396 lt!7482))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!7493 () Unit!440)

(declare-fun Unit!463 () Unit!440)

(assert (=> b!5862 (= lt!7493 Unit!463)))

(declare-fun lt!7494 () tuple2!758)

(assert (=> b!5862 (= lt!7494 (reader!0 thiss!1486 (_2!396 lt!7501)))))

(declare-fun lt!7489 () (_ BitVec 64))

(assert (=> b!5862 (= lt!7489 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7468 () Unit!440)

(assert (=> b!5862 (= lt!7468 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!507 (_2!396 lt!7501)) lt!7489))))

(assert (=> b!5862 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!7501)))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) lt!7489)))

(declare-fun lt!7488 () Unit!440)

(assert (=> b!5862 (= lt!7488 lt!7468)))

(declare-fun lt!7470 () tuple2!758)

(assert (=> b!5862 (= lt!7470 (reader!0 (_2!396 lt!7482) (_2!396 lt!7501)))))

(declare-fun lt!7499 () (_ BitVec 64))

(assert (=> b!5862 (= lt!7499 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!7471 () Unit!440)

(assert (=> b!5862 (= lt!7471 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!396 lt!7482) (buf!507 (_2!396 lt!7501)) lt!7499))))

(assert (=> b!5862 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 (_2!396 lt!7501)))) ((_ sign_extend 32) (currentByte!1492 (_2!396 lt!7482))) ((_ sign_extend 32) (currentBit!1487 (_2!396 lt!7482))) lt!7499)))

(declare-fun lt!7477 () Unit!440)

(assert (=> b!5862 (= lt!7477 lt!7471)))

(declare-fun lt!7502 () List!83)

(assert (=> b!5862 (= lt!7502 (byteArrayBitContentToList!0 (_2!396 lt!7501) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!7495 () List!83)

(assert (=> b!5862 (= lt!7495 (byteArrayBitContentToList!0 (_2!396 lt!7501) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7504 () List!83)

(assert (=> b!5862 (= lt!7504 (bitStreamReadBitsIntoList!0 (_2!396 lt!7501) (_1!398 lt!7494) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!7472 () List!83)

(assert (=> b!5862 (= lt!7472 (bitStreamReadBitsIntoList!0 (_2!396 lt!7501) (_1!398 lt!7470) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!7479 () (_ BitVec 64))

(assert (=> b!5862 (= lt!7479 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!7480 () Unit!440)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!344 BitStream!344 BitStream!344 BitStream!344 (_ BitVec 64) List!83) Unit!440)

(assert (=> b!5862 (= lt!7480 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!396 lt!7501) (_2!396 lt!7501) (_1!398 lt!7494) (_1!398 lt!7470) lt!7479 lt!7504))))

(declare-fun tail!33 (List!83) List!83)

(assert (=> b!5862 (= (bitStreamReadBitsIntoList!0 (_2!396 lt!7501) (_1!398 lt!7470) (bvsub lt!7479 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!33 lt!7504))))

(declare-fun lt!7505 () Unit!440)

(assert (=> b!5862 (= lt!7505 lt!7480)))

(declare-fun lt!7491 () (_ BitVec 64))

(declare-fun lt!7506 () Unit!440)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!424 array!424 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!440)

(assert (=> b!5862 (= lt!7506 (arrayBitRangesEqImpliesEq!0 (buf!507 (_2!396 lt!7482)) (buf!507 (_2!396 lt!7501)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!7491 (bitIndex!0 (size!183 (buf!507 (_2!396 lt!7482))) (currentByte!1492 (_2!396 lt!7482)) (currentBit!1487 (_2!396 lt!7482)))))))

(declare-fun bitAt!0 (array!424 (_ BitVec 64)) Bool)

(assert (=> b!5862 (= (bitAt!0 (buf!507 (_2!396 lt!7482)) lt!7491) (bitAt!0 (buf!507 (_2!396 lt!7501)) lt!7491))))

(declare-fun lt!7469 () Unit!440)

(assert (=> b!5862 (= lt!7469 lt!7506)))

(declare-fun b!5863 () Bool)

(declare-fun res!6926 () Bool)

(assert (=> b!5863 (=> (not res!6926) (not e!3734))))

(assert (=> b!5863 (= res!6926 (= (size!183 (buf!507 thiss!1486)) (size!183 (buf!507 (_2!396 lt!7503)))))))

(declare-fun d!1954 () Bool)

(assert (=> d!1954 e!3734))

(declare-fun res!6928 () Bool)

(assert (=> d!1954 (=> (not res!6928) (not e!3734))))

(declare-fun lt!7509 () (_ BitVec 64))

(assert (=> d!1954 (= res!6928 (= (bitIndex!0 (size!183 (buf!507 (_2!396 lt!7503))) (currentByte!1492 (_2!396 lt!7503)) (currentBit!1487 (_2!396 lt!7503))) (bvsub lt!7509 from!367)))))

(assert (=> d!1954 (or (= (bvand lt!7509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7509 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!7498 () (_ BitVec 64))

(assert (=> d!1954 (= lt!7509 (bvadd lt!7498 from!367 nBits!460))))

(assert (=> d!1954 (or (not (= (bvand lt!7498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!7498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!7498 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1954 (= lt!7498 (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)))))

(assert (=> d!1954 (= lt!7503 e!3735)))

(assert (=> d!1954 (= c!291 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!7500 () Unit!440)

(declare-fun lt!7497 () Unit!440)

(assert (=> d!1954 (= lt!7500 lt!7497)))

(assert (=> d!1954 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1954 (= lt!7497 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1954 (= lt!7491 (bitIndex!0 (size!183 (buf!507 thiss!1486)) (currentByte!1492 thiss!1486) (currentBit!1487 thiss!1486)))))

(assert (=> d!1954 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1954 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!7503)))

(declare-fun b!5864 () Bool)

(declare-fun res!6925 () Bool)

(assert (=> b!5864 (=> (not res!6925) (not e!3734))))

(assert (=> b!5864 (= res!6925 (isPrefixOf!0 thiss!1486 (_2!396 lt!7503)))))

(declare-fun b!5865 () Bool)

(assert (=> b!5865 (= e!3733 (validate_offset_bits!1 ((_ sign_extend 32) (size!183 (buf!507 thiss!1486))) ((_ sign_extend 32) (currentByte!1492 thiss!1486)) ((_ sign_extend 32) (currentBit!1487 thiss!1486)) lt!7496))))

(declare-fun b!5866 () Bool)

(declare-fun res!6927 () Bool)

(assert (=> b!5866 (=> (not res!6927) (not e!3734))))

(assert (=> b!5866 (= res!6927 (invariant!0 (currentBit!1487 (_2!396 lt!7503)) (currentByte!1492 (_2!396 lt!7503)) (size!183 (buf!507 (_2!396 lt!7503)))))))

(declare-fun b!5867 () Bool)

(declare-fun res!6923 () Bool)

(assert (=> b!5867 (=> (not res!6923) (not e!3734))))

(assert (=> b!5867 (= res!6923 (= (size!183 (buf!507 (_2!396 lt!7503))) (size!183 (buf!507 thiss!1486))))))

(assert (= (and d!1954 c!291) b!5862))

(assert (= (and d!1954 (not c!291)) b!5860))

(assert (= (or b!5862 b!5860) bm!59))

(assert (= (and d!1954 res!6928) b!5866))

(assert (= (and b!5866 res!6927) b!5863))

(assert (= (and b!5863 res!6926) b!5864))

(assert (= (and b!5864 res!6925) b!5867))

(assert (= (and b!5867 res!6923) b!5861))

(assert (= (and b!5861 res!6924) b!5865))

(declare-fun m!7207 () Bool)

(assert (=> b!5865 m!7207))

(declare-fun m!7209 () Bool)

(assert (=> b!5862 m!7209))

(declare-fun m!7211 () Bool)

(assert (=> b!5862 m!7211))

(declare-fun m!7213 () Bool)

(assert (=> b!5862 m!7213))

(declare-fun m!7215 () Bool)

(assert (=> b!5862 m!7215))

(declare-fun m!7217 () Bool)

(assert (=> b!5862 m!7217))

(declare-fun m!7219 () Bool)

(assert (=> b!5862 m!7219))

(declare-fun m!7221 () Bool)

(assert (=> b!5862 m!7221))

(declare-fun m!7223 () Bool)

(assert (=> b!5862 m!7223))

(declare-fun m!7225 () Bool)

(assert (=> b!5862 m!7225))

(declare-fun m!7227 () Bool)

(assert (=> b!5862 m!7227))

(declare-fun m!7229 () Bool)

(assert (=> b!5862 m!7229))

(declare-fun m!7231 () Bool)

(assert (=> b!5862 m!7231))

(declare-fun m!7233 () Bool)

(assert (=> b!5862 m!7233))

(assert (=> b!5862 m!6915))

(declare-fun m!7235 () Bool)

(assert (=> b!5862 m!7235))

(assert (=> b!5862 m!6915))

(declare-fun m!7237 () Bool)

(assert (=> b!5862 m!7237))

(declare-fun m!7239 () Bool)

(assert (=> b!5862 m!7239))

(declare-fun m!7241 () Bool)

(assert (=> b!5862 m!7241))

(declare-fun m!7243 () Bool)

(assert (=> b!5862 m!7243))

(assert (=> b!5862 m!6891))

(declare-fun m!7245 () Bool)

(assert (=> b!5862 m!7245))

(declare-fun m!7247 () Bool)

(assert (=> b!5862 m!7247))

(declare-fun m!7249 () Bool)

(assert (=> b!5862 m!7249))

(declare-fun m!7251 () Bool)

(assert (=> b!5862 m!7251))

(assert (=> b!5862 m!7223))

(declare-fun m!7253 () Bool)

(assert (=> b!5862 m!7253))

(declare-fun m!7255 () Bool)

(assert (=> b!5862 m!7255))

(assert (=> b!5862 m!7211))

(declare-fun m!7257 () Bool)

(assert (=> b!5862 m!7257))

(assert (=> b!5862 m!7225))

(declare-fun m!7259 () Bool)

(assert (=> b!5862 m!7259))

(declare-fun m!7261 () Bool)

(assert (=> b!5862 m!7261))

(declare-fun m!7263 () Bool)

(assert (=> b!5862 m!7263))

(declare-fun m!7265 () Bool)

(assert (=> b!5862 m!7265))

(declare-fun m!7267 () Bool)

(assert (=> b!5862 m!7267))

(declare-fun m!7269 () Bool)

(assert (=> bm!59 m!7269))

(declare-fun m!7271 () Bool)

(assert (=> d!1954 m!7271))

(assert (=> d!1954 m!6891))

(assert (=> d!1954 m!7055))

(assert (=> d!1954 m!7061))

(declare-fun m!7273 () Bool)

(assert (=> b!5864 m!7273))

(declare-fun m!7275 () Bool)

(assert (=> b!5866 m!7275))

(declare-fun m!7277 () Bool)

(assert (=> b!5860 m!7277))

(declare-fun m!7279 () Bool)

(assert (=> b!5860 m!7279))

(declare-fun m!7281 () Bool)

(assert (=> b!5861 m!7281))

(declare-fun m!7283 () Bool)

(assert (=> b!5861 m!7283))

(declare-fun m!7285 () Bool)

(assert (=> b!5861 m!7285))

(declare-fun m!7287 () Bool)

(assert (=> b!5861 m!7287))

(declare-fun m!7289 () Bool)

(assert (=> b!5861 m!7289))

(assert (=> b!5620 d!1954))

(push 1)

(assert (not d!1890))

(assert (not b!5683))

(assert (not b!5710))

(assert (not b!5686))

(assert (not b!5860))

(assert (not b!5862))

(assert (not d!1908))

(assert (not b!5708))

(assert (not d!1954))

(assert (not b!5767))

(assert (not b!5687))

(assert (not b!5790))

(assert (not d!1898))

(assert (not b!5765))

(assert (not b!5864))

(assert (not b!5709))

(assert (not d!1906))

(assert (not b!5865))

(assert (not b!5866))

(assert (not b!5653))

(assert (not b!5769))

(assert (not b!5766))

(assert (not d!1918))

(assert (not d!1938))

(assert (not b!5861))

(assert (not b!5712))

(assert (not d!1942))

(assert (not d!1926))

(assert (not d!1940))

(assert (not b!5788))

(assert (not bm!59))

(check-sat)

(pop 1)

(push 1)

(check-sat)

