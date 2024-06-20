; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26346 () Bool)

(assert start!26346)

(declare-fun b!134671 () Bool)

(declare-fun res!111937 () Bool)

(declare-fun e!89354 () Bool)

(assert (=> b!134671 (=> (not res!111937) (not e!89354))))

(declare-datatypes ((array!6146 0))(
  ( (array!6147 (arr!3446 (Array (_ BitVec 32) (_ BitVec 8))) (size!2781 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4826 0))(
  ( (BitStream!4827 (buf!3174 array!6146) (currentByte!5971 (_ BitVec 32)) (currentBit!5966 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8400 0))(
  ( (Unit!8401) )
))
(declare-datatypes ((tuple2!11644 0))(
  ( (tuple2!11645 (_1!6138 Unit!8400) (_2!6138 BitStream!4826)) )
))
(declare-fun lt!208898 () tuple2!11644)

(declare-fun thiss!1634 () BitStream!4826)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134671 (= res!111937 (= (bitIndex!0 (size!2781 (buf!3174 (_2!6138 lt!208898))) (currentByte!5971 (_2!6138 lt!208898)) (currentBit!5966 (_2!6138 lt!208898))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2781 (buf!3174 thiss!1634)) (currentByte!5971 thiss!1634) (currentBit!5966 thiss!1634)))))))

(declare-fun b!134672 () Bool)

(declare-fun res!111938 () Bool)

(declare-fun e!89360 () Bool)

(assert (=> b!134672 (=> (not res!111938) (not e!89360))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134672 (= res!111938 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2781 (buf!3174 thiss!1634))) ((_ sign_extend 32) (currentByte!5971 thiss!1634)) ((_ sign_extend 32) (currentBit!5966 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134673 () Bool)

(declare-fun res!111939 () Bool)

(assert (=> b!134673 (=> (not res!111939) (not e!89354))))

(declare-fun isPrefixOf!0 (BitStream!4826 BitStream!4826) Bool)

(assert (=> b!134673 (= res!111939 (isPrefixOf!0 thiss!1634 (_2!6138 lt!208898)))))

(declare-fun b!134674 () Bool)

(declare-fun arr!237 () array!6146)

(declare-datatypes ((tuple2!11646 0))(
  ( (tuple2!11647 (_1!6139 BitStream!4826) (_2!6139 BitStream!4826)) )
))
(declare-fun lt!208908 () tuple2!11646)

(declare-datatypes ((tuple2!11648 0))(
  ( (tuple2!11649 (_1!6140 BitStream!4826) (_2!6140 (_ BitVec 8))) )
))
(declare-fun lt!208897 () tuple2!11648)

(assert (=> b!134674 (= e!89354 (and (= (_2!6140 lt!208897) (select (arr!3446 arr!237) from!447)) (= (_1!6140 lt!208897) (_2!6139 lt!208908))))))

(declare-fun readBytePure!0 (BitStream!4826) tuple2!11648)

(assert (=> b!134674 (= lt!208897 (readBytePure!0 (_1!6139 lt!208908)))))

(declare-fun reader!0 (BitStream!4826 BitStream!4826) tuple2!11646)

(assert (=> b!134674 (= lt!208908 (reader!0 thiss!1634 (_2!6138 lt!208898)))))

(declare-fun b!134675 () Bool)

(declare-fun e!89358 () Bool)

(declare-fun lt!208896 () tuple2!11648)

(declare-fun lt!208899 () tuple2!11648)

(assert (=> b!134675 (= e!89358 (= (_2!6140 lt!208896) (_2!6140 lt!208899)))))

(declare-fun res!111929 () Bool)

(assert (=> start!26346 (=> (not res!111929) (not e!89360))))

(assert (=> start!26346 (= res!111929 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2781 arr!237))))))

(assert (=> start!26346 e!89360))

(assert (=> start!26346 true))

(declare-fun array_inv!2570 (array!6146) Bool)

(assert (=> start!26346 (array_inv!2570 arr!237)))

(declare-fun e!89356 () Bool)

(declare-fun inv!12 (BitStream!4826) Bool)

