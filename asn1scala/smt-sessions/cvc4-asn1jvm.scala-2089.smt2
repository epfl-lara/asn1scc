; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53094 () Bool)

(assert start!53094)

(declare-fun b!245896 () Bool)

(declare-fun e!170356 () Bool)

(declare-fun e!170354 () Bool)

(assert (=> b!245896 (= e!170356 e!170354)))

(declare-fun res!205651 () Bool)

(assert (=> b!245896 (=> res!205651 e!170354)))

(declare-datatypes ((array!13422 0))(
  ( (array!13423 (arr!6870 (Array (_ BitVec 32) (_ BitVec 8))) (size!5883 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10688 0))(
  ( (BitStream!10689 (buf!6364 array!13422) (currentByte!11760 (_ BitVec 32)) (currentBit!11755 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10688)

(declare-datatypes ((Unit!17878 0))(
  ( (Unit!17879) )
))
(declare-datatypes ((tuple2!21078 0))(
  ( (tuple2!21079 (_1!11461 Unit!17878) (_2!11461 BitStream!10688)) )
))
(declare-fun lt!383678 () tuple2!21078)

(assert (=> b!245896 (= res!205651 (not (= (size!5883 (buf!6364 thiss!1005)) (size!5883 (buf!6364 (_2!11461 lt!383678))))))))

(declare-datatypes ((tuple2!21080 0))(
  ( (tuple2!21081 (_1!11462 BitStream!10688) (_2!11462 Bool)) )
))
(declare-fun lt!383680 () tuple2!21080)

(declare-fun lt!383684 () tuple2!21080)

(declare-datatypes ((tuple2!21082 0))(
  ( (tuple2!21083 (_1!11463 BitStream!10688) (_2!11463 BitStream!10688)) )
))
(declare-fun lt!383691 () tuple2!21082)

(assert (=> b!245896 (and (= (_2!11462 lt!383680) (_2!11462 lt!383684)) (= (_1!11462 lt!383680) (_2!11463 lt!383691)))))

(declare-fun b!245897 () Bool)

(declare-fun e!170346 () Bool)

(declare-fun e!170353 () Bool)

(assert (=> b!245897 (= e!170346 e!170353)))

(declare-fun res!205644 () Bool)

(assert (=> b!245897 (=> (not res!205644) (not e!170353))))

(declare-fun lt!383685 () tuple2!21080)

(declare-fun bit!26 () Bool)

(declare-fun lt!383679 () tuple2!21078)

(assert (=> b!245897 (= res!205644 (and (= (_2!11462 lt!383685) bit!26) (= (_1!11462 lt!383685) (_2!11461 lt!383679))))))

(declare-fun readBitPure!0 (BitStream!10688) tuple2!21080)

(declare-fun readerFrom!0 (BitStream!10688 (_ BitVec 32) (_ BitVec 32)) BitStream!10688)

(assert (=> b!245897 (= lt!383685 (readBitPure!0 (readerFrom!0 (_2!11461 lt!383679) (currentBit!11755 thiss!1005) (currentByte!11760 thiss!1005))))))

(declare-fun b!245898 () Bool)

(declare-fun e!170347 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!245898 (= e!170347 (invariant!0 (currentBit!11755 thiss!1005) (currentByte!11760 thiss!1005) (size!5883 (buf!6364 (_2!11461 lt!383678)))))))

(declare-fun b!245900 () Bool)

(declare-fun res!205659 () Bool)

(assert (=> b!245900 (=> (not res!205659) (not e!170346))))

(declare-fun isPrefixOf!0 (BitStream!10688 BitStream!10688) Bool)

(assert (=> b!245900 (= res!205659 (isPrefixOf!0 thiss!1005 (_2!11461 lt!383679)))))

(declare-fun b!245901 () Bool)

(declare-fun e!170348 () Bool)

(declare-fun e!170349 () Bool)

(assert (=> b!245901 (= e!170348 e!170349)))

(declare-fun res!205647 () Bool)

(assert (=> b!245901 (=> (not res!205647) (not e!170349))))

(declare-fun lt!383681 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!245901 (= res!205647 (= (bitIndex!0 (size!5883 (buf!6364 (_2!11461 lt!383678))) (currentByte!11760 (_2!11461 lt!383678)) (currentBit!11755 (_2!11461 lt!383678))) (bvadd (bitIndex!0 (size!5883 (buf!6364 (_2!11461 lt!383679))) (currentByte!11760 (_2!11461 lt!383679)) (currentBit!11755 (_2!11461 lt!383679))) lt!383681)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!245901 (= lt!383681 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!245902 () Bool)

(declare-fun res!205650 () Bool)

(declare-fun e!170352 () Bool)

(assert (=> b!245902 (=> (not res!205650) (not e!170352))))

(assert (=> b!245902 (= res!205650 (bvslt from!289 nBits!297))))

(declare-fun b!245903 () Bool)

(declare-fun e!170357 () Bool)

(assert (=> b!245903 (= e!170357 e!170346)))

(declare-fun res!205654 () Bool)

(assert (=> b!245903 (=> (not res!205654) (not e!170346))))

(declare-fun lt!383688 () (_ BitVec 64))

(declare-fun lt!383686 () (_ BitVec 64))

(assert (=> b!245903 (= res!205654 (= lt!383688 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!383686)))))

(assert (=> b!245903 (= lt!383688 (bitIndex!0 (size!5883 (buf!6364 (_2!11461 lt!383679))) (currentByte!11760 (_2!11461 lt!383679)) (currentBit!11755 (_2!11461 lt!383679))))))

(assert (=> b!245903 (= lt!383686 (bitIndex!0 (size!5883 (buf!6364 thiss!1005)) (currentByte!11760 thiss!1005) (currentBit!11755 thiss!1005)))))

(declare-fun b!245904 () Bool)

(assert (=> b!245904 (= e!170354 (invariant!0 (currentBit!11755 thiss!1005) (currentByte!11760 thiss!1005) (size!5883 (buf!6364 thiss!1005))))))

(declare-fun b!245905 () Bool)

(declare-fun res!205653 () Bool)

(assert (=> b!245905 (=> (not res!205653) (not e!170352))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!245905 (= res!205653 (validate_offset_bits!1 ((_ sign_extend 32) (size!5883 (buf!6364 thiss!1005))) ((_ sign_extend 32) (currentByte!11760 thiss!1005)) ((_ sign_extend 32) (currentBit!11755 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!245906 () Bool)

(declare-fun res!205656 () Bool)

(assert (=> b!245906 (=> (not res!205656) (not e!170347))))

(assert (=> b!245906 (= res!205656 (invariant!0 (currentBit!11755 thiss!1005) (currentByte!11760 thiss!1005) (size!5883 (buf!6364 (_2!11461 lt!383679)))))))

(declare-fun b!245907 () Bool)

(declare-fun res!205648 () Bool)

(assert (=> b!245907 (=> res!205648 e!170356)))

(declare-fun lt!383689 () tuple2!21082)

(declare-fun withMovedBitIndex!0 (BitStream!10688 (_ BitVec 64)) BitStream!10688)

(assert (=> b!245907 (= res!205648 (not (= (_1!11463 lt!383689) (withMovedBitIndex!0 (_1!11463 lt!383691) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!245908 () Bool)

(assert (=> b!245908 (= e!170352 (not e!170356))))

(declare-fun res!205645 () Bool)

(assert (=> b!245908 (=> res!205645 e!170356)))

(assert (=> b!245908 (= res!205645 (not (= (_1!11462 lt!383684) (_2!11463 lt!383689))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10688 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21080)

(assert (=> b!245908 (= lt!383684 (checkBitsLoopPure!0 (_1!11463 lt!383689) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!383676 () (_ BitVec 64))

(assert (=> b!245908 (validate_offset_bits!1 ((_ sign_extend 32) (size!5883 (buf!6364 (_2!11461 lt!383678)))) ((_ sign_extend 32) (currentByte!11760 (_2!11461 lt!383679))) ((_ sign_extend 32) (currentBit!11755 (_2!11461 lt!383679))) lt!383676)))

(declare-fun lt!383673 () Unit!17878)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10688 array!13422 (_ BitVec 64)) Unit!17878)

(assert (=> b!245908 (= lt!383673 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11461 lt!383679) (buf!6364 (_2!11461 lt!383678)) lt!383676))))

(assert (=> b!245908 (= lt!383680 (checkBitsLoopPure!0 (_1!11463 lt!383691) nBits!297 bit!26 from!289))))

(assert (=> b!245908 (validate_offset_bits!1 ((_ sign_extend 32) (size!5883 (buf!6364 (_2!11461 lt!383678)))) ((_ sign_extend 32) (currentByte!11760 thiss!1005)) ((_ sign_extend 32) (currentBit!11755 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!383677 () Unit!17878)

(assert (=> b!245908 (= lt!383677 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6364 (_2!11461 lt!383678)) (bvsub nBits!297 from!289)))))

(assert (=> b!245908 (= (_2!11462 (readBitPure!0 (_1!11463 lt!383691))) bit!26)))

(declare-fun reader!0 (BitStream!10688 BitStream!10688) tuple2!21082)

(assert (=> b!245908 (= lt!383689 (reader!0 (_2!11461 lt!383679) (_2!11461 lt!383678)))))

(assert (=> b!245908 (= lt!383691 (reader!0 thiss!1005 (_2!11461 lt!383678)))))

(declare-fun e!170351 () Bool)

(assert (=> b!245908 e!170351))

(declare-fun res!205658 () Bool)

(assert (=> b!245908 (=> (not res!205658) (not e!170351))))

(declare-fun lt!383693 () tuple2!21080)

(declare-fun lt!383683 () tuple2!21080)

(assert (=> b!245908 (= res!205658 (= (bitIndex!0 (size!5883 (buf!6364 (_1!11462 lt!383693))) (currentByte!11760 (_1!11462 lt!383693)) (currentBit!11755 (_1!11462 lt!383693))) (bitIndex!0 (size!5883 (buf!6364 (_1!11462 lt!383683))) (currentByte!11760 (_1!11462 lt!383683)) (currentBit!11755 (_1!11462 lt!383683)))))))

(declare-fun lt!383690 () Unit!17878)

(declare-fun lt!383682 () BitStream!10688)

(declare-fun readBitPrefixLemma!0 (BitStream!10688 BitStream!10688) Unit!17878)

(assert (=> b!245908 (= lt!383690 (readBitPrefixLemma!0 lt!383682 (_2!11461 lt!383678)))))

(assert (=> b!245908 (= lt!383683 (readBitPure!0 (BitStream!10689 (buf!6364 (_2!11461 lt!383678)) (currentByte!11760 thiss!1005) (currentBit!11755 thiss!1005))))))

(assert (=> b!245908 (= lt!383693 (readBitPure!0 lt!383682))))

(assert (=> b!245908 (= lt!383682 (BitStream!10689 (buf!6364 (_2!11461 lt!383679)) (currentByte!11760 thiss!1005) (currentBit!11755 thiss!1005)))))

(assert (=> b!245908 e!170347))

(declare-fun res!205646 () Bool)

(assert (=> b!245908 (=> (not res!205646) (not e!170347))))

(assert (=> b!245908 (= res!205646 (isPrefixOf!0 thiss!1005 (_2!11461 lt!383678)))))

(declare-fun lt!383674 () Unit!17878)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10688 BitStream!10688 BitStream!10688) Unit!17878)

(assert (=> b!245908 (= lt!383674 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11461 lt!383679) (_2!11461 lt!383678)))))

(assert (=> b!245908 e!170348))

(declare-fun res!205655 () Bool)

(assert (=> b!245908 (=> (not res!205655) (not e!170348))))

(assert (=> b!245908 (= res!205655 (= (size!5883 (buf!6364 (_2!11461 lt!383679))) (size!5883 (buf!6364 (_2!11461 lt!383678)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10688 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21078)

(assert (=> b!245908 (= lt!383678 (appendNBitsLoop!0 (_2!11461 lt!383679) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245908 (validate_offset_bits!1 ((_ sign_extend 32) (size!5883 (buf!6364 (_2!11461 lt!383679)))) ((_ sign_extend 32) (currentByte!11760 (_2!11461 lt!383679))) ((_ sign_extend 32) (currentBit!11755 (_2!11461 lt!383679))) lt!383676)))

(assert (=> b!245908 (= lt!383676 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!383687 () Unit!17878)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10688 BitStream!10688 (_ BitVec 64) (_ BitVec 64)) Unit!17878)

(assert (=> b!245908 (= lt!383687 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11461 lt!383679) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!245908 e!170357))

(declare-fun res!205649 () Bool)

(assert (=> b!245908 (=> (not res!205649) (not e!170357))))

(assert (=> b!245908 (= res!205649 (= (size!5883 (buf!6364 thiss!1005)) (size!5883 (buf!6364 (_2!11461 lt!383679)))))))

(declare-fun appendBit!0 (BitStream!10688 Bool) tuple2!21078)

(assert (=> b!245908 (= lt!383679 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!245909 () Bool)

(declare-fun e!170355 () Bool)

(declare-fun array_inv!5624 (array!13422) Bool)

(assert (=> b!245909 (= e!170355 (array_inv!5624 (buf!6364 thiss!1005)))))

(declare-fun b!245910 () Bool)

(assert (=> b!245910 (= e!170351 (= (_2!11462 lt!383693) (_2!11462 lt!383683)))))

(declare-fun b!245911 () Bool)

(assert (=> b!245911 (= e!170353 (= (bitIndex!0 (size!5883 (buf!6364 (_1!11462 lt!383685))) (currentByte!11760 (_1!11462 lt!383685)) (currentBit!11755 (_1!11462 lt!383685))) lt!383688))))

(declare-fun b!245912 () Bool)

(declare-fun res!205657 () Bool)

(assert (=> b!245912 (=> (not res!205657) (not e!170349))))

(assert (=> b!245912 (= res!205657 (isPrefixOf!0 (_2!11461 lt!383679) (_2!11461 lt!383678)))))

(declare-fun b!245899 () Bool)

(declare-fun lt!383694 () tuple2!21080)

(declare-fun lt!383692 () tuple2!21082)

(assert (=> b!245899 (= e!170349 (not (or (not (_2!11462 lt!383694)) (not (= (_1!11462 lt!383694) (_2!11463 lt!383692))))))))

(assert (=> b!245899 (= lt!383694 (checkBitsLoopPure!0 (_1!11463 lt!383692) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!245899 (validate_offset_bits!1 ((_ sign_extend 32) (size!5883 (buf!6364 (_2!11461 lt!383678)))) ((_ sign_extend 32) (currentByte!11760 (_2!11461 lt!383679))) ((_ sign_extend 32) (currentBit!11755 (_2!11461 lt!383679))) lt!383681)))

(declare-fun lt!383675 () Unit!17878)

(assert (=> b!245899 (= lt!383675 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11461 lt!383679) (buf!6364 (_2!11461 lt!383678)) lt!383681))))

(assert (=> b!245899 (= lt!383692 (reader!0 (_2!11461 lt!383679) (_2!11461 lt!383678)))))

(declare-fun res!205652 () Bool)

(assert (=> start!53094 (=> (not res!205652) (not e!170352))))

(assert (=> start!53094 (= res!205652 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53094 e!170352))

(assert (=> start!53094 true))

(declare-fun inv!12 (BitStream!10688) Bool)

(assert (=> start!53094 (and (inv!12 thiss!1005) e!170355)))

(assert (= (and start!53094 res!205652) b!245905))

(assert (= (and b!245905 res!205653) b!245902))

(assert (= (and b!245902 res!205650) b!245908))

(assert (= (and b!245908 res!205649) b!245903))

(assert (= (and b!245903 res!205654) b!245900))

(assert (= (and b!245900 res!205659) b!245897))

(assert (= (and b!245897 res!205644) b!245911))

(assert (= (and b!245908 res!205655) b!245901))

(assert (= (and b!245901 res!205647) b!245912))

(assert (= (and b!245912 res!205657) b!245899))

(assert (= (and b!245908 res!205646) b!245906))

(assert (= (and b!245906 res!205656) b!245898))

(assert (= (and b!245908 res!205658) b!245910))

(assert (= (and b!245908 (not res!205645)) b!245907))

(assert (= (and b!245907 (not res!205648)) b!245896))

(assert (= (and b!245896 (not res!205651)) b!245904))

(assert (= start!53094 b!245909))

(declare-fun m!370885 () Bool)

(assert (=> b!245907 m!370885))

(declare-fun m!370887 () Bool)

(assert (=> b!245900 m!370887))

(declare-fun m!370889 () Bool)

(assert (=> b!245905 m!370889))

(declare-fun m!370891 () Bool)

(assert (=> b!245909 m!370891))

(declare-fun m!370893 () Bool)

(assert (=> b!245899 m!370893))

(declare-fun m!370895 () Bool)

(assert (=> b!245899 m!370895))

(declare-fun m!370897 () Bool)

(assert (=> b!245899 m!370897))

(declare-fun m!370899 () Bool)

(assert (=> b!245899 m!370899))

(declare-fun m!370901 () Bool)

(assert (=> start!53094 m!370901))

(declare-fun m!370903 () Bool)

(assert (=> b!245903 m!370903))

(declare-fun m!370905 () Bool)

(assert (=> b!245903 m!370905))

(declare-fun m!370907 () Bool)

(assert (=> b!245912 m!370907))

(declare-fun m!370909 () Bool)

(assert (=> b!245908 m!370909))

(declare-fun m!370911 () Bool)

(assert (=> b!245908 m!370911))

(declare-fun m!370913 () Bool)

(assert (=> b!245908 m!370913))

(declare-fun m!370915 () Bool)

(assert (=> b!245908 m!370915))

(declare-fun m!370917 () Bool)

(assert (=> b!245908 m!370917))

(declare-fun m!370919 () Bool)

(assert (=> b!245908 m!370919))

(assert (=> b!245908 m!370899))

(declare-fun m!370921 () Bool)

(assert (=> b!245908 m!370921))

(declare-fun m!370923 () Bool)

(assert (=> b!245908 m!370923))

(declare-fun m!370925 () Bool)

(assert (=> b!245908 m!370925))

(declare-fun m!370927 () Bool)

(assert (=> b!245908 m!370927))

(declare-fun m!370929 () Bool)

(assert (=> b!245908 m!370929))

(declare-fun m!370931 () Bool)

(assert (=> b!245908 m!370931))

(declare-fun m!370933 () Bool)

(assert (=> b!245908 m!370933))

(declare-fun m!370935 () Bool)

(assert (=> b!245908 m!370935))

(declare-fun m!370937 () Bool)

(assert (=> b!245908 m!370937))

(declare-fun m!370939 () Bool)

(assert (=> b!245908 m!370939))

(declare-fun m!370941 () Bool)

(assert (=> b!245908 m!370941))

(declare-fun m!370943 () Bool)

(assert (=> b!245908 m!370943))

(declare-fun m!370945 () Bool)

(assert (=> b!245908 m!370945))

(declare-fun m!370947 () Bool)

(assert (=> b!245901 m!370947))

(assert (=> b!245901 m!370903))

(declare-fun m!370949 () Bool)

(assert (=> b!245904 m!370949))

(declare-fun m!370951 () Bool)

(assert (=> b!245906 m!370951))

(declare-fun m!370953 () Bool)

(assert (=> b!245911 m!370953))

(declare-fun m!370955 () Bool)

(assert (=> b!245897 m!370955))

(assert (=> b!245897 m!370955))

(declare-fun m!370957 () Bool)

(assert (=> b!245897 m!370957))

(declare-fun m!370959 () Bool)

(assert (=> b!245898 m!370959))

(push 1)

(assert (not b!245908))

(assert (not start!53094))

(assert (not b!245899))

(assert (not b!245898))

(assert (not b!245911))

(assert (not b!245907))

(assert (not b!245900))

(assert (not b!245906))

(assert (not b!245901))

(assert (not b!245903))

(assert (not b!245904))

(assert (not b!245905))

(assert (not b!245912))

(assert (not b!245909))

(assert (not b!245897))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