(assert (=> start!26346 (and (inv!12 thiss!1634) e!89356)))

(declare-fun b!134676 () Bool)

(declare-fun e!89359 () Bool)

(declare-fun e!89352 () Bool)

(assert (=> b!134676 (= e!89359 (not e!89352))))

(declare-fun res!111930 () Bool)

(assert (=> b!134676 (=> res!111930 e!89352)))

(declare-datatypes ((tuple2!11650 0))(
  ( (tuple2!11651 (_1!6141 BitStream!4826) (_2!6141 array!6146)) )
))
(declare-fun lt!208900 () tuple2!11650)

(declare-fun lt!208888 () tuple2!11646)

(assert (=> b!134676 (= res!111930 (or (not (= (size!2781 (_2!6141 lt!208900)) (size!2781 arr!237))) (not (= (_1!6141 lt!208900) (_2!6139 lt!208888)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4826 array!6146 (_ BitVec 32) (_ BitVec 32)) tuple2!11650)

(assert (=> b!134676 (= lt!208900 (readByteArrayLoopPure!0 (_1!6139 lt!208888) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208909 () tuple2!11644)

(declare-fun lt!208889 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134676 (validate_offset_bits!1 ((_ sign_extend 32) (size!2781 (buf!3174 (_2!6138 lt!208909)))) ((_ sign_extend 32) (currentByte!5971 (_2!6138 lt!208898))) ((_ sign_extend 32) (currentBit!5966 (_2!6138 lt!208898))) lt!208889)))

(declare-fun lt!208905 () Unit!8400)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4826 array!6146 (_ BitVec 64)) Unit!8400)

(assert (=> b!134676 (= lt!208905 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6138 lt!208898) (buf!3174 (_2!6138 lt!208909)) lt!208889))))

(assert (=> b!134676 (= lt!208888 (reader!0 (_2!6138 lt!208898) (_2!6138 lt!208909)))))

(declare-fun b!134677 () Bool)

(assert (=> b!134677 (= e!89360 (not true))))

(declare-fun lt!208895 () tuple2!11650)

(declare-fun lt!208891 () tuple2!11650)

(declare-fun arrayRangesEq!184 (array!6146 array!6146 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134677 (arrayRangesEq!184 (_2!6141 lt!208895) (_2!6141 lt!208891) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!208903 () Unit!8400)

(declare-fun lt!208911 () tuple2!11646)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4826 array!6146 (_ BitVec 32) (_ BitVec 32)) Unit!8400)

(assert (=> b!134677 (= lt!208903 (readByteArrayLoopArrayPrefixLemma!0 (_1!6139 lt!208911) arr!237 from!447 to!404))))

(declare-fun lt!208910 () array!6146)

(declare-fun withMovedByteIndex!0 (BitStream!4826 (_ BitVec 32)) BitStream!4826)

(assert (=> b!134677 (= lt!208891 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6139 lt!208911) #b00000000000000000000000000000001) lt!208910 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208892 () tuple2!11646)

(declare-fun lt!208907 () tuple2!11650)

(assert (=> b!134677 (= lt!208907 (readByteArrayLoopPure!0 (_1!6139 lt!208892) lt!208910 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208901 () tuple2!11648)

(assert (=> b!134677 (= lt!208910 (array!6147 (store (arr!3446 arr!237) from!447 (_2!6140 lt!208901)) (size!2781 arr!237)))))

(declare-fun lt!208906 () (_ BitVec 32))

(assert (=> b!134677 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2781 (buf!3174 (_2!6138 lt!208909)))) ((_ sign_extend 32) (currentByte!5971 (_2!6138 lt!208898))) ((_ sign_extend 32) (currentBit!5966 (_2!6138 lt!208898))) lt!208906)))

(declare-fun lt!208902 () Unit!8400)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4826 array!6146 (_ BitVec 32)) Unit!8400)

(assert (=> b!134677 (= lt!208902 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6138 lt!208898) (buf!3174 (_2!6138 lt!208909)) lt!208906))))

(assert (=> b!134677 (= (_1!6141 lt!208895) (_2!6139 lt!208911))))

(assert (=> b!134677 (= lt!208895 (readByteArrayLoopPure!0 (_1!6139 lt!208911) arr!237 from!447 to!404))))

(assert (=> b!134677 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2781 (buf!3174 (_2!6138 lt!208909)))) ((_ sign_extend 32) (currentByte!5971 thiss!1634)) ((_ sign_extend 32) (currentBit!5966 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!208894 () Unit!8400)

(assert (=> b!134677 (= lt!208894 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3174 (_2!6138 lt!208909)) (bvsub to!404 from!447)))))

(assert (=> b!134677 (= (_2!6140 lt!208901) (select (arr!3446 arr!237) from!447))))

(assert (=> b!134677 (= lt!208901 (readBytePure!0 (_1!6139 lt!208911)))))

(assert (=> b!134677 (= lt!208892 (reader!0 (_2!6138 lt!208898) (_2!6138 lt!208909)))))

(assert (=> b!134677 (= lt!208911 (reader!0 thiss!1634 (_2!6138 lt!208909)))))

(assert (=> b!134677 e!89358))

(declare-fun res!111936 () Bool)

(assert (=> b!134677 (=> (not res!111936) (not e!89358))))

(assert (=> b!134677 (= res!111936 (= (bitIndex!0 (size!2781 (buf!3174 (_1!6140 lt!208896))) (currentByte!5971 (_1!6140 lt!208896)) (currentBit!5966 (_1!6140 lt!208896))) (bitIndex!0 (size!2781 (buf!3174 (_1!6140 lt!208899))) (currentByte!5971 (_1!6140 lt!208899)) (currentBit!5966 (_1!6140 lt!208899)))))))

(declare-fun lt!208893 () Unit!8400)

(declare-fun lt!208904 () BitStream!4826)

(declare-fun readBytePrefixLemma!0 (BitStream!4826 BitStream!4826) Unit!8400)

(assert (=> b!134677 (= lt!208893 (readBytePrefixLemma!0 lt!208904 (_2!6138 lt!208909)))))

(assert (=> b!134677 (= lt!208899 (readBytePure!0 (BitStream!4827 (buf!3174 (_2!6138 lt!208909)) (currentByte!5971 thiss!1634) (currentBit!5966 thiss!1634))))))

(assert (=> b!134677 (= lt!208896 (readBytePure!0 lt!208904))))

(assert (=> b!134677 (= lt!208904 (BitStream!4827 (buf!3174 (_2!6138 lt!208898)) (currentByte!5971 thiss!1634) (currentBit!5966 thiss!1634)))))

(declare-fun e!89361 () Bool)

(assert (=> b!134677 e!89361))

(declare-fun res!111935 () Bool)

(assert (=> b!134677 (=> (not res!111935) (not e!89361))))

(assert (=> b!134677 (= res!111935 (isPrefixOf!0 thiss!1634 (_2!6138 lt!208909)))))

(declare-fun lt!208912 () Unit!8400)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4826 BitStream!4826 BitStream!4826) Unit!8400)

(assert (=> b!134677 (= lt!208912 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6138 lt!208898) (_2!6138 lt!208909)))))

(declare-fun e!89353 () Bool)

(assert (=> b!134677 e!89353))

(declare-fun res!111928 () Bool)

(assert (=> b!134677 (=> (not res!111928) (not e!89353))))

(assert (=> b!134677 (= res!111928 (= (size!2781 (buf!3174 (_2!6138 lt!208898))) (size!2781 (buf!3174 (_2!6138 lt!208909)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4826 array!6146 (_ BitVec 32) (_ BitVec 32)) tuple2!11644)

(assert (=> b!134677 (= lt!208909 (appendByteArrayLoop!0 (_2!6138 lt!208898) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134677 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2781 (buf!3174 (_2!6138 lt!208898)))) ((_ sign_extend 32) (currentByte!5971 (_2!6138 lt!208898))) ((_ sign_extend 32) (currentBit!5966 (_2!6138 lt!208898))) lt!208906)))

(assert (=> b!134677 (= lt!208906 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!208890 () Unit!8400)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4826 BitStream!4826 (_ BitVec 64) (_ BitVec 32)) Unit!8400)

(assert (=> b!134677 (= lt!208890 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6138 lt!208898) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134677 e!89354))

(declare-fun res!111933 () Bool)

(assert (=> b!134677 (=> (not res!111933) (not e!89354))))

(assert (=> b!134677 (= res!111933 (= (size!2781 (buf!3174 thiss!1634)) (size!2781 (buf!3174 (_2!6138 lt!208898)))))))

(declare-fun appendByte!0 (BitStream!4826 (_ BitVec 8)) tuple2!11644)

(assert (=> b!134677 (= lt!208898 (appendByte!0 thiss!1634 (select (arr!3446 arr!237) from!447)))))

(declare-fun b!134678 () Bool)

(assert (=> b!134678 (= e!89353 e!89359)))

(declare-fun res!111934 () Bool)

(assert (=> b!134678 (=> (not res!111934) (not e!89359))))

(assert (=> b!134678 (= res!111934 (= (bitIndex!0 (size!2781 (buf!3174 (_2!6138 lt!208909))) (currentByte!5971 (_2!6138 lt!208909)) (currentBit!5966 (_2!6138 lt!208909))) (bvadd (bitIndex!0 (size!2781 (buf!3174 (_2!6138 lt!208898))) (currentByte!5971 (_2!6138 lt!208898)) (currentBit!5966 (_2!6138 lt!208898))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!208889))))))

(assert (=> b!134678 (= lt!208889 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134679 () Bool)

(declare-fun res!111931 () Bool)

(assert (=> b!134679 (=> (not res!111931) (not e!89360))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134679 (= res!111931 (invariant!0 (currentBit!5966 thiss!1634) (currentByte!5971 thiss!1634) (size!2781 (buf!3174 thiss!1634))))))

(declare-fun b!134680 () Bool)

(assert (=> b!134680 (= e!89356 (array_inv!2570 (buf!3174 thiss!1634)))))

(declare-fun b!134681 () Bool)

(assert (=> b!134681 (= e!89361 (invariant!0 (currentBit!5966 thiss!1634) (currentByte!5971 thiss!1634) (size!2781 (buf!3174 (_2!6138 lt!208898)))))))

(declare-fun b!134682 () Bool)

(assert (=> b!134682 (= e!89352 (not (arrayRangesEq!184 arr!237 (_2!6141 lt!208900) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134683 () Bool)

(declare-fun res!111927 () Bool)

(assert (=> b!134683 (=> (not res!111927) (not e!89360))))

(assert (=> b!134683 (= res!111927 (bvslt from!447 to!404))))

(declare-fun b!134684 () Bool)

(declare-fun res!111932 () Bool)

(assert (=> b!134684 (=> (not res!111932) (not e!89359))))

(assert (=> b!134684 (= res!111932 (isPrefixOf!0 (_2!6138 lt!208898) (_2!6138 lt!208909)))))

(assert (= (and start!26346 res!111929) b!134672))

(assert (= (and b!134672 res!111938) b!134683))

(assert (= (and b!134683 res!111927) b!134679))

(assert (= (and b!134679 res!111931) b!134677))

(assert (= (and b!134677 res!111933) b!134671))

(assert (= (and b!134671 res!111937) b!134673))

(assert (= (and b!134673 res!111939) b!134674))

(assert (= (and b!134677 res!111928) b!134678))

(assert (= (and b!134678 res!111934) b!134684))

(assert (= (and b!134684 res!111932) b!134676))

(assert (= (and b!134676 (not res!111930)) b!134682))

(assert (= (and b!134677 res!111935) b!134681))

(assert (= (and b!134677 res!111936) b!134675))

(assert (= start!26346 b!134680))

(declare-fun m!205055 () Bool)

(assert (=> b!134682 m!205055))

(declare-fun m!205057 () Bool)

(assert (=> b!134681 m!205057))

(declare-fun m!205059 () Bool)

(assert (=> b!134678 m!205059))

(declare-fun m!205061 () Bool)

(assert (=> b!134678 m!205061))

(declare-fun m!205063 () Bool)

(assert (=> b!134673 m!205063))

(declare-fun m!205065 () Bool)

(assert (=> b!134672 m!205065))

(declare-fun m!205067 () Bool)

(assert (=> b!134676 m!205067))

(declare-fun m!205069 () Bool)

(assert (=> b!134676 m!205069))

(declare-fun m!205071 () Bool)

(assert (=> b!134676 m!205071))

(declare-fun m!205073 () Bool)

(assert (=> b!134676 m!205073))

(assert (=> b!134671 m!205061))

(declare-fun m!205075 () Bool)

(assert (=> b!134671 m!205075))

(declare-fun m!205077 () Bool)

(assert (=> b!134674 m!205077))

(declare-fun m!205079 () Bool)

(assert (=> b!134674 m!205079))

(declare-fun m!205081 () Bool)

(assert (=> b!134674 m!205081))

(declare-fun m!205083 () Bool)

(assert (=> start!26346 m!205083))

(declare-fun m!205085 () Bool)

(assert (=> start!26346 m!205085))

(declare-fun m!205087 () Bool)

(assert (=> b!134684 m!205087))

(declare-fun m!205089 () Bool)

(assert (=> b!134680 m!205089))

(declare-fun m!205091 () Bool)

(assert (=> b!134679 m!205091))

(declare-fun m!205093 () Bool)

(assert (=> b!134677 m!205093))

(declare-fun m!205095 () Bool)

(assert (=> b!134677 m!205095))

(assert (=> b!134677 m!205093))

(declare-fun m!205097 () Bool)

(assert (=> b!134677 m!205097))

(declare-fun m!205099 () Bool)

(assert (=> b!134677 m!205099))

(declare-fun m!205101 () Bool)

(assert (=> b!134677 m!205101))

(declare-fun m!205103 () Bool)

(assert (=> b!134677 m!205103))

(declare-fun m!205105 () Bool)

(assert (=> b!134677 m!205105))

(declare-fun m!205107 () Bool)

(assert (=> b!134677 m!205107))

(declare-fun m!205109 () Bool)

(assert (=> b!134677 m!205109))

(assert (=> b!134677 m!205077))

(declare-fun m!205111 () Bool)

(assert (=> b!134677 m!205111))

(declare-fun m!205113 () Bool)

(assert (=> b!134677 m!205113))

(declare-fun m!205115 () Bool)

(assert (=> b!134677 m!205115))

(declare-fun m!205117 () Bool)

(assert (=> b!134677 m!205117))

(declare-fun m!205119 () Bool)

(assert (=> b!134677 m!205119))

(declare-fun m!205121 () Bool)

(assert (=> b!134677 m!205121))

(declare-fun m!205123 () Bool)

(assert (=> b!134677 m!205123))

(declare-fun m!205125 () Bool)

(assert (=> b!134677 m!205125))

(assert (=> b!134677 m!205073))

(declare-fun m!205127 () Bool)

(assert (=> b!134677 m!205127))

(declare-fun m!205129 () Bool)

(assert (=> b!134677 m!205129))

(declare-fun m!205131 () Bool)

(assert (=> b!134677 m!205131))

(declare-fun m!205133 () Bool)

(assert (=> b!134677 m!205133))

(declare-fun m!205135 () Bool)

(assert (=> b!134677 m!205135))

(assert (=> b!134677 m!205077))

(declare-fun m!205137 () Bool)

(assert (=> b!134677 m!205137))

(declare-fun m!205139 () Bool)

(assert (=> b!134677 m!205139))

(push 1)

(assert (not b!134677))

(assert (not b!134682))

(assert (not b!134671))

(assert (not b!134680))

(assert (not b!134676))

(assert (not b!134674))

(assert (not b!134673))

(assert (not b!134684))

(assert (not b!134681))

(assert (not b!134672))

(assert (not b!134679))

(assert (not start!26346))

(assert (not b!134678))

(check-sat)

(pop 1)

