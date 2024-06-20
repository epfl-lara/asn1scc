; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25950 () Bool)

(assert start!25950)

(declare-fun res!110305 () Bool)

(declare-fun e!88078 () Bool)

(assert (=> start!25950 (=> (not res!110305) (not e!88078))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6120 0))(
  ( (array!6121 (arr!3406 (Array (_ BitVec 32) (_ BitVec 8))) (size!2771 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6120)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25950 (= res!110305 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2771 arr!237))))))

(assert (=> start!25950 e!88078))

(assert (=> start!25950 true))

(declare-fun array_inv!2560 (array!6120) Bool)

(assert (=> start!25950 (array_inv!2560 arr!237)))

(declare-datatypes ((BitStream!4806 0))(
  ( (BitStream!4807 (buf!3144 array!6120) (currentByte!5929 (_ BitVec 32)) (currentBit!5924 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4806)

(declare-fun e!88073 () Bool)

(declare-fun inv!12 (BitStream!4806) Bool)

(assert (=> start!25950 (and (inv!12 thiss!1634) e!88073)))

(declare-fun b!132811 () Bool)

(declare-datatypes ((tuple2!11544 0))(
  ( (tuple2!11545 (_1!6078 BitStream!4806) (_2!6078 array!6120)) )
))
(declare-fun lt!205097 () tuple2!11544)

(declare-fun lt!205079 () tuple2!11544)

(assert (=> b!132811 (= e!88078 (not (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsle (size!2771 (_2!6078 lt!205097)) (size!2771 (_2!6078 lt!205079))))))))

(declare-fun lt!205084 () tuple2!11544)

(declare-fun arrayRangesEq!174 (array!6120 array!6120 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132811 (arrayRangesEq!174 (_2!6078 lt!205097) (_2!6078 lt!205084) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((Unit!8174 0))(
  ( (Unit!8175) )
))
(declare-fun lt!205092 () Unit!8174)

(declare-datatypes ((tuple2!11546 0))(
  ( (tuple2!11547 (_1!6079 BitStream!4806) (_2!6079 BitStream!4806)) )
))
(declare-fun lt!205083 () tuple2!11546)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4806 array!6120 (_ BitVec 32) (_ BitVec 32)) Unit!8174)

(assert (=> b!132811 (= lt!205092 (readByteArrayLoopArrayPrefixLemma!0 (_1!6079 lt!205083) arr!237 from!447 to!404))))

(declare-fun lt!205086 () array!6120)

(declare-fun readByteArrayLoopPure!0 (BitStream!4806 array!6120 (_ BitVec 32) (_ BitVec 32)) tuple2!11544)

(declare-fun withMovedByteIndex!0 (BitStream!4806 (_ BitVec 32)) BitStream!4806)

(assert (=> b!132811 (= lt!205084 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) lt!205086 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205089 () tuple2!11546)

(assert (=> b!132811 (= lt!205079 (readByteArrayLoopPure!0 (_1!6079 lt!205089) lt!205086 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11548 0))(
  ( (tuple2!11549 (_1!6080 BitStream!4806) (_2!6080 (_ BitVec 8))) )
))
(declare-fun lt!205077 () tuple2!11548)

(assert (=> b!132811 (= lt!205086 (array!6121 (store (arr!3406 arr!237) from!447 (_2!6080 lt!205077)) (size!2771 arr!237)))))

(declare-datatypes ((tuple2!11550 0))(
  ( (tuple2!11551 (_1!6081 Unit!8174) (_2!6081 BitStream!4806)) )
))
(declare-fun lt!205096 () tuple2!11550)

(declare-fun lt!205095 () tuple2!11550)

(declare-fun lt!205088 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132811 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205088)))

(declare-fun lt!205080 () Unit!8174)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4806 array!6120 (_ BitVec 32)) Unit!8174)

(assert (=> b!132811 (= lt!205080 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205096)) lt!205088))))

(assert (=> b!132811 (= (_1!6078 lt!205097) (_2!6079 lt!205083))))

(assert (=> b!132811 (= lt!205097 (readByteArrayLoopPure!0 (_1!6079 lt!205083) arr!237 from!447 to!404))))

(assert (=> b!132811 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!205082 () Unit!8174)

(assert (=> b!132811 (= lt!205082 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3144 (_2!6081 lt!205096)) (bvsub to!404 from!447)))))

(assert (=> b!132811 (= (_2!6080 lt!205077) (select (arr!3406 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4806) tuple2!11548)

(assert (=> b!132811 (= lt!205077 (readBytePure!0 (_1!6079 lt!205083)))))

(declare-fun reader!0 (BitStream!4806 BitStream!4806) tuple2!11546)

(assert (=> b!132811 (= lt!205089 (reader!0 (_2!6081 lt!205095) (_2!6081 lt!205096)))))

(assert (=> b!132811 (= lt!205083 (reader!0 thiss!1634 (_2!6081 lt!205096)))))

(declare-fun e!88070 () Bool)

(assert (=> b!132811 e!88070))

(declare-fun res!110308 () Bool)

(assert (=> b!132811 (=> (not res!110308) (not e!88070))))

(declare-fun lt!205098 () tuple2!11548)

(declare-fun lt!205093 () tuple2!11548)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132811 (= res!110308 (= (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205098))) (currentByte!5929 (_1!6080 lt!205098)) (currentBit!5924 (_1!6080 lt!205098))) (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205093))) (currentByte!5929 (_1!6080 lt!205093)) (currentBit!5924 (_1!6080 lt!205093)))))))

(declare-fun lt!205081 () Unit!8174)

(declare-fun lt!205078 () BitStream!4806)

(declare-fun readBytePrefixLemma!0 (BitStream!4806 BitStream!4806) Unit!8174)

(assert (=> b!132811 (= lt!205081 (readBytePrefixLemma!0 lt!205078 (_2!6081 lt!205096)))))

(assert (=> b!132811 (= lt!205093 (readBytePure!0 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (=> b!132811 (= lt!205098 (readBytePure!0 lt!205078))))

(assert (=> b!132811 (= lt!205078 (BitStream!4807 (buf!3144 (_2!6081 lt!205095)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(declare-fun e!88077 () Bool)

(assert (=> b!132811 e!88077))

(declare-fun res!110310 () Bool)

(assert (=> b!132811 (=> (not res!110310) (not e!88077))))

(declare-fun isPrefixOf!0 (BitStream!4806 BitStream!4806) Bool)

(assert (=> b!132811 (= res!110310 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205096)))))

(declare-fun lt!205091 () Unit!8174)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4806 BitStream!4806 BitStream!4806) Unit!8174)

(assert (=> b!132811 (= lt!205091 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6081 lt!205095) (_2!6081 lt!205096)))))

(declare-fun e!88076 () Bool)

(assert (=> b!132811 e!88076))

(declare-fun res!110309 () Bool)

(assert (=> b!132811 (=> (not res!110309) (not e!88076))))

(assert (=> b!132811 (= res!110309 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4806 array!6120 (_ BitVec 32) (_ BitVec 32)) tuple2!11550)

(assert (=> b!132811 (= lt!205096 (appendByteArrayLoop!0 (_2!6081 lt!205095) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132811 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205088)))

(assert (=> b!132811 (= lt!205088 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!205076 () Unit!8174)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4806 BitStream!4806 (_ BitVec 64) (_ BitVec 32)) Unit!8174)

(assert (=> b!132811 (= lt!205076 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6081 lt!205095) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!88075 () Bool)

(assert (=> b!132811 e!88075))

(declare-fun res!110315 () Bool)

(assert (=> b!132811 (=> (not res!110315) (not e!88075))))

(assert (=> b!132811 (= res!110315 (= (size!2771 (buf!3144 thiss!1634)) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(declare-fun appendByte!0 (BitStream!4806 (_ BitVec 8)) tuple2!11550)

(assert (=> b!132811 (= lt!205095 (appendByte!0 thiss!1634 (select (arr!3406 arr!237) from!447)))))

(declare-fun b!132812 () Bool)

(assert (=> b!132812 (= e!88073 (array_inv!2560 (buf!3144 thiss!1634)))))

(declare-fun b!132813 () Bool)

(declare-fun e!88079 () Bool)

(declare-fun e!88072 () Bool)

(assert (=> b!132813 (= e!88079 (not e!88072))))

(declare-fun res!110313 () Bool)

(assert (=> b!132813 (=> res!110313 e!88072)))

(declare-fun lt!205100 () tuple2!11546)

(declare-fun lt!205094 () tuple2!11544)

(assert (=> b!132813 (= res!110313 (or (not (= (size!2771 (_2!6078 lt!205094)) (size!2771 arr!237))) (not (= (_1!6078 lt!205094) (_2!6079 lt!205100)))))))

(assert (=> b!132813 (= lt!205094 (readByteArrayLoopPure!0 (_1!6079 lt!205100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205090 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132813 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205090)))

(declare-fun lt!205099 () Unit!8174)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4806 array!6120 (_ BitVec 64)) Unit!8174)

(assert (=> b!132813 (= lt!205099 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205096)) lt!205090))))

(assert (=> b!132813 (= lt!205100 (reader!0 (_2!6081 lt!205095) (_2!6081 lt!205096)))))

(declare-fun b!132814 () Bool)

(declare-fun res!110316 () Bool)

(assert (=> b!132814 (=> (not res!110316) (not e!88075))))

(assert (=> b!132814 (= res!110316 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))))

(declare-fun b!132815 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132815 (= e!88077 (invariant!0 (currentBit!5924 thiss!1634) (currentByte!5929 thiss!1634) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(declare-fun b!132816 () Bool)

(declare-fun res!110314 () Bool)

(assert (=> b!132816 (=> (not res!110314) (not e!88079))))

(assert (=> b!132816 (= res!110314 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205096)))))

(declare-fun b!132817 () Bool)

(declare-fun lt!205085 () tuple2!11546)

(declare-fun lt!205087 () tuple2!11548)

(assert (=> b!132817 (= e!88075 (and (= (_2!6080 lt!205087) (select (arr!3406 arr!237) from!447)) (= (_1!6080 lt!205087) (_2!6079 lt!205085))))))

(assert (=> b!132817 (= lt!205087 (readBytePure!0 (_1!6079 lt!205085)))))

(assert (=> b!132817 (= lt!205085 (reader!0 thiss!1634 (_2!6081 lt!205095)))))

(declare-fun b!132818 () Bool)

(declare-fun res!110307 () Bool)

(assert (=> b!132818 (=> (not res!110307) (not e!88075))))

(assert (=> b!132818 (= res!110307 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205095)))))

(declare-fun b!132819 () Bool)

(declare-fun res!110311 () Bool)

(assert (=> b!132819 (=> (not res!110311) (not e!88078))))

(assert (=> b!132819 (= res!110311 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132820 () Bool)

(assert (=> b!132820 (= e!88070 (= (_2!6080 lt!205098) (_2!6080 lt!205093)))))

(declare-fun b!132821 () Bool)

(declare-fun res!110317 () Bool)

(assert (=> b!132821 (=> (not res!110317) (not e!88078))))

(assert (=> b!132821 (= res!110317 (bvslt from!447 to!404))))

(declare-fun b!132822 () Bool)

(assert (=> b!132822 (= e!88076 e!88079)))

(declare-fun res!110306 () Bool)

(assert (=> b!132822 (=> (not res!110306) (not e!88079))))

(assert (=> b!132822 (= res!110306 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096))) (bvadd (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!205090))))))

(assert (=> b!132822 (= lt!205090 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!132823 () Bool)

(declare-fun res!110312 () Bool)

(assert (=> b!132823 (=> (not res!110312) (not e!88078))))

(assert (=> b!132823 (= res!110312 (invariant!0 (currentBit!5924 thiss!1634) (currentByte!5929 thiss!1634) (size!2771 (buf!3144 thiss!1634))))))

(declare-fun b!132824 () Bool)

(assert (=> b!132824 (= e!88072 (not (arrayRangesEq!174 arr!237 (_2!6078 lt!205094) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!25950 res!110305) b!132819))

(assert (= (and b!132819 res!110311) b!132821))

(assert (= (and b!132821 res!110317) b!132823))

(assert (= (and b!132823 res!110312) b!132811))

(assert (= (and b!132811 res!110315) b!132814))

(assert (= (and b!132814 res!110316) b!132818))

(assert (= (and b!132818 res!110307) b!132817))

(assert (= (and b!132811 res!110309) b!132822))

(assert (= (and b!132822 res!110306) b!132816))

(assert (= (and b!132816 res!110314) b!132813))

(assert (= (and b!132813 (not res!110313)) b!132824))

(assert (= (and b!132811 res!110310) b!132815))

(assert (= (and b!132811 res!110308) b!132820))

(assert (= start!25950 b!132812))

(declare-fun m!200799 () Bool)

(assert (=> b!132816 m!200799))

(declare-fun m!200801 () Bool)

(assert (=> b!132811 m!200801))

(declare-fun m!200803 () Bool)

(assert (=> b!132811 m!200803))

(declare-fun m!200805 () Bool)

(assert (=> b!132811 m!200805))

(declare-fun m!200807 () Bool)

(assert (=> b!132811 m!200807))

(declare-fun m!200809 () Bool)

(assert (=> b!132811 m!200809))

(declare-fun m!200811 () Bool)

(assert (=> b!132811 m!200811))

(assert (=> b!132811 m!200805))

(declare-fun m!200813 () Bool)

(assert (=> b!132811 m!200813))

(declare-fun m!200815 () Bool)

(assert (=> b!132811 m!200815))

(declare-fun m!200817 () Bool)

(assert (=> b!132811 m!200817))

(declare-fun m!200819 () Bool)

(assert (=> b!132811 m!200819))

(declare-fun m!200821 () Bool)

(assert (=> b!132811 m!200821))

(declare-fun m!200823 () Bool)

(assert (=> b!132811 m!200823))

(declare-fun m!200825 () Bool)

(assert (=> b!132811 m!200825))

(declare-fun m!200827 () Bool)

(assert (=> b!132811 m!200827))

(declare-fun m!200829 () Bool)

(assert (=> b!132811 m!200829))

(declare-fun m!200831 () Bool)

(assert (=> b!132811 m!200831))

(declare-fun m!200833 () Bool)

(assert (=> b!132811 m!200833))

(declare-fun m!200835 () Bool)

(assert (=> b!132811 m!200835))

(declare-fun m!200837 () Bool)

(assert (=> b!132811 m!200837))

(declare-fun m!200839 () Bool)

(assert (=> b!132811 m!200839))

(declare-fun m!200841 () Bool)

(assert (=> b!132811 m!200841))

(declare-fun m!200843 () Bool)

(assert (=> b!132811 m!200843))

(declare-fun m!200845 () Bool)

(assert (=> b!132811 m!200845))

(declare-fun m!200847 () Bool)

(assert (=> b!132811 m!200847))

(declare-fun m!200849 () Bool)

(assert (=> b!132811 m!200849))

(assert (=> b!132811 m!200819))

(declare-fun m!200851 () Bool)

(assert (=> b!132811 m!200851))

(declare-fun m!200853 () Bool)

(assert (=> b!132823 m!200853))

(declare-fun m!200855 () Bool)

(assert (=> b!132818 m!200855))

(declare-fun m!200857 () Bool)

(assert (=> b!132814 m!200857))

(declare-fun m!200859 () Bool)

(assert (=> b!132814 m!200859))

(declare-fun m!200861 () Bool)

(assert (=> b!132813 m!200861))

(declare-fun m!200863 () Bool)

(assert (=> b!132813 m!200863))

(declare-fun m!200865 () Bool)

(assert (=> b!132813 m!200865))

(assert (=> b!132813 m!200847))

(declare-fun m!200867 () Bool)

(assert (=> b!132815 m!200867))

(declare-fun m!200869 () Bool)

(assert (=> b!132812 m!200869))

(declare-fun m!200871 () Bool)

(assert (=> b!132819 m!200871))

(assert (=> b!132817 m!200819))

(declare-fun m!200873 () Bool)

(assert (=> b!132817 m!200873))

(declare-fun m!200875 () Bool)

(assert (=> b!132817 m!200875))

(declare-fun m!200877 () Bool)

(assert (=> start!25950 m!200877))

(declare-fun m!200879 () Bool)

(assert (=> start!25950 m!200879))

(declare-fun m!200881 () Bool)

(assert (=> b!132824 m!200881))

(declare-fun m!200883 () Bool)

(assert (=> b!132822 m!200883))

(assert (=> b!132822 m!200857))

(check-sat (not b!132813) (not start!25950) (not b!132824) (not b!132815) (not b!132823) (not b!132819) (not b!132812) (not b!132818) (not b!132814) (not b!132811) (not b!132817) (not b!132816) (not b!132822))
(check-sat)
(get-model)

(declare-fun d!42333 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!42333 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10350 () Bool)

(assert (= bs!10350 d!42333))

(declare-fun m!201359 () Bool)

(assert (=> bs!10350 m!201359))

(assert (=> b!132819 d!42333))

(declare-fun d!42335 () Bool)

(declare-fun res!110529 () Bool)

(declare-fun e!88220 () Bool)

(assert (=> d!42335 (=> (not res!110529) (not e!88220))))

(assert (=> d!42335 (= res!110529 (= (size!2771 (buf!3144 thiss!1634)) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(assert (=> d!42335 (= (isPrefixOf!0 thiss!1634 (_2!6081 lt!205095)) e!88220)))

(declare-fun b!133057 () Bool)

(declare-fun res!110527 () Bool)

(assert (=> b!133057 (=> (not res!110527) (not e!88220))))

(assert (=> b!133057 (= res!110527 (bvsle (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(declare-fun b!133058 () Bool)

(declare-fun e!88221 () Bool)

(assert (=> b!133058 (= e!88220 e!88221)))

(declare-fun res!110528 () Bool)

(assert (=> b!133058 (=> res!110528 e!88221)))

(assert (=> b!133058 (= res!110528 (= (size!2771 (buf!3144 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133059 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6120 array!6120 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!133059 (= e!88221 (arrayBitRangesEq!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205095)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (= (and d!42335 res!110529) b!133057))

(assert (= (and b!133057 res!110527) b!133058))

(assert (= (and b!133058 (not res!110528)) b!133059))

(assert (=> b!133057 m!200859))

(assert (=> b!133057 m!200857))

(assert (=> b!133059 m!200859))

(assert (=> b!133059 m!200859))

(declare-fun m!201361 () Bool)

(assert (=> b!133059 m!201361))

(assert (=> b!132818 d!42335))

(declare-fun d!42337 () Bool)

(assert (=> d!42337 (= (array_inv!2560 arr!237) (bvsge (size!2771 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25950 d!42337))

(declare-fun d!42339 () Bool)

(assert (=> d!42339 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5924 thiss!1634) (currentByte!5929 thiss!1634) (size!2771 (buf!3144 thiss!1634))))))

(declare-fun bs!10351 () Bool)

(assert (= bs!10351 d!42339))

(assert (=> bs!10351 m!200853))

(assert (=> start!25950 d!42339))

(declare-fun d!42341 () Bool)

(declare-datatypes ((tuple2!11564 0))(
  ( (tuple2!11565 (_1!6090 (_ BitVec 8)) (_2!6090 BitStream!4806)) )
))
(declare-fun lt!205656 () tuple2!11564)

(declare-fun readByte!0 (BitStream!4806) tuple2!11564)

(assert (=> d!42341 (= lt!205656 (readByte!0 (_1!6079 lt!205085)))))

(assert (=> d!42341 (= (readBytePure!0 (_1!6079 lt!205085)) (tuple2!11549 (_2!6090 lt!205656) (_1!6090 lt!205656)))))

(declare-fun bs!10352 () Bool)

(assert (= bs!10352 d!42341))

(declare-fun m!201363 () Bool)

(assert (=> bs!10352 m!201363))

(assert (=> b!132817 d!42341))

(declare-fun b!133070 () Bool)

(declare-fun e!88227 () Unit!8174)

(declare-fun Unit!8184 () Unit!8174)

(assert (=> b!133070 (= e!88227 Unit!8184)))

(declare-fun b!133071 () Bool)

(declare-fun lt!205701 () Unit!8174)

(assert (=> b!133071 (= e!88227 lt!205701)))

(declare-fun lt!205711 () (_ BitVec 64))

(assert (=> b!133071 (= lt!205711 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205704 () (_ BitVec 64))

(assert (=> b!133071 (= lt!205704 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6120 array!6120 (_ BitVec 64) (_ BitVec 64)) Unit!8174)

(assert (=> b!133071 (= lt!205701 (arrayBitRangesEqSymmetric!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205095)) lt!205711 lt!205704))))

(assert (=> b!133071 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 thiss!1634) lt!205711 lt!205704)))

(declare-fun d!42343 () Bool)

(declare-fun e!88226 () Bool)

(assert (=> d!42343 e!88226))

(declare-fun res!110538 () Bool)

(assert (=> d!42343 (=> (not res!110538) (not e!88226))))

(declare-fun lt!205700 () tuple2!11546)

(assert (=> d!42343 (= res!110538 (isPrefixOf!0 (_1!6079 lt!205700) (_2!6079 lt!205700)))))

(declare-fun lt!205697 () BitStream!4806)

(assert (=> d!42343 (= lt!205700 (tuple2!11547 lt!205697 (_2!6081 lt!205095)))))

(declare-fun lt!205707 () Unit!8174)

(declare-fun lt!205706 () Unit!8174)

(assert (=> d!42343 (= lt!205707 lt!205706)))

(assert (=> d!42343 (isPrefixOf!0 lt!205697 (_2!6081 lt!205095))))

(assert (=> d!42343 (= lt!205706 (lemmaIsPrefixTransitive!0 lt!205697 (_2!6081 lt!205095) (_2!6081 lt!205095)))))

(declare-fun lt!205709 () Unit!8174)

(declare-fun lt!205713 () Unit!8174)

(assert (=> d!42343 (= lt!205709 lt!205713)))

(assert (=> d!42343 (isPrefixOf!0 lt!205697 (_2!6081 lt!205095))))

(assert (=> d!42343 (= lt!205713 (lemmaIsPrefixTransitive!0 lt!205697 thiss!1634 (_2!6081 lt!205095)))))

(declare-fun lt!205698 () Unit!8174)

(assert (=> d!42343 (= lt!205698 e!88227)))

(declare-fun c!7597 () Bool)

(assert (=> d!42343 (= c!7597 (not (= (size!2771 (buf!3144 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!205705 () Unit!8174)

(declare-fun lt!205714 () Unit!8174)

(assert (=> d!42343 (= lt!205705 lt!205714)))

(assert (=> d!42343 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205095))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4806) Unit!8174)

(assert (=> d!42343 (= lt!205714 (lemmaIsPrefixRefl!0 (_2!6081 lt!205095)))))

(declare-fun lt!205699 () Unit!8174)

(declare-fun lt!205702 () Unit!8174)

(assert (=> d!42343 (= lt!205699 lt!205702)))

(assert (=> d!42343 (= lt!205702 (lemmaIsPrefixRefl!0 (_2!6081 lt!205095)))))

(declare-fun lt!205715 () Unit!8174)

(declare-fun lt!205716 () Unit!8174)

(assert (=> d!42343 (= lt!205715 lt!205716)))

(assert (=> d!42343 (isPrefixOf!0 lt!205697 lt!205697)))

(assert (=> d!42343 (= lt!205716 (lemmaIsPrefixRefl!0 lt!205697))))

(declare-fun lt!205703 () Unit!8174)

(declare-fun lt!205710 () Unit!8174)

(assert (=> d!42343 (= lt!205703 lt!205710)))

(assert (=> d!42343 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42343 (= lt!205710 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42343 (= lt!205697 (BitStream!4807 (buf!3144 (_2!6081 lt!205095)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(assert (=> d!42343 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205095))))

(assert (=> d!42343 (= (reader!0 thiss!1634 (_2!6081 lt!205095)) lt!205700)))

(declare-fun lt!205712 () (_ BitVec 64))

(declare-fun lt!205708 () (_ BitVec 64))

(declare-fun b!133072 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4806 (_ BitVec 64)) BitStream!4806)

(assert (=> b!133072 (= e!88226 (= (_1!6079 lt!205700) (withMovedBitIndex!0 (_2!6079 lt!205700) (bvsub lt!205708 lt!205712))))))

(assert (=> b!133072 (or (= (bvand lt!205708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205708 lt!205712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133072 (= lt!205712 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))))))

(assert (=> b!133072 (= lt!205708 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(declare-fun b!133073 () Bool)

(declare-fun res!110536 () Bool)

(assert (=> b!133073 (=> (not res!110536) (not e!88226))))

(assert (=> b!133073 (= res!110536 (isPrefixOf!0 (_2!6079 lt!205700) (_2!6081 lt!205095)))))

(declare-fun b!133074 () Bool)

(declare-fun res!110537 () Bool)

(assert (=> b!133074 (=> (not res!110537) (not e!88226))))

(assert (=> b!133074 (= res!110537 (isPrefixOf!0 (_1!6079 lt!205700) thiss!1634))))

(assert (= (and d!42343 c!7597) b!133071))

(assert (= (and d!42343 (not c!7597)) b!133070))

(assert (= (and d!42343 res!110538) b!133074))

(assert (= (and b!133074 res!110537) b!133073))

(assert (= (and b!133073 res!110536) b!133072))

(declare-fun m!201365 () Bool)

(assert (=> b!133074 m!201365))

(declare-fun m!201367 () Bool)

(assert (=> b!133072 m!201367))

(assert (=> b!133072 m!200857))

(assert (=> b!133072 m!200859))

(declare-fun m!201369 () Bool)

(assert (=> d!42343 m!201369))

(declare-fun m!201371 () Bool)

(assert (=> d!42343 m!201371))

(declare-fun m!201373 () Bool)

(assert (=> d!42343 m!201373))

(declare-fun m!201375 () Bool)

(assert (=> d!42343 m!201375))

(declare-fun m!201377 () Bool)

(assert (=> d!42343 m!201377))

(declare-fun m!201379 () Bool)

(assert (=> d!42343 m!201379))

(assert (=> d!42343 m!200855))

(declare-fun m!201381 () Bool)

(assert (=> d!42343 m!201381))

(declare-fun m!201383 () Bool)

(assert (=> d!42343 m!201383))

(declare-fun m!201385 () Bool)

(assert (=> d!42343 m!201385))

(declare-fun m!201387 () Bool)

(assert (=> d!42343 m!201387))

(assert (=> b!133071 m!200859))

(declare-fun m!201389 () Bool)

(assert (=> b!133071 m!201389))

(declare-fun m!201391 () Bool)

(assert (=> b!133071 m!201391))

(declare-fun m!201393 () Bool)

(assert (=> b!133073 m!201393))

(assert (=> b!132817 d!42343))

(declare-fun d!42345 () Bool)

(declare-fun res!110541 () Bool)

(declare-fun e!88228 () Bool)

(assert (=> d!42345 (=> (not res!110541) (not e!88228))))

(assert (=> d!42345 (= res!110541 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (=> d!42345 (= (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205096)) e!88228)))

(declare-fun b!133075 () Bool)

(declare-fun res!110539 () Bool)

(assert (=> b!133075 (=> (not res!110539) (not e!88228))))

(assert (=> b!133075 (= res!110539 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096)))))))

(declare-fun b!133076 () Bool)

(declare-fun e!88229 () Bool)

(assert (=> b!133076 (= e!88228 e!88229)))

(declare-fun res!110540 () Bool)

(assert (=> b!133076 (=> res!110540 e!88229)))

(assert (=> b!133076 (= res!110540 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) #b00000000000000000000000000000000))))

(declare-fun b!133077 () Bool)

(assert (=> b!133077 (= e!88229 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(assert (= (and d!42345 res!110541) b!133075))

(assert (= (and b!133075 res!110539) b!133076))

(assert (= (and b!133076 (not res!110540)) b!133077))

(assert (=> b!133075 m!200857))

(assert (=> b!133075 m!200883))

(assert (=> b!133077 m!200857))

(assert (=> b!133077 m!200857))

(declare-fun m!201395 () Bool)

(assert (=> b!133077 m!201395))

(assert (=> b!132816 d!42345))

(declare-fun d!42347 () Bool)

(assert (=> d!42347 (= (invariant!0 (currentBit!5924 thiss!1634) (currentByte!5929 thiss!1634) (size!2771 (buf!3144 (_2!6081 lt!205095)))) (and (bvsge (currentBit!5924 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5924 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5929 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5929 thiss!1634) (size!2771 (buf!3144 (_2!6081 lt!205095)))) (and (= (currentBit!5924 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5929 thiss!1634) (size!2771 (buf!3144 (_2!6081 lt!205095))))))))))

(assert (=> b!132815 d!42347))

(declare-fun d!42349 () Bool)

(declare-fun e!88232 () Bool)

(assert (=> d!42349 e!88232))

(declare-fun res!110547 () Bool)

(assert (=> d!42349 (=> (not res!110547) (not e!88232))))

(declare-fun lt!205730 () (_ BitVec 64))

(declare-fun lt!205731 () (_ BitVec 64))

(declare-fun lt!205734 () (_ BitVec 64))

(assert (=> d!42349 (= res!110547 (= lt!205734 (bvsub lt!205731 lt!205730)))))

(assert (=> d!42349 (or (= (bvand lt!205731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205730 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205731 lt!205730) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42349 (= lt!205730 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))))))

(declare-fun lt!205729 () (_ BitVec 64))

(declare-fun lt!205732 () (_ BitVec 64))

(assert (=> d!42349 (= lt!205731 (bvmul lt!205729 lt!205732))))

(assert (=> d!42349 (or (= lt!205729 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205732 (bvsdiv (bvmul lt!205729 lt!205732) lt!205729)))))

(assert (=> d!42349 (= lt!205732 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42349 (= lt!205729 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(assert (=> d!42349 (= lt!205734 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))))))

(assert (=> d!42349 (invariant!0 (currentBit!5924 (_2!6081 lt!205095)) (currentByte!5929 (_2!6081 lt!205095)) (size!2771 (buf!3144 (_2!6081 lt!205095))))))

(assert (=> d!42349 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))) lt!205734)))

(declare-fun b!133082 () Bool)

(declare-fun res!110546 () Bool)

(assert (=> b!133082 (=> (not res!110546) (not e!88232))))

(assert (=> b!133082 (= res!110546 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205734))))

(declare-fun b!133083 () Bool)

(declare-fun lt!205733 () (_ BitVec 64))

(assert (=> b!133083 (= e!88232 (bvsle lt!205734 (bvmul lt!205733 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133083 (or (= lt!205733 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205733 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205733)))))

(assert (=> b!133083 (= lt!205733 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(assert (= (and d!42349 res!110547) b!133082))

(assert (= (and b!133082 res!110546) b!133083))

(declare-fun m!201397 () Bool)

(assert (=> d!42349 m!201397))

(declare-fun m!201399 () Bool)

(assert (=> d!42349 m!201399))

(assert (=> b!132814 d!42349))

(declare-fun d!42351 () Bool)

(declare-fun e!88233 () Bool)

(assert (=> d!42351 e!88233))

(declare-fun res!110549 () Bool)

(assert (=> d!42351 (=> (not res!110549) (not e!88233))))

(declare-fun lt!205740 () (_ BitVec 64))

(declare-fun lt!205736 () (_ BitVec 64))

(declare-fun lt!205737 () (_ BitVec 64))

(assert (=> d!42351 (= res!110549 (= lt!205740 (bvsub lt!205737 lt!205736)))))

(assert (=> d!42351 (or (= (bvand lt!205737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205737 lt!205736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42351 (= lt!205736 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634))))))

(declare-fun lt!205735 () (_ BitVec 64))

(declare-fun lt!205738 () (_ BitVec 64))

(assert (=> d!42351 (= lt!205737 (bvmul lt!205735 lt!205738))))

(assert (=> d!42351 (or (= lt!205735 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205738 (bvsdiv (bvmul lt!205735 lt!205738) lt!205735)))))

(assert (=> d!42351 (= lt!205738 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42351 (= lt!205735 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))))))

(assert (=> d!42351 (= lt!205740 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 thiss!1634))))))

(assert (=> d!42351 (invariant!0 (currentBit!5924 thiss!1634) (currentByte!5929 thiss!1634) (size!2771 (buf!3144 thiss!1634)))))

(assert (=> d!42351 (= (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)) lt!205740)))

(declare-fun b!133084 () Bool)

(declare-fun res!110548 () Bool)

(assert (=> b!133084 (=> (not res!110548) (not e!88233))))

(assert (=> b!133084 (= res!110548 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205740))))

(declare-fun b!133085 () Bool)

(declare-fun lt!205739 () (_ BitVec 64))

(assert (=> b!133085 (= e!88233 (bvsle lt!205740 (bvmul lt!205739 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133085 (or (= lt!205739 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205739 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205739)))))

(assert (=> b!133085 (= lt!205739 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))))))

(assert (= (and d!42351 res!110549) b!133084))

(assert (= (and b!133084 res!110548) b!133085))

(assert (=> d!42351 m!201359))

(assert (=> d!42351 m!200853))

(assert (=> b!132814 d!42351))

(declare-fun d!42353 () Bool)

(declare-fun res!110554 () Bool)

(declare-fun e!88238 () Bool)

(assert (=> d!42353 (=> res!110554 e!88238)))

(assert (=> d!42353 (= res!110554 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42353 (= (arrayRangesEq!174 arr!237 (_2!6078 lt!205094) #b00000000000000000000000000000000 to!404) e!88238)))

(declare-fun b!133090 () Bool)

(declare-fun e!88239 () Bool)

(assert (=> b!133090 (= e!88238 e!88239)))

(declare-fun res!110555 () Bool)

(assert (=> b!133090 (=> (not res!110555) (not e!88239))))

(assert (=> b!133090 (= res!110555 (= (select (arr!3406 arr!237) #b00000000000000000000000000000000) (select (arr!3406 (_2!6078 lt!205094)) #b00000000000000000000000000000000)))))

(declare-fun b!133091 () Bool)

(assert (=> b!133091 (= e!88239 (arrayRangesEq!174 arr!237 (_2!6078 lt!205094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42353 (not res!110554)) b!133090))

(assert (= (and b!133090 res!110555) b!133091))

(declare-fun m!201401 () Bool)

(assert (=> b!133090 m!201401))

(declare-fun m!201403 () Bool)

(assert (=> b!133090 m!201403))

(declare-fun m!201405 () Bool)

(assert (=> b!133091 m!201405))

(assert (=> b!132824 d!42353))

(declare-datatypes ((tuple3!506 0))(
  ( (tuple3!507 (_1!6091 Unit!8174) (_2!6091 BitStream!4806) (_3!308 array!6120)) )
))
(declare-fun lt!205743 () tuple3!506)

(declare-fun d!42355 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4806 array!6120 (_ BitVec 32) (_ BitVec 32)) tuple3!506)

(assert (=> d!42355 (= lt!205743 (readByteArrayLoop!0 (_1!6079 lt!205100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42355 (= (readByteArrayLoopPure!0 (_1!6079 lt!205100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11545 (_2!6091 lt!205743) (_3!308 lt!205743)))))

(declare-fun bs!10353 () Bool)

(assert (= bs!10353 d!42355))

(declare-fun m!201407 () Bool)

(assert (=> bs!10353 m!201407))

(assert (=> b!132813 d!42355))

(declare-fun d!42357 () Bool)

(assert (=> d!42357 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205090) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))) lt!205090))))

(declare-fun bs!10354 () Bool)

(assert (= bs!10354 d!42357))

(declare-fun m!201409 () Bool)

(assert (=> bs!10354 m!201409))

(assert (=> b!132813 d!42357))

(declare-fun d!42359 () Bool)

(assert (=> d!42359 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205090)))

(declare-fun lt!205746 () Unit!8174)

(declare-fun choose!9 (BitStream!4806 array!6120 (_ BitVec 64) BitStream!4806) Unit!8174)

(assert (=> d!42359 (= lt!205746 (choose!9 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205096)) lt!205090 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(assert (=> d!42359 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205096)) lt!205090) lt!205746)))

(declare-fun bs!10355 () Bool)

(assert (= bs!10355 d!42359))

(assert (=> bs!10355 m!200863))

(declare-fun m!201411 () Bool)

(assert (=> bs!10355 m!201411))

(assert (=> b!132813 d!42359))

(declare-fun b!133092 () Bool)

(declare-fun e!88241 () Unit!8174)

(declare-fun Unit!8185 () Unit!8174)

(assert (=> b!133092 (= e!88241 Unit!8185)))

(declare-fun b!133093 () Bool)

(declare-fun lt!205751 () Unit!8174)

(assert (=> b!133093 (= e!88241 lt!205751)))

(declare-fun lt!205761 () (_ BitVec 64))

(assert (=> b!133093 (= lt!205761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205754 () (_ BitVec 64))

(assert (=> b!133093 (= lt!205754 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))))))

(assert (=> b!133093 (= lt!205751 (arrayBitRangesEqSymmetric!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205096)) lt!205761 lt!205754))))

(assert (=> b!133093 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205096)) (buf!3144 (_2!6081 lt!205095)) lt!205761 lt!205754)))

(declare-fun d!42361 () Bool)

(declare-fun e!88240 () Bool)

(assert (=> d!42361 e!88240))

(declare-fun res!110558 () Bool)

(assert (=> d!42361 (=> (not res!110558) (not e!88240))))

(declare-fun lt!205750 () tuple2!11546)

(assert (=> d!42361 (= res!110558 (isPrefixOf!0 (_1!6079 lt!205750) (_2!6079 lt!205750)))))

(declare-fun lt!205747 () BitStream!4806)

(assert (=> d!42361 (= lt!205750 (tuple2!11547 lt!205747 (_2!6081 lt!205096)))))

(declare-fun lt!205757 () Unit!8174)

(declare-fun lt!205756 () Unit!8174)

(assert (=> d!42361 (= lt!205757 lt!205756)))

(assert (=> d!42361 (isPrefixOf!0 lt!205747 (_2!6081 lt!205096))))

(assert (=> d!42361 (= lt!205756 (lemmaIsPrefixTransitive!0 lt!205747 (_2!6081 lt!205096) (_2!6081 lt!205096)))))

(declare-fun lt!205759 () Unit!8174)

(declare-fun lt!205763 () Unit!8174)

(assert (=> d!42361 (= lt!205759 lt!205763)))

(assert (=> d!42361 (isPrefixOf!0 lt!205747 (_2!6081 lt!205096))))

(assert (=> d!42361 (= lt!205763 (lemmaIsPrefixTransitive!0 lt!205747 (_2!6081 lt!205095) (_2!6081 lt!205096)))))

(declare-fun lt!205748 () Unit!8174)

(assert (=> d!42361 (= lt!205748 e!88241)))

(declare-fun c!7598 () Bool)

(assert (=> d!42361 (= c!7598 (not (= (size!2771 (buf!3144 (_2!6081 lt!205095))) #b00000000000000000000000000000000)))))

(declare-fun lt!205755 () Unit!8174)

(declare-fun lt!205764 () Unit!8174)

(assert (=> d!42361 (= lt!205755 lt!205764)))

(assert (=> d!42361 (isPrefixOf!0 (_2!6081 lt!205096) (_2!6081 lt!205096))))

(assert (=> d!42361 (= lt!205764 (lemmaIsPrefixRefl!0 (_2!6081 lt!205096)))))

(declare-fun lt!205749 () Unit!8174)

(declare-fun lt!205752 () Unit!8174)

(assert (=> d!42361 (= lt!205749 lt!205752)))

(assert (=> d!42361 (= lt!205752 (lemmaIsPrefixRefl!0 (_2!6081 lt!205096)))))

(declare-fun lt!205765 () Unit!8174)

(declare-fun lt!205766 () Unit!8174)

(assert (=> d!42361 (= lt!205765 lt!205766)))

(assert (=> d!42361 (isPrefixOf!0 lt!205747 lt!205747)))

(assert (=> d!42361 (= lt!205766 (lemmaIsPrefixRefl!0 lt!205747))))

(declare-fun lt!205753 () Unit!8174)

(declare-fun lt!205760 () Unit!8174)

(assert (=> d!42361 (= lt!205753 lt!205760)))

(assert (=> d!42361 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205095))))

(assert (=> d!42361 (= lt!205760 (lemmaIsPrefixRefl!0 (_2!6081 lt!205095)))))

(assert (=> d!42361 (= lt!205747 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))))))

(assert (=> d!42361 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205096))))

(assert (=> d!42361 (= (reader!0 (_2!6081 lt!205095) (_2!6081 lt!205096)) lt!205750)))

(declare-fun b!133094 () Bool)

(declare-fun lt!205762 () (_ BitVec 64))

(declare-fun lt!205758 () (_ BitVec 64))

(assert (=> b!133094 (= e!88240 (= (_1!6079 lt!205750) (withMovedBitIndex!0 (_2!6079 lt!205750) (bvsub lt!205758 lt!205762))))))

(assert (=> b!133094 (or (= (bvand lt!205758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205758 lt!205762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133094 (= lt!205762 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096))))))

(assert (=> b!133094 (= lt!205758 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))))))

(declare-fun b!133095 () Bool)

(declare-fun res!110556 () Bool)

(assert (=> b!133095 (=> (not res!110556) (not e!88240))))

(assert (=> b!133095 (= res!110556 (isPrefixOf!0 (_2!6079 lt!205750) (_2!6081 lt!205096)))))

(declare-fun b!133096 () Bool)

(declare-fun res!110557 () Bool)

(assert (=> b!133096 (=> (not res!110557) (not e!88240))))

(assert (=> b!133096 (= res!110557 (isPrefixOf!0 (_1!6079 lt!205750) (_2!6081 lt!205095)))))

(assert (= (and d!42361 c!7598) b!133093))

(assert (= (and d!42361 (not c!7598)) b!133092))

(assert (= (and d!42361 res!110558) b!133096))

(assert (= (and b!133096 res!110557) b!133095))

(assert (= (and b!133095 res!110556) b!133094))

(declare-fun m!201413 () Bool)

(assert (=> b!133096 m!201413))

(declare-fun m!201415 () Bool)

(assert (=> b!133094 m!201415))

(assert (=> b!133094 m!200883))

(assert (=> b!133094 m!200857))

(declare-fun m!201417 () Bool)

(assert (=> d!42361 m!201417))

(declare-fun m!201419 () Bool)

(assert (=> d!42361 m!201419))

(declare-fun m!201421 () Bool)

(assert (=> d!42361 m!201421))

(declare-fun m!201423 () Bool)

(assert (=> d!42361 m!201423))

(declare-fun m!201425 () Bool)

(assert (=> d!42361 m!201425))

(declare-fun m!201427 () Bool)

(assert (=> d!42361 m!201427))

(assert (=> d!42361 m!200799))

(assert (=> d!42361 m!201373))

(declare-fun m!201429 () Bool)

(assert (=> d!42361 m!201429))

(declare-fun m!201431 () Bool)

(assert (=> d!42361 m!201431))

(assert (=> d!42361 m!201383))

(assert (=> b!133093 m!200857))

(declare-fun m!201433 () Bool)

(assert (=> b!133093 m!201433))

(declare-fun m!201435 () Bool)

(assert (=> b!133093 m!201435))

(declare-fun m!201437 () Bool)

(assert (=> b!133095 m!201437))

(assert (=> b!132813 d!42361))

(declare-fun d!42363 () Bool)

(assert (=> d!42363 (= (array_inv!2560 (buf!3144 thiss!1634)) (bvsge (size!2771 (buf!3144 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!132812 d!42363))

(declare-fun d!42365 () Bool)

(assert (=> d!42365 (= (invariant!0 (currentBit!5924 thiss!1634) (currentByte!5929 thiss!1634) (size!2771 (buf!3144 thiss!1634))) (and (bvsge (currentBit!5924 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5924 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5929 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5929 thiss!1634) (size!2771 (buf!3144 thiss!1634))) (and (= (currentBit!5924 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5929 thiss!1634) (size!2771 (buf!3144 thiss!1634)))))))))

(assert (=> b!132823 d!42365))

(declare-fun d!42367 () Bool)

(declare-fun e!88242 () Bool)

(assert (=> d!42367 e!88242))

(declare-fun res!110560 () Bool)

(assert (=> d!42367 (=> (not res!110560) (not e!88242))))

(declare-fun lt!205768 () (_ BitVec 64))

(declare-fun lt!205772 () (_ BitVec 64))

(declare-fun lt!205769 () (_ BitVec 64))

(assert (=> d!42367 (= res!110560 (= lt!205772 (bvsub lt!205769 lt!205768)))))

(assert (=> d!42367 (or (= (bvand lt!205769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205768 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205769 lt!205768) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42367 (= lt!205768 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205096))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205096)))))))

(declare-fun lt!205767 () (_ BitVec 64))

(declare-fun lt!205770 () (_ BitVec 64))

(assert (=> d!42367 (= lt!205769 (bvmul lt!205767 lt!205770))))

(assert (=> d!42367 (or (= lt!205767 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205770 (bvsdiv (bvmul lt!205767 lt!205770) lt!205767)))))

(assert (=> d!42367 (= lt!205770 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42367 (= lt!205767 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (=> d!42367 (= lt!205772 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205096))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205096)))))))

(assert (=> d!42367 (invariant!0 (currentBit!5924 (_2!6081 lt!205096)) (currentByte!5929 (_2!6081 lt!205096)) (size!2771 (buf!3144 (_2!6081 lt!205096))))))

(assert (=> d!42367 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096))) lt!205772)))

(declare-fun b!133097 () Bool)

(declare-fun res!110559 () Bool)

(assert (=> b!133097 (=> (not res!110559) (not e!88242))))

(assert (=> b!133097 (= res!110559 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205772))))

(declare-fun b!133098 () Bool)

(declare-fun lt!205771 () (_ BitVec 64))

(assert (=> b!133098 (= e!88242 (bvsle lt!205772 (bvmul lt!205771 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133098 (or (= lt!205771 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205771 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205771)))))

(assert (=> b!133098 (= lt!205771 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (= (and d!42367 res!110560) b!133097))

(assert (= (and b!133097 res!110559) b!133098))

(declare-fun m!201439 () Bool)

(assert (=> d!42367 m!201439))

(declare-fun m!201441 () Bool)

(assert (=> d!42367 m!201441))

(assert (=> b!132822 d!42367))

(assert (=> b!132822 d!42349))

(declare-fun lt!205773 () tuple3!506)

(declare-fun d!42369 () Bool)

(assert (=> d!42369 (= lt!205773 (readByteArrayLoop!0 (_1!6079 lt!205083) arr!237 from!447 to!404))))

(assert (=> d!42369 (= (readByteArrayLoopPure!0 (_1!6079 lt!205083) arr!237 from!447 to!404) (tuple2!11545 (_2!6091 lt!205773) (_3!308 lt!205773)))))

(declare-fun bs!10356 () Bool)

(assert (= bs!10356 d!42369))

(declare-fun m!201443 () Bool)

(assert (=> bs!10356 m!201443))

(assert (=> b!132811 d!42369))

(declare-fun d!42371 () Bool)

(assert (=> d!42371 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205096))))

(declare-fun lt!205776 () Unit!8174)

(declare-fun choose!30 (BitStream!4806 BitStream!4806 BitStream!4806) Unit!8174)

(assert (=> d!42371 (= lt!205776 (choose!30 thiss!1634 (_2!6081 lt!205095) (_2!6081 lt!205096)))))

(assert (=> d!42371 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205095))))

(assert (=> d!42371 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6081 lt!205095) (_2!6081 lt!205096)) lt!205776)))

(declare-fun bs!10357 () Bool)

(assert (= bs!10357 d!42371))

(assert (=> bs!10357 m!200803))

(declare-fun m!201445 () Bool)

(assert (=> bs!10357 m!201445))

(assert (=> bs!10357 m!200855))

(assert (=> b!132811 d!42371))

(declare-fun d!42373 () Bool)

(declare-fun lt!205777 () tuple2!11564)

(assert (=> d!42373 (= lt!205777 (readByte!0 (_1!6079 lt!205083)))))

(assert (=> d!42373 (= (readBytePure!0 (_1!6079 lt!205083)) (tuple2!11549 (_2!6090 lt!205777) (_1!6090 lt!205777)))))

(declare-fun bs!10358 () Bool)

(assert (= bs!10358 d!42373))

(declare-fun m!201447 () Bool)

(assert (=> bs!10358 m!201447))

(assert (=> b!132811 d!42373))

(declare-fun d!42375 () Bool)

(declare-fun lt!205786 () tuple2!11544)

(declare-fun lt!205788 () tuple2!11544)

(assert (=> d!42375 (arrayRangesEq!174 (_2!6078 lt!205786) (_2!6078 lt!205788) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!205787 () BitStream!4806)

(declare-fun lt!205789 () Unit!8174)

(declare-fun choose!35 (BitStream!4806 array!6120 (_ BitVec 32) (_ BitVec 32) tuple2!11544 array!6120 BitStream!4806 tuple2!11544 array!6120) Unit!8174)

(assert (=> d!42375 (= lt!205789 (choose!35 (_1!6079 lt!205083) arr!237 from!447 to!404 lt!205786 (_2!6078 lt!205786) lt!205787 lt!205788 (_2!6078 lt!205788)))))

(assert (=> d!42375 (= lt!205788 (readByteArrayLoopPure!0 lt!205787 (array!6121 (store (arr!3406 arr!237) from!447 (_2!6080 (readBytePure!0 (_1!6079 lt!205083)))) (size!2771 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42375 (= lt!205787 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001))))

(assert (=> d!42375 (= lt!205786 (readByteArrayLoopPure!0 (_1!6079 lt!205083) arr!237 from!447 to!404))))

(assert (=> d!42375 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6079 lt!205083) arr!237 from!447 to!404) lt!205789)))

(declare-fun bs!10360 () Bool)

(assert (= bs!10360 d!42375))

(declare-fun m!201449 () Bool)

(assert (=> bs!10360 m!201449))

(declare-fun m!201451 () Bool)

(assert (=> bs!10360 m!201451))

(assert (=> bs!10360 m!200805))

(declare-fun m!201453 () Bool)

(assert (=> bs!10360 m!201453))

(assert (=> bs!10360 m!200837))

(declare-fun m!201455 () Bool)

(assert (=> bs!10360 m!201455))

(assert (=> bs!10360 m!200811))

(assert (=> b!132811 d!42375))

(declare-fun d!42377 () Bool)

(declare-fun res!110563 () Bool)

(declare-fun e!88243 () Bool)

(assert (=> d!42377 (=> (not res!110563) (not e!88243))))

(assert (=> d!42377 (= res!110563 (= (size!2771 (buf!3144 thiss!1634)) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (=> d!42377 (= (isPrefixOf!0 thiss!1634 (_2!6081 lt!205096)) e!88243)))

(declare-fun b!133099 () Bool)

(declare-fun res!110561 () Bool)

(assert (=> b!133099 (=> (not res!110561) (not e!88243))))

(assert (=> b!133099 (= res!110561 (bvsle (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096)))))))

(declare-fun b!133100 () Bool)

(declare-fun e!88244 () Bool)

(assert (=> b!133100 (= e!88243 e!88244)))

(declare-fun res!110562 () Bool)

(assert (=> b!133100 (=> res!110562 e!88244)))

(assert (=> b!133100 (= res!110562 (= (size!2771 (buf!3144 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133101 () Bool)

(assert (=> b!133101 (= e!88244 (arrayBitRangesEq!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (= (and d!42377 res!110563) b!133099))

(assert (= (and b!133099 res!110561) b!133100))

(assert (= (and b!133100 (not res!110562)) b!133101))

(assert (=> b!133099 m!200859))

(assert (=> b!133099 m!200883))

(assert (=> b!133101 m!200859))

(assert (=> b!133101 m!200859))

(declare-fun m!201457 () Bool)

(assert (=> b!133101 m!201457))

(assert (=> b!132811 d!42377))

(declare-fun d!42379 () Bool)

(declare-fun e!88247 () Bool)

(assert (=> d!42379 e!88247))

(declare-fun res!110566 () Bool)

(assert (=> d!42379 (=> (not res!110566) (not e!88247))))

(assert (=> d!42379 (= res!110566 (and (or (let ((rhs!3103 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3103 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3103) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!42380 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!42380 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!42380 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3102 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3102 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3102) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205798 () Unit!8174)

(declare-fun choose!57 (BitStream!4806 BitStream!4806 (_ BitVec 64) (_ BitVec 32)) Unit!8174)

(assert (=> d!42379 (= lt!205798 (choose!57 thiss!1634 (_2!6081 lt!205095) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!42379 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6081 lt!205095) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!205798)))

(declare-fun b!133104 () Bool)

(declare-fun lt!205797 () (_ BitVec 32))

(assert (=> b!133104 (= e!88247 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) (bvsub (bvsub to!404 from!447) lt!205797)))))

(assert (=> b!133104 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!205797 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!205797) #b10000000000000000000000000000000)))))

(declare-fun lt!205796 () (_ BitVec 64))

(assert (=> b!133104 (= lt!205797 ((_ extract 31 0) lt!205796))))

(assert (=> b!133104 (and (bvslt lt!205796 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!205796 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!133104 (= lt!205796 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!42379 res!110566) b!133104))

(declare-fun m!201459 () Bool)

(assert (=> d!42379 m!201459))

(declare-fun m!201461 () Bool)

(assert (=> b!133104 m!201461))

(assert (=> b!132811 d!42379))

(declare-fun d!42382 () Bool)

(declare-fun lt!205799 () tuple3!506)

(assert (=> d!42382 (= lt!205799 (readByteArrayLoop!0 (_1!6079 lt!205089) lt!205086 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42382 (= (readByteArrayLoopPure!0 (_1!6079 lt!205089) lt!205086 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11545 (_2!6091 lt!205799) (_3!308 lt!205799)))))

(declare-fun bs!10361 () Bool)

(assert (= bs!10361 d!42382))

(declare-fun m!201463 () Bool)

(assert (=> bs!10361 m!201463))

(assert (=> b!132811 d!42382))

(declare-fun d!42384 () Bool)

(assert (=> d!42384 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205088) (bvsle ((_ sign_extend 32) lt!205088) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10362 () Bool)

(assert (= bs!10362 d!42384))

(assert (=> bs!10362 m!201409))

(assert (=> b!132811 d!42384))

(declare-fun b!133105 () Bool)

(declare-fun e!88249 () Unit!8174)

(declare-fun Unit!8186 () Unit!8174)

(assert (=> b!133105 (= e!88249 Unit!8186)))

(declare-fun b!133106 () Bool)

(declare-fun lt!205804 () Unit!8174)

(assert (=> b!133106 (= e!88249 lt!205804)))

(declare-fun lt!205814 () (_ BitVec 64))

(assert (=> b!133106 (= lt!205814 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205807 () (_ BitVec 64))

(assert (=> b!133106 (= lt!205807 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(assert (=> b!133106 (= lt!205804 (arrayBitRangesEqSymmetric!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205096)) lt!205814 lt!205807))))

(assert (=> b!133106 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205096)) (buf!3144 thiss!1634) lt!205814 lt!205807)))

(declare-fun d!42386 () Bool)

(declare-fun e!88248 () Bool)

(assert (=> d!42386 e!88248))

(declare-fun res!110569 () Bool)

(assert (=> d!42386 (=> (not res!110569) (not e!88248))))

(declare-fun lt!205803 () tuple2!11546)

(assert (=> d!42386 (= res!110569 (isPrefixOf!0 (_1!6079 lt!205803) (_2!6079 lt!205803)))))

(declare-fun lt!205800 () BitStream!4806)

(assert (=> d!42386 (= lt!205803 (tuple2!11547 lt!205800 (_2!6081 lt!205096)))))

(declare-fun lt!205810 () Unit!8174)

(declare-fun lt!205809 () Unit!8174)

(assert (=> d!42386 (= lt!205810 lt!205809)))

(assert (=> d!42386 (isPrefixOf!0 lt!205800 (_2!6081 lt!205096))))

(assert (=> d!42386 (= lt!205809 (lemmaIsPrefixTransitive!0 lt!205800 (_2!6081 lt!205096) (_2!6081 lt!205096)))))

(declare-fun lt!205812 () Unit!8174)

(declare-fun lt!205816 () Unit!8174)

(assert (=> d!42386 (= lt!205812 lt!205816)))

(assert (=> d!42386 (isPrefixOf!0 lt!205800 (_2!6081 lt!205096))))

(assert (=> d!42386 (= lt!205816 (lemmaIsPrefixTransitive!0 lt!205800 thiss!1634 (_2!6081 lt!205096)))))

(declare-fun lt!205801 () Unit!8174)

(assert (=> d!42386 (= lt!205801 e!88249)))

(declare-fun c!7599 () Bool)

(assert (=> d!42386 (= c!7599 (not (= (size!2771 (buf!3144 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!205808 () Unit!8174)

(declare-fun lt!205817 () Unit!8174)

(assert (=> d!42386 (= lt!205808 lt!205817)))

(assert (=> d!42386 (isPrefixOf!0 (_2!6081 lt!205096) (_2!6081 lt!205096))))

(assert (=> d!42386 (= lt!205817 (lemmaIsPrefixRefl!0 (_2!6081 lt!205096)))))

(declare-fun lt!205802 () Unit!8174)

(declare-fun lt!205805 () Unit!8174)

(assert (=> d!42386 (= lt!205802 lt!205805)))

(assert (=> d!42386 (= lt!205805 (lemmaIsPrefixRefl!0 (_2!6081 lt!205096)))))

(declare-fun lt!205818 () Unit!8174)

(declare-fun lt!205819 () Unit!8174)

(assert (=> d!42386 (= lt!205818 lt!205819)))

(assert (=> d!42386 (isPrefixOf!0 lt!205800 lt!205800)))

(assert (=> d!42386 (= lt!205819 (lemmaIsPrefixRefl!0 lt!205800))))

(declare-fun lt!205806 () Unit!8174)

(declare-fun lt!205813 () Unit!8174)

(assert (=> d!42386 (= lt!205806 lt!205813)))

(assert (=> d!42386 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42386 (= lt!205813 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42386 (= lt!205800 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(assert (=> d!42386 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205096))))

(assert (=> d!42386 (= (reader!0 thiss!1634 (_2!6081 lt!205096)) lt!205803)))

(declare-fun lt!205811 () (_ BitVec 64))

(declare-fun lt!205815 () (_ BitVec 64))

(declare-fun b!133107 () Bool)

(assert (=> b!133107 (= e!88248 (= (_1!6079 lt!205803) (withMovedBitIndex!0 (_2!6079 lt!205803) (bvsub lt!205811 lt!205815))))))

(assert (=> b!133107 (or (= (bvand lt!205811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205811 lt!205815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133107 (= lt!205815 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096))))))

(assert (=> b!133107 (= lt!205811 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(declare-fun b!133108 () Bool)

(declare-fun res!110567 () Bool)

(assert (=> b!133108 (=> (not res!110567) (not e!88248))))

(assert (=> b!133108 (= res!110567 (isPrefixOf!0 (_2!6079 lt!205803) (_2!6081 lt!205096)))))

(declare-fun b!133109 () Bool)

(declare-fun res!110568 () Bool)

(assert (=> b!133109 (=> (not res!110568) (not e!88248))))

(assert (=> b!133109 (= res!110568 (isPrefixOf!0 (_1!6079 lt!205803) thiss!1634))))

(assert (= (and d!42386 c!7599) b!133106))

(assert (= (and d!42386 (not c!7599)) b!133105))

(assert (= (and d!42386 res!110569) b!133109))

(assert (= (and b!133109 res!110568) b!133108))

(assert (= (and b!133108 res!110567) b!133107))

(declare-fun m!201465 () Bool)

(assert (=> b!133109 m!201465))

(declare-fun m!201467 () Bool)

(assert (=> b!133107 m!201467))

(assert (=> b!133107 m!200883))

(assert (=> b!133107 m!200859))

(declare-fun m!201469 () Bool)

(assert (=> d!42386 m!201469))

(declare-fun m!201471 () Bool)

(assert (=> d!42386 m!201471))

(assert (=> d!42386 m!201421))

(declare-fun m!201473 () Bool)

(assert (=> d!42386 m!201473))

(declare-fun m!201475 () Bool)

(assert (=> d!42386 m!201475))

(declare-fun m!201477 () Bool)

(assert (=> d!42386 m!201477))

(assert (=> d!42386 m!200803))

(assert (=> d!42386 m!201381))

(assert (=> d!42386 m!201429))

(declare-fun m!201479 () Bool)

(assert (=> d!42386 m!201479))

(assert (=> d!42386 m!201387))

(assert (=> b!133106 m!200859))

(declare-fun m!201481 () Bool)

(assert (=> b!133106 m!201481))

(declare-fun m!201483 () Bool)

(assert (=> b!133106 m!201483))

(declare-fun m!201485 () Bool)

(assert (=> b!133108 m!201485))

(assert (=> b!132811 d!42386))

(declare-fun d!42388 () Bool)

(declare-fun e!88250 () Bool)

(assert (=> d!42388 e!88250))

(declare-fun res!110571 () Bool)

(assert (=> d!42388 (=> (not res!110571) (not e!88250))))

(declare-fun lt!205821 () (_ BitVec 64))

(declare-fun lt!205822 () (_ BitVec 64))

(declare-fun lt!205825 () (_ BitVec 64))

(assert (=> d!42388 (= res!110571 (= lt!205825 (bvsub lt!205822 lt!205821)))))

(assert (=> d!42388 (or (= (bvand lt!205822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205821 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205822 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205822 lt!205821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42388 (= lt!205821 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205098)))) ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205098))) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205098)))))))

(declare-fun lt!205820 () (_ BitVec 64))

(declare-fun lt!205823 () (_ BitVec 64))

(assert (=> d!42388 (= lt!205822 (bvmul lt!205820 lt!205823))))

(assert (=> d!42388 (or (= lt!205820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205823 (bvsdiv (bvmul lt!205820 lt!205823) lt!205820)))))

(assert (=> d!42388 (= lt!205823 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42388 (= lt!205820 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205098)))))))

(assert (=> d!42388 (= lt!205825 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205098))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205098)))))))

(assert (=> d!42388 (invariant!0 (currentBit!5924 (_1!6080 lt!205098)) (currentByte!5929 (_1!6080 lt!205098)) (size!2771 (buf!3144 (_1!6080 lt!205098))))))

(assert (=> d!42388 (= (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205098))) (currentByte!5929 (_1!6080 lt!205098)) (currentBit!5924 (_1!6080 lt!205098))) lt!205825)))

(declare-fun b!133110 () Bool)

(declare-fun res!110570 () Bool)

(assert (=> b!133110 (=> (not res!110570) (not e!88250))))

(assert (=> b!133110 (= res!110570 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205825))))

(declare-fun b!133111 () Bool)

(declare-fun lt!205824 () (_ BitVec 64))

(assert (=> b!133111 (= e!88250 (bvsle lt!205825 (bvmul lt!205824 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133111 (or (= lt!205824 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205824 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205824)))))

(assert (=> b!133111 (= lt!205824 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205098)))))))

(assert (= (and d!42388 res!110571) b!133110))

(assert (= (and b!133110 res!110570) b!133111))

(declare-fun m!201487 () Bool)

(assert (=> d!42388 m!201487))

(declare-fun m!201489 () Bool)

(assert (=> d!42388 m!201489))

(assert (=> b!132811 d!42388))

(declare-fun d!42390 () Bool)

(declare-fun lt!205826 () tuple2!11564)

(assert (=> d!42390 (= lt!205826 (readByte!0 lt!205078))))

(assert (=> d!42390 (= (readBytePure!0 lt!205078) (tuple2!11549 (_2!6090 lt!205826) (_1!6090 lt!205826)))))

(declare-fun bs!10363 () Bool)

(assert (= bs!10363 d!42390))

(declare-fun m!201491 () Bool)

(assert (=> bs!10363 m!201491))

(assert (=> b!132811 d!42390))

(declare-fun d!42392 () Bool)

(declare-fun res!110572 () Bool)

(declare-fun e!88251 () Bool)

(assert (=> d!42392 (=> res!110572 e!88251)))

(assert (=> d!42392 (= res!110572 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42392 (= (arrayRangesEq!174 (_2!6078 lt!205097) (_2!6078 lt!205084) #b00000000000000000000000000000000 to!404) e!88251)))

(declare-fun b!133112 () Bool)

(declare-fun e!88252 () Bool)

(assert (=> b!133112 (= e!88251 e!88252)))

(declare-fun res!110573 () Bool)

(assert (=> b!133112 (=> (not res!110573) (not e!88252))))

(assert (=> b!133112 (= res!110573 (= (select (arr!3406 (_2!6078 lt!205097)) #b00000000000000000000000000000000) (select (arr!3406 (_2!6078 lt!205084)) #b00000000000000000000000000000000)))))

(declare-fun b!133113 () Bool)

(assert (=> b!133113 (= e!88252 (arrayRangesEq!174 (_2!6078 lt!205097) (_2!6078 lt!205084) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42392 (not res!110572)) b!133112))

(assert (= (and b!133112 res!110573) b!133113))

(declare-fun m!201493 () Bool)

(assert (=> b!133112 m!201493))

(declare-fun m!201495 () Bool)

(assert (=> b!133112 m!201495))

(declare-fun m!201497 () Bool)

(assert (=> b!133113 m!201497))

(assert (=> b!132811 d!42392))

(declare-fun d!42394 () Bool)

(declare-fun e!88253 () Bool)

(assert (=> d!42394 e!88253))

(declare-fun res!110575 () Bool)

(assert (=> d!42394 (=> (not res!110575) (not e!88253))))

(declare-fun lt!205828 () (_ BitVec 64))

(declare-fun lt!205832 () (_ BitVec 64))

(declare-fun lt!205829 () (_ BitVec 64))

(assert (=> d!42394 (= res!110575 (= lt!205832 (bvsub lt!205829 lt!205828)))))

(assert (=> d!42394 (or (= (bvand lt!205829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205828 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205829 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205829 lt!205828) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42394 (= lt!205828 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205093)))) ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205093))) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205093)))))))

(declare-fun lt!205827 () (_ BitVec 64))

(declare-fun lt!205830 () (_ BitVec 64))

(assert (=> d!42394 (= lt!205829 (bvmul lt!205827 lt!205830))))

(assert (=> d!42394 (or (= lt!205827 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205830 (bvsdiv (bvmul lt!205827 lt!205830) lt!205827)))))

(assert (=> d!42394 (= lt!205830 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42394 (= lt!205827 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205093)))))))

(assert (=> d!42394 (= lt!205832 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205093))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205093)))))))

(assert (=> d!42394 (invariant!0 (currentBit!5924 (_1!6080 lt!205093)) (currentByte!5929 (_1!6080 lt!205093)) (size!2771 (buf!3144 (_1!6080 lt!205093))))))

(assert (=> d!42394 (= (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205093))) (currentByte!5929 (_1!6080 lt!205093)) (currentBit!5924 (_1!6080 lt!205093))) lt!205832)))

(declare-fun b!133114 () Bool)

(declare-fun res!110574 () Bool)

(assert (=> b!133114 (=> (not res!110574) (not e!88253))))

(assert (=> b!133114 (= res!110574 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205832))))

(declare-fun b!133115 () Bool)

(declare-fun lt!205831 () (_ BitVec 64))

(assert (=> b!133115 (= e!88253 (bvsle lt!205832 (bvmul lt!205831 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133115 (or (= lt!205831 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205831 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205831)))))

(assert (=> b!133115 (= lt!205831 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205093)))))))

(assert (= (and d!42394 res!110575) b!133114))

(assert (= (and b!133114 res!110574) b!133115))

(declare-fun m!201499 () Bool)

(assert (=> d!42394 m!201499))

(declare-fun m!201501 () Bool)

(assert (=> d!42394 m!201501))

(assert (=> b!132811 d!42394))

(declare-fun d!42396 () Bool)

(declare-fun lt!205833 () tuple2!11564)

(assert (=> d!42396 (= lt!205833 (readByte!0 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (=> d!42396 (= (readBytePure!0 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) (tuple2!11549 (_2!6090 lt!205833) (_1!6090 lt!205833)))))

(declare-fun bs!10364 () Bool)

(assert (= bs!10364 d!42396))

(declare-fun m!201503 () Bool)

(assert (=> bs!10364 m!201503))

(assert (=> b!132811 d!42396))

(declare-fun d!42398 () Bool)

(assert (=> d!42398 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!205836 () Unit!8174)

(declare-fun choose!26 (BitStream!4806 array!6120 (_ BitVec 32) BitStream!4806) Unit!8174)

(assert (=> d!42398 (= lt!205836 (choose!26 thiss!1634 (buf!3144 (_2!6081 lt!205096)) (bvsub to!404 from!447) (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (=> d!42398 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3144 (_2!6081 lt!205096)) (bvsub to!404 from!447)) lt!205836)))

(declare-fun bs!10365 () Bool)

(assert (= bs!10365 d!42398))

(assert (=> bs!10365 m!200823))

(declare-fun m!201505 () Bool)

(assert (=> bs!10365 m!201505))

(assert (=> b!132811 d!42398))

(declare-fun d!42400 () Bool)

(assert (=> d!42400 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205088)))

(declare-fun lt!205837 () Unit!8174)

(assert (=> d!42400 (= lt!205837 (choose!26 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205096)) lt!205088 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(assert (=> d!42400 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205096)) lt!205088) lt!205837)))

(declare-fun bs!10366 () Bool)

(assert (= bs!10366 d!42400))

(assert (=> bs!10366 m!200809))

(declare-fun m!201507 () Bool)

(assert (=> bs!10366 m!201507))

(assert (=> b!132811 d!42400))

(declare-fun d!42402 () Bool)

(assert (=> d!42402 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205088) (bvsle ((_ sign_extend 32) lt!205088) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10367 () Bool)

(assert (= bs!10367 d!42402))

(assert (=> bs!10367 m!201397))

(assert (=> b!132811 d!42402))

(declare-fun d!42404 () Bool)

(assert (=> d!42404 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10368 () Bool)

(assert (= bs!10368 d!42404))

(declare-fun m!201509 () Bool)

(assert (=> bs!10368 m!201509))

(assert (=> b!132811 d!42404))

(declare-fun d!42406 () Bool)

(declare-fun moveByteIndex!0 (BitStream!4806 (_ BitVec 32)) tuple2!11550)

(assert (=> d!42406 (= (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) (_2!6081 (moveByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001)))))

(declare-fun bs!10369 () Bool)

(assert (= bs!10369 d!42406))

(declare-fun m!201511 () Bool)

(assert (=> bs!10369 m!201511))

(assert (=> b!132811 d!42406))

(assert (=> b!132811 d!42361))

(declare-fun d!42408 () Bool)

(declare-fun e!88256 () Bool)

(assert (=> d!42408 e!88256))

(declare-fun res!110578 () Bool)

(assert (=> d!42408 (=> (not res!110578) (not e!88256))))

(declare-fun lt!205846 () tuple2!11548)

(declare-fun lt!205849 () tuple2!11548)

(assert (=> d!42408 (= res!110578 (= (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205846))) (currentByte!5929 (_1!6080 lt!205846)) (currentBit!5924 (_1!6080 lt!205846))) (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205849))) (currentByte!5929 (_1!6080 lt!205849)) (currentBit!5924 (_1!6080 lt!205849)))))))

(declare-fun lt!205848 () BitStream!4806)

(declare-fun lt!205847 () Unit!8174)

(declare-fun choose!14 (BitStream!4806 BitStream!4806 BitStream!4806 tuple2!11548 tuple2!11548 BitStream!4806 (_ BitVec 8) tuple2!11548 tuple2!11548 BitStream!4806 (_ BitVec 8)) Unit!8174)

(assert (=> d!42408 (= lt!205847 (choose!14 lt!205078 (_2!6081 lt!205096) lt!205848 lt!205846 (tuple2!11549 (_1!6080 lt!205846) (_2!6080 lt!205846)) (_1!6080 lt!205846) (_2!6080 lt!205846) lt!205849 (tuple2!11549 (_1!6080 lt!205849) (_2!6080 lt!205849)) (_1!6080 lt!205849) (_2!6080 lt!205849)))))

(assert (=> d!42408 (= lt!205849 (readBytePure!0 lt!205848))))

(assert (=> d!42408 (= lt!205846 (readBytePure!0 lt!205078))))

(assert (=> d!42408 (= lt!205848 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 lt!205078) (currentBit!5924 lt!205078)))))

(assert (=> d!42408 (= (readBytePrefixLemma!0 lt!205078 (_2!6081 lt!205096)) lt!205847)))

(declare-fun b!133118 () Bool)

(assert (=> b!133118 (= e!88256 (= (_2!6080 lt!205846) (_2!6080 lt!205849)))))

(assert (= (and d!42408 res!110578) b!133118))

(declare-fun m!201513 () Bool)

(assert (=> d!42408 m!201513))

(declare-fun m!201515 () Bool)

(assert (=> d!42408 m!201515))

(declare-fun m!201517 () Bool)

(assert (=> d!42408 m!201517))

(assert (=> d!42408 m!200835))

(declare-fun m!201519 () Bool)

(assert (=> d!42408 m!201519))

(assert (=> b!132811 d!42408))

(declare-fun b!133129 () Bool)

(declare-fun e!88264 () Bool)

(declare-fun e!88263 () Bool)

(assert (=> b!133129 (= e!88264 e!88263)))

(declare-fun res!110591 () Bool)

(assert (=> b!133129 (=> (not res!110591) (not e!88263))))

(declare-fun lt!205874 () tuple2!11544)

(declare-fun lt!205873 () tuple2!11546)

(assert (=> b!133129 (= res!110591 (and (= (size!2771 (_2!6078 lt!205874)) (size!2771 arr!237)) (= (_1!6078 lt!205874) (_2!6079 lt!205873))))))

(assert (=> b!133129 (= lt!205874 (readByteArrayLoopPure!0 (_1!6079 lt!205873) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!205870 () Unit!8174)

(declare-fun lt!205869 () Unit!8174)

(assert (=> b!133129 (= lt!205870 lt!205869)))

(declare-fun lt!205871 () tuple2!11550)

(declare-fun lt!205875 () (_ BitVec 64))

(assert (=> b!133129 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205871)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205875)))

(assert (=> b!133129 (= lt!205869 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205871)) lt!205875))))

(declare-fun e!88265 () Bool)

(assert (=> b!133129 e!88265))

(declare-fun res!110590 () Bool)

(assert (=> b!133129 (=> (not res!110590) (not e!88265))))

(assert (=> b!133129 (= res!110590 (and (= (size!2771 (buf!3144 (_2!6081 lt!205095))) (size!2771 (buf!3144 (_2!6081 lt!205871)))) (bvsge lt!205875 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133129 (= lt!205875 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133129 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133129 (= lt!205873 (reader!0 (_2!6081 lt!205095) (_2!6081 lt!205871)))))

(declare-fun d!42410 () Bool)

(assert (=> d!42410 e!88264))

(declare-fun res!110592 () Bool)

(assert (=> d!42410 (=> (not res!110592) (not e!88264))))

(assert (=> d!42410 (= res!110592 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) (size!2771 (buf!3144 (_2!6081 lt!205871)))))))

(declare-fun choose!64 (BitStream!4806 array!6120 (_ BitVec 32) (_ BitVec 32)) tuple2!11550)

(assert (=> d!42410 (= lt!205871 (choose!64 (_2!6081 lt!205095) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42410 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2771 arr!237)))))

(assert (=> d!42410 (= (appendByteArrayLoop!0 (_2!6081 lt!205095) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!205871)))

(declare-fun b!133130 () Bool)

(declare-fun res!110593 () Bool)

(assert (=> b!133130 (=> (not res!110593) (not e!88264))))

(assert (=> b!133130 (= res!110593 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205871)))))

(declare-fun b!133131 () Bool)

(assert (=> b!133131 (= e!88263 (arrayRangesEq!174 arr!237 (_2!6078 lt!205874) #b00000000000000000000000000000000 to!404))))

(declare-fun b!133132 () Bool)

(assert (=> b!133132 (= e!88265 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205875))))

(declare-fun b!133133 () Bool)

(declare-fun res!110589 () Bool)

(assert (=> b!133133 (=> (not res!110589) (not e!88264))))

(declare-fun lt!205872 () (_ BitVec 64))

(declare-fun lt!205868 () (_ BitVec 64))

(assert (=> b!133133 (= res!110589 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205871))) (currentByte!5929 (_2!6081 lt!205871)) (currentBit!5924 (_2!6081 lt!205871))) (bvadd lt!205868 lt!205872)))))

(assert (=> b!133133 (or (not (= (bvand lt!205868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205872 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!205868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!205868 lt!205872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!205876 () (_ BitVec 64))

(assert (=> b!133133 (= lt!205872 (bvmul lt!205876 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!133133 (or (= lt!205876 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205876 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205876)))))

(assert (=> b!133133 (= lt!205876 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133133 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!133133 (= lt!205868 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))))))

(assert (= (and d!42410 res!110592) b!133133))

(assert (= (and b!133133 res!110589) b!133130))

(assert (= (and b!133130 res!110593) b!133129))

(assert (= (and b!133129 res!110590) b!133132))

(assert (= (and b!133129 res!110591) b!133131))

(declare-fun m!201521 () Bool)

(assert (=> d!42410 m!201521))

(declare-fun m!201523 () Bool)

(assert (=> b!133132 m!201523))

(declare-fun m!201525 () Bool)

(assert (=> b!133133 m!201525))

(assert (=> b!133133 m!200857))

(declare-fun m!201527 () Bool)

(assert (=> b!133130 m!201527))

(declare-fun m!201529 () Bool)

(assert (=> b!133129 m!201529))

(declare-fun m!201531 () Bool)

(assert (=> b!133129 m!201531))

(declare-fun m!201533 () Bool)

(assert (=> b!133129 m!201533))

(declare-fun m!201535 () Bool)

(assert (=> b!133129 m!201535))

(declare-fun m!201537 () Bool)

(assert (=> b!133131 m!201537))

(assert (=> b!132811 d!42410))

(declare-fun d!42412 () Bool)

(declare-fun lt!205877 () tuple3!506)

(assert (=> d!42412 (= lt!205877 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) lt!205086 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42412 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) lt!205086 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11545 (_2!6091 lt!205877) (_3!308 lt!205877)))))

(declare-fun bs!10370 () Bool)

(assert (= bs!10370 d!42412))

(assert (=> bs!10370 m!200805))

(declare-fun m!201539 () Bool)

(assert (=> bs!10370 m!201539))

(assert (=> b!132811 d!42412))

(declare-fun d!42414 () Bool)

(declare-fun e!88268 () Bool)

(assert (=> d!42414 e!88268))

(declare-fun res!110600 () Bool)

(assert (=> d!42414 (=> (not res!110600) (not e!88268))))

(declare-fun lt!205891 () tuple2!11550)

(assert (=> d!42414 (= res!110600 (= (size!2771 (buf!3144 thiss!1634)) (size!2771 (buf!3144 (_2!6081 lt!205891)))))))

(declare-fun choose!6 (BitStream!4806 (_ BitVec 8)) tuple2!11550)

(assert (=> d!42414 (= lt!205891 (choose!6 thiss!1634 (select (arr!3406 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!42414 (validate_offset_byte!0 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634)))))

(assert (=> d!42414 (= (appendByte!0 thiss!1634 (select (arr!3406 arr!237) from!447)) lt!205891)))

(declare-fun b!133140 () Bool)

(declare-fun res!110601 () Bool)

(assert (=> b!133140 (=> (not res!110601) (not e!88268))))

(declare-fun lt!205889 () (_ BitVec 64))

(declare-fun lt!205890 () (_ BitVec 64))

(assert (=> b!133140 (= res!110601 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205891))) (currentByte!5929 (_2!6081 lt!205891)) (currentBit!5924 (_2!6081 lt!205891))) (bvadd lt!205890 lt!205889)))))

(assert (=> b!133140 (or (not (= (bvand lt!205890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205889 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!205890 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!205890 lt!205889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133140 (= lt!205889 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133140 (= lt!205890 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(declare-fun b!133141 () Bool)

(declare-fun res!110602 () Bool)

(assert (=> b!133141 (=> (not res!110602) (not e!88268))))

(assert (=> b!133141 (= res!110602 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205891)))))

(declare-fun b!133142 () Bool)

(declare-fun lt!205892 () tuple2!11546)

(declare-fun lt!205888 () tuple2!11548)

(assert (=> b!133142 (= e!88268 (and (= (_2!6080 lt!205888) (select (arr!3406 arr!237) from!447)) (= (_1!6080 lt!205888) (_2!6079 lt!205892))))))

(assert (=> b!133142 (= lt!205888 (readBytePure!0 (_1!6079 lt!205892)))))

(assert (=> b!133142 (= lt!205892 (reader!0 thiss!1634 (_2!6081 lt!205891)))))

(assert (= (and d!42414 res!110600) b!133140))

(assert (= (and b!133140 res!110601) b!133141))

(assert (= (and b!133141 res!110602) b!133142))

(assert (=> d!42414 m!200819))

(declare-fun m!201541 () Bool)

(assert (=> d!42414 m!201541))

(declare-fun m!201543 () Bool)

(assert (=> d!42414 m!201543))

(declare-fun m!201545 () Bool)

(assert (=> b!133140 m!201545))

(assert (=> b!133140 m!200859))

(declare-fun m!201547 () Bool)

(assert (=> b!133141 m!201547))

(declare-fun m!201549 () Bool)

(assert (=> b!133142 m!201549))

(declare-fun m!201551 () Bool)

(assert (=> b!133142 m!201551))

(assert (=> b!132811 d!42414))

(check-sat (not d!42408) (not b!133072) (not d!42390) (not d!42367) (not b!133107) (not b!133075) (not d!42382) (not b!133132) (not d!42384) (not d!42404) (not b!133074) (not b!133141) (not b!133140) (not d!42343) (not b!133099) (not b!133109) (not d!42379) (not b!133106) (not d!42369) (not b!133091) (not b!133133) (not d!42339) (not d!42361) (not b!133057) (not b!133101) (not d!42402) (not d!42396) (not b!133113) (not d!42355) (not b!133131) (not b!133077) (not b!133073) (not b!133071) (not d!42406) (not b!133095) (not d!42388) (not d!42410) (not d!42359) (not b!133142) (not d!42351) (not b!133096) (not b!133130) (not b!133093) (not b!133059) (not d!42373) (not d!42375) (not b!133104) (not d!42386) (not d!42398) (not d!42394) (not b!133094) (not b!133129) (not d!42400) (not d!42412) (not d!42341) (not d!42371) (not d!42349) (not b!133108) (not d!42414) (not d!42333) (not d!42357))
(check-sat)
(get-model)

(declare-fun d!42416 () Bool)

(declare-fun res!110605 () Bool)

(declare-fun e!88269 () Bool)

(assert (=> d!42416 (=> (not res!110605) (not e!88269))))

(assert (=> d!42416 (= res!110605 (= (size!2771 (buf!3144 (_2!6079 lt!205700))) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(assert (=> d!42416 (= (isPrefixOf!0 (_2!6079 lt!205700) (_2!6081 lt!205095)) e!88269)))

(declare-fun b!133143 () Bool)

(declare-fun res!110603 () Bool)

(assert (=> b!133143 (=> (not res!110603) (not e!88269))))

(assert (=> b!133143 (= res!110603 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205700))) (currentByte!5929 (_2!6079 lt!205700)) (currentBit!5924 (_2!6079 lt!205700))) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(declare-fun b!133144 () Bool)

(declare-fun e!88270 () Bool)

(assert (=> b!133144 (= e!88269 e!88270)))

(declare-fun res!110604 () Bool)

(assert (=> b!133144 (=> res!110604 e!88270)))

(assert (=> b!133144 (= res!110604 (= (size!2771 (buf!3144 (_2!6079 lt!205700))) #b00000000000000000000000000000000))))

(declare-fun b!133145 () Bool)

(assert (=> b!133145 (= e!88270 (arrayBitRangesEq!0 (buf!3144 (_2!6079 lt!205700)) (buf!3144 (_2!6081 lt!205095)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205700))) (currentByte!5929 (_2!6079 lt!205700)) (currentBit!5924 (_2!6079 lt!205700)))))))

(assert (= (and d!42416 res!110605) b!133143))

(assert (= (and b!133143 res!110603) b!133144))

(assert (= (and b!133144 (not res!110604)) b!133145))

(declare-fun m!201553 () Bool)

(assert (=> b!133143 m!201553))

(assert (=> b!133143 m!200857))

(assert (=> b!133145 m!201553))

(assert (=> b!133145 m!201553))

(declare-fun m!201555 () Bool)

(assert (=> b!133145 m!201555))

(assert (=> b!133073 d!42416))

(declare-fun d!42418 () Bool)

(declare-fun res!110617 () Bool)

(declare-fun e!88283 () Bool)

(assert (=> d!42418 (=> res!110617 e!88283)))

(assert (=> d!42418 (= res!110617 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (=> d!42418 (= (arrayBitRangesEq!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) e!88283)))

(declare-fun b!133160 () Bool)

(declare-fun e!88288 () Bool)

(declare-fun e!88284 () Bool)

(assert (=> b!133160 (= e!88288 e!88284)))

(declare-fun c!7602 () Bool)

(declare-datatypes ((tuple4!110 0))(
  ( (tuple4!111 (_1!6092 (_ BitVec 32)) (_2!6092 (_ BitVec 32)) (_3!309 (_ BitVec 32)) (_4!55 (_ BitVec 32))) )
))
(declare-fun lt!205899 () tuple4!110)

(assert (=> b!133160 (= c!7602 (= (_3!309 lt!205899) (_4!55 lt!205899)))))

(declare-fun b!133161 () Bool)

(declare-fun lt!205900 () (_ BitVec 32))

(declare-fun e!88286 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!133161 (= e!88286 (byteRangesEq!0 (select (arr!3406 (buf!3144 thiss!1634)) (_4!55 lt!205899)) (select (arr!3406 (buf!3144 (_2!6081 lt!205096))) (_4!55 lt!205899)) #b00000000000000000000000000000000 lt!205900))))

(declare-fun b!133162 () Bool)

(declare-fun e!88287 () Bool)

(assert (=> b!133162 (= e!88284 e!88287)))

(declare-fun res!110616 () Bool)

(declare-fun call!1666 () Bool)

(assert (=> b!133162 (= res!110616 call!1666)))

(assert (=> b!133162 (=> (not res!110616) (not e!88287))))

(declare-fun b!133163 () Bool)

(assert (=> b!133163 (= e!88283 e!88288)))

(declare-fun res!110618 () Bool)

(assert (=> b!133163 (=> (not res!110618) (not e!88288))))

(declare-fun e!88285 () Bool)

(assert (=> b!133163 (= res!110618 e!88285)))

(declare-fun res!110619 () Bool)

(assert (=> b!133163 (=> res!110619 e!88285)))

(assert (=> b!133163 (= res!110619 (bvsge (_1!6092 lt!205899) (_2!6092 lt!205899)))))

(assert (=> b!133163 (= lt!205900 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!205901 () (_ BitVec 32))

(assert (=> b!133163 (= lt!205901 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!110)

(assert (=> b!133163 (= lt!205899 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(declare-fun bm!1663 () Bool)

(assert (=> bm!1663 (= call!1666 (byteRangesEq!0 (select (arr!3406 (buf!3144 thiss!1634)) (_3!309 lt!205899)) (select (arr!3406 (buf!3144 (_2!6081 lt!205096))) (_3!309 lt!205899)) lt!205901 (ite c!7602 lt!205900 #b00000000000000000000000000001000)))))

(declare-fun b!133164 () Bool)

(assert (=> b!133164 (= e!88284 call!1666)))

(declare-fun b!133165 () Bool)

(declare-fun res!110620 () Bool)

(assert (=> b!133165 (= res!110620 (= lt!205900 #b00000000000000000000000000000000))))

(assert (=> b!133165 (=> res!110620 e!88286)))

(assert (=> b!133165 (= e!88287 e!88286)))

(declare-fun b!133166 () Bool)

(assert (=> b!133166 (= e!88285 (arrayRangesEq!174 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205096)) (_1!6092 lt!205899) (_2!6092 lt!205899)))))

(assert (= (and d!42418 (not res!110617)) b!133163))

(assert (= (and b!133163 (not res!110619)) b!133166))

(assert (= (and b!133163 res!110618) b!133160))

(assert (= (and b!133160 c!7602) b!133164))

(assert (= (and b!133160 (not c!7602)) b!133162))

(assert (= (and b!133162 res!110616) b!133165))

(assert (= (and b!133165 (not res!110620)) b!133161))

(assert (= (or b!133164 b!133162) bm!1663))

(declare-fun m!201557 () Bool)

(assert (=> b!133161 m!201557))

(declare-fun m!201559 () Bool)

(assert (=> b!133161 m!201559))

(assert (=> b!133161 m!201557))

(assert (=> b!133161 m!201559))

(declare-fun m!201561 () Bool)

(assert (=> b!133161 m!201561))

(assert (=> b!133163 m!200859))

(declare-fun m!201563 () Bool)

(assert (=> b!133163 m!201563))

(declare-fun m!201565 () Bool)

(assert (=> bm!1663 m!201565))

(declare-fun m!201567 () Bool)

(assert (=> bm!1663 m!201567))

(assert (=> bm!1663 m!201565))

(assert (=> bm!1663 m!201567))

(declare-fun m!201569 () Bool)

(assert (=> bm!1663 m!201569))

(declare-fun m!201571 () Bool)

(assert (=> b!133166 m!201571))

(assert (=> b!133101 d!42418))

(assert (=> b!133101 d!42351))

(assert (=> b!133099 d!42351))

(assert (=> b!133099 d!42367))

(declare-fun d!42420 () Bool)

(declare-fun lt!205920 () (_ BitVec 8))

(declare-fun lt!205921 () (_ BitVec 8))

(assert (=> d!42420 (= lt!205920 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3406 (buf!3144 (_1!6079 lt!205085))) (currentByte!5929 (_1!6079 lt!205085)))) ((_ sign_extend 24) lt!205921))))))

(assert (=> d!42420 (= lt!205921 ((_ extract 7 0) (currentBit!5924 (_1!6079 lt!205085))))))

(declare-fun e!88294 () Bool)

(assert (=> d!42420 e!88294))

(declare-fun res!110626 () Bool)

(assert (=> d!42420 (=> (not res!110626) (not e!88294))))

(assert (=> d!42420 (= res!110626 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6079 lt!205085)))) ((_ sign_extend 32) (currentByte!5929 (_1!6079 lt!205085))) ((_ sign_extend 32) (currentBit!5924 (_1!6079 lt!205085))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!11566 0))(
  ( (tuple2!11567 (_1!6093 Unit!8174) (_2!6093 (_ BitVec 8))) )
))
(declare-fun Unit!8187 () Unit!8174)

(declare-fun Unit!8188 () Unit!8174)

(assert (=> d!42420 (= (readByte!0 (_1!6079 lt!205085)) (tuple2!11565 (_2!6093 (ite (bvsgt ((_ sign_extend 24) lt!205921) #b00000000000000000000000000000000) (tuple2!11567 Unit!8187 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!205920) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3406 (buf!3144 (_1!6079 lt!205085))) (bvadd (currentByte!5929 (_1!6079 lt!205085)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!205921)))))))) (tuple2!11567 Unit!8188 lt!205920))) (BitStream!4807 (buf!3144 (_1!6079 lt!205085)) (bvadd (currentByte!5929 (_1!6079 lt!205085)) #b00000000000000000000000000000001) (currentBit!5924 (_1!6079 lt!205085)))))))

(declare-fun b!133171 () Bool)

(declare-fun e!88293 () Bool)

(assert (=> b!133171 (= e!88294 e!88293)))

(declare-fun res!110627 () Bool)

(assert (=> b!133171 (=> (not res!110627) (not e!88293))))

(declare-fun lt!205918 () tuple2!11564)

(assert (=> b!133171 (= res!110627 (= (buf!3144 (_2!6090 lt!205918)) (buf!3144 (_1!6079 lt!205085))))))

(declare-fun lt!205922 () (_ BitVec 8))

(declare-fun lt!205917 () (_ BitVec 8))

(declare-fun Unit!8189 () Unit!8174)

(declare-fun Unit!8190 () Unit!8174)

(assert (=> b!133171 (= lt!205918 (tuple2!11565 (_2!6093 (ite (bvsgt ((_ sign_extend 24) lt!205922) #b00000000000000000000000000000000) (tuple2!11567 Unit!8189 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!205917) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3406 (buf!3144 (_1!6079 lt!205085))) (bvadd (currentByte!5929 (_1!6079 lt!205085)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!205922)))))))) (tuple2!11567 Unit!8190 lt!205917))) (BitStream!4807 (buf!3144 (_1!6079 lt!205085)) (bvadd (currentByte!5929 (_1!6079 lt!205085)) #b00000000000000000000000000000001) (currentBit!5924 (_1!6079 lt!205085)))))))

(assert (=> b!133171 (= lt!205917 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3406 (buf!3144 (_1!6079 lt!205085))) (currentByte!5929 (_1!6079 lt!205085)))) ((_ sign_extend 24) lt!205922))))))

(assert (=> b!133171 (= lt!205922 ((_ extract 7 0) (currentBit!5924 (_1!6079 lt!205085))))))

(declare-fun lt!205916 () (_ BitVec 64))

(declare-fun lt!205919 () (_ BitVec 64))

(declare-fun b!133172 () Bool)

(assert (=> b!133172 (= e!88293 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!205918))) (currentByte!5929 (_2!6090 lt!205918)) (currentBit!5924 (_2!6090 lt!205918))) (bvadd lt!205919 lt!205916)))))

(assert (=> b!133172 (or (not (= (bvand lt!205919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205916 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!205919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!205919 lt!205916) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133172 (= lt!205916 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133172 (= lt!205919 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205085))) (currentByte!5929 (_1!6079 lt!205085)) (currentBit!5924 (_1!6079 lt!205085))))))

(assert (= (and d!42420 res!110626) b!133171))

(assert (= (and b!133171 res!110627) b!133172))

(declare-fun m!201573 () Bool)

(assert (=> d!42420 m!201573))

(declare-fun m!201575 () Bool)

(assert (=> d!42420 m!201575))

(declare-fun m!201577 () Bool)

(assert (=> d!42420 m!201577))

(assert (=> b!133171 m!201577))

(assert (=> b!133171 m!201573))

(declare-fun m!201579 () Bool)

(assert (=> b!133172 m!201579))

(declare-fun m!201581 () Bool)

(assert (=> b!133172 m!201581))

(assert (=> d!42341 d!42420))

(declare-fun d!42422 () Bool)

(assert (=> d!42422 (= (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205098)))) ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205098))) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205098)))) (bvsub (bvmul ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205098)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205098))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205098))))))))

(assert (=> d!42388 d!42422))

(declare-fun d!42424 () Bool)

(assert (=> d!42424 (= (invariant!0 (currentBit!5924 (_1!6080 lt!205098)) (currentByte!5929 (_1!6080 lt!205098)) (size!2771 (buf!3144 (_1!6080 lt!205098)))) (and (bvsge (currentBit!5924 (_1!6080 lt!205098)) #b00000000000000000000000000000000) (bvslt (currentBit!5924 (_1!6080 lt!205098)) #b00000000000000000000000000001000) (bvsge (currentByte!5929 (_1!6080 lt!205098)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5929 (_1!6080 lt!205098)) (size!2771 (buf!3144 (_1!6080 lt!205098)))) (and (= (currentBit!5924 (_1!6080 lt!205098)) #b00000000000000000000000000000000) (= (currentByte!5929 (_1!6080 lt!205098)) (size!2771 (buf!3144 (_1!6080 lt!205098))))))))))

(assert (=> d!42388 d!42424))

(assert (=> b!133071 d!42351))

(declare-fun d!42426 () Bool)

(assert (=> d!42426 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 thiss!1634) lt!205711 lt!205704)))

(declare-fun lt!205925 () Unit!8174)

(declare-fun choose!8 (array!6120 array!6120 (_ BitVec 64) (_ BitVec 64)) Unit!8174)

(assert (=> d!42426 (= lt!205925 (choose!8 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205095)) lt!205711 lt!205704))))

(assert (=> d!42426 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205711) (bvsle lt!205711 lt!205704))))

(assert (=> d!42426 (= (arrayBitRangesEqSymmetric!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205095)) lt!205711 lt!205704) lt!205925)))

(declare-fun bs!10371 () Bool)

(assert (= bs!10371 d!42426))

(assert (=> bs!10371 m!201391))

(declare-fun m!201583 () Bool)

(assert (=> bs!10371 m!201583))

(assert (=> b!133071 d!42426))

(declare-fun d!42428 () Bool)

(declare-fun res!110629 () Bool)

(declare-fun e!88295 () Bool)

(assert (=> d!42428 (=> res!110629 e!88295)))

(assert (=> d!42428 (= res!110629 (bvsge lt!205711 lt!205704))))

(assert (=> d!42428 (= (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 thiss!1634) lt!205711 lt!205704) e!88295)))

(declare-fun b!133173 () Bool)

(declare-fun e!88300 () Bool)

(declare-fun e!88296 () Bool)

(assert (=> b!133173 (= e!88300 e!88296)))

(declare-fun c!7603 () Bool)

(declare-fun lt!205926 () tuple4!110)

(assert (=> b!133173 (= c!7603 (= (_3!309 lt!205926) (_4!55 lt!205926)))))

(declare-fun b!133174 () Bool)

(declare-fun e!88298 () Bool)

(declare-fun lt!205927 () (_ BitVec 32))

(assert (=> b!133174 (= e!88298 (byteRangesEq!0 (select (arr!3406 (buf!3144 (_2!6081 lt!205095))) (_4!55 lt!205926)) (select (arr!3406 (buf!3144 thiss!1634)) (_4!55 lt!205926)) #b00000000000000000000000000000000 lt!205927))))

(declare-fun b!133175 () Bool)

(declare-fun e!88299 () Bool)

(assert (=> b!133175 (= e!88296 e!88299)))

(declare-fun res!110628 () Bool)

(declare-fun call!1667 () Bool)

(assert (=> b!133175 (= res!110628 call!1667)))

(assert (=> b!133175 (=> (not res!110628) (not e!88299))))

(declare-fun b!133176 () Bool)

(assert (=> b!133176 (= e!88295 e!88300)))

(declare-fun res!110630 () Bool)

(assert (=> b!133176 (=> (not res!110630) (not e!88300))))

(declare-fun e!88297 () Bool)

(assert (=> b!133176 (= res!110630 e!88297)))

(declare-fun res!110631 () Bool)

(assert (=> b!133176 (=> res!110631 e!88297)))

(assert (=> b!133176 (= res!110631 (bvsge (_1!6092 lt!205926) (_2!6092 lt!205926)))))

(assert (=> b!133176 (= lt!205927 ((_ extract 31 0) (bvsrem lt!205704 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!205928 () (_ BitVec 32))

(assert (=> b!133176 (= lt!205928 ((_ extract 31 0) (bvsrem lt!205711 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133176 (= lt!205926 (arrayBitIndices!0 lt!205711 lt!205704))))

(declare-fun bm!1664 () Bool)

(assert (=> bm!1664 (= call!1667 (byteRangesEq!0 (select (arr!3406 (buf!3144 (_2!6081 lt!205095))) (_3!309 lt!205926)) (select (arr!3406 (buf!3144 thiss!1634)) (_3!309 lt!205926)) lt!205928 (ite c!7603 lt!205927 #b00000000000000000000000000001000)))))

(declare-fun b!133177 () Bool)

(assert (=> b!133177 (= e!88296 call!1667)))

(declare-fun b!133178 () Bool)

(declare-fun res!110632 () Bool)

(assert (=> b!133178 (= res!110632 (= lt!205927 #b00000000000000000000000000000000))))

(assert (=> b!133178 (=> res!110632 e!88298)))

(assert (=> b!133178 (= e!88299 e!88298)))

(declare-fun b!133179 () Bool)

(assert (=> b!133179 (= e!88297 (arrayRangesEq!174 (buf!3144 (_2!6081 lt!205095)) (buf!3144 thiss!1634) (_1!6092 lt!205926) (_2!6092 lt!205926)))))

(assert (= (and d!42428 (not res!110629)) b!133176))

(assert (= (and b!133176 (not res!110631)) b!133179))

(assert (= (and b!133176 res!110630) b!133173))

(assert (= (and b!133173 c!7603) b!133177))

(assert (= (and b!133173 (not c!7603)) b!133175))

(assert (= (and b!133175 res!110628) b!133178))

(assert (= (and b!133178 (not res!110632)) b!133174))

(assert (= (or b!133177 b!133175) bm!1664))

(declare-fun m!201585 () Bool)

(assert (=> b!133174 m!201585))

(declare-fun m!201587 () Bool)

(assert (=> b!133174 m!201587))

(assert (=> b!133174 m!201585))

(assert (=> b!133174 m!201587))

(declare-fun m!201589 () Bool)

(assert (=> b!133174 m!201589))

(declare-fun m!201591 () Bool)

(assert (=> b!133176 m!201591))

(declare-fun m!201593 () Bool)

(assert (=> bm!1664 m!201593))

(declare-fun m!201595 () Bool)

(assert (=> bm!1664 m!201595))

(assert (=> bm!1664 m!201593))

(assert (=> bm!1664 m!201595))

(declare-fun m!201597 () Bool)

(assert (=> bm!1664 m!201597))

(declare-fun m!201599 () Bool)

(assert (=> b!133179 m!201599))

(assert (=> b!133071 d!42428))

(declare-fun d!42430 () Bool)

(declare-fun res!110635 () Bool)

(declare-fun e!88301 () Bool)

(assert (=> d!42430 (=> (not res!110635) (not e!88301))))

(assert (=> d!42430 (= res!110635 (= (size!2771 (buf!3144 (_1!6079 lt!205750))) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(assert (=> d!42430 (= (isPrefixOf!0 (_1!6079 lt!205750) (_2!6081 lt!205095)) e!88301)))

(declare-fun b!133180 () Bool)

(declare-fun res!110633 () Bool)

(assert (=> b!133180 (=> (not res!110633) (not e!88301))))

(assert (=> b!133180 (= res!110633 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205750))) (currentByte!5929 (_1!6079 lt!205750)) (currentBit!5924 (_1!6079 lt!205750))) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(declare-fun b!133181 () Bool)

(declare-fun e!88302 () Bool)

(assert (=> b!133181 (= e!88301 e!88302)))

(declare-fun res!110634 () Bool)

(assert (=> b!133181 (=> res!110634 e!88302)))

(assert (=> b!133181 (= res!110634 (= (size!2771 (buf!3144 (_1!6079 lt!205750))) #b00000000000000000000000000000000))))

(declare-fun b!133182 () Bool)

(assert (=> b!133182 (= e!88302 (arrayBitRangesEq!0 (buf!3144 (_1!6079 lt!205750)) (buf!3144 (_2!6081 lt!205095)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205750))) (currentByte!5929 (_1!6079 lt!205750)) (currentBit!5924 (_1!6079 lt!205750)))))))

(assert (= (and d!42430 res!110635) b!133180))

(assert (= (and b!133180 res!110633) b!133181))

(assert (= (and b!133181 (not res!110634)) b!133182))

(declare-fun m!201601 () Bool)

(assert (=> b!133180 m!201601))

(assert (=> b!133180 m!200857))

(assert (=> b!133182 m!201601))

(assert (=> b!133182 m!201601))

(declare-fun m!201603 () Bool)

(assert (=> b!133182 m!201603))

(assert (=> b!133096 d!42430))

(declare-fun d!42432 () Bool)

(assert (=> d!42432 (= (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))) (bvsub (bvmul ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))))))))

(assert (=> d!42357 d!42432))

(declare-fun d!42434 () Bool)

(declare-fun res!110637 () Bool)

(declare-fun e!88303 () Bool)

(assert (=> d!42434 (=> res!110637 e!88303)))

(assert (=> d!42434 (= res!110637 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (=> d!42434 (= (arrayBitRangesEq!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205095)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) e!88303)))

(declare-fun b!133183 () Bool)

(declare-fun e!88308 () Bool)

(declare-fun e!88304 () Bool)

(assert (=> b!133183 (= e!88308 e!88304)))

(declare-fun c!7604 () Bool)

(declare-fun lt!205929 () tuple4!110)

(assert (=> b!133183 (= c!7604 (= (_3!309 lt!205929) (_4!55 lt!205929)))))

(declare-fun lt!205930 () (_ BitVec 32))

(declare-fun e!88306 () Bool)

(declare-fun b!133184 () Bool)

(assert (=> b!133184 (= e!88306 (byteRangesEq!0 (select (arr!3406 (buf!3144 thiss!1634)) (_4!55 lt!205929)) (select (arr!3406 (buf!3144 (_2!6081 lt!205095))) (_4!55 lt!205929)) #b00000000000000000000000000000000 lt!205930))))

(declare-fun b!133185 () Bool)

(declare-fun e!88307 () Bool)

(assert (=> b!133185 (= e!88304 e!88307)))

(declare-fun res!110636 () Bool)

(declare-fun call!1668 () Bool)

(assert (=> b!133185 (= res!110636 call!1668)))

(assert (=> b!133185 (=> (not res!110636) (not e!88307))))

(declare-fun b!133186 () Bool)

(assert (=> b!133186 (= e!88303 e!88308)))

(declare-fun res!110638 () Bool)

(assert (=> b!133186 (=> (not res!110638) (not e!88308))))

(declare-fun e!88305 () Bool)

(assert (=> b!133186 (= res!110638 e!88305)))

(declare-fun res!110639 () Bool)

(assert (=> b!133186 (=> res!110639 e!88305)))

(assert (=> b!133186 (= res!110639 (bvsge (_1!6092 lt!205929) (_2!6092 lt!205929)))))

(assert (=> b!133186 (= lt!205930 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!205931 () (_ BitVec 32))

(assert (=> b!133186 (= lt!205931 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133186 (= lt!205929 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(declare-fun bm!1665 () Bool)

(assert (=> bm!1665 (= call!1668 (byteRangesEq!0 (select (arr!3406 (buf!3144 thiss!1634)) (_3!309 lt!205929)) (select (arr!3406 (buf!3144 (_2!6081 lt!205095))) (_3!309 lt!205929)) lt!205931 (ite c!7604 lt!205930 #b00000000000000000000000000001000)))))

(declare-fun b!133187 () Bool)

(assert (=> b!133187 (= e!88304 call!1668)))

(declare-fun b!133188 () Bool)

(declare-fun res!110640 () Bool)

(assert (=> b!133188 (= res!110640 (= lt!205930 #b00000000000000000000000000000000))))

(assert (=> b!133188 (=> res!110640 e!88306)))

(assert (=> b!133188 (= e!88307 e!88306)))

(declare-fun b!133189 () Bool)

(assert (=> b!133189 (= e!88305 (arrayRangesEq!174 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205095)) (_1!6092 lt!205929) (_2!6092 lt!205929)))))

(assert (= (and d!42434 (not res!110637)) b!133186))

(assert (= (and b!133186 (not res!110639)) b!133189))

(assert (= (and b!133186 res!110638) b!133183))

(assert (= (and b!133183 c!7604) b!133187))

(assert (= (and b!133183 (not c!7604)) b!133185))

(assert (= (and b!133185 res!110636) b!133188))

(assert (= (and b!133188 (not res!110640)) b!133184))

(assert (= (or b!133187 b!133185) bm!1665))

(declare-fun m!201605 () Bool)

(assert (=> b!133184 m!201605))

(declare-fun m!201607 () Bool)

(assert (=> b!133184 m!201607))

(assert (=> b!133184 m!201605))

(assert (=> b!133184 m!201607))

(declare-fun m!201609 () Bool)

(assert (=> b!133184 m!201609))

(assert (=> b!133186 m!200859))

(assert (=> b!133186 m!201563))

(declare-fun m!201611 () Bool)

(assert (=> bm!1665 m!201611))

(declare-fun m!201613 () Bool)

(assert (=> bm!1665 m!201613))

(assert (=> bm!1665 m!201611))

(assert (=> bm!1665 m!201613))

(declare-fun m!201615 () Bool)

(assert (=> bm!1665 m!201615))

(declare-fun m!201617 () Bool)

(assert (=> b!133189 m!201617))

(assert (=> b!133059 d!42434))

(assert (=> b!133059 d!42351))

(declare-fun lt!205932 () tuple3!506)

(declare-fun d!42436 () Bool)

(assert (=> d!42436 (= lt!205932 (readByteArrayLoop!0 (_1!6079 lt!205873) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42436 (= (readByteArrayLoopPure!0 (_1!6079 lt!205873) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11545 (_2!6091 lt!205932) (_3!308 lt!205932)))))

(declare-fun bs!10372 () Bool)

(assert (= bs!10372 d!42436))

(declare-fun m!201619 () Bool)

(assert (=> bs!10372 m!201619))

(assert (=> b!133129 d!42436))

(declare-fun d!42438 () Bool)

(assert (=> d!42438 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205871)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205875) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205871)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))) lt!205875))))

(declare-fun bs!10373 () Bool)

(assert (= bs!10373 d!42438))

(declare-fun m!201621 () Bool)

(assert (=> bs!10373 m!201621))

(assert (=> b!133129 d!42438))

(declare-fun d!42440 () Bool)

(assert (=> d!42440 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205871)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205875)))

(declare-fun lt!205933 () Unit!8174)

(assert (=> d!42440 (= lt!205933 (choose!9 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205871)) lt!205875 (BitStream!4807 (buf!3144 (_2!6081 lt!205871)) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(assert (=> d!42440 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205871)) lt!205875) lt!205933)))

(declare-fun bs!10374 () Bool)

(assert (= bs!10374 d!42440))

(assert (=> bs!10374 m!201531))

(declare-fun m!201623 () Bool)

(assert (=> bs!10374 m!201623))

(assert (=> b!133129 d!42440))

(declare-fun b!133190 () Bool)

(declare-fun e!88310 () Unit!8174)

(declare-fun Unit!8191 () Unit!8174)

(assert (=> b!133190 (= e!88310 Unit!8191)))

(declare-fun b!133191 () Bool)

(declare-fun lt!205938 () Unit!8174)

(assert (=> b!133191 (= e!88310 lt!205938)))

(declare-fun lt!205948 () (_ BitVec 64))

(assert (=> b!133191 (= lt!205948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!205941 () (_ BitVec 64))

(assert (=> b!133191 (= lt!205941 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))))))

(assert (=> b!133191 (= lt!205938 (arrayBitRangesEqSymmetric!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205871)) lt!205948 lt!205941))))

(assert (=> b!133191 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205871)) (buf!3144 (_2!6081 lt!205095)) lt!205948 lt!205941)))

(declare-fun d!42442 () Bool)

(declare-fun e!88309 () Bool)

(assert (=> d!42442 e!88309))

(declare-fun res!110643 () Bool)

(assert (=> d!42442 (=> (not res!110643) (not e!88309))))

(declare-fun lt!205937 () tuple2!11546)

(assert (=> d!42442 (= res!110643 (isPrefixOf!0 (_1!6079 lt!205937) (_2!6079 lt!205937)))))

(declare-fun lt!205934 () BitStream!4806)

(assert (=> d!42442 (= lt!205937 (tuple2!11547 lt!205934 (_2!6081 lt!205871)))))

(declare-fun lt!205944 () Unit!8174)

(declare-fun lt!205943 () Unit!8174)

(assert (=> d!42442 (= lt!205944 lt!205943)))

(assert (=> d!42442 (isPrefixOf!0 lt!205934 (_2!6081 lt!205871))))

(assert (=> d!42442 (= lt!205943 (lemmaIsPrefixTransitive!0 lt!205934 (_2!6081 lt!205871) (_2!6081 lt!205871)))))

(declare-fun lt!205946 () Unit!8174)

(declare-fun lt!205950 () Unit!8174)

(assert (=> d!42442 (= lt!205946 lt!205950)))

(assert (=> d!42442 (isPrefixOf!0 lt!205934 (_2!6081 lt!205871))))

(assert (=> d!42442 (= lt!205950 (lemmaIsPrefixTransitive!0 lt!205934 (_2!6081 lt!205095) (_2!6081 lt!205871)))))

(declare-fun lt!205935 () Unit!8174)

(assert (=> d!42442 (= lt!205935 e!88310)))

(declare-fun c!7605 () Bool)

(assert (=> d!42442 (= c!7605 (not (= (size!2771 (buf!3144 (_2!6081 lt!205095))) #b00000000000000000000000000000000)))))

(declare-fun lt!205942 () Unit!8174)

(declare-fun lt!205951 () Unit!8174)

(assert (=> d!42442 (= lt!205942 lt!205951)))

(assert (=> d!42442 (isPrefixOf!0 (_2!6081 lt!205871) (_2!6081 lt!205871))))

(assert (=> d!42442 (= lt!205951 (lemmaIsPrefixRefl!0 (_2!6081 lt!205871)))))

(declare-fun lt!205936 () Unit!8174)

(declare-fun lt!205939 () Unit!8174)

(assert (=> d!42442 (= lt!205936 lt!205939)))

(assert (=> d!42442 (= lt!205939 (lemmaIsPrefixRefl!0 (_2!6081 lt!205871)))))

(declare-fun lt!205952 () Unit!8174)

(declare-fun lt!205953 () Unit!8174)

(assert (=> d!42442 (= lt!205952 lt!205953)))

(assert (=> d!42442 (isPrefixOf!0 lt!205934 lt!205934)))

(assert (=> d!42442 (= lt!205953 (lemmaIsPrefixRefl!0 lt!205934))))

(declare-fun lt!205940 () Unit!8174)

(declare-fun lt!205947 () Unit!8174)

(assert (=> d!42442 (= lt!205940 lt!205947)))

(assert (=> d!42442 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205095))))

(assert (=> d!42442 (= lt!205947 (lemmaIsPrefixRefl!0 (_2!6081 lt!205095)))))

(assert (=> d!42442 (= lt!205934 (BitStream!4807 (buf!3144 (_2!6081 lt!205871)) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))))))

(assert (=> d!42442 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205871))))

(assert (=> d!42442 (= (reader!0 (_2!6081 lt!205095) (_2!6081 lt!205871)) lt!205937)))

(declare-fun lt!205949 () (_ BitVec 64))

(declare-fun lt!205945 () (_ BitVec 64))

(declare-fun b!133192 () Bool)

(assert (=> b!133192 (= e!88309 (= (_1!6079 lt!205937) (withMovedBitIndex!0 (_2!6079 lt!205937) (bvsub lt!205945 lt!205949))))))

(assert (=> b!133192 (or (= (bvand lt!205945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205945 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205945 lt!205949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133192 (= lt!205949 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205871))) (currentByte!5929 (_2!6081 lt!205871)) (currentBit!5924 (_2!6081 lt!205871))))))

(assert (=> b!133192 (= lt!205945 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))))))

(declare-fun b!133193 () Bool)

(declare-fun res!110641 () Bool)

(assert (=> b!133193 (=> (not res!110641) (not e!88309))))

(assert (=> b!133193 (= res!110641 (isPrefixOf!0 (_2!6079 lt!205937) (_2!6081 lt!205871)))))

(declare-fun b!133194 () Bool)

(declare-fun res!110642 () Bool)

(assert (=> b!133194 (=> (not res!110642) (not e!88309))))

(assert (=> b!133194 (= res!110642 (isPrefixOf!0 (_1!6079 lt!205937) (_2!6081 lt!205095)))))

(assert (= (and d!42442 c!7605) b!133191))

(assert (= (and d!42442 (not c!7605)) b!133190))

(assert (= (and d!42442 res!110643) b!133194))

(assert (= (and b!133194 res!110642) b!133193))

(assert (= (and b!133193 res!110641) b!133192))

(declare-fun m!201625 () Bool)

(assert (=> b!133194 m!201625))

(declare-fun m!201627 () Bool)

(assert (=> b!133192 m!201627))

(assert (=> b!133192 m!201525))

(assert (=> b!133192 m!200857))

(declare-fun m!201629 () Bool)

(assert (=> d!42442 m!201629))

(declare-fun m!201631 () Bool)

(assert (=> d!42442 m!201631))

(declare-fun m!201633 () Bool)

(assert (=> d!42442 m!201633))

(declare-fun m!201635 () Bool)

(assert (=> d!42442 m!201635))

(declare-fun m!201637 () Bool)

(assert (=> d!42442 m!201637))

(declare-fun m!201639 () Bool)

(assert (=> d!42442 m!201639))

(assert (=> d!42442 m!201527))

(assert (=> d!42442 m!201373))

(declare-fun m!201641 () Bool)

(assert (=> d!42442 m!201641))

(declare-fun m!201643 () Bool)

(assert (=> d!42442 m!201643))

(assert (=> d!42442 m!201383))

(assert (=> b!133191 m!200857))

(declare-fun m!201645 () Bool)

(assert (=> b!133191 m!201645))

(declare-fun m!201647 () Bool)

(assert (=> b!133191 m!201647))

(declare-fun m!201649 () Bool)

(assert (=> b!133193 m!201649))

(assert (=> b!133129 d!42442))

(declare-fun d!42444 () Bool)

(declare-fun res!110646 () Bool)

(declare-fun e!88311 () Bool)

(assert (=> d!42444 (=> (not res!110646) (not e!88311))))

(assert (=> d!42444 (= res!110646 (= (size!2771 (buf!3144 lt!205800)) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (=> d!42444 (= (isPrefixOf!0 lt!205800 (_2!6081 lt!205096)) e!88311)))

(declare-fun b!133195 () Bool)

(declare-fun res!110644 () Bool)

(assert (=> b!133195 (=> (not res!110644) (not e!88311))))

(assert (=> b!133195 (= res!110644 (bvsle (bitIndex!0 (size!2771 (buf!3144 lt!205800)) (currentByte!5929 lt!205800) (currentBit!5924 lt!205800)) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096)))))))

(declare-fun b!133196 () Bool)

(declare-fun e!88312 () Bool)

(assert (=> b!133196 (= e!88311 e!88312)))

(declare-fun res!110645 () Bool)

(assert (=> b!133196 (=> res!110645 e!88312)))

(assert (=> b!133196 (= res!110645 (= (size!2771 (buf!3144 lt!205800)) #b00000000000000000000000000000000))))

(declare-fun b!133197 () Bool)

(assert (=> b!133197 (= e!88312 (arrayBitRangesEq!0 (buf!3144 lt!205800) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 lt!205800)) (currentByte!5929 lt!205800) (currentBit!5924 lt!205800))))))

(assert (= (and d!42444 res!110646) b!133195))

(assert (= (and b!133195 res!110644) b!133196))

(assert (= (and b!133196 (not res!110645)) b!133197))

(declare-fun m!201651 () Bool)

(assert (=> b!133195 m!201651))

(assert (=> b!133195 m!200883))

(assert (=> b!133197 m!201651))

(assert (=> b!133197 m!201651))

(declare-fun m!201653 () Bool)

(assert (=> b!133197 m!201653))

(assert (=> d!42386 d!42444))

(declare-fun d!42446 () Bool)

(declare-fun res!110649 () Bool)

(declare-fun e!88313 () Bool)

(assert (=> d!42446 (=> (not res!110649) (not e!88313))))

(assert (=> d!42446 (= res!110649 (= (size!2771 (buf!3144 lt!205800)) (size!2771 (buf!3144 lt!205800))))))

(assert (=> d!42446 (= (isPrefixOf!0 lt!205800 lt!205800) e!88313)))

(declare-fun b!133198 () Bool)

(declare-fun res!110647 () Bool)

(assert (=> b!133198 (=> (not res!110647) (not e!88313))))

(assert (=> b!133198 (= res!110647 (bvsle (bitIndex!0 (size!2771 (buf!3144 lt!205800)) (currentByte!5929 lt!205800) (currentBit!5924 lt!205800)) (bitIndex!0 (size!2771 (buf!3144 lt!205800)) (currentByte!5929 lt!205800) (currentBit!5924 lt!205800))))))

(declare-fun b!133199 () Bool)

(declare-fun e!88314 () Bool)

(assert (=> b!133199 (= e!88313 e!88314)))

(declare-fun res!110648 () Bool)

(assert (=> b!133199 (=> res!110648 e!88314)))

(assert (=> b!133199 (= res!110648 (= (size!2771 (buf!3144 lt!205800)) #b00000000000000000000000000000000))))

(declare-fun b!133200 () Bool)

(assert (=> b!133200 (= e!88314 (arrayBitRangesEq!0 (buf!3144 lt!205800) (buf!3144 lt!205800) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 lt!205800)) (currentByte!5929 lt!205800) (currentBit!5924 lt!205800))))))

(assert (= (and d!42446 res!110649) b!133198))

(assert (= (and b!133198 res!110647) b!133199))

(assert (= (and b!133199 (not res!110648)) b!133200))

(assert (=> b!133198 m!201651))

(assert (=> b!133198 m!201651))

(assert (=> b!133200 m!201651))

(assert (=> b!133200 m!201651))

(declare-fun m!201655 () Bool)

(assert (=> b!133200 m!201655))

(assert (=> d!42386 d!42446))

(assert (=> d!42386 d!42377))

(declare-fun d!42448 () Bool)

(assert (=> d!42448 (isPrefixOf!0 lt!205800 (_2!6081 lt!205096))))

(declare-fun lt!205954 () Unit!8174)

(assert (=> d!42448 (= lt!205954 (choose!30 lt!205800 (_2!6081 lt!205096) (_2!6081 lt!205096)))))

(assert (=> d!42448 (isPrefixOf!0 lt!205800 (_2!6081 lt!205096))))

(assert (=> d!42448 (= (lemmaIsPrefixTransitive!0 lt!205800 (_2!6081 lt!205096) (_2!6081 lt!205096)) lt!205954)))

(declare-fun bs!10375 () Bool)

(assert (= bs!10375 d!42448))

(assert (=> bs!10375 m!201471))

(declare-fun m!201657 () Bool)

(assert (=> bs!10375 m!201657))

(assert (=> bs!10375 m!201471))

(assert (=> d!42386 d!42448))

(declare-fun d!42450 () Bool)

(declare-fun res!110652 () Bool)

(declare-fun e!88315 () Bool)

(assert (=> d!42450 (=> (not res!110652) (not e!88315))))

(assert (=> d!42450 (= res!110652 (= (size!2771 (buf!3144 (_1!6079 lt!205803))) (size!2771 (buf!3144 (_2!6079 lt!205803)))))))

(assert (=> d!42450 (= (isPrefixOf!0 (_1!6079 lt!205803) (_2!6079 lt!205803)) e!88315)))

(declare-fun b!133201 () Bool)

(declare-fun res!110650 () Bool)

(assert (=> b!133201 (=> (not res!110650) (not e!88315))))

(assert (=> b!133201 (= res!110650 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205803))) (currentByte!5929 (_1!6079 lt!205803)) (currentBit!5924 (_1!6079 lt!205803))) (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205803))) (currentByte!5929 (_2!6079 lt!205803)) (currentBit!5924 (_2!6079 lt!205803)))))))

(declare-fun b!133202 () Bool)

(declare-fun e!88316 () Bool)

(assert (=> b!133202 (= e!88315 e!88316)))

(declare-fun res!110651 () Bool)

(assert (=> b!133202 (=> res!110651 e!88316)))

(assert (=> b!133202 (= res!110651 (= (size!2771 (buf!3144 (_1!6079 lt!205803))) #b00000000000000000000000000000000))))

(declare-fun b!133203 () Bool)

(assert (=> b!133203 (= e!88316 (arrayBitRangesEq!0 (buf!3144 (_1!6079 lt!205803)) (buf!3144 (_2!6079 lt!205803)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205803))) (currentByte!5929 (_1!6079 lt!205803)) (currentBit!5924 (_1!6079 lt!205803)))))))

(assert (= (and d!42450 res!110652) b!133201))

(assert (= (and b!133201 res!110650) b!133202))

(assert (= (and b!133202 (not res!110651)) b!133203))

(declare-fun m!201659 () Bool)

(assert (=> b!133201 m!201659))

(declare-fun m!201661 () Bool)

(assert (=> b!133201 m!201661))

(assert (=> b!133203 m!201659))

(assert (=> b!133203 m!201659))

(declare-fun m!201663 () Bool)

(assert (=> b!133203 m!201663))

(assert (=> d!42386 d!42450))

(declare-fun d!42452 () Bool)

(assert (=> d!42452 (isPrefixOf!0 lt!205800 (_2!6081 lt!205096))))

(declare-fun lt!205955 () Unit!8174)

(assert (=> d!42452 (= lt!205955 (choose!30 lt!205800 thiss!1634 (_2!6081 lt!205096)))))

(assert (=> d!42452 (isPrefixOf!0 lt!205800 thiss!1634)))

(assert (=> d!42452 (= (lemmaIsPrefixTransitive!0 lt!205800 thiss!1634 (_2!6081 lt!205096)) lt!205955)))

(declare-fun bs!10376 () Bool)

(assert (= bs!10376 d!42452))

(assert (=> bs!10376 m!201471))

(declare-fun m!201665 () Bool)

(assert (=> bs!10376 m!201665))

(declare-fun m!201667 () Bool)

(assert (=> bs!10376 m!201667))

(assert (=> d!42386 d!42452))

(declare-fun d!42454 () Bool)

(declare-fun res!110655 () Bool)

(declare-fun e!88317 () Bool)

(assert (=> d!42454 (=> (not res!110655) (not e!88317))))

(assert (=> d!42454 (= res!110655 (= (size!2771 (buf!3144 (_2!6081 lt!205096))) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (=> d!42454 (= (isPrefixOf!0 (_2!6081 lt!205096) (_2!6081 lt!205096)) e!88317)))

(declare-fun b!133204 () Bool)

(declare-fun res!110653 () Bool)

(assert (=> b!133204 (=> (not res!110653) (not e!88317))))

(assert (=> b!133204 (= res!110653 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096))) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096)))))))

(declare-fun b!133205 () Bool)

(declare-fun e!88318 () Bool)

(assert (=> b!133205 (= e!88317 e!88318)))

(declare-fun res!110654 () Bool)

(assert (=> b!133205 (=> res!110654 e!88318)))

(assert (=> b!133205 (= res!110654 (= (size!2771 (buf!3144 (_2!6081 lt!205096))) #b00000000000000000000000000000000))))

(declare-fun b!133206 () Bool)

(assert (=> b!133206 (= e!88318 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205096)) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096)))))))

(assert (= (and d!42454 res!110655) b!133204))

(assert (= (and b!133204 res!110653) b!133205))

(assert (= (and b!133205 (not res!110654)) b!133206))

(assert (=> b!133204 m!200883))

(assert (=> b!133204 m!200883))

(assert (=> b!133206 m!200883))

(assert (=> b!133206 m!200883))

(declare-fun m!201669 () Bool)

(assert (=> b!133206 m!201669))

(assert (=> d!42386 d!42454))

(declare-fun d!42456 () Bool)

(assert (=> d!42456 (isPrefixOf!0 (_2!6081 lt!205096) (_2!6081 lt!205096))))

(declare-fun lt!205958 () Unit!8174)

(declare-fun choose!11 (BitStream!4806) Unit!8174)

(assert (=> d!42456 (= lt!205958 (choose!11 (_2!6081 lt!205096)))))

(assert (=> d!42456 (= (lemmaIsPrefixRefl!0 (_2!6081 lt!205096)) lt!205958)))

(declare-fun bs!10378 () Bool)

(assert (= bs!10378 d!42456))

(assert (=> bs!10378 m!201429))

(declare-fun m!201671 () Bool)

(assert (=> bs!10378 m!201671))

(assert (=> d!42386 d!42456))

(declare-fun d!42458 () Bool)

(assert (=> d!42458 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!205959 () Unit!8174)

(assert (=> d!42458 (= lt!205959 (choose!11 thiss!1634))))

(assert (=> d!42458 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!205959)))

(declare-fun bs!10379 () Bool)

(assert (= bs!10379 d!42458))

(assert (=> bs!10379 m!201387))

(declare-fun m!201673 () Bool)

(assert (=> bs!10379 m!201673))

(assert (=> d!42386 d!42458))

(declare-fun d!42460 () Bool)

(declare-fun res!110658 () Bool)

(declare-fun e!88319 () Bool)

(assert (=> d!42460 (=> (not res!110658) (not e!88319))))

(assert (=> d!42460 (= res!110658 (= (size!2771 (buf!3144 thiss!1634)) (size!2771 (buf!3144 thiss!1634))))))

(assert (=> d!42460 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!88319)))

(declare-fun b!133207 () Bool)

(declare-fun res!110656 () Bool)

(assert (=> b!133207 (=> (not res!110656) (not e!88319))))

(assert (=> b!133207 (= res!110656 (bvsle (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)) (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(declare-fun b!133208 () Bool)

(declare-fun e!88320 () Bool)

(assert (=> b!133208 (= e!88319 e!88320)))

(declare-fun res!110657 () Bool)

(assert (=> b!133208 (=> res!110657 e!88320)))

(assert (=> b!133208 (= res!110657 (= (size!2771 (buf!3144 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133209 () Bool)

(assert (=> b!133209 (= e!88320 (arrayBitRangesEq!0 (buf!3144 thiss!1634) (buf!3144 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (= (and d!42460 res!110658) b!133207))

(assert (= (and b!133207 res!110656) b!133208))

(assert (= (and b!133208 (not res!110657)) b!133209))

(assert (=> b!133207 m!200859))

(assert (=> b!133207 m!200859))

(assert (=> b!133209 m!200859))

(assert (=> b!133209 m!200859))

(declare-fun m!201675 () Bool)

(assert (=> b!133209 m!201675))

(assert (=> d!42386 d!42460))

(declare-fun d!42462 () Bool)

(assert (=> d!42462 (isPrefixOf!0 lt!205800 lt!205800)))

(declare-fun lt!205960 () Unit!8174)

(assert (=> d!42462 (= lt!205960 (choose!11 lt!205800))))

(assert (=> d!42462 (= (lemmaIsPrefixRefl!0 lt!205800) lt!205960)))

(declare-fun bs!10380 () Bool)

(assert (= bs!10380 d!42462))

(assert (=> bs!10380 m!201479))

(declare-fun m!201677 () Bool)

(assert (=> bs!10380 m!201677))

(assert (=> d!42386 d!42462))

(assert (=> b!133057 d!42351))

(assert (=> b!133057 d!42349))

(declare-fun d!42464 () Bool)

(declare-fun res!110659 () Bool)

(declare-fun e!88321 () Bool)

(assert (=> d!42464 (=> res!110659 e!88321)))

(assert (=> d!42464 (= res!110659 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42464 (= (arrayRangesEq!174 arr!237 (_2!6078 lt!205874) #b00000000000000000000000000000000 to!404) e!88321)))

(declare-fun b!133210 () Bool)

(declare-fun e!88322 () Bool)

(assert (=> b!133210 (= e!88321 e!88322)))

(declare-fun res!110660 () Bool)

(assert (=> b!133210 (=> (not res!110660) (not e!88322))))

(assert (=> b!133210 (= res!110660 (= (select (arr!3406 arr!237) #b00000000000000000000000000000000) (select (arr!3406 (_2!6078 lt!205874)) #b00000000000000000000000000000000)))))

(declare-fun b!133211 () Bool)

(assert (=> b!133211 (= e!88322 (arrayRangesEq!174 arr!237 (_2!6078 lt!205874) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42464 (not res!110659)) b!133210))

(assert (= (and b!133210 res!110660) b!133211))

(assert (=> b!133210 m!201401))

(declare-fun m!201679 () Bool)

(assert (=> b!133210 m!201679))

(declare-fun m!201681 () Bool)

(assert (=> b!133211 m!201681))

(assert (=> b!133131 d!42464))

(assert (=> d!42400 d!42384))

(declare-fun d!42466 () Bool)

(assert (=> d!42466 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205088)))

(assert (=> d!42466 true))

(declare-fun _$5!28 () Unit!8174)

(assert (=> d!42466 (= (choose!26 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205096)) lt!205088 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))) _$5!28)))

(declare-fun bs!10381 () Bool)

(assert (= bs!10381 d!42466))

(assert (=> bs!10381 m!200809))

(assert (=> d!42400 d!42466))

(declare-fun d!42468 () Bool)

(declare-fun res!110661 () Bool)

(declare-fun e!88323 () Bool)

(assert (=> d!42468 (=> res!110661 e!88323)))

(assert (=> d!42468 (= res!110661 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42468 (= (arrayRangesEq!174 (_2!6078 lt!205097) (_2!6078 lt!205084) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!88323)))

(declare-fun b!133212 () Bool)

(declare-fun e!88324 () Bool)

(assert (=> b!133212 (= e!88323 e!88324)))

(declare-fun res!110662 () Bool)

(assert (=> b!133212 (=> (not res!110662) (not e!88324))))

(assert (=> b!133212 (= res!110662 (= (select (arr!3406 (_2!6078 lt!205097)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3406 (_2!6078 lt!205084)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!133213 () Bool)

(assert (=> b!133213 (= e!88324 (arrayRangesEq!174 (_2!6078 lt!205097) (_2!6078 lt!205084) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42468 (not res!110661)) b!133212))

(assert (= (and b!133212 res!110662) b!133213))

(declare-fun m!201683 () Bool)

(assert (=> b!133212 m!201683))

(declare-fun m!201685 () Bool)

(assert (=> b!133212 m!201685))

(declare-fun m!201687 () Bool)

(assert (=> b!133213 m!201687))

(assert (=> b!133113 d!42468))

(declare-fun d!42470 () Bool)

(assert (=> d!42470 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!42470 true))

(declare-fun _$7!46 () Unit!8174)

(assert (=> d!42470 (= (choose!57 thiss!1634 (_2!6081 lt!205095) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!46)))

(declare-fun bs!10382 () Bool)

(assert (= bs!10382 d!42470))

(declare-fun m!201689 () Bool)

(assert (=> bs!10382 m!201689))

(assert (=> d!42379 d!42470))

(declare-fun d!42472 () Bool)

(assert (=> d!42472 (= (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 thiss!1634)))))))

(assert (=> d!42351 d!42472))

(assert (=> d!42351 d!42365))

(declare-fun d!42474 () Bool)

(declare-fun res!110665 () Bool)

(declare-fun e!88325 () Bool)

(assert (=> d!42474 (=> (not res!110665) (not e!88325))))

(assert (=> d!42474 (= res!110665 (= (size!2771 (buf!3144 thiss!1634)) (size!2771 (buf!3144 (_2!6081 lt!205891)))))))

(assert (=> d!42474 (= (isPrefixOf!0 thiss!1634 (_2!6081 lt!205891)) e!88325)))

(declare-fun b!133214 () Bool)

(declare-fun res!110663 () Bool)

(assert (=> b!133214 (=> (not res!110663) (not e!88325))))

(assert (=> b!133214 (= res!110663 (bvsle (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205891))) (currentByte!5929 (_2!6081 lt!205891)) (currentBit!5924 (_2!6081 lt!205891)))))))

(declare-fun b!133215 () Bool)

(declare-fun e!88326 () Bool)

(assert (=> b!133215 (= e!88325 e!88326)))

(declare-fun res!110664 () Bool)

(assert (=> b!133215 (=> res!110664 e!88326)))

(assert (=> b!133215 (= res!110664 (= (size!2771 (buf!3144 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!133216 () Bool)

(assert (=> b!133216 (= e!88326 (arrayBitRangesEq!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205891)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(assert (= (and d!42474 res!110665) b!133214))

(assert (= (and b!133214 res!110663) b!133215))

(assert (= (and b!133215 (not res!110664)) b!133216))

(assert (=> b!133214 m!200859))

(assert (=> b!133214 m!201545))

(assert (=> b!133216 m!200859))

(assert (=> b!133216 m!200859))

(declare-fun m!201691 () Bool)

(assert (=> b!133216 m!201691))

(assert (=> b!133141 d!42474))

(declare-fun d!42476 () Bool)

(assert (=> d!42476 (= (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))) (bvsub (bvmul ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))))))))

(assert (=> d!42349 d!42476))

(declare-fun d!42478 () Bool)

(assert (=> d!42478 (= (invariant!0 (currentBit!5924 (_2!6081 lt!205095)) (currentByte!5929 (_2!6081 lt!205095)) (size!2771 (buf!3144 (_2!6081 lt!205095)))) (and (bvsge (currentBit!5924 (_2!6081 lt!205095)) #b00000000000000000000000000000000) (bvslt (currentBit!5924 (_2!6081 lt!205095)) #b00000000000000000000000000001000) (bvsge (currentByte!5929 (_2!6081 lt!205095)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5929 (_2!6081 lt!205095)) (size!2771 (buf!3144 (_2!6081 lt!205095)))) (and (= (currentBit!5924 (_2!6081 lt!205095)) #b00000000000000000000000000000000) (= (currentByte!5929 (_2!6081 lt!205095)) (size!2771 (buf!3144 (_2!6081 lt!205095))))))))))

(assert (=> d!42349 d!42478))

(declare-fun d!42480 () Bool)

(declare-fun lt!205965 () (_ BitVec 8))

(declare-fun lt!205966 () (_ BitVec 8))

(assert (=> d!42480 (= lt!205965 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3406 (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))) (currentByte!5929 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))) ((_ sign_extend 24) lt!205966))))))

(assert (=> d!42480 (= lt!205966 ((_ extract 7 0) (currentBit!5924 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))))

(declare-fun e!88328 () Bool)

(assert (=> d!42480 e!88328))

(declare-fun res!110666 () Bool)

(assert (=> d!42480 (=> (not res!110666) (not e!88328))))

(assert (=> d!42480 (= res!110666 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))) ((_ sign_extend 32) (currentByte!5929 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))) ((_ sign_extend 32) (currentBit!5924 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8192 () Unit!8174)

(declare-fun Unit!8193 () Unit!8174)

(assert (=> d!42480 (= (readByte!0 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) (tuple2!11565 (_2!6093 (ite (bvsgt ((_ sign_extend 24) lt!205966) #b00000000000000000000000000000000) (tuple2!11567 Unit!8192 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!205965) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3406 (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))) (bvadd (currentByte!5929 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!205966)))))))) (tuple2!11567 Unit!8193 lt!205965))) (BitStream!4807 (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) (bvadd (currentByte!5929 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5924 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))))

(declare-fun b!133217 () Bool)

(declare-fun e!88327 () Bool)

(assert (=> b!133217 (= e!88328 e!88327)))

(declare-fun res!110667 () Bool)

(assert (=> b!133217 (=> (not res!110667) (not e!88327))))

(declare-fun lt!205963 () tuple2!11564)

(assert (=> b!133217 (= res!110667 (= (buf!3144 (_2!6090 lt!205963)) (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))))

(declare-fun lt!205962 () (_ BitVec 8))

(declare-fun lt!205967 () (_ BitVec 8))

(declare-fun Unit!8194 () Unit!8174)

(declare-fun Unit!8195 () Unit!8174)

(assert (=> b!133217 (= lt!205963 (tuple2!11565 (_2!6093 (ite (bvsgt ((_ sign_extend 24) lt!205967) #b00000000000000000000000000000000) (tuple2!11567 Unit!8194 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!205962) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3406 (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))) (bvadd (currentByte!5929 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!205967)))))))) (tuple2!11567 Unit!8195 lt!205962))) (BitStream!4807 (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) (bvadd (currentByte!5929 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) #b00000000000000000000000000000001) (currentBit!5924 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))))

(assert (=> b!133217 (= lt!205962 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3406 (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))) (currentByte!5929 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))) ((_ sign_extend 24) lt!205967))))))

(assert (=> b!133217 (= lt!205967 ((_ extract 7 0) (currentBit!5924 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))))

(declare-fun b!133218 () Bool)

(declare-fun lt!205961 () (_ BitVec 64))

(declare-fun lt!205964 () (_ BitVec 64))

(assert (=> b!133218 (= e!88327 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!205963))) (currentByte!5929 (_2!6090 lt!205963)) (currentBit!5924 (_2!6090 lt!205963))) (bvadd lt!205964 lt!205961)))))

(assert (=> b!133218 (or (not (= (bvand lt!205964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205961 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!205964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!205964 lt!205961) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133218 (= lt!205961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133218 (= lt!205964 (bitIndex!0 (size!2771 (buf!3144 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))) (currentByte!5929 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) (currentBit!5924 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))))

(assert (= (and d!42480 res!110666) b!133217))

(assert (= (and b!133217 res!110667) b!133218))

(declare-fun m!201693 () Bool)

(assert (=> d!42480 m!201693))

(declare-fun m!201695 () Bool)

(assert (=> d!42480 m!201695))

(declare-fun m!201697 () Bool)

(assert (=> d!42480 m!201697))

(assert (=> b!133217 m!201697))

(assert (=> b!133217 m!201693))

(declare-fun m!201699 () Bool)

(assert (=> b!133218 m!201699))

(declare-fun m!201701 () Bool)

(assert (=> b!133218 m!201701))

(assert (=> d!42396 d!42480))

(declare-fun d!42482 () Bool)

(declare-fun e!88329 () Bool)

(assert (=> d!42482 e!88329))

(declare-fun res!110669 () Bool)

(assert (=> d!42482 (=> (not res!110669) (not e!88329))))

(declare-fun lt!205970 () (_ BitVec 64))

(declare-fun lt!205973 () (_ BitVec 64))

(declare-fun lt!205969 () (_ BitVec 64))

(assert (=> d!42482 (= res!110669 (= lt!205973 (bvsub lt!205970 lt!205969)))))

(assert (=> d!42482 (or (= (bvand lt!205970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205970 lt!205969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42482 (= lt!205969 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205871)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205871))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205871)))))))

(declare-fun lt!205968 () (_ BitVec 64))

(declare-fun lt!205971 () (_ BitVec 64))

(assert (=> d!42482 (= lt!205970 (bvmul lt!205968 lt!205971))))

(assert (=> d!42482 (or (= lt!205968 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205971 (bvsdiv (bvmul lt!205968 lt!205971) lt!205968)))))

(assert (=> d!42482 (= lt!205971 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42482 (= lt!205968 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205871)))))))

(assert (=> d!42482 (= lt!205973 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205871))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205871)))))))

(assert (=> d!42482 (invariant!0 (currentBit!5924 (_2!6081 lt!205871)) (currentByte!5929 (_2!6081 lt!205871)) (size!2771 (buf!3144 (_2!6081 lt!205871))))))

(assert (=> d!42482 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205871))) (currentByte!5929 (_2!6081 lt!205871)) (currentBit!5924 (_2!6081 lt!205871))) lt!205973)))

(declare-fun b!133219 () Bool)

(declare-fun res!110668 () Bool)

(assert (=> b!133219 (=> (not res!110668) (not e!88329))))

(assert (=> b!133219 (= res!110668 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205973))))

(declare-fun b!133220 () Bool)

(declare-fun lt!205972 () (_ BitVec 64))

(assert (=> b!133220 (= e!88329 (bvsle lt!205973 (bvmul lt!205972 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133220 (or (= lt!205972 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205972 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205972)))))

(assert (=> b!133220 (= lt!205972 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205871)))))))

(assert (= (and d!42482 res!110669) b!133219))

(assert (= (and b!133219 res!110668) b!133220))

(declare-fun m!201703 () Bool)

(assert (=> d!42482 m!201703))

(declare-fun m!201705 () Bool)

(assert (=> d!42482 m!201705))

(assert (=> b!133133 d!42482))

(assert (=> b!133133 d!42349))

(declare-fun d!42484 () Bool)

(declare-fun e!88330 () Bool)

(assert (=> d!42484 e!88330))

(declare-fun res!110671 () Bool)

(assert (=> d!42484 (=> (not res!110671) (not e!88330))))

(declare-fun lt!205975 () (_ BitVec 64))

(declare-fun lt!205979 () (_ BitVec 64))

(declare-fun lt!205976 () (_ BitVec 64))

(assert (=> d!42484 (= res!110671 (= lt!205979 (bvsub lt!205976 lt!205975)))))

(assert (=> d!42484 (or (= (bvand lt!205976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205975 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205976 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205976 lt!205975) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42484 (= lt!205975 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205846)))) ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205846))) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205846)))))))

(declare-fun lt!205974 () (_ BitVec 64))

(declare-fun lt!205977 () (_ BitVec 64))

(assert (=> d!42484 (= lt!205976 (bvmul lt!205974 lt!205977))))

(assert (=> d!42484 (or (= lt!205974 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205977 (bvsdiv (bvmul lt!205974 lt!205977) lt!205974)))))

(assert (=> d!42484 (= lt!205977 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42484 (= lt!205974 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205846)))))))

(assert (=> d!42484 (= lt!205979 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205846))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205846)))))))

(assert (=> d!42484 (invariant!0 (currentBit!5924 (_1!6080 lt!205846)) (currentByte!5929 (_1!6080 lt!205846)) (size!2771 (buf!3144 (_1!6080 lt!205846))))))

(assert (=> d!42484 (= (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205846))) (currentByte!5929 (_1!6080 lt!205846)) (currentBit!5924 (_1!6080 lt!205846))) lt!205979)))

(declare-fun b!133221 () Bool)

(declare-fun res!110670 () Bool)

(assert (=> b!133221 (=> (not res!110670) (not e!88330))))

(assert (=> b!133221 (= res!110670 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205979))))

(declare-fun b!133222 () Bool)

(declare-fun lt!205978 () (_ BitVec 64))

(assert (=> b!133222 (= e!88330 (bvsle lt!205979 (bvmul lt!205978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133222 (or (= lt!205978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205978)))))

(assert (=> b!133222 (= lt!205978 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205846)))))))

(assert (= (and d!42484 res!110671) b!133221))

(assert (= (and b!133221 res!110670) b!133222))

(declare-fun m!201707 () Bool)

(assert (=> d!42484 m!201707))

(declare-fun m!201709 () Bool)

(assert (=> d!42484 m!201709))

(assert (=> d!42408 d!42484))

(declare-fun d!42486 () Bool)

(declare-fun lt!205980 () tuple2!11564)

(assert (=> d!42486 (= lt!205980 (readByte!0 lt!205848))))

(assert (=> d!42486 (= (readBytePure!0 lt!205848) (tuple2!11549 (_2!6090 lt!205980) (_1!6090 lt!205980)))))

(declare-fun bs!10383 () Bool)

(assert (= bs!10383 d!42486))

(declare-fun m!201711 () Bool)

(assert (=> bs!10383 m!201711))

(assert (=> d!42408 d!42486))

(declare-fun d!42488 () Bool)

(declare-fun e!88331 () Bool)

(assert (=> d!42488 e!88331))

(declare-fun res!110673 () Bool)

(assert (=> d!42488 (=> (not res!110673) (not e!88331))))

(declare-fun lt!205986 () (_ BitVec 64))

(declare-fun lt!205982 () (_ BitVec 64))

(declare-fun lt!205983 () (_ BitVec 64))

(assert (=> d!42488 (= res!110673 (= lt!205986 (bvsub lt!205983 lt!205982)))))

(assert (=> d!42488 (or (= (bvand lt!205983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!205982 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!205983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205983 lt!205982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42488 (= lt!205982 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205849)))) ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205849))) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205849)))))))

(declare-fun lt!205981 () (_ BitVec 64))

(declare-fun lt!205984 () (_ BitVec 64))

(assert (=> d!42488 (= lt!205983 (bvmul lt!205981 lt!205984))))

(assert (=> d!42488 (or (= lt!205981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!205984 (bvsdiv (bvmul lt!205981 lt!205984) lt!205981)))))

(assert (=> d!42488 (= lt!205984 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42488 (= lt!205981 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205849)))))))

(assert (=> d!42488 (= lt!205986 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205849))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205849)))))))

(assert (=> d!42488 (invariant!0 (currentBit!5924 (_1!6080 lt!205849)) (currentByte!5929 (_1!6080 lt!205849)) (size!2771 (buf!3144 (_1!6080 lt!205849))))))

(assert (=> d!42488 (= (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205849))) (currentByte!5929 (_1!6080 lt!205849)) (currentBit!5924 (_1!6080 lt!205849))) lt!205986)))

(declare-fun b!133223 () Bool)

(declare-fun res!110672 () Bool)

(assert (=> b!133223 (=> (not res!110672) (not e!88331))))

(assert (=> b!133223 (= res!110672 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205986))))

(declare-fun b!133224 () Bool)

(declare-fun lt!205985 () (_ BitVec 64))

(assert (=> b!133224 (= e!88331 (bvsle lt!205986 (bvmul lt!205985 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133224 (or (= lt!205985 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!205985 #b0000000000000000000000000000000000000000000000000000000000001000) lt!205985)))))

(assert (=> b!133224 (= lt!205985 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205849)))))))

(assert (= (and d!42488 res!110673) b!133223))

(assert (= (and b!133223 res!110672) b!133224))

(declare-fun m!201713 () Bool)

(assert (=> d!42488 m!201713))

(declare-fun m!201715 () Bool)

(assert (=> d!42488 m!201715))

(assert (=> d!42408 d!42488))

(declare-fun d!42490 () Bool)

(declare-fun e!88334 () Bool)

(assert (=> d!42490 e!88334))

(declare-fun res!110676 () Bool)

(assert (=> d!42490 (=> (not res!110676) (not e!88334))))

(declare-fun lt!205991 () tuple2!11548)

(declare-fun lt!205992 () tuple2!11548)

(assert (=> d!42490 (= res!110676 (= (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205991))) (currentByte!5929 (_1!6080 lt!205991)) (currentBit!5924 (_1!6080 lt!205991))) (bitIndex!0 (size!2771 (buf!3144 (_1!6080 lt!205992))) (currentByte!5929 (_1!6080 lt!205992)) (currentBit!5924 (_1!6080 lt!205992)))))))

(assert (=> d!42490 (= lt!205992 (readBytePure!0 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 lt!205078) (currentBit!5924 lt!205078))))))

(assert (=> d!42490 (= lt!205991 (readBytePure!0 lt!205078))))

(assert (=> d!42490 true))

(declare-fun _$8!54 () Unit!8174)

(assert (=> d!42490 (= (choose!14 lt!205078 (_2!6081 lt!205096) lt!205848 lt!205846 (tuple2!11549 (_1!6080 lt!205846) (_2!6080 lt!205846)) (_1!6080 lt!205846) (_2!6080 lt!205846) lt!205849 (tuple2!11549 (_1!6080 lt!205849) (_2!6080 lt!205849)) (_1!6080 lt!205849) (_2!6080 lt!205849)) _$8!54)))

(declare-fun b!133227 () Bool)

(assert (=> b!133227 (= e!88334 (= (_2!6080 lt!205991) (_2!6080 lt!205992)))))

(assert (= (and d!42490 res!110676) b!133227))

(declare-fun m!201717 () Bool)

(assert (=> d!42490 m!201717))

(declare-fun m!201719 () Bool)

(assert (=> d!42490 m!201719))

(declare-fun m!201721 () Bool)

(assert (=> d!42490 m!201721))

(assert (=> d!42490 m!200835))

(assert (=> d!42408 d!42490))

(assert (=> d!42408 d!42390))

(declare-fun d!42492 () Bool)

(declare-fun res!110679 () Bool)

(declare-fun e!88335 () Bool)

(assert (=> d!42492 (=> (not res!110679) (not e!88335))))

(assert (=> d!42492 (= res!110679 (= (size!2771 (buf!3144 (_1!6079 lt!205803))) (size!2771 (buf!3144 thiss!1634))))))

(assert (=> d!42492 (= (isPrefixOf!0 (_1!6079 lt!205803) thiss!1634) e!88335)))

(declare-fun b!133228 () Bool)

(declare-fun res!110677 () Bool)

(assert (=> b!133228 (=> (not res!110677) (not e!88335))))

(assert (=> b!133228 (= res!110677 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205803))) (currentByte!5929 (_1!6079 lt!205803)) (currentBit!5924 (_1!6079 lt!205803))) (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(declare-fun b!133229 () Bool)

(declare-fun e!88336 () Bool)

(assert (=> b!133229 (= e!88335 e!88336)))

(declare-fun res!110678 () Bool)

(assert (=> b!133229 (=> res!110678 e!88336)))

(assert (=> b!133229 (= res!110678 (= (size!2771 (buf!3144 (_1!6079 lt!205803))) #b00000000000000000000000000000000))))

(declare-fun b!133230 () Bool)

(assert (=> b!133230 (= e!88336 (arrayBitRangesEq!0 (buf!3144 (_1!6079 lt!205803)) (buf!3144 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205803))) (currentByte!5929 (_1!6079 lt!205803)) (currentBit!5924 (_1!6079 lt!205803)))))))

(assert (= (and d!42492 res!110679) b!133228))

(assert (= (and b!133228 res!110677) b!133229))

(assert (= (and b!133229 (not res!110678)) b!133230))

(assert (=> b!133228 m!201659))

(assert (=> b!133228 m!200859))

(assert (=> b!133230 m!201659))

(assert (=> b!133230 m!201659))

(declare-fun m!201723 () Bool)

(assert (=> b!133230 m!201723))

(assert (=> b!133109 d!42492))

(declare-fun d!42494 () Bool)

(declare-fun res!110682 () Bool)

(declare-fun e!88337 () Bool)

(assert (=> d!42494 (=> (not res!110682) (not e!88337))))

(assert (=> d!42494 (= res!110682 (= (size!2771 (buf!3144 (_2!6079 lt!205750))) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (=> d!42494 (= (isPrefixOf!0 (_2!6079 lt!205750) (_2!6081 lt!205096)) e!88337)))

(declare-fun b!133231 () Bool)

(declare-fun res!110680 () Bool)

(assert (=> b!133231 (=> (not res!110680) (not e!88337))))

(assert (=> b!133231 (= res!110680 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205750))) (currentByte!5929 (_2!6079 lt!205750)) (currentBit!5924 (_2!6079 lt!205750))) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096)))))))

(declare-fun b!133232 () Bool)

(declare-fun e!88338 () Bool)

(assert (=> b!133232 (= e!88337 e!88338)))

(declare-fun res!110681 () Bool)

(assert (=> b!133232 (=> res!110681 e!88338)))

(assert (=> b!133232 (= res!110681 (= (size!2771 (buf!3144 (_2!6079 lt!205750))) #b00000000000000000000000000000000))))

(declare-fun b!133233 () Bool)

(assert (=> b!133233 (= e!88338 (arrayBitRangesEq!0 (buf!3144 (_2!6079 lt!205750)) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205750))) (currentByte!5929 (_2!6079 lt!205750)) (currentBit!5924 (_2!6079 lt!205750)))))))

(assert (= (and d!42494 res!110682) b!133231))

(assert (= (and b!133231 res!110680) b!133232))

(assert (= (and b!133232 (not res!110681)) b!133233))

(declare-fun m!201725 () Bool)

(assert (=> b!133231 m!201725))

(assert (=> b!133231 m!200883))

(assert (=> b!133233 m!201725))

(assert (=> b!133233 m!201725))

(declare-fun m!201727 () Bool)

(assert (=> b!133233 m!201727))

(assert (=> b!133095 d!42494))

(assert (=> d!42398 d!42404))

(declare-fun d!42496 () Bool)

(assert (=> d!42496 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!42496 true))

(declare-fun _$5!29 () Unit!8174)

(assert (=> d!42496 (= (choose!26 thiss!1634 (buf!3144 (_2!6081 lt!205096)) (bvsub to!404 from!447) (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))) _$5!29)))

(declare-fun bs!10384 () Bool)

(assert (= bs!10384 d!42496))

(assert (=> bs!10384 m!200823))

(assert (=> d!42398 d!42496))

(assert (=> b!133093 d!42349))

(declare-fun d!42498 () Bool)

(assert (=> d!42498 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205096)) (buf!3144 (_2!6081 lt!205095)) lt!205761 lt!205754)))

(declare-fun lt!205993 () Unit!8174)

(assert (=> d!42498 (= lt!205993 (choose!8 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205096)) lt!205761 lt!205754))))

(assert (=> d!42498 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205761) (bvsle lt!205761 lt!205754))))

(assert (=> d!42498 (= (arrayBitRangesEqSymmetric!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205096)) lt!205761 lt!205754) lt!205993)))

(declare-fun bs!10385 () Bool)

(assert (= bs!10385 d!42498))

(assert (=> bs!10385 m!201435))

(declare-fun m!201729 () Bool)

(assert (=> bs!10385 m!201729))

(assert (=> b!133093 d!42498))

(declare-fun d!42500 () Bool)

(declare-fun res!110684 () Bool)

(declare-fun e!88339 () Bool)

(assert (=> d!42500 (=> res!110684 e!88339)))

(assert (=> d!42500 (= res!110684 (bvsge lt!205761 lt!205754))))

(assert (=> d!42500 (= (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205096)) (buf!3144 (_2!6081 lt!205095)) lt!205761 lt!205754) e!88339)))

(declare-fun b!133234 () Bool)

(declare-fun e!88344 () Bool)

(declare-fun e!88340 () Bool)

(assert (=> b!133234 (= e!88344 e!88340)))

(declare-fun c!7606 () Bool)

(declare-fun lt!205994 () tuple4!110)

(assert (=> b!133234 (= c!7606 (= (_3!309 lt!205994) (_4!55 lt!205994)))))

(declare-fun b!133235 () Bool)

(declare-fun lt!205995 () (_ BitVec 32))

(declare-fun e!88342 () Bool)

(assert (=> b!133235 (= e!88342 (byteRangesEq!0 (select (arr!3406 (buf!3144 (_2!6081 lt!205096))) (_4!55 lt!205994)) (select (arr!3406 (buf!3144 (_2!6081 lt!205095))) (_4!55 lt!205994)) #b00000000000000000000000000000000 lt!205995))))

(declare-fun b!133236 () Bool)

(declare-fun e!88343 () Bool)

(assert (=> b!133236 (= e!88340 e!88343)))

(declare-fun res!110683 () Bool)

(declare-fun call!1669 () Bool)

(assert (=> b!133236 (= res!110683 call!1669)))

(assert (=> b!133236 (=> (not res!110683) (not e!88343))))

(declare-fun b!133237 () Bool)

(assert (=> b!133237 (= e!88339 e!88344)))

(declare-fun res!110685 () Bool)

(assert (=> b!133237 (=> (not res!110685) (not e!88344))))

(declare-fun e!88341 () Bool)

(assert (=> b!133237 (= res!110685 e!88341)))

(declare-fun res!110686 () Bool)

(assert (=> b!133237 (=> res!110686 e!88341)))

(assert (=> b!133237 (= res!110686 (bvsge (_1!6092 lt!205994) (_2!6092 lt!205994)))))

(assert (=> b!133237 (= lt!205995 ((_ extract 31 0) (bvsrem lt!205754 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!205996 () (_ BitVec 32))

(assert (=> b!133237 (= lt!205996 ((_ extract 31 0) (bvsrem lt!205761 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133237 (= lt!205994 (arrayBitIndices!0 lt!205761 lt!205754))))

(declare-fun bm!1666 () Bool)

(assert (=> bm!1666 (= call!1669 (byteRangesEq!0 (select (arr!3406 (buf!3144 (_2!6081 lt!205096))) (_3!309 lt!205994)) (select (arr!3406 (buf!3144 (_2!6081 lt!205095))) (_3!309 lt!205994)) lt!205996 (ite c!7606 lt!205995 #b00000000000000000000000000001000)))))

(declare-fun b!133238 () Bool)

(assert (=> b!133238 (= e!88340 call!1669)))

(declare-fun b!133239 () Bool)

(declare-fun res!110687 () Bool)

(assert (=> b!133239 (= res!110687 (= lt!205995 #b00000000000000000000000000000000))))

(assert (=> b!133239 (=> res!110687 e!88342)))

(assert (=> b!133239 (= e!88343 e!88342)))

(declare-fun b!133240 () Bool)

(assert (=> b!133240 (= e!88341 (arrayRangesEq!174 (buf!3144 (_2!6081 lt!205096)) (buf!3144 (_2!6081 lt!205095)) (_1!6092 lt!205994) (_2!6092 lt!205994)))))

(assert (= (and d!42500 (not res!110684)) b!133237))

(assert (= (and b!133237 (not res!110686)) b!133240))

(assert (= (and b!133237 res!110685) b!133234))

(assert (= (and b!133234 c!7606) b!133238))

(assert (= (and b!133234 (not c!7606)) b!133236))

(assert (= (and b!133236 res!110683) b!133239))

(assert (= (and b!133239 (not res!110687)) b!133235))

(assert (= (or b!133238 b!133236) bm!1666))

(declare-fun m!201731 () Bool)

(assert (=> b!133235 m!201731))

(declare-fun m!201733 () Bool)

(assert (=> b!133235 m!201733))

(assert (=> b!133235 m!201731))

(assert (=> b!133235 m!201733))

(declare-fun m!201735 () Bool)

(assert (=> b!133235 m!201735))

(declare-fun m!201737 () Bool)

(assert (=> b!133237 m!201737))

(declare-fun m!201739 () Bool)

(assert (=> bm!1666 m!201739))

(declare-fun m!201741 () Bool)

(assert (=> bm!1666 m!201741))

(assert (=> bm!1666 m!201739))

(assert (=> bm!1666 m!201741))

(declare-fun m!201743 () Bool)

(assert (=> bm!1666 m!201743))

(declare-fun m!201745 () Bool)

(assert (=> b!133240 m!201745))

(assert (=> b!133093 d!42500))

(declare-fun d!42502 () Bool)

(declare-fun e!88347 () Bool)

(assert (=> d!42502 e!88347))

(declare-fun res!110690 () Bool)

(assert (=> d!42502 (=> (not res!110690) (not e!88347))))

(declare-fun lt!206002 () (_ BitVec 64))

(declare-fun lt!206001 () BitStream!4806)

(assert (=> d!42502 (= res!110690 (= (bvadd lt!206002 (bvsub lt!205811 lt!205815)) (bitIndex!0 (size!2771 (buf!3144 lt!206001)) (currentByte!5929 lt!206001) (currentBit!5924 lt!206001))))))

(assert (=> d!42502 (or (not (= (bvand lt!206002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205811 lt!205815) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206002 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206002 (bvsub lt!205811 lt!205815)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42502 (= lt!206002 (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205803))) (currentByte!5929 (_2!6079 lt!205803)) (currentBit!5924 (_2!6079 lt!205803))))))

(declare-fun moveBitIndex!0 (BitStream!4806 (_ BitVec 64)) tuple2!11550)

(assert (=> d!42502 (= lt!206001 (_2!6081 (moveBitIndex!0 (_2!6079 lt!205803) (bvsub lt!205811 lt!205815))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4806 (_ BitVec 64)) Bool)

(assert (=> d!42502 (moveBitIndexPrecond!0 (_2!6079 lt!205803) (bvsub lt!205811 lt!205815))))

(assert (=> d!42502 (= (withMovedBitIndex!0 (_2!6079 lt!205803) (bvsub lt!205811 lt!205815)) lt!206001)))

(declare-fun b!133243 () Bool)

(assert (=> b!133243 (= e!88347 (= (size!2771 (buf!3144 (_2!6079 lt!205803))) (size!2771 (buf!3144 lt!206001))))))

(assert (= (and d!42502 res!110690) b!133243))

(declare-fun m!201747 () Bool)

(assert (=> d!42502 m!201747))

(assert (=> d!42502 m!201661))

(declare-fun m!201749 () Bool)

(assert (=> d!42502 m!201749))

(declare-fun m!201751 () Bool)

(assert (=> d!42502 m!201751))

(assert (=> b!133107 d!42502))

(assert (=> b!133107 d!42367))

(assert (=> b!133107 d!42351))

(assert (=> d!42402 d!42476))

(declare-fun d!42504 () Bool)

(assert (=> d!42504 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) (bvsub (bvsub to!404 from!447) lt!205797)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!205797)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10386 () Bool)

(assert (= bs!10386 d!42504))

(assert (=> bs!10386 m!201397))

(assert (=> b!133104 d!42504))

(declare-fun d!42506 () Bool)

(assert (=> d!42506 (= (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205093)))) ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205093))) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205093)))) (bvsub (bvmul ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6080 lt!205093)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_1!6080 lt!205093))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_1!6080 lt!205093))))))))

(assert (=> d!42394 d!42506))

(declare-fun d!42508 () Bool)

(assert (=> d!42508 (= (invariant!0 (currentBit!5924 (_1!6080 lt!205093)) (currentByte!5929 (_1!6080 lt!205093)) (size!2771 (buf!3144 (_1!6080 lt!205093)))) (and (bvsge (currentBit!5924 (_1!6080 lt!205093)) #b00000000000000000000000000000000) (bvslt (currentBit!5924 (_1!6080 lt!205093)) #b00000000000000000000000000001000) (bvsge (currentByte!5929 (_1!6080 lt!205093)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5929 (_1!6080 lt!205093)) (size!2771 (buf!3144 (_1!6080 lt!205093)))) (and (= (currentBit!5924 (_1!6080 lt!205093)) #b00000000000000000000000000000000) (= (currentByte!5929 (_1!6080 lt!205093)) (size!2771 (buf!3144 (_1!6080 lt!205093))))))))))

(assert (=> d!42394 d!42508))

(declare-fun d!42510 () Bool)

(declare-fun lt!206007 () (_ BitVec 8))

(declare-fun lt!206008 () (_ BitVec 8))

(assert (=> d!42510 (= lt!206007 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3406 (buf!3144 (_1!6079 lt!205083))) (currentByte!5929 (_1!6079 lt!205083)))) ((_ sign_extend 24) lt!206008))))))

(assert (=> d!42510 (= lt!206008 ((_ extract 7 0) (currentBit!5924 (_1!6079 lt!205083))))))

(declare-fun e!88349 () Bool)

(assert (=> d!42510 e!88349))

(declare-fun res!110691 () Bool)

(assert (=> d!42510 (=> (not res!110691) (not e!88349))))

(assert (=> d!42510 (= res!110691 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_1!6079 lt!205083)))) ((_ sign_extend 32) (currentByte!5929 (_1!6079 lt!205083))) ((_ sign_extend 32) (currentBit!5924 (_1!6079 lt!205083))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8196 () Unit!8174)

(declare-fun Unit!8197 () Unit!8174)

(assert (=> d!42510 (= (readByte!0 (_1!6079 lt!205083)) (tuple2!11565 (_2!6093 (ite (bvsgt ((_ sign_extend 24) lt!206008) #b00000000000000000000000000000000) (tuple2!11567 Unit!8196 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206007) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3406 (buf!3144 (_1!6079 lt!205083))) (bvadd (currentByte!5929 (_1!6079 lt!205083)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206008)))))))) (tuple2!11567 Unit!8197 lt!206007))) (BitStream!4807 (buf!3144 (_1!6079 lt!205083)) (bvadd (currentByte!5929 (_1!6079 lt!205083)) #b00000000000000000000000000000001) (currentBit!5924 (_1!6079 lt!205083)))))))

(declare-fun b!133244 () Bool)

(declare-fun e!88348 () Bool)

(assert (=> b!133244 (= e!88349 e!88348)))

(declare-fun res!110692 () Bool)

(assert (=> b!133244 (=> (not res!110692) (not e!88348))))

(declare-fun lt!206005 () tuple2!11564)

(assert (=> b!133244 (= res!110692 (= (buf!3144 (_2!6090 lt!206005)) (buf!3144 (_1!6079 lt!205083))))))

(declare-fun lt!206009 () (_ BitVec 8))

(declare-fun lt!206004 () (_ BitVec 8))

(declare-fun Unit!8198 () Unit!8174)

(declare-fun Unit!8199 () Unit!8174)

(assert (=> b!133244 (= lt!206005 (tuple2!11565 (_2!6093 (ite (bvsgt ((_ sign_extend 24) lt!206009) #b00000000000000000000000000000000) (tuple2!11567 Unit!8198 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206004) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3406 (buf!3144 (_1!6079 lt!205083))) (bvadd (currentByte!5929 (_1!6079 lt!205083)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206009)))))))) (tuple2!11567 Unit!8199 lt!206004))) (BitStream!4807 (buf!3144 (_1!6079 lt!205083)) (bvadd (currentByte!5929 (_1!6079 lt!205083)) #b00000000000000000000000000000001) (currentBit!5924 (_1!6079 lt!205083)))))))

(assert (=> b!133244 (= lt!206004 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3406 (buf!3144 (_1!6079 lt!205083))) (currentByte!5929 (_1!6079 lt!205083)))) ((_ sign_extend 24) lt!206009))))))

(assert (=> b!133244 (= lt!206009 ((_ extract 7 0) (currentBit!5924 (_1!6079 lt!205083))))))

(declare-fun lt!206006 () (_ BitVec 64))

(declare-fun b!133245 () Bool)

(declare-fun lt!206003 () (_ BitVec 64))

(assert (=> b!133245 (= e!88348 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206005))) (currentByte!5929 (_2!6090 lt!206005)) (currentBit!5924 (_2!6090 lt!206005))) (bvadd lt!206006 lt!206003)))))

(assert (=> b!133245 (or (not (= (bvand lt!206006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206003 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206006 lt!206003) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133245 (= lt!206003 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133245 (= lt!206006 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205083))) (currentByte!5929 (_1!6079 lt!205083)) (currentBit!5924 (_1!6079 lt!205083))))))

(assert (= (and d!42510 res!110691) b!133244))

(assert (= (and b!133244 res!110692) b!133245))

(declare-fun m!201753 () Bool)

(assert (=> d!42510 m!201753))

(declare-fun m!201755 () Bool)

(assert (=> d!42510 m!201755))

(declare-fun m!201757 () Bool)

(assert (=> d!42510 m!201757))

(assert (=> b!133244 m!201757))

(assert (=> b!133244 m!201753))

(declare-fun m!201759 () Bool)

(assert (=> b!133245 m!201759))

(declare-fun m!201761 () Bool)

(assert (=> b!133245 m!201761))

(assert (=> d!42373 d!42510))

(declare-fun d!42512 () Bool)

(declare-fun e!88352 () Bool)

(assert (=> d!42512 e!88352))

(declare-fun res!110695 () Bool)

(assert (=> d!42512 (=> (not res!110695) (not e!88352))))

(declare-fun moveByteIndexPrecond!0 (BitStream!4806 (_ BitVec 32)) Bool)

(assert (=> d!42512 (= res!110695 (moveByteIndexPrecond!0 (_1!6079 lt!205083) #b00000000000000000000000000000001))))

(declare-fun Unit!8200 () Unit!8174)

(assert (=> d!42512 (= (moveByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) (tuple2!11551 Unit!8200 (BitStream!4807 (buf!3144 (_1!6079 lt!205083)) (bvadd (currentByte!5929 (_1!6079 lt!205083)) #b00000000000000000000000000000001) (currentBit!5924 (_1!6079 lt!205083)))))))

(declare-fun b!133248 () Bool)

(assert (=> b!133248 (= e!88352 (and (or (not (= (bvand (currentByte!5929 (_1!6079 lt!205083)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!5929 (_1!6079 lt!205083)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!5929 (_1!6079 lt!205083)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!5929 (_1!6079 lt!205083)) #b00000000000000000000000000000001) (bvadd (currentByte!5929 (_1!6079 lt!205083)) #b00000000000000000000000000000001))))))

(assert (= (and d!42512 res!110695) b!133248))

(declare-fun m!201763 () Bool)

(assert (=> d!42512 m!201763))

(assert (=> d!42406 d!42512))

(declare-fun d!42514 () Bool)

(declare-fun res!110698 () Bool)

(declare-fun e!88353 () Bool)

(assert (=> d!42514 (=> (not res!110698) (not e!88353))))

(assert (=> d!42514 (= res!110698 (= (size!2771 (buf!3144 (_1!6079 lt!205700))) (size!2771 (buf!3144 thiss!1634))))))

(assert (=> d!42514 (= (isPrefixOf!0 (_1!6079 lt!205700) thiss!1634) e!88353)))

(declare-fun b!133249 () Bool)

(declare-fun res!110696 () Bool)

(assert (=> b!133249 (=> (not res!110696) (not e!88353))))

(assert (=> b!133249 (= res!110696 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205700))) (currentByte!5929 (_1!6079 lt!205700)) (currentBit!5924 (_1!6079 lt!205700))) (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634))))))

(declare-fun b!133250 () Bool)

(declare-fun e!88354 () Bool)

(assert (=> b!133250 (= e!88353 e!88354)))

(declare-fun res!110697 () Bool)

(assert (=> b!133250 (=> res!110697 e!88354)))

(assert (=> b!133250 (= res!110697 (= (size!2771 (buf!3144 (_1!6079 lt!205700))) #b00000000000000000000000000000000))))

(declare-fun b!133251 () Bool)

(assert (=> b!133251 (= e!88354 (arrayBitRangesEq!0 (buf!3144 (_1!6079 lt!205700)) (buf!3144 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205700))) (currentByte!5929 (_1!6079 lt!205700)) (currentBit!5924 (_1!6079 lt!205700)))))))

(assert (= (and d!42514 res!110698) b!133249))

(assert (= (and b!133249 res!110696) b!133250))

(assert (= (and b!133250 (not res!110697)) b!133251))

(declare-fun m!201765 () Bool)

(assert (=> b!133249 m!201765))

(assert (=> b!133249 m!200859))

(assert (=> b!133251 m!201765))

(assert (=> b!133251 m!201765))

(declare-fun m!201767 () Bool)

(assert (=> b!133251 m!201767))

(assert (=> b!133074 d!42514))

(declare-fun d!42516 () Bool)

(declare-fun e!88355 () Bool)

(assert (=> d!42516 e!88355))

(declare-fun res!110699 () Bool)

(assert (=> d!42516 (=> (not res!110699) (not e!88355))))

(declare-fun lt!206011 () (_ BitVec 64))

(declare-fun lt!206010 () BitStream!4806)

(assert (=> d!42516 (= res!110699 (= (bvadd lt!206011 (bvsub lt!205708 lt!205712)) (bitIndex!0 (size!2771 (buf!3144 lt!206010)) (currentByte!5929 lt!206010) (currentBit!5924 lt!206010))))))

(assert (=> d!42516 (or (not (= (bvand lt!206011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205708 lt!205712) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206011 (bvsub lt!205708 lt!205712)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42516 (= lt!206011 (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205700))) (currentByte!5929 (_2!6079 lt!205700)) (currentBit!5924 (_2!6079 lt!205700))))))

(assert (=> d!42516 (= lt!206010 (_2!6081 (moveBitIndex!0 (_2!6079 lt!205700) (bvsub lt!205708 lt!205712))))))

(assert (=> d!42516 (moveBitIndexPrecond!0 (_2!6079 lt!205700) (bvsub lt!205708 lt!205712))))

(assert (=> d!42516 (= (withMovedBitIndex!0 (_2!6079 lt!205700) (bvsub lt!205708 lt!205712)) lt!206010)))

(declare-fun b!133252 () Bool)

(assert (=> b!133252 (= e!88355 (= (size!2771 (buf!3144 (_2!6079 lt!205700))) (size!2771 (buf!3144 lt!206010))))))

(assert (= (and d!42516 res!110699) b!133252))

(declare-fun m!201769 () Bool)

(assert (=> d!42516 m!201769))

(assert (=> d!42516 m!201553))

(declare-fun m!201771 () Bool)

(assert (=> d!42516 m!201771))

(declare-fun m!201773 () Bool)

(assert (=> d!42516 m!201773))

(assert (=> b!133072 d!42516))

(assert (=> b!133072 d!42349))

(assert (=> b!133072 d!42351))

(declare-fun lt!206024 () tuple2!11544)

(declare-fun e!88367 () Bool)

(declare-fun b!133263 () Bool)

(assert (=> b!133263 (= e!88367 (arrayRangesEq!174 arr!237 (_2!6078 lt!206024) #b00000000000000000000000000000000 to!404))))

(declare-fun b!133264 () Bool)

(declare-fun e!88365 () Bool)

(declare-fun _$39!15 () tuple2!11550)

(assert (=> b!133264 (= e!88365 (array_inv!2560 (buf!3144 (_2!6081 _$39!15))))))

(declare-fun b!133265 () Bool)

(declare-fun e!88364 () Bool)

(assert (=> b!133265 (= e!88364 e!88367)))

(declare-fun res!110708 () Bool)

(assert (=> b!133265 (=> (not res!110708) (not e!88367))))

(declare-fun lt!206023 () tuple2!11546)

(assert (=> b!133265 (= res!110708 (and (= (size!2771 (_2!6078 lt!206024)) (size!2771 arr!237)) (= (_1!6078 lt!206024) (_2!6079 lt!206023))))))

(assert (=> b!133265 (= lt!206024 (readByteArrayLoopPure!0 (_1!6079 lt!206023) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206022 () Unit!8174)

(declare-fun lt!206026 () Unit!8174)

(assert (=> b!133265 (= lt!206022 lt!206026)))

(declare-fun lt!206025 () (_ BitVec 64))

(assert (=> b!133265 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 _$39!15)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!206025)))

(assert (=> b!133265 (= lt!206026 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6081 lt!205095) (buf!3144 (_2!6081 _$39!15)) lt!206025))))

(assert (=> b!133265 (= lt!206025 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!133265 (= lt!206023 (reader!0 (_2!6081 lt!205095) (_2!6081 _$39!15)))))

(declare-fun b!133266 () Bool)

(declare-fun res!110710 () Bool)

(assert (=> b!133266 (=> (not res!110710) (not e!88364))))

(assert (=> b!133266 (= res!110710 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 _$39!15))) (currentByte!5929 (_2!6081 _$39!15)) (currentBit!5924 (_2!6081 _$39!15))) (bvadd (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun d!42518 () Bool)

(assert (=> d!42518 e!88364))

(declare-fun res!110711 () Bool)

(assert (=> d!42518 (=> (not res!110711) (not e!88364))))

(assert (=> d!42518 (= res!110711 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) (size!2771 (buf!3144 (_2!6081 _$39!15)))))))

(assert (=> d!42518 (and (inv!12 (_2!6081 _$39!15)) e!88365)))

(assert (=> d!42518 (= (choose!64 (_2!6081 lt!205095) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!15)))

(declare-fun b!133267 () Bool)

(declare-fun res!110709 () Bool)

(assert (=> b!133267 (=> (not res!110709) (not e!88364))))

(assert (=> b!133267 (= res!110709 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 _$39!15)))))

(assert (= d!42518 b!133264))

(assert (= (and d!42518 res!110711) b!133266))

(assert (= (and b!133266 res!110710) b!133267))

(assert (= (and b!133267 res!110709) b!133265))

(assert (= (and b!133265 res!110708) b!133263))

(declare-fun m!201775 () Bool)

(assert (=> d!42518 m!201775))

(declare-fun m!201777 () Bool)

(assert (=> b!133266 m!201777))

(assert (=> b!133266 m!200857))

(declare-fun m!201779 () Bool)

(assert (=> b!133263 m!201779))

(declare-fun m!201781 () Bool)

(assert (=> b!133267 m!201781))

(declare-fun m!201783 () Bool)

(assert (=> b!133264 m!201783))

(declare-fun m!201785 () Bool)

(assert (=> b!133265 m!201785))

(declare-fun m!201787 () Bool)

(assert (=> b!133265 m!201787))

(declare-fun m!201789 () Bool)

(assert (=> b!133265 m!201789))

(declare-fun m!201791 () Bool)

(assert (=> b!133265 m!201791))

(assert (=> d!42410 d!42518))

(declare-fun lt!206124 () tuple3!506)

(declare-fun bm!1673 () Bool)

(declare-fun c!7609 () Bool)

(declare-fun call!1678 () Bool)

(assert (=> bm!1673 (= call!1678 (arrayRangesEq!174 lt!205086 (ite c!7609 (_3!308 lt!206124) lt!205086) #b00000000000000000000000000000000 (ite c!7609 (bvadd #b00000000000000000000000000000001 from!447) (size!2771 lt!205086))))))

(declare-fun bm!1674 () Bool)

(declare-fun call!1676 () (_ BitVec 64))

(assert (=> bm!1674 (= call!1676 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205089))) (currentByte!5929 (_1!6079 lt!205089)) (currentBit!5924 (_1!6079 lt!205089))))))

(declare-fun bm!1675 () Bool)

(declare-fun lt!206125 () (_ BitVec 32))

(declare-fun call!1677 () Bool)

(declare-fun lt!206112 () array!6120)

(declare-fun lt!206113 () array!6120)

(declare-fun lt!206104 () (_ BitVec 32))

(declare-fun lt!206129 () tuple2!11564)

(assert (=> bm!1675 (= call!1677 (arrayRangesEq!174 (ite c!7609 lt!205086 lt!206113) (ite c!7609 (array!6121 (store (arr!3406 lt!205086) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206129)) (size!2771 lt!205086)) lt!206112) (ite c!7609 #b00000000000000000000000000000000 lt!206125) (ite c!7609 (bvadd #b00000000000000000000000000000001 from!447) lt!206104)))))

(declare-fun lt!206122 () tuple3!506)

(declare-fun e!88375 () Bool)

(declare-fun b!133279 () Bool)

(assert (=> b!133279 (= e!88375 (= (select (arr!3406 (_3!308 lt!206122)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6080 (readBytePure!0 (_1!6079 lt!205089)))))))

(assert (=> b!133279 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2771 (_3!308 lt!206122))))))

(declare-fun b!133280 () Bool)

(declare-fun e!88374 () tuple3!506)

(declare-fun lt!206115 () Unit!8174)

(assert (=> b!133280 (= e!88374 (tuple3!507 lt!206115 (_2!6091 lt!206124) (_3!308 lt!206124)))))

(assert (=> b!133280 (= lt!206129 (readByte!0 (_1!6079 lt!205089)))))

(declare-fun lt!206109 () array!6120)

(assert (=> b!133280 (= lt!206109 (array!6121 (store (arr!3406 lt!205086) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206129)) (size!2771 lt!205086)))))

(declare-fun lt!206101 () (_ BitVec 64))

(assert (=> b!133280 (= lt!206101 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!206108 () (_ BitVec 32))

(assert (=> b!133280 (= lt!206108 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206127 () Unit!8174)

(assert (=> b!133280 (= lt!206127 (validateOffsetBytesFromBitIndexLemma!0 (_1!6079 lt!205089) (_2!6090 lt!206129) lt!206101 lt!206108))))

(assert (=> b!133280 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6090 lt!206129)))) ((_ sign_extend 32) (currentByte!5929 (_2!6090 lt!206129))) ((_ sign_extend 32) (currentBit!5924 (_2!6090 lt!206129))) (bvsub lt!206108 ((_ extract 31 0) (bvsdiv (bvadd lt!206101 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!206110 () Unit!8174)

(assert (=> b!133280 (= lt!206110 lt!206127)))

(assert (=> b!133280 (= lt!206124 (readByteArrayLoop!0 (_2!6090 lt!206129) lt!206109 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!133280 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206129))) (currentByte!5929 (_2!6090 lt!206129)) (currentBit!5924 (_2!6090 lt!206129))) (bvadd call!1676 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!206114 () Unit!8174)

(declare-fun Unit!8201 () Unit!8174)

(assert (=> b!133280 (= lt!206114 Unit!8201)))

(assert (=> b!133280 (= (bvadd (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206129))) (currentByte!5929 (_2!6090 lt!206129)) (currentBit!5924 (_2!6090 lt!206129))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206124))) (currentByte!5929 (_2!6091 lt!206124)) (currentBit!5924 (_2!6091 lt!206124))))))

(declare-fun lt!206132 () Unit!8174)

(declare-fun Unit!8202 () Unit!8174)

(assert (=> b!133280 (= lt!206132 Unit!8202)))

(assert (=> b!133280 (= (bvadd call!1676 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206124))) (currentByte!5929 (_2!6091 lt!206124)) (currentBit!5924 (_2!6091 lt!206124))))))

(declare-fun lt!206099 () Unit!8174)

(declare-fun Unit!8203 () Unit!8174)

(assert (=> b!133280 (= lt!206099 Unit!8203)))

(assert (=> b!133280 (and (= (buf!3144 (_1!6079 lt!205089)) (buf!3144 (_2!6091 lt!206124))) (= (size!2771 lt!205086) (size!2771 (_3!308 lt!206124))))))

(declare-fun lt!206105 () Unit!8174)

(declare-fun Unit!8204 () Unit!8174)

(assert (=> b!133280 (= lt!206105 Unit!8204)))

(declare-fun lt!206116 () Unit!8174)

(declare-fun arrayUpdatedAtPrefixLemma!1 (array!6120 (_ BitVec 32) (_ BitVec 8)) Unit!8174)

(assert (=> b!133280 (= lt!206116 (arrayUpdatedAtPrefixLemma!1 lt!205086 (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206129)))))

(assert (=> b!133280 call!1677))

(declare-fun lt!206119 () Unit!8174)

(assert (=> b!133280 (= lt!206119 lt!206116)))

(declare-fun lt!206117 () (_ BitVec 32))

(assert (=> b!133280 (= lt!206117 #b00000000000000000000000000000000)))

(declare-fun lt!206131 () Unit!8174)

(declare-fun arrayRangesEqTransitive!1 (array!6120 array!6120 array!6120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8174)

(assert (=> b!133280 (= lt!206131 (arrayRangesEqTransitive!1 lt!205086 lt!206109 (_3!308 lt!206124) lt!206117 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133280 (arrayRangesEq!174 lt!205086 (_3!308 lt!206124) lt!206117 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!206128 () Unit!8174)

(assert (=> b!133280 (= lt!206128 lt!206131)))

(assert (=> b!133280 call!1678))

(declare-fun lt!206111 () Unit!8174)

(declare-fun Unit!8205 () Unit!8174)

(assert (=> b!133280 (= lt!206111 Unit!8205)))

(declare-fun lt!206120 () Unit!8174)

(declare-fun arrayRangesEqImpliesEq!1 (array!6120 array!6120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8174)

(assert (=> b!133280 (= lt!206120 (arrayRangesEqImpliesEq!1 lt!206109 (_3!308 lt!206124) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133280 (= (select (store (arr!3406 lt!205086) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206129)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3406 (_3!308 lt!206124)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206100 () Unit!8174)

(assert (=> b!133280 (= lt!206100 lt!206120)))

(declare-fun lt!206118 () Bool)

(assert (=> b!133280 (= lt!206118 (= (select (arr!3406 (_3!308 lt!206124)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6090 lt!206129)))))

(declare-fun Unit!8206 () Unit!8174)

(assert (=> b!133280 (= lt!206115 Unit!8206)))

(assert (=> b!133280 lt!206118))

(declare-fun lt!206102 () Unit!8174)

(declare-fun b!133281 () Bool)

(assert (=> b!133281 (= e!88374 (tuple3!507 lt!206102 (_1!6079 lt!205089) lt!205086))))

(assert (=> b!133281 (= call!1676 call!1676)))

(declare-fun lt!206126 () Unit!8174)

(declare-fun Unit!8207 () Unit!8174)

(assert (=> b!133281 (= lt!206126 Unit!8207)))

(declare-fun lt!206107 () Unit!8174)

(declare-fun arrayRangesEqReflexiveLemma!1 (array!6120) Unit!8174)

(assert (=> b!133281 (= lt!206107 (arrayRangesEqReflexiveLemma!1 lt!205086))))

(assert (=> b!133281 call!1678))

(declare-fun lt!206130 () Unit!8174)

(assert (=> b!133281 (= lt!206130 lt!206107)))

(assert (=> b!133281 (= lt!206113 lt!205086)))

(assert (=> b!133281 (= lt!206112 lt!205086)))

(declare-fun lt!206133 () (_ BitVec 32))

(assert (=> b!133281 (= lt!206133 #b00000000000000000000000000000000)))

(declare-fun lt!206106 () (_ BitVec 32))

(assert (=> b!133281 (= lt!206106 (size!2771 lt!205086))))

(assert (=> b!133281 (= lt!206125 #b00000000000000000000000000000000)))

(assert (=> b!133281 (= lt!206104 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!1 (array!6120 array!6120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8174)

(assert (=> b!133281 (= lt!206102 (arrayRangesEqSlicedLemma!1 lt!206113 lt!206112 lt!206133 lt!206106 lt!206125 lt!206104))))

(assert (=> b!133281 call!1677))

(declare-fun b!133282 () Bool)

(declare-fun res!110718 () Bool)

(declare-fun e!88376 () Bool)

(assert (=> b!133282 (=> (not res!110718) (not e!88376))))

(assert (=> b!133282 (= res!110718 (and (= (buf!3144 (_1!6079 lt!205089)) (buf!3144 (_2!6091 lt!206122))) (= (size!2771 lt!205086) (size!2771 (_3!308 lt!206122)))))))

(declare-fun b!133278 () Bool)

(assert (=> b!133278 (= e!88376 (arrayRangesEq!174 lt!205086 (_3!308 lt!206122) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun d!42520 () Bool)

(assert (=> d!42520 e!88375))

(declare-fun res!110720 () Bool)

(assert (=> d!42520 (=> res!110720 e!88375)))

(assert (=> d!42520 (= res!110720 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206123 () Bool)

(assert (=> d!42520 (= lt!206123 e!88376)))

(declare-fun res!110719 () Bool)

(assert (=> d!42520 (=> (not res!110719) (not e!88376))))

(declare-fun lt!206134 () (_ BitVec 64))

(declare-fun lt!206103 () (_ BitVec 64))

(assert (=> d!42520 (= res!110719 (= (bvadd lt!206103 lt!206134) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206122))) (currentByte!5929 (_2!6091 lt!206122)) (currentBit!5924 (_2!6091 lt!206122)))))))

(assert (=> d!42520 (or (not (= (bvand lt!206103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206134 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206103 lt!206134) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!206121 () (_ BitVec 64))

(assert (=> d!42520 (= lt!206134 (bvmul lt!206121 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!42520 (or (= lt!206121 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206121 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206121)))))

(assert (=> d!42520 (= lt!206121 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!42520 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!42520 (= lt!206103 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205089))) (currentByte!5929 (_1!6079 lt!205089)) (currentBit!5924 (_1!6079 lt!205089))))))

(assert (=> d!42520 (= lt!206122 e!88374)))

(assert (=> d!42520 (= c!7609 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42520 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2771 lt!205086)))))

(assert (=> d!42520 (= (readByteArrayLoop!0 (_1!6079 lt!205089) lt!205086 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!206122)))

(assert (= (and d!42520 c!7609) b!133280))

(assert (= (and d!42520 (not c!7609)) b!133281))

(assert (= (or b!133280 b!133281) bm!1675))

(assert (= (or b!133280 b!133281) bm!1673))

(assert (= (or b!133280 b!133281) bm!1674))

(assert (= (and d!42520 res!110719) b!133282))

(assert (= (and b!133282 res!110718) b!133278))

(assert (= (and d!42520 (not res!110720)) b!133279))

(declare-fun m!201793 () Bool)

(assert (=> b!133280 m!201793))

(declare-fun m!201795 () Bool)

(assert (=> b!133280 m!201795))

(declare-fun m!201797 () Bool)

(assert (=> b!133280 m!201797))

(declare-fun m!201799 () Bool)

(assert (=> b!133280 m!201799))

(declare-fun m!201801 () Bool)

(assert (=> b!133280 m!201801))

(declare-fun m!201803 () Bool)

(assert (=> b!133280 m!201803))

(declare-fun m!201805 () Bool)

(assert (=> b!133280 m!201805))

(declare-fun m!201807 () Bool)

(assert (=> b!133280 m!201807))

(declare-fun m!201809 () Bool)

(assert (=> b!133280 m!201809))

(declare-fun m!201811 () Bool)

(assert (=> b!133280 m!201811))

(declare-fun m!201813 () Bool)

(assert (=> b!133280 m!201813))

(declare-fun m!201815 () Bool)

(assert (=> b!133280 m!201815))

(declare-fun m!201817 () Bool)

(assert (=> b!133280 m!201817))

(assert (=> bm!1675 m!201797))

(declare-fun m!201819 () Bool)

(assert (=> bm!1675 m!201819))

(declare-fun m!201821 () Bool)

(assert (=> b!133279 m!201821))

(declare-fun m!201823 () Bool)

(assert (=> b!133279 m!201823))

(declare-fun m!201825 () Bool)

(assert (=> b!133278 m!201825))

(declare-fun m!201827 () Bool)

(assert (=> bm!1674 m!201827))

(declare-fun m!201829 () Bool)

(assert (=> d!42520 m!201829))

(assert (=> d!42520 m!201827))

(declare-fun m!201831 () Bool)

(assert (=> b!133281 m!201831))

(declare-fun m!201833 () Bool)

(assert (=> b!133281 m!201833))

(declare-fun m!201835 () Bool)

(assert (=> bm!1673 m!201835))

(assert (=> d!42382 d!42520))

(declare-fun d!42522 () Bool)

(declare-fun res!110722 () Bool)

(declare-fun e!88377 () Bool)

(assert (=> d!42522 (=> res!110722 e!88377)))

(assert (=> d!42522 (= res!110722 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(assert (=> d!42522 (= (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))) e!88377)))

(declare-fun b!133283 () Bool)

(declare-fun e!88382 () Bool)

(declare-fun e!88378 () Bool)

(assert (=> b!133283 (= e!88382 e!88378)))

(declare-fun c!7610 () Bool)

(declare-fun lt!206135 () tuple4!110)

(assert (=> b!133283 (= c!7610 (= (_3!309 lt!206135) (_4!55 lt!206135)))))

(declare-fun lt!206136 () (_ BitVec 32))

(declare-fun b!133284 () Bool)

(declare-fun e!88380 () Bool)

(assert (=> b!133284 (= e!88380 (byteRangesEq!0 (select (arr!3406 (buf!3144 (_2!6081 lt!205095))) (_4!55 lt!206135)) (select (arr!3406 (buf!3144 (_2!6081 lt!205096))) (_4!55 lt!206135)) #b00000000000000000000000000000000 lt!206136))))

(declare-fun b!133285 () Bool)

(declare-fun e!88381 () Bool)

(assert (=> b!133285 (= e!88378 e!88381)))

(declare-fun res!110721 () Bool)

(declare-fun call!1679 () Bool)

(assert (=> b!133285 (= res!110721 call!1679)))

(assert (=> b!133285 (=> (not res!110721) (not e!88381))))

(declare-fun b!133286 () Bool)

(assert (=> b!133286 (= e!88377 e!88382)))

(declare-fun res!110723 () Bool)

(assert (=> b!133286 (=> (not res!110723) (not e!88382))))

(declare-fun e!88379 () Bool)

(assert (=> b!133286 (= res!110723 e!88379)))

(declare-fun res!110724 () Bool)

(assert (=> b!133286 (=> res!110724 e!88379)))

(assert (=> b!133286 (= res!110724 (bvsge (_1!6092 lt!206135) (_2!6092 lt!206135)))))

(assert (=> b!133286 (= lt!206136 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!206137 () (_ BitVec 32))

(assert (=> b!133286 (= lt!206137 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133286 (= lt!206135 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(declare-fun bm!1676 () Bool)

(assert (=> bm!1676 (= call!1679 (byteRangesEq!0 (select (arr!3406 (buf!3144 (_2!6081 lt!205095))) (_3!309 lt!206135)) (select (arr!3406 (buf!3144 (_2!6081 lt!205096))) (_3!309 lt!206135)) lt!206137 (ite c!7610 lt!206136 #b00000000000000000000000000001000)))))

(declare-fun b!133287 () Bool)

(assert (=> b!133287 (= e!88378 call!1679)))

(declare-fun b!133288 () Bool)

(declare-fun res!110725 () Bool)

(assert (=> b!133288 (= res!110725 (= lt!206136 #b00000000000000000000000000000000))))

(assert (=> b!133288 (=> res!110725 e!88380)))

(assert (=> b!133288 (= e!88381 e!88380)))

(declare-fun b!133289 () Bool)

(assert (=> b!133289 (= e!88379 (arrayRangesEq!174 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205096)) (_1!6092 lt!206135) (_2!6092 lt!206135)))))

(assert (= (and d!42522 (not res!110722)) b!133286))

(assert (= (and b!133286 (not res!110724)) b!133289))

(assert (= (and b!133286 res!110723) b!133283))

(assert (= (and b!133283 c!7610) b!133287))

(assert (= (and b!133283 (not c!7610)) b!133285))

(assert (= (and b!133285 res!110721) b!133288))

(assert (= (and b!133288 (not res!110725)) b!133284))

(assert (= (or b!133287 b!133285) bm!1676))

(declare-fun m!201837 () Bool)

(assert (=> b!133284 m!201837))

(declare-fun m!201839 () Bool)

(assert (=> b!133284 m!201839))

(assert (=> b!133284 m!201837))

(assert (=> b!133284 m!201839))

(declare-fun m!201841 () Bool)

(assert (=> b!133284 m!201841))

(assert (=> b!133286 m!200857))

(declare-fun m!201843 () Bool)

(assert (=> b!133286 m!201843))

(declare-fun m!201845 () Bool)

(assert (=> bm!1676 m!201845))

(declare-fun m!201847 () Bool)

(assert (=> bm!1676 m!201847))

(assert (=> bm!1676 m!201845))

(assert (=> bm!1676 m!201847))

(declare-fun m!201849 () Bool)

(assert (=> bm!1676 m!201849))

(declare-fun m!201851 () Bool)

(assert (=> b!133289 m!201851))

(assert (=> b!133077 d!42522))

(assert (=> b!133077 d!42349))

(assert (=> b!133075 d!42349))

(assert (=> b!133075 d!42367))

(declare-fun d!42524 () Bool)

(declare-fun res!110726 () Bool)

(declare-fun e!88383 () Bool)

(assert (=> d!42524 (=> res!110726 e!88383)))

(assert (=> d!42524 (= res!110726 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42524 (= (arrayRangesEq!174 arr!237 (_2!6078 lt!205094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!88383)))

(declare-fun b!133290 () Bool)

(declare-fun e!88384 () Bool)

(assert (=> b!133290 (= e!88383 e!88384)))

(declare-fun res!110727 () Bool)

(assert (=> b!133290 (=> (not res!110727) (not e!88384))))

(assert (=> b!133290 (= res!110727 (= (select (arr!3406 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3406 (_2!6078 lt!205094)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!133291 () Bool)

(assert (=> b!133291 (= e!88384 (arrayRangesEq!174 arr!237 (_2!6078 lt!205094) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42524 (not res!110726)) b!133290))

(assert (= (and b!133290 res!110727) b!133291))

(declare-fun m!201853 () Bool)

(assert (=> b!133290 m!201853))

(declare-fun m!201855 () Bool)

(assert (=> b!133290 m!201855))

(declare-fun m!201857 () Bool)

(assert (=> b!133291 m!201857))

(assert (=> b!133091 d!42524))

(declare-fun d!42526 () Bool)

(declare-fun res!110730 () Bool)

(declare-fun e!88385 () Bool)

(assert (=> d!42526 (=> (not res!110730) (not e!88385))))

(assert (=> d!42526 (= res!110730 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) (size!2771 (buf!3144 (_2!6081 lt!205871)))))))

(assert (=> d!42526 (= (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205871)) e!88385)))

(declare-fun b!133292 () Bool)

(declare-fun res!110728 () Bool)

(assert (=> b!133292 (=> (not res!110728) (not e!88385))))

(assert (=> b!133292 (= res!110728 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205871))) (currentByte!5929 (_2!6081 lt!205871)) (currentBit!5924 (_2!6081 lt!205871)))))))

(declare-fun b!133293 () Bool)

(declare-fun e!88386 () Bool)

(assert (=> b!133293 (= e!88385 e!88386)))

(declare-fun res!110729 () Bool)

(assert (=> b!133293 (=> res!110729 e!88386)))

(assert (=> b!133293 (= res!110729 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) #b00000000000000000000000000000000))))

(declare-fun b!133294 () Bool)

(assert (=> b!133294 (= e!88386 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205871)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(assert (= (and d!42526 res!110730) b!133292))

(assert (= (and b!133292 res!110728) b!133293))

(assert (= (and b!133293 (not res!110729)) b!133294))

(assert (=> b!133292 m!200857))

(assert (=> b!133292 m!201525))

(assert (=> b!133294 m!200857))

(assert (=> b!133294 m!200857))

(declare-fun m!201859 () Bool)

(assert (=> b!133294 m!201859))

(assert (=> b!133130 d!42526))

(declare-fun c!7611 () Bool)

(declare-fun call!1682 () Bool)

(declare-fun lt!206163 () tuple3!506)

(declare-fun bm!1677 () Bool)

(assert (=> bm!1677 (= call!1682 (arrayRangesEq!174 arr!237 (ite c!7611 (_3!308 lt!206163) arr!237) #b00000000000000000000000000000000 (ite c!7611 from!447 (size!2771 arr!237))))))

(declare-fun bm!1678 () Bool)

(declare-fun call!1680 () (_ BitVec 64))

(assert (=> bm!1678 (= call!1680 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205083))) (currentByte!5929 (_1!6079 lt!205083)) (currentBit!5924 (_1!6079 lt!205083))))))

(declare-fun lt!206143 () (_ BitVec 32))

(declare-fun call!1681 () Bool)

(declare-fun lt!206152 () array!6120)

(declare-fun lt!206151 () array!6120)

(declare-fun lt!206168 () tuple2!11564)

(declare-fun bm!1679 () Bool)

(declare-fun lt!206164 () (_ BitVec 32))

(assert (=> bm!1679 (= call!1681 (arrayRangesEq!174 (ite c!7611 arr!237 lt!206152) (ite c!7611 (array!6121 (store (arr!3406 arr!237) from!447 (_1!6090 lt!206168)) (size!2771 arr!237)) lt!206151) (ite c!7611 #b00000000000000000000000000000000 lt!206164) (ite c!7611 from!447 lt!206143)))))

(declare-fun lt!206161 () tuple3!506)

(declare-fun b!133296 () Bool)

(declare-fun e!88388 () Bool)

(assert (=> b!133296 (= e!88388 (= (select (arr!3406 (_3!308 lt!206161)) from!447) (_2!6080 (readBytePure!0 (_1!6079 lt!205083)))))))

(assert (=> b!133296 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2771 (_3!308 lt!206161))))))

(declare-fun b!133297 () Bool)

(declare-fun e!88387 () tuple3!506)

(declare-fun lt!206154 () Unit!8174)

(assert (=> b!133297 (= e!88387 (tuple3!507 lt!206154 (_2!6091 lt!206163) (_3!308 lt!206163)))))

(assert (=> b!133297 (= lt!206168 (readByte!0 (_1!6079 lt!205083)))))

(declare-fun lt!206148 () array!6120)

(assert (=> b!133297 (= lt!206148 (array!6121 (store (arr!3406 arr!237) from!447 (_1!6090 lt!206168)) (size!2771 arr!237)))))

(declare-fun lt!206140 () (_ BitVec 64))

(assert (=> b!133297 (= lt!206140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!206147 () (_ BitVec 32))

(assert (=> b!133297 (= lt!206147 (bvsub to!404 from!447))))

(declare-fun lt!206166 () Unit!8174)

(assert (=> b!133297 (= lt!206166 (validateOffsetBytesFromBitIndexLemma!0 (_1!6079 lt!205083) (_2!6090 lt!206168) lt!206140 lt!206147))))

(assert (=> b!133297 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6090 lt!206168)))) ((_ sign_extend 32) (currentByte!5929 (_2!6090 lt!206168))) ((_ sign_extend 32) (currentBit!5924 (_2!6090 lt!206168))) (bvsub lt!206147 ((_ extract 31 0) (bvsdiv (bvadd lt!206140 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!206149 () Unit!8174)

(assert (=> b!133297 (= lt!206149 lt!206166)))

(assert (=> b!133297 (= lt!206163 (readByteArrayLoop!0 (_2!6090 lt!206168) lt!206148 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!133297 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206168))) (currentByte!5929 (_2!6090 lt!206168)) (currentBit!5924 (_2!6090 lt!206168))) (bvadd call!1680 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!206153 () Unit!8174)

(declare-fun Unit!8208 () Unit!8174)

(assert (=> b!133297 (= lt!206153 Unit!8208)))

(assert (=> b!133297 (= (bvadd (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206168))) (currentByte!5929 (_2!6090 lt!206168)) (currentBit!5924 (_2!6090 lt!206168))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206163))) (currentByte!5929 (_2!6091 lt!206163)) (currentBit!5924 (_2!6091 lt!206163))))))

(declare-fun lt!206171 () Unit!8174)

(declare-fun Unit!8209 () Unit!8174)

(assert (=> b!133297 (= lt!206171 Unit!8209)))

(assert (=> b!133297 (= (bvadd call!1680 (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206163))) (currentByte!5929 (_2!6091 lt!206163)) (currentBit!5924 (_2!6091 lt!206163))))))

(declare-fun lt!206138 () Unit!8174)

(declare-fun Unit!8210 () Unit!8174)

(assert (=> b!133297 (= lt!206138 Unit!8210)))

(assert (=> b!133297 (and (= (buf!3144 (_1!6079 lt!205083)) (buf!3144 (_2!6091 lt!206163))) (= (size!2771 arr!237) (size!2771 (_3!308 lt!206163))))))

(declare-fun lt!206144 () Unit!8174)

(declare-fun Unit!8211 () Unit!8174)

(assert (=> b!133297 (= lt!206144 Unit!8211)))

(declare-fun lt!206155 () Unit!8174)

(assert (=> b!133297 (= lt!206155 (arrayUpdatedAtPrefixLemma!1 arr!237 from!447 (_1!6090 lt!206168)))))

(assert (=> b!133297 call!1681))

(declare-fun lt!206158 () Unit!8174)

(assert (=> b!133297 (= lt!206158 lt!206155)))

(declare-fun lt!206156 () (_ BitVec 32))

(assert (=> b!133297 (= lt!206156 #b00000000000000000000000000000000)))

(declare-fun lt!206170 () Unit!8174)

(assert (=> b!133297 (= lt!206170 (arrayRangesEqTransitive!1 arr!237 lt!206148 (_3!308 lt!206163) lt!206156 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133297 (arrayRangesEq!174 arr!237 (_3!308 lt!206163) lt!206156 from!447)))

(declare-fun lt!206167 () Unit!8174)

(assert (=> b!133297 (= lt!206167 lt!206170)))

(assert (=> b!133297 call!1682))

(declare-fun lt!206150 () Unit!8174)

(declare-fun Unit!8212 () Unit!8174)

(assert (=> b!133297 (= lt!206150 Unit!8212)))

(declare-fun lt!206159 () Unit!8174)

(assert (=> b!133297 (= lt!206159 (arrayRangesEqImpliesEq!1 lt!206148 (_3!308 lt!206163) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133297 (= (select (store (arr!3406 arr!237) from!447 (_1!6090 lt!206168)) from!447) (select (arr!3406 (_3!308 lt!206163)) from!447))))

(declare-fun lt!206139 () Unit!8174)

(assert (=> b!133297 (= lt!206139 lt!206159)))

(declare-fun lt!206157 () Bool)

(assert (=> b!133297 (= lt!206157 (= (select (arr!3406 (_3!308 lt!206163)) from!447) (_1!6090 lt!206168)))))

(declare-fun Unit!8213 () Unit!8174)

(assert (=> b!133297 (= lt!206154 Unit!8213)))

(assert (=> b!133297 lt!206157))

(declare-fun b!133298 () Bool)

(declare-fun lt!206141 () Unit!8174)

(assert (=> b!133298 (= e!88387 (tuple3!507 lt!206141 (_1!6079 lt!205083) arr!237))))

(assert (=> b!133298 (= call!1680 call!1680)))

(declare-fun lt!206165 () Unit!8174)

(declare-fun Unit!8214 () Unit!8174)

(assert (=> b!133298 (= lt!206165 Unit!8214)))

(declare-fun lt!206146 () Unit!8174)

(assert (=> b!133298 (= lt!206146 (arrayRangesEqReflexiveLemma!1 arr!237))))

(assert (=> b!133298 call!1682))

(declare-fun lt!206169 () Unit!8174)

(assert (=> b!133298 (= lt!206169 lt!206146)))

(assert (=> b!133298 (= lt!206152 arr!237)))

(assert (=> b!133298 (= lt!206151 arr!237)))

(declare-fun lt!206172 () (_ BitVec 32))

(assert (=> b!133298 (= lt!206172 #b00000000000000000000000000000000)))

(declare-fun lt!206145 () (_ BitVec 32))

(assert (=> b!133298 (= lt!206145 (size!2771 arr!237))))

(assert (=> b!133298 (= lt!206164 #b00000000000000000000000000000000)))

(assert (=> b!133298 (= lt!206143 from!447)))

(assert (=> b!133298 (= lt!206141 (arrayRangesEqSlicedLemma!1 lt!206152 lt!206151 lt!206172 lt!206145 lt!206164 lt!206143))))

(assert (=> b!133298 call!1681))

(declare-fun b!133299 () Bool)

(declare-fun res!110731 () Bool)

(declare-fun e!88389 () Bool)

(assert (=> b!133299 (=> (not res!110731) (not e!88389))))

(assert (=> b!133299 (= res!110731 (and (= (buf!3144 (_1!6079 lt!205083)) (buf!3144 (_2!6091 lt!206161))) (= (size!2771 arr!237) (size!2771 (_3!308 lt!206161)))))))

(declare-fun b!133295 () Bool)

(assert (=> b!133295 (= e!88389 (arrayRangesEq!174 arr!237 (_3!308 lt!206161) #b00000000000000000000000000000000 from!447))))

(declare-fun d!42528 () Bool)

(assert (=> d!42528 e!88388))

(declare-fun res!110733 () Bool)

(assert (=> d!42528 (=> res!110733 e!88388)))

(assert (=> d!42528 (= res!110733 (bvsge from!447 to!404))))

(declare-fun lt!206162 () Bool)

(assert (=> d!42528 (= lt!206162 e!88389)))

(declare-fun res!110732 () Bool)

(assert (=> d!42528 (=> (not res!110732) (not e!88389))))

(declare-fun lt!206173 () (_ BitVec 64))

(declare-fun lt!206142 () (_ BitVec 64))

(assert (=> d!42528 (= res!110732 (= (bvadd lt!206142 lt!206173) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206161))) (currentByte!5929 (_2!6091 lt!206161)) (currentBit!5924 (_2!6091 lt!206161)))))))

(assert (=> d!42528 (or (not (= (bvand lt!206142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206173 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206142 lt!206173) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!206160 () (_ BitVec 64))

(assert (=> d!42528 (= lt!206173 (bvmul lt!206160 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!42528 (or (= lt!206160 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206160 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206160)))))

(assert (=> d!42528 (= lt!206160 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!42528 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!42528 (= lt!206142 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205083))) (currentByte!5929 (_1!6079 lt!205083)) (currentBit!5924 (_1!6079 lt!205083))))))

(assert (=> d!42528 (= lt!206161 e!88387)))

(assert (=> d!42528 (= c!7611 (bvslt from!447 to!404))))

(assert (=> d!42528 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2771 arr!237)))))

(assert (=> d!42528 (= (readByteArrayLoop!0 (_1!6079 lt!205083) arr!237 from!447 to!404) lt!206161)))

(assert (= (and d!42528 c!7611) b!133297))

(assert (= (and d!42528 (not c!7611)) b!133298))

(assert (= (or b!133297 b!133298) bm!1679))

(assert (= (or b!133297 b!133298) bm!1677))

(assert (= (or b!133297 b!133298) bm!1678))

(assert (= (and d!42528 res!110732) b!133299))

(assert (= (and b!133299 res!110731) b!133295))

(assert (= (and d!42528 (not res!110733)) b!133296))

(declare-fun m!201861 () Bool)

(assert (=> b!133297 m!201861))

(assert (=> b!133297 m!201447))

(declare-fun m!201863 () Bool)

(assert (=> b!133297 m!201863))

(declare-fun m!201865 () Bool)

(assert (=> b!133297 m!201865))

(declare-fun m!201867 () Bool)

(assert (=> b!133297 m!201867))

(declare-fun m!201869 () Bool)

(assert (=> b!133297 m!201869))

(declare-fun m!201871 () Bool)

(assert (=> b!133297 m!201871))

(declare-fun m!201873 () Bool)

(assert (=> b!133297 m!201873))

(declare-fun m!201875 () Bool)

(assert (=> b!133297 m!201875))

(declare-fun m!201877 () Bool)

(assert (=> b!133297 m!201877))

(declare-fun m!201879 () Bool)

(assert (=> b!133297 m!201879))

(declare-fun m!201881 () Bool)

(assert (=> b!133297 m!201881))

(declare-fun m!201883 () Bool)

(assert (=> b!133297 m!201883))

(assert (=> bm!1679 m!201863))

(declare-fun m!201885 () Bool)

(assert (=> bm!1679 m!201885))

(declare-fun m!201887 () Bool)

(assert (=> b!133296 m!201887))

(assert (=> b!133296 m!200837))

(declare-fun m!201889 () Bool)

(assert (=> b!133295 m!201889))

(assert (=> bm!1678 m!201761))

(declare-fun m!201891 () Bool)

(assert (=> d!42528 m!201891))

(assert (=> d!42528 m!201761))

(declare-fun m!201893 () Bool)

(assert (=> b!133298 m!201893))

(declare-fun m!201895 () Bool)

(assert (=> b!133298 m!201895))

(declare-fun m!201897 () Bool)

(assert (=> bm!1677 m!201897))

(assert (=> d!42369 d!42528))

(assert (=> d!42384 d!42432))

(declare-fun d!42530 () Bool)

(assert (=> d!42530 (isPrefixOf!0 lt!205697 (_2!6081 lt!205095))))

(declare-fun lt!206174 () Unit!8174)

(assert (=> d!42530 (= lt!206174 (choose!30 lt!205697 thiss!1634 (_2!6081 lt!205095)))))

(assert (=> d!42530 (isPrefixOf!0 lt!205697 thiss!1634)))

(assert (=> d!42530 (= (lemmaIsPrefixTransitive!0 lt!205697 thiss!1634 (_2!6081 lt!205095)) lt!206174)))

(declare-fun bs!10387 () Bool)

(assert (= bs!10387 d!42530))

(assert (=> bs!10387 m!201371))

(declare-fun m!201899 () Bool)

(assert (=> bs!10387 m!201899))

(declare-fun m!201901 () Bool)

(assert (=> bs!10387 m!201901))

(assert (=> d!42343 d!42530))

(declare-fun d!42532 () Bool)

(assert (=> d!42532 (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205095))))

(declare-fun lt!206175 () Unit!8174)

(assert (=> d!42532 (= lt!206175 (choose!11 (_2!6081 lt!205095)))))

(assert (=> d!42532 (= (lemmaIsPrefixRefl!0 (_2!6081 lt!205095)) lt!206175)))

(declare-fun bs!10388 () Bool)

(assert (= bs!10388 d!42532))

(assert (=> bs!10388 m!201383))

(declare-fun m!201903 () Bool)

(assert (=> bs!10388 m!201903))

(assert (=> d!42343 d!42532))

(assert (=> d!42343 d!42335))

(declare-fun d!42534 () Bool)

(declare-fun res!110736 () Bool)

(declare-fun e!88390 () Bool)

(assert (=> d!42534 (=> (not res!110736) (not e!88390))))

(assert (=> d!42534 (= res!110736 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(assert (=> d!42534 (= (isPrefixOf!0 (_2!6081 lt!205095) (_2!6081 lt!205095)) e!88390)))

(declare-fun b!133300 () Bool)

(declare-fun res!110734 () Bool)

(assert (=> b!133300 (=> (not res!110734) (not e!88390))))

(assert (=> b!133300 (= res!110734 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095))) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(declare-fun b!133301 () Bool)

(declare-fun e!88391 () Bool)

(assert (=> b!133301 (= e!88390 e!88391)))

(declare-fun res!110735 () Bool)

(assert (=> b!133301 (=> res!110735 e!88391)))

(assert (=> b!133301 (= res!110735 (= (size!2771 (buf!3144 (_2!6081 lt!205095))) #b00000000000000000000000000000000))))

(declare-fun b!133302 () Bool)

(assert (=> b!133302 (= e!88391 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205095)) (buf!3144 (_2!6081 lt!205095)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(assert (= (and d!42534 res!110736) b!133300))

(assert (= (and b!133300 res!110734) b!133301))

(assert (= (and b!133301 (not res!110735)) b!133302))

(assert (=> b!133300 m!200857))

(assert (=> b!133300 m!200857))

(assert (=> b!133302 m!200857))

(assert (=> b!133302 m!200857))

(declare-fun m!201905 () Bool)

(assert (=> b!133302 m!201905))

(assert (=> d!42343 d!42534))

(declare-fun d!42536 () Bool)

(assert (=> d!42536 (isPrefixOf!0 lt!205697 lt!205697)))

(declare-fun lt!206176 () Unit!8174)

(assert (=> d!42536 (= lt!206176 (choose!11 lt!205697))))

(assert (=> d!42536 (= (lemmaIsPrefixRefl!0 lt!205697) lt!206176)))

(declare-fun bs!10389 () Bool)

(assert (= bs!10389 d!42536))

(assert (=> bs!10389 m!201385))

(declare-fun m!201907 () Bool)

(assert (=> bs!10389 m!201907))

(assert (=> d!42343 d!42536))

(assert (=> d!42343 d!42460))

(declare-fun d!42538 () Bool)

(declare-fun res!110739 () Bool)

(declare-fun e!88392 () Bool)

(assert (=> d!42538 (=> (not res!110739) (not e!88392))))

(assert (=> d!42538 (= res!110739 (= (size!2771 (buf!3144 lt!205697)) (size!2771 (buf!3144 lt!205697))))))

(assert (=> d!42538 (= (isPrefixOf!0 lt!205697 lt!205697) e!88392)))

(declare-fun b!133303 () Bool)

(declare-fun res!110737 () Bool)

(assert (=> b!133303 (=> (not res!110737) (not e!88392))))

(assert (=> b!133303 (= res!110737 (bvsle (bitIndex!0 (size!2771 (buf!3144 lt!205697)) (currentByte!5929 lt!205697) (currentBit!5924 lt!205697)) (bitIndex!0 (size!2771 (buf!3144 lt!205697)) (currentByte!5929 lt!205697) (currentBit!5924 lt!205697))))))

(declare-fun b!133304 () Bool)

(declare-fun e!88393 () Bool)

(assert (=> b!133304 (= e!88392 e!88393)))

(declare-fun res!110738 () Bool)

(assert (=> b!133304 (=> res!110738 e!88393)))

(assert (=> b!133304 (= res!110738 (= (size!2771 (buf!3144 lt!205697)) #b00000000000000000000000000000000))))

(declare-fun b!133305 () Bool)

(assert (=> b!133305 (= e!88393 (arrayBitRangesEq!0 (buf!3144 lt!205697) (buf!3144 lt!205697) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 lt!205697)) (currentByte!5929 lt!205697) (currentBit!5924 lt!205697))))))

(assert (= (and d!42538 res!110739) b!133303))

(assert (= (and b!133303 res!110737) b!133304))

(assert (= (and b!133304 (not res!110738)) b!133305))

(declare-fun m!201909 () Bool)

(assert (=> b!133303 m!201909))

(assert (=> b!133303 m!201909))

(assert (=> b!133305 m!201909))

(assert (=> b!133305 m!201909))

(declare-fun m!201911 () Bool)

(assert (=> b!133305 m!201911))

(assert (=> d!42343 d!42538))

(declare-fun d!42540 () Bool)

(assert (=> d!42540 (isPrefixOf!0 lt!205697 (_2!6081 lt!205095))))

(declare-fun lt!206177 () Unit!8174)

(assert (=> d!42540 (= lt!206177 (choose!30 lt!205697 (_2!6081 lt!205095) (_2!6081 lt!205095)))))

(assert (=> d!42540 (isPrefixOf!0 lt!205697 (_2!6081 lt!205095))))

(assert (=> d!42540 (= (lemmaIsPrefixTransitive!0 lt!205697 (_2!6081 lt!205095) (_2!6081 lt!205095)) lt!206177)))

(declare-fun bs!10390 () Bool)

(assert (= bs!10390 d!42540))

(assert (=> bs!10390 m!201371))

(declare-fun m!201913 () Bool)

(assert (=> bs!10390 m!201913))

(assert (=> bs!10390 m!201371))

(assert (=> d!42343 d!42540))

(assert (=> d!42343 d!42458))

(declare-fun d!42542 () Bool)

(declare-fun res!110742 () Bool)

(declare-fun e!88394 () Bool)

(assert (=> d!42542 (=> (not res!110742) (not e!88394))))

(assert (=> d!42542 (= res!110742 (= (size!2771 (buf!3144 (_1!6079 lt!205700))) (size!2771 (buf!3144 (_2!6079 lt!205700)))))))

(assert (=> d!42542 (= (isPrefixOf!0 (_1!6079 lt!205700) (_2!6079 lt!205700)) e!88394)))

(declare-fun b!133306 () Bool)

(declare-fun res!110740 () Bool)

(assert (=> b!133306 (=> (not res!110740) (not e!88394))))

(assert (=> b!133306 (= res!110740 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205700))) (currentByte!5929 (_1!6079 lt!205700)) (currentBit!5924 (_1!6079 lt!205700))) (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205700))) (currentByte!5929 (_2!6079 lt!205700)) (currentBit!5924 (_2!6079 lt!205700)))))))

(declare-fun b!133307 () Bool)

(declare-fun e!88395 () Bool)

(assert (=> b!133307 (= e!88394 e!88395)))

(declare-fun res!110741 () Bool)

(assert (=> b!133307 (=> res!110741 e!88395)))

(assert (=> b!133307 (= res!110741 (= (size!2771 (buf!3144 (_1!6079 lt!205700))) #b00000000000000000000000000000000))))

(declare-fun b!133308 () Bool)

(assert (=> b!133308 (= e!88395 (arrayBitRangesEq!0 (buf!3144 (_1!6079 lt!205700)) (buf!3144 (_2!6079 lt!205700)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205700))) (currentByte!5929 (_1!6079 lt!205700)) (currentBit!5924 (_1!6079 lt!205700)))))))

(assert (= (and d!42542 res!110742) b!133306))

(assert (= (and b!133306 res!110740) b!133307))

(assert (= (and b!133307 (not res!110741)) b!133308))

(assert (=> b!133306 m!201765))

(assert (=> b!133306 m!201553))

(assert (=> b!133308 m!201765))

(assert (=> b!133308 m!201765))

(declare-fun m!201915 () Bool)

(assert (=> b!133308 m!201915))

(assert (=> d!42343 d!42542))

(declare-fun d!42544 () Bool)

(declare-fun res!110745 () Bool)

(declare-fun e!88396 () Bool)

(assert (=> d!42544 (=> (not res!110745) (not e!88396))))

(assert (=> d!42544 (= res!110745 (= (size!2771 (buf!3144 lt!205697)) (size!2771 (buf!3144 (_2!6081 lt!205095)))))))

(assert (=> d!42544 (= (isPrefixOf!0 lt!205697 (_2!6081 lt!205095)) e!88396)))

(declare-fun b!133309 () Bool)

(declare-fun res!110743 () Bool)

(assert (=> b!133309 (=> (not res!110743) (not e!88396))))

(assert (=> b!133309 (= res!110743 (bvsle (bitIndex!0 (size!2771 (buf!3144 lt!205697)) (currentByte!5929 lt!205697) (currentBit!5924 lt!205697)) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205095))) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))))))

(declare-fun b!133310 () Bool)

(declare-fun e!88397 () Bool)

(assert (=> b!133310 (= e!88396 e!88397)))

(declare-fun res!110744 () Bool)

(assert (=> b!133310 (=> res!110744 e!88397)))

(assert (=> b!133310 (= res!110744 (= (size!2771 (buf!3144 lt!205697)) #b00000000000000000000000000000000))))

(declare-fun b!133311 () Bool)

(assert (=> b!133311 (= e!88397 (arrayBitRangesEq!0 (buf!3144 lt!205697) (buf!3144 (_2!6081 lt!205095)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 lt!205697)) (currentByte!5929 lt!205697) (currentBit!5924 lt!205697))))))

(assert (= (and d!42544 res!110745) b!133309))

(assert (= (and b!133309 res!110743) b!133310))

(assert (= (and b!133310 (not res!110744)) b!133311))

(assert (=> b!133309 m!201909))

(assert (=> b!133309 m!200857))

(assert (=> b!133311 m!201909))

(assert (=> b!133311 m!201909))

(declare-fun m!201917 () Bool)

(assert (=> b!133311 m!201917))

(assert (=> d!42343 d!42544))

(declare-fun d!42546 () Bool)

(declare-fun lt!206178 () tuple2!11564)

(assert (=> d!42546 (= lt!206178 (readByte!0 (_1!6079 lt!205892)))))

(assert (=> d!42546 (= (readBytePure!0 (_1!6079 lt!205892)) (tuple2!11549 (_2!6090 lt!206178) (_1!6090 lt!206178)))))

(declare-fun bs!10391 () Bool)

(assert (= bs!10391 d!42546))

(declare-fun m!201919 () Bool)

(assert (=> bs!10391 m!201919))

(assert (=> b!133142 d!42546))

(declare-fun b!133312 () Bool)

(declare-fun e!88399 () Unit!8174)

(declare-fun Unit!8215 () Unit!8174)

(assert (=> b!133312 (= e!88399 Unit!8215)))

(declare-fun b!133313 () Bool)

(declare-fun lt!206183 () Unit!8174)

(assert (=> b!133313 (= e!88399 lt!206183)))

(declare-fun lt!206193 () (_ BitVec 64))

(assert (=> b!133313 (= lt!206193 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!206186 () (_ BitVec 64))

(assert (=> b!133313 (= lt!206186 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(assert (=> b!133313 (= lt!206183 (arrayBitRangesEqSymmetric!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205891)) lt!206193 lt!206186))))

(assert (=> b!133313 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205891)) (buf!3144 thiss!1634) lt!206193 lt!206186)))

(declare-fun d!42548 () Bool)

(declare-fun e!88398 () Bool)

(assert (=> d!42548 e!88398))

(declare-fun res!110748 () Bool)

(assert (=> d!42548 (=> (not res!110748) (not e!88398))))

(declare-fun lt!206182 () tuple2!11546)

(assert (=> d!42548 (= res!110748 (isPrefixOf!0 (_1!6079 lt!206182) (_2!6079 lt!206182)))))

(declare-fun lt!206179 () BitStream!4806)

(assert (=> d!42548 (= lt!206182 (tuple2!11547 lt!206179 (_2!6081 lt!205891)))))

(declare-fun lt!206189 () Unit!8174)

(declare-fun lt!206188 () Unit!8174)

(assert (=> d!42548 (= lt!206189 lt!206188)))

(assert (=> d!42548 (isPrefixOf!0 lt!206179 (_2!6081 lt!205891))))

(assert (=> d!42548 (= lt!206188 (lemmaIsPrefixTransitive!0 lt!206179 (_2!6081 lt!205891) (_2!6081 lt!205891)))))

(declare-fun lt!206191 () Unit!8174)

(declare-fun lt!206195 () Unit!8174)

(assert (=> d!42548 (= lt!206191 lt!206195)))

(assert (=> d!42548 (isPrefixOf!0 lt!206179 (_2!6081 lt!205891))))

(assert (=> d!42548 (= lt!206195 (lemmaIsPrefixTransitive!0 lt!206179 thiss!1634 (_2!6081 lt!205891)))))

(declare-fun lt!206180 () Unit!8174)

(assert (=> d!42548 (= lt!206180 e!88399)))

(declare-fun c!7612 () Bool)

(assert (=> d!42548 (= c!7612 (not (= (size!2771 (buf!3144 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!206187 () Unit!8174)

(declare-fun lt!206196 () Unit!8174)

(assert (=> d!42548 (= lt!206187 lt!206196)))

(assert (=> d!42548 (isPrefixOf!0 (_2!6081 lt!205891) (_2!6081 lt!205891))))

(assert (=> d!42548 (= lt!206196 (lemmaIsPrefixRefl!0 (_2!6081 lt!205891)))))

(declare-fun lt!206181 () Unit!8174)

(declare-fun lt!206184 () Unit!8174)

(assert (=> d!42548 (= lt!206181 lt!206184)))

(assert (=> d!42548 (= lt!206184 (lemmaIsPrefixRefl!0 (_2!6081 lt!205891)))))

(declare-fun lt!206197 () Unit!8174)

(declare-fun lt!206198 () Unit!8174)

(assert (=> d!42548 (= lt!206197 lt!206198)))

(assert (=> d!42548 (isPrefixOf!0 lt!206179 lt!206179)))

(assert (=> d!42548 (= lt!206198 (lemmaIsPrefixRefl!0 lt!206179))))

(declare-fun lt!206185 () Unit!8174)

(declare-fun lt!206192 () Unit!8174)

(assert (=> d!42548 (= lt!206185 lt!206192)))

(assert (=> d!42548 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!42548 (= lt!206192 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!42548 (= lt!206179 (BitStream!4807 (buf!3144 (_2!6081 lt!205891)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(assert (=> d!42548 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205891))))

(assert (=> d!42548 (= (reader!0 thiss!1634 (_2!6081 lt!205891)) lt!206182)))

(declare-fun lt!206194 () (_ BitVec 64))

(declare-fun b!133314 () Bool)

(declare-fun lt!206190 () (_ BitVec 64))

(assert (=> b!133314 (= e!88398 (= (_1!6079 lt!206182) (withMovedBitIndex!0 (_2!6079 lt!206182) (bvsub lt!206190 lt!206194))))))

(assert (=> b!133314 (or (= (bvand lt!206190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206190 lt!206194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133314 (= lt!206194 (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205891))) (currentByte!5929 (_2!6081 lt!205891)) (currentBit!5924 (_2!6081 lt!205891))))))

(assert (=> b!133314 (= lt!206190 (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)))))

(declare-fun b!133315 () Bool)

(declare-fun res!110746 () Bool)

(assert (=> b!133315 (=> (not res!110746) (not e!88398))))

(assert (=> b!133315 (= res!110746 (isPrefixOf!0 (_2!6079 lt!206182) (_2!6081 lt!205891)))))

(declare-fun b!133316 () Bool)

(declare-fun res!110747 () Bool)

(assert (=> b!133316 (=> (not res!110747) (not e!88398))))

(assert (=> b!133316 (= res!110747 (isPrefixOf!0 (_1!6079 lt!206182) thiss!1634))))

(assert (= (and d!42548 c!7612) b!133313))

(assert (= (and d!42548 (not c!7612)) b!133312))

(assert (= (and d!42548 res!110748) b!133316))

(assert (= (and b!133316 res!110747) b!133315))

(assert (= (and b!133315 res!110746) b!133314))

(declare-fun m!201921 () Bool)

(assert (=> b!133316 m!201921))

(declare-fun m!201923 () Bool)

(assert (=> b!133314 m!201923))

(assert (=> b!133314 m!201545))

(assert (=> b!133314 m!200859))

(declare-fun m!201925 () Bool)

(assert (=> d!42548 m!201925))

(declare-fun m!201927 () Bool)

(assert (=> d!42548 m!201927))

(declare-fun m!201929 () Bool)

(assert (=> d!42548 m!201929))

(declare-fun m!201931 () Bool)

(assert (=> d!42548 m!201931))

(declare-fun m!201933 () Bool)

(assert (=> d!42548 m!201933))

(declare-fun m!201935 () Bool)

(assert (=> d!42548 m!201935))

(assert (=> d!42548 m!201547))

(assert (=> d!42548 m!201381))

(declare-fun m!201937 () Bool)

(assert (=> d!42548 m!201937))

(declare-fun m!201939 () Bool)

(assert (=> d!42548 m!201939))

(assert (=> d!42548 m!201387))

(assert (=> b!133313 m!200859))

(declare-fun m!201941 () Bool)

(assert (=> b!133313 m!201941))

(declare-fun m!201943 () Bool)

(assert (=> b!133313 m!201943))

(declare-fun m!201945 () Bool)

(assert (=> b!133315 m!201945))

(assert (=> b!133142 d!42548))

(assert (=> d!42333 d!42472))

(declare-fun d!42550 () Bool)

(declare-fun res!110751 () Bool)

(declare-fun e!88400 () Bool)

(assert (=> d!42550 (=> (not res!110751) (not e!88400))))

(assert (=> d!42550 (= res!110751 (= (size!2771 (buf!3144 lt!205747)) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (=> d!42550 (= (isPrefixOf!0 lt!205747 (_2!6081 lt!205096)) e!88400)))

(declare-fun b!133317 () Bool)

(declare-fun res!110749 () Bool)

(assert (=> b!133317 (=> (not res!110749) (not e!88400))))

(assert (=> b!133317 (= res!110749 (bvsle (bitIndex!0 (size!2771 (buf!3144 lt!205747)) (currentByte!5929 lt!205747) (currentBit!5924 lt!205747)) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096)))))))

(declare-fun b!133318 () Bool)

(declare-fun e!88401 () Bool)

(assert (=> b!133318 (= e!88400 e!88401)))

(declare-fun res!110750 () Bool)

(assert (=> b!133318 (=> res!110750 e!88401)))

(assert (=> b!133318 (= res!110750 (= (size!2771 (buf!3144 lt!205747)) #b00000000000000000000000000000000))))

(declare-fun b!133319 () Bool)

(assert (=> b!133319 (= e!88401 (arrayBitRangesEq!0 (buf!3144 lt!205747) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 lt!205747)) (currentByte!5929 lt!205747) (currentBit!5924 lt!205747))))))

(assert (= (and d!42550 res!110751) b!133317))

(assert (= (and b!133317 res!110749) b!133318))

(assert (= (and b!133318 (not res!110750)) b!133319))

(declare-fun m!201947 () Bool)

(assert (=> b!133317 m!201947))

(assert (=> b!133317 m!200883))

(assert (=> b!133319 m!201947))

(assert (=> b!133319 m!201947))

(declare-fun m!201949 () Bool)

(assert (=> b!133319 m!201949))

(assert (=> d!42361 d!42550))

(assert (=> d!42361 d!42532))

(declare-fun d!42552 () Bool)

(declare-fun res!110754 () Bool)

(declare-fun e!88402 () Bool)

(assert (=> d!42552 (=> (not res!110754) (not e!88402))))

(assert (=> d!42552 (= res!110754 (= (size!2771 (buf!3144 (_1!6079 lt!205750))) (size!2771 (buf!3144 (_2!6079 lt!205750)))))))

(assert (=> d!42552 (= (isPrefixOf!0 (_1!6079 lt!205750) (_2!6079 lt!205750)) e!88402)))

(declare-fun b!133320 () Bool)

(declare-fun res!110752 () Bool)

(assert (=> b!133320 (=> (not res!110752) (not e!88402))))

(assert (=> b!133320 (= res!110752 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205750))) (currentByte!5929 (_1!6079 lt!205750)) (currentBit!5924 (_1!6079 lt!205750))) (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205750))) (currentByte!5929 (_2!6079 lt!205750)) (currentBit!5924 (_2!6079 lt!205750)))))))

(declare-fun b!133321 () Bool)

(declare-fun e!88403 () Bool)

(assert (=> b!133321 (= e!88402 e!88403)))

(declare-fun res!110753 () Bool)

(assert (=> b!133321 (=> res!110753 e!88403)))

(assert (=> b!133321 (= res!110753 (= (size!2771 (buf!3144 (_1!6079 lt!205750))) #b00000000000000000000000000000000))))

(declare-fun b!133322 () Bool)

(assert (=> b!133322 (= e!88403 (arrayBitRangesEq!0 (buf!3144 (_1!6079 lt!205750)) (buf!3144 (_2!6079 lt!205750)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205750))) (currentByte!5929 (_1!6079 lt!205750)) (currentBit!5924 (_1!6079 lt!205750)))))))

(assert (= (and d!42552 res!110754) b!133320))

(assert (= (and b!133320 res!110752) b!133321))

(assert (= (and b!133321 (not res!110753)) b!133322))

(assert (=> b!133320 m!201601))

(assert (=> b!133320 m!201725))

(assert (=> b!133322 m!201601))

(assert (=> b!133322 m!201601))

(declare-fun m!201951 () Bool)

(assert (=> b!133322 m!201951))

(assert (=> d!42361 d!42552))

(assert (=> d!42361 d!42534))

(declare-fun d!42554 () Bool)

(assert (=> d!42554 (isPrefixOf!0 lt!205747 (_2!6081 lt!205096))))

(declare-fun lt!206199 () Unit!8174)

(assert (=> d!42554 (= lt!206199 (choose!30 lt!205747 (_2!6081 lt!205095) (_2!6081 lt!205096)))))

(assert (=> d!42554 (isPrefixOf!0 lt!205747 (_2!6081 lt!205095))))

(assert (=> d!42554 (= (lemmaIsPrefixTransitive!0 lt!205747 (_2!6081 lt!205095) (_2!6081 lt!205096)) lt!206199)))

(declare-fun bs!10392 () Bool)

(assert (= bs!10392 d!42554))

(assert (=> bs!10392 m!201419))

(declare-fun m!201953 () Bool)

(assert (=> bs!10392 m!201953))

(declare-fun m!201955 () Bool)

(assert (=> bs!10392 m!201955))

(assert (=> d!42361 d!42554))

(assert (=> d!42361 d!42454))

(declare-fun d!42556 () Bool)

(assert (=> d!42556 (isPrefixOf!0 lt!205747 lt!205747)))

(declare-fun lt!206200 () Unit!8174)

(assert (=> d!42556 (= lt!206200 (choose!11 lt!205747))))

(assert (=> d!42556 (= (lemmaIsPrefixRefl!0 lt!205747) lt!206200)))

(declare-fun bs!10393 () Bool)

(assert (= bs!10393 d!42556))

(assert (=> bs!10393 m!201431))

(declare-fun m!201957 () Bool)

(assert (=> bs!10393 m!201957))

(assert (=> d!42361 d!42556))

(assert (=> d!42361 d!42456))

(assert (=> d!42361 d!42345))

(declare-fun d!42558 () Bool)

(declare-fun res!110757 () Bool)

(declare-fun e!88404 () Bool)

(assert (=> d!42558 (=> (not res!110757) (not e!88404))))

(assert (=> d!42558 (= res!110757 (= (size!2771 (buf!3144 lt!205747)) (size!2771 (buf!3144 lt!205747))))))

(assert (=> d!42558 (= (isPrefixOf!0 lt!205747 lt!205747) e!88404)))

(declare-fun b!133323 () Bool)

(declare-fun res!110755 () Bool)

(assert (=> b!133323 (=> (not res!110755) (not e!88404))))

(assert (=> b!133323 (= res!110755 (bvsle (bitIndex!0 (size!2771 (buf!3144 lt!205747)) (currentByte!5929 lt!205747) (currentBit!5924 lt!205747)) (bitIndex!0 (size!2771 (buf!3144 lt!205747)) (currentByte!5929 lt!205747) (currentBit!5924 lt!205747))))))

(declare-fun b!133324 () Bool)

(declare-fun e!88405 () Bool)

(assert (=> b!133324 (= e!88404 e!88405)))

(declare-fun res!110756 () Bool)

(assert (=> b!133324 (=> res!110756 e!88405)))

(assert (=> b!133324 (= res!110756 (= (size!2771 (buf!3144 lt!205747)) #b00000000000000000000000000000000))))

(declare-fun b!133325 () Bool)

(assert (=> b!133325 (= e!88405 (arrayBitRangesEq!0 (buf!3144 lt!205747) (buf!3144 lt!205747) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 lt!205747)) (currentByte!5929 lt!205747) (currentBit!5924 lt!205747))))))

(assert (= (and d!42558 res!110757) b!133323))

(assert (= (and b!133323 res!110755) b!133324))

(assert (= (and b!133324 (not res!110756)) b!133325))

(assert (=> b!133323 m!201947))

(assert (=> b!133323 m!201947))

(assert (=> b!133325 m!201947))

(assert (=> b!133325 m!201947))

(declare-fun m!201959 () Bool)

(assert (=> b!133325 m!201959))

(assert (=> d!42361 d!42558))

(declare-fun d!42560 () Bool)

(assert (=> d!42560 (isPrefixOf!0 lt!205747 (_2!6081 lt!205096))))

(declare-fun lt!206201 () Unit!8174)

(assert (=> d!42560 (= lt!206201 (choose!30 lt!205747 (_2!6081 lt!205096) (_2!6081 lt!205096)))))

(assert (=> d!42560 (isPrefixOf!0 lt!205747 (_2!6081 lt!205096))))

(assert (=> d!42560 (= (lemmaIsPrefixTransitive!0 lt!205747 (_2!6081 lt!205096) (_2!6081 lt!205096)) lt!206201)))

(declare-fun bs!10394 () Bool)

(assert (= bs!10394 d!42560))

(assert (=> bs!10394 m!201419))

(declare-fun m!201961 () Bool)

(assert (=> bs!10394 m!201961))

(assert (=> bs!10394 m!201419))

(assert (=> d!42361 d!42560))

(declare-fun d!42562 () Bool)

(assert (=> d!42562 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205875) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205095)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095)))) lt!205875))))

(declare-fun bs!10395 () Bool)

(assert (= bs!10395 d!42562))

(assert (=> bs!10395 m!201397))

(assert (=> b!133132 d!42562))

(declare-fun lt!206227 () tuple3!506)

(declare-fun call!1685 () Bool)

(declare-fun c!7613 () Bool)

(declare-fun bm!1680 () Bool)

(assert (=> bm!1680 (= call!1685 (arrayRangesEq!174 lt!205086 (ite c!7613 (_3!308 lt!206227) lt!205086) #b00000000000000000000000000000000 (ite c!7613 (bvadd #b00000000000000000000000000000001 from!447) (size!2771 lt!205086))))))

(declare-fun bm!1681 () Bool)

(declare-fun call!1683 () (_ BitVec 64))

(assert (=> bm!1681 (= call!1683 (bitIndex!0 (size!2771 (buf!3144 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001))) (currentByte!5929 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001)) (currentBit!5924 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001))))))

(declare-fun lt!206228 () (_ BitVec 32))

(declare-fun lt!206215 () array!6120)

(declare-fun lt!206216 () array!6120)

(declare-fun lt!206232 () tuple2!11564)

(declare-fun call!1684 () Bool)

(declare-fun bm!1682 () Bool)

(declare-fun lt!206207 () (_ BitVec 32))

(assert (=> bm!1682 (= call!1684 (arrayRangesEq!174 (ite c!7613 lt!205086 lt!206216) (ite c!7613 (array!6121 (store (arr!3406 lt!205086) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206232)) (size!2771 lt!205086)) lt!206215) (ite c!7613 #b00000000000000000000000000000000 lt!206228) (ite c!7613 (bvadd #b00000000000000000000000000000001 from!447) lt!206207)))))

(declare-fun e!88407 () Bool)

(declare-fun lt!206225 () tuple3!506)

(declare-fun b!133327 () Bool)

(assert (=> b!133327 (= e!88407 (= (select (arr!3406 (_3!308 lt!206225)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6080 (readBytePure!0 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001)))))))

(assert (=> b!133327 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2771 (_3!308 lt!206225))))))

(declare-fun b!133328 () Bool)

(declare-fun e!88406 () tuple3!506)

(declare-fun lt!206218 () Unit!8174)

(assert (=> b!133328 (= e!88406 (tuple3!507 lt!206218 (_2!6091 lt!206227) (_3!308 lt!206227)))))

(assert (=> b!133328 (= lt!206232 (readByte!0 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001)))))

(declare-fun lt!206212 () array!6120)

(assert (=> b!133328 (= lt!206212 (array!6121 (store (arr!3406 lt!205086) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206232)) (size!2771 lt!205086)))))

(declare-fun lt!206204 () (_ BitVec 64))

(assert (=> b!133328 (= lt!206204 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!206211 () (_ BitVec 32))

(assert (=> b!133328 (= lt!206211 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206230 () Unit!8174)

(assert (=> b!133328 (= lt!206230 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) (_2!6090 lt!206232) lt!206204 lt!206211))))

(assert (=> b!133328 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6090 lt!206232)))) ((_ sign_extend 32) (currentByte!5929 (_2!6090 lt!206232))) ((_ sign_extend 32) (currentBit!5924 (_2!6090 lt!206232))) (bvsub lt!206211 ((_ extract 31 0) (bvsdiv (bvadd lt!206204 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!206213 () Unit!8174)

(assert (=> b!133328 (= lt!206213 lt!206230)))

(assert (=> b!133328 (= lt!206227 (readByteArrayLoop!0 (_2!6090 lt!206232) lt!206212 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!133328 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206232))) (currentByte!5929 (_2!6090 lt!206232)) (currentBit!5924 (_2!6090 lt!206232))) (bvadd call!1683 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!206217 () Unit!8174)

(declare-fun Unit!8216 () Unit!8174)

(assert (=> b!133328 (= lt!206217 Unit!8216)))

(assert (=> b!133328 (= (bvadd (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206232))) (currentByte!5929 (_2!6090 lt!206232)) (currentBit!5924 (_2!6090 lt!206232))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206227))) (currentByte!5929 (_2!6091 lt!206227)) (currentBit!5924 (_2!6091 lt!206227))))))

(declare-fun lt!206235 () Unit!8174)

(declare-fun Unit!8217 () Unit!8174)

(assert (=> b!133328 (= lt!206235 Unit!8217)))

(assert (=> b!133328 (= (bvadd call!1683 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206227))) (currentByte!5929 (_2!6091 lt!206227)) (currentBit!5924 (_2!6091 lt!206227))))))

(declare-fun lt!206202 () Unit!8174)

(declare-fun Unit!8218 () Unit!8174)

(assert (=> b!133328 (= lt!206202 Unit!8218)))

(assert (=> b!133328 (and (= (buf!3144 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001)) (buf!3144 (_2!6091 lt!206227))) (= (size!2771 lt!205086) (size!2771 (_3!308 lt!206227))))))

(declare-fun lt!206208 () Unit!8174)

(declare-fun Unit!8219 () Unit!8174)

(assert (=> b!133328 (= lt!206208 Unit!8219)))

(declare-fun lt!206219 () Unit!8174)

(assert (=> b!133328 (= lt!206219 (arrayUpdatedAtPrefixLemma!1 lt!205086 (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206232)))))

(assert (=> b!133328 call!1684))

(declare-fun lt!206222 () Unit!8174)

(assert (=> b!133328 (= lt!206222 lt!206219)))

(declare-fun lt!206220 () (_ BitVec 32))

(assert (=> b!133328 (= lt!206220 #b00000000000000000000000000000000)))

(declare-fun lt!206234 () Unit!8174)

(assert (=> b!133328 (= lt!206234 (arrayRangesEqTransitive!1 lt!205086 lt!206212 (_3!308 lt!206227) lt!206220 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133328 (arrayRangesEq!174 lt!205086 (_3!308 lt!206227) lt!206220 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!206231 () Unit!8174)

(assert (=> b!133328 (= lt!206231 lt!206234)))

(assert (=> b!133328 call!1685))

(declare-fun lt!206214 () Unit!8174)

(declare-fun Unit!8220 () Unit!8174)

(assert (=> b!133328 (= lt!206214 Unit!8220)))

(declare-fun lt!206223 () Unit!8174)

(assert (=> b!133328 (= lt!206223 (arrayRangesEqImpliesEq!1 lt!206212 (_3!308 lt!206227) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133328 (= (select (store (arr!3406 lt!205086) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206232)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3406 (_3!308 lt!206227)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206203 () Unit!8174)

(assert (=> b!133328 (= lt!206203 lt!206223)))

(declare-fun lt!206221 () Bool)

(assert (=> b!133328 (= lt!206221 (= (select (arr!3406 (_3!308 lt!206227)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6090 lt!206232)))))

(declare-fun Unit!8221 () Unit!8174)

(assert (=> b!133328 (= lt!206218 Unit!8221)))

(assert (=> b!133328 lt!206221))

(declare-fun b!133329 () Bool)

(declare-fun lt!206205 () Unit!8174)

(assert (=> b!133329 (= e!88406 (tuple3!507 lt!206205 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) lt!205086))))

(assert (=> b!133329 (= call!1683 call!1683)))

(declare-fun lt!206229 () Unit!8174)

(declare-fun Unit!8222 () Unit!8174)

(assert (=> b!133329 (= lt!206229 Unit!8222)))

(declare-fun lt!206210 () Unit!8174)

(assert (=> b!133329 (= lt!206210 (arrayRangesEqReflexiveLemma!1 lt!205086))))

(assert (=> b!133329 call!1685))

(declare-fun lt!206233 () Unit!8174)

(assert (=> b!133329 (= lt!206233 lt!206210)))

(assert (=> b!133329 (= lt!206216 lt!205086)))

(assert (=> b!133329 (= lt!206215 lt!205086)))

(declare-fun lt!206236 () (_ BitVec 32))

(assert (=> b!133329 (= lt!206236 #b00000000000000000000000000000000)))

(declare-fun lt!206209 () (_ BitVec 32))

(assert (=> b!133329 (= lt!206209 (size!2771 lt!205086))))

(assert (=> b!133329 (= lt!206228 #b00000000000000000000000000000000)))

(assert (=> b!133329 (= lt!206207 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!133329 (= lt!206205 (arrayRangesEqSlicedLemma!1 lt!206216 lt!206215 lt!206236 lt!206209 lt!206228 lt!206207))))

(assert (=> b!133329 call!1684))

(declare-fun b!133330 () Bool)

(declare-fun res!110758 () Bool)

(declare-fun e!88408 () Bool)

(assert (=> b!133330 (=> (not res!110758) (not e!88408))))

(assert (=> b!133330 (= res!110758 (and (= (buf!3144 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001)) (buf!3144 (_2!6091 lt!206225))) (= (size!2771 lt!205086) (size!2771 (_3!308 lt!206225)))))))

(declare-fun b!133326 () Bool)

(assert (=> b!133326 (= e!88408 (arrayRangesEq!174 lt!205086 (_3!308 lt!206225) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun d!42564 () Bool)

(assert (=> d!42564 e!88407))

(declare-fun res!110760 () Bool)

(assert (=> d!42564 (=> res!110760 e!88407)))

(assert (=> d!42564 (= res!110760 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206226 () Bool)

(assert (=> d!42564 (= lt!206226 e!88408)))

(declare-fun res!110759 () Bool)

(assert (=> d!42564 (=> (not res!110759) (not e!88408))))

(declare-fun lt!206206 () (_ BitVec 64))

(declare-fun lt!206237 () (_ BitVec 64))

(assert (=> d!42564 (= res!110759 (= (bvadd lt!206206 lt!206237) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206225))) (currentByte!5929 (_2!6091 lt!206225)) (currentBit!5924 (_2!6091 lt!206225)))))))

(assert (=> d!42564 (or (not (= (bvand lt!206206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206237 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206206 lt!206237) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!206224 () (_ BitVec 64))

(assert (=> d!42564 (= lt!206237 (bvmul lt!206224 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!42564 (or (= lt!206224 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206224 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206224)))))

(assert (=> d!42564 (= lt!206224 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!42564 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!42564 (= lt!206206 (bitIndex!0 (size!2771 (buf!3144 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001))) (currentByte!5929 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001)) (currentBit!5924 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001))))))

(assert (=> d!42564 (= lt!206225 e!88406)))

(assert (=> d!42564 (= c!7613 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42564 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2771 lt!205086)))))

(assert (=> d!42564 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) lt!205086 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!206225)))

(assert (= (and d!42564 c!7613) b!133328))

(assert (= (and d!42564 (not c!7613)) b!133329))

(assert (= (or b!133328 b!133329) bm!1682))

(assert (= (or b!133328 b!133329) bm!1680))

(assert (= (or b!133328 b!133329) bm!1681))

(assert (= (and d!42564 res!110759) b!133330))

(assert (= (and b!133330 res!110758) b!133326))

(assert (= (and d!42564 (not res!110760)) b!133327))

(declare-fun m!201963 () Bool)

(assert (=> b!133328 m!201963))

(assert (=> b!133328 m!200805))

(declare-fun m!201965 () Bool)

(assert (=> b!133328 m!201965))

(declare-fun m!201967 () Bool)

(assert (=> b!133328 m!201967))

(declare-fun m!201969 () Bool)

(assert (=> b!133328 m!201969))

(declare-fun m!201971 () Bool)

(assert (=> b!133328 m!201971))

(declare-fun m!201973 () Bool)

(assert (=> b!133328 m!201973))

(declare-fun m!201975 () Bool)

(assert (=> b!133328 m!201975))

(declare-fun m!201977 () Bool)

(assert (=> b!133328 m!201977))

(assert (=> b!133328 m!200805))

(declare-fun m!201979 () Bool)

(assert (=> b!133328 m!201979))

(declare-fun m!201981 () Bool)

(assert (=> b!133328 m!201981))

(declare-fun m!201983 () Bool)

(assert (=> b!133328 m!201983))

(declare-fun m!201985 () Bool)

(assert (=> b!133328 m!201985))

(declare-fun m!201987 () Bool)

(assert (=> b!133328 m!201987))

(assert (=> bm!1682 m!201967))

(declare-fun m!201989 () Bool)

(assert (=> bm!1682 m!201989))

(declare-fun m!201991 () Bool)

(assert (=> b!133327 m!201991))

(assert (=> b!133327 m!200805))

(declare-fun m!201993 () Bool)

(assert (=> b!133327 m!201993))

(declare-fun m!201995 () Bool)

(assert (=> b!133326 m!201995))

(declare-fun m!201997 () Bool)

(assert (=> bm!1681 m!201997))

(declare-fun m!201999 () Bool)

(assert (=> d!42564 m!201999))

(assert (=> d!42564 m!201997))

(assert (=> b!133329 m!201831))

(declare-fun m!202001 () Bool)

(assert (=> b!133329 m!202001))

(declare-fun m!202003 () Bool)

(assert (=> bm!1680 m!202003))

(assert (=> d!42412 d!42564))

(assert (=> d!42371 d!42377))

(declare-fun d!42566 () Bool)

(assert (=> d!42566 (isPrefixOf!0 thiss!1634 (_2!6081 lt!205096))))

(assert (=> d!42566 true))

(declare-fun _$15!201 () Unit!8174)

(assert (=> d!42566 (= (choose!30 thiss!1634 (_2!6081 lt!205095) (_2!6081 lt!205096)) _$15!201)))

(declare-fun bs!10396 () Bool)

(assert (= bs!10396 d!42566))

(assert (=> bs!10396 m!200803))

(assert (=> d!42371 d!42566))

(assert (=> d!42371 d!42335))

(assert (=> d!42375 d!42369))

(assert (=> d!42375 d!42373))

(declare-fun d!42568 () Bool)

(declare-fun lt!206238 () tuple3!506)

(assert (=> d!42568 (= lt!206238 (readByteArrayLoop!0 lt!205787 (array!6121 (store (arr!3406 arr!237) from!447 (_2!6080 (readBytePure!0 (_1!6079 lt!205083)))) (size!2771 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!42568 (= (readByteArrayLoopPure!0 lt!205787 (array!6121 (store (arr!3406 arr!237) from!447 (_2!6080 (readBytePure!0 (_1!6079 lt!205083)))) (size!2771 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!11545 (_2!6091 lt!206238) (_3!308 lt!206238)))))

(declare-fun bs!10397 () Bool)

(assert (= bs!10397 d!42568))

(declare-fun m!202005 () Bool)

(assert (=> bs!10397 m!202005))

(assert (=> d!42375 d!42568))

(assert (=> d!42375 d!42406))

(declare-fun d!42570 () Bool)

(assert (=> d!42570 (arrayRangesEq!174 (_2!6078 (readByteArrayLoopPure!0 (_1!6079 lt!205083) arr!237 from!447 to!404)) (_2!6078 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6079 lt!205083) #b00000000000000000000000000000001) (array!6121 (store (arr!3406 arr!237) from!447 (_2!6080 (readBytePure!0 (_1!6079 lt!205083)))) (size!2771 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!42570 true))

(declare-fun _$13!34 () Unit!8174)

(assert (=> d!42570 (= (choose!35 (_1!6079 lt!205083) arr!237 from!447 to!404 lt!205786 (_2!6078 lt!205786) lt!205787 lt!205788 (_2!6078 lt!205788)) _$13!34)))

(declare-fun bs!10399 () Bool)

(assert (= bs!10399 d!42570))

(declare-fun m!202007 () Bool)

(assert (=> bs!10399 m!202007))

(assert (=> bs!10399 m!200805))

(declare-fun m!202009 () Bool)

(assert (=> bs!10399 m!202009))

(assert (=> bs!10399 m!200811))

(assert (=> bs!10399 m!201455))

(assert (=> bs!10399 m!200837))

(assert (=> bs!10399 m!200805))

(assert (=> d!42375 d!42570))

(declare-fun d!42572 () Bool)

(declare-fun res!110761 () Bool)

(declare-fun e!88409 () Bool)

(assert (=> d!42572 (=> res!110761 e!88409)))

(assert (=> d!42572 (= res!110761 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!42572 (= (arrayRangesEq!174 (_2!6078 lt!205786) (_2!6078 lt!205788) #b00000000000000000000000000000000 to!404) e!88409)))

(declare-fun b!133331 () Bool)

(declare-fun e!88410 () Bool)

(assert (=> b!133331 (= e!88409 e!88410)))

(declare-fun res!110762 () Bool)

(assert (=> b!133331 (=> (not res!110762) (not e!88410))))

(assert (=> b!133331 (= res!110762 (= (select (arr!3406 (_2!6078 lt!205786)) #b00000000000000000000000000000000) (select (arr!3406 (_2!6078 lt!205788)) #b00000000000000000000000000000000)))))

(declare-fun b!133332 () Bool)

(assert (=> b!133332 (= e!88410 (arrayRangesEq!174 (_2!6078 lt!205786) (_2!6078 lt!205788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!42572 (not res!110761)) b!133331))

(assert (= (and b!133331 res!110762) b!133332))

(declare-fun m!202011 () Bool)

(assert (=> b!133331 m!202011))

(declare-fun m!202013 () Bool)

(assert (=> b!133331 m!202013))

(declare-fun m!202015 () Bool)

(assert (=> b!133332 m!202015))

(assert (=> d!42375 d!42572))

(declare-fun d!42574 () Bool)

(assert (=> d!42574 (= (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205096))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205096)))) (bvsub (bvmul ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205096))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205096))))))))

(assert (=> d!42367 d!42574))

(declare-fun d!42576 () Bool)

(assert (=> d!42576 (= (invariant!0 (currentBit!5924 (_2!6081 lt!205096)) (currentByte!5929 (_2!6081 lt!205096)) (size!2771 (buf!3144 (_2!6081 lt!205096)))) (and (bvsge (currentBit!5924 (_2!6081 lt!205096)) #b00000000000000000000000000000000) (bvslt (currentBit!5924 (_2!6081 lt!205096)) #b00000000000000000000000000001000) (bvsge (currentByte!5929 (_2!6081 lt!205096)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5929 (_2!6081 lt!205096)) (size!2771 (buf!3144 (_2!6081 lt!205096)))) (and (= (currentBit!5924 (_2!6081 lt!205096)) #b00000000000000000000000000000000) (= (currentByte!5929 (_2!6081 lt!205096)) (size!2771 (buf!3144 (_2!6081 lt!205096))))))))))

(assert (=> d!42367 d!42576))

(declare-fun d!42578 () Bool)

(declare-fun e!88411 () Bool)

(assert (=> d!42578 e!88411))

(declare-fun res!110764 () Bool)

(assert (=> d!42578 (=> (not res!110764) (not e!88411))))

(declare-fun lt!206244 () (_ BitVec 64))

(declare-fun lt!206241 () (_ BitVec 64))

(declare-fun lt!206240 () (_ BitVec 64))

(assert (=> d!42578 (= res!110764 (= lt!206244 (bvsub lt!206241 lt!206240)))))

(assert (=> d!42578 (or (= (bvand lt!206241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206240 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!206241 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!206241 lt!206240) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42578 (= lt!206240 (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205891)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205891))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205891)))))))

(declare-fun lt!206239 () (_ BitVec 64))

(declare-fun lt!206242 () (_ BitVec 64))

(assert (=> d!42578 (= lt!206241 (bvmul lt!206239 lt!206242))))

(assert (=> d!42578 (or (= lt!206239 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!206242 (bvsdiv (bvmul lt!206239 lt!206242) lt!206239)))))

(assert (=> d!42578 (= lt!206242 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!42578 (= lt!206239 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205891)))))))

(assert (=> d!42578 (= lt!206244 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205891))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205891)))))))

(assert (=> d!42578 (invariant!0 (currentBit!5924 (_2!6081 lt!205891)) (currentByte!5929 (_2!6081 lt!205891)) (size!2771 (buf!3144 (_2!6081 lt!205891))))))

(assert (=> d!42578 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205891))) (currentByte!5929 (_2!6081 lt!205891)) (currentBit!5924 (_2!6081 lt!205891))) lt!206244)))

(declare-fun b!133333 () Bool)

(declare-fun res!110763 () Bool)

(assert (=> b!133333 (=> (not res!110763) (not e!88411))))

(assert (=> b!133333 (= res!110763 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!206244))))

(declare-fun b!133334 () Bool)

(declare-fun lt!206243 () (_ BitVec 64))

(assert (=> b!133334 (= e!88411 (bvsle lt!206244 (bvmul lt!206243 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133334 (or (= lt!206243 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206243 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206243)))))

(assert (=> b!133334 (= lt!206243 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205891)))))))

(assert (= (and d!42578 res!110764) b!133333))

(assert (= (and b!133333 res!110763) b!133334))

(declare-fun m!202017 () Bool)

(assert (=> d!42578 m!202017))

(declare-fun m!202019 () Bool)

(assert (=> d!42578 m!202019))

(assert (=> b!133140 d!42578))

(assert (=> b!133140 d!42351))

(declare-fun d!42580 () Bool)

(declare-fun e!88412 () Bool)

(assert (=> d!42580 e!88412))

(declare-fun res!110765 () Bool)

(assert (=> d!42580 (=> (not res!110765) (not e!88412))))

(declare-fun lt!206246 () (_ BitVec 64))

(declare-fun lt!206245 () BitStream!4806)

(assert (=> d!42580 (= res!110765 (= (bvadd lt!206246 (bvsub lt!205758 lt!205762)) (bitIndex!0 (size!2771 (buf!3144 lt!206245)) (currentByte!5929 lt!206245) (currentBit!5924 lt!206245))))))

(assert (=> d!42580 (or (not (= (bvand lt!206246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!205758 lt!205762) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206246 (bvsub lt!205758 lt!205762)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!42580 (= lt!206246 (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205750))) (currentByte!5929 (_2!6079 lt!205750)) (currentBit!5924 (_2!6079 lt!205750))))))

(assert (=> d!42580 (= lt!206245 (_2!6081 (moveBitIndex!0 (_2!6079 lt!205750) (bvsub lt!205758 lt!205762))))))

(assert (=> d!42580 (moveBitIndexPrecond!0 (_2!6079 lt!205750) (bvsub lt!205758 lt!205762))))

(assert (=> d!42580 (= (withMovedBitIndex!0 (_2!6079 lt!205750) (bvsub lt!205758 lt!205762)) lt!206245)))

(declare-fun b!133335 () Bool)

(assert (=> b!133335 (= e!88412 (= (size!2771 (buf!3144 (_2!6079 lt!205750))) (size!2771 (buf!3144 lt!206245))))))

(assert (= (and d!42580 res!110765) b!133335))

(declare-fun m!202021 () Bool)

(assert (=> d!42580 m!202021))

(assert (=> d!42580 m!201725))

(declare-fun m!202023 () Bool)

(assert (=> d!42580 m!202023))

(declare-fun m!202025 () Bool)

(assert (=> d!42580 m!202025))

(assert (=> b!133094 d!42580))

(assert (=> b!133094 d!42367))

(assert (=> b!133094 d!42349))

(declare-fun d!42582 () Bool)

(assert (=> d!42582 (= (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5929 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5924 thiss!1634)))))))

(assert (=> d!42404 d!42582))

(assert (=> d!42359 d!42357))

(declare-fun d!42584 () Bool)

(assert (=> d!42584 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6081 lt!205096)))) ((_ sign_extend 32) (currentByte!5929 (_2!6081 lt!205095))) ((_ sign_extend 32) (currentBit!5924 (_2!6081 lt!205095))) lt!205090)))

(assert (=> d!42584 true))

(declare-fun _$6!274 () Unit!8174)

(assert (=> d!42584 (= (choose!9 (_2!6081 lt!205095) (buf!3144 (_2!6081 lt!205096)) lt!205090 (BitStream!4807 (buf!3144 (_2!6081 lt!205096)) (currentByte!5929 (_2!6081 lt!205095)) (currentBit!5924 (_2!6081 lt!205095)))) _$6!274)))

(declare-fun bs!10400 () Bool)

(assert (= bs!10400 d!42584))

(assert (=> bs!10400 m!200863))

(assert (=> d!42359 d!42584))

(declare-fun d!42586 () Bool)

(declare-fun res!110768 () Bool)

(declare-fun e!88413 () Bool)

(assert (=> d!42586 (=> (not res!110768) (not e!88413))))

(assert (=> d!42586 (= res!110768 (= (size!2771 (buf!3144 (_2!6079 lt!205803))) (size!2771 (buf!3144 (_2!6081 lt!205096)))))))

(assert (=> d!42586 (= (isPrefixOf!0 (_2!6079 lt!205803) (_2!6081 lt!205096)) e!88413)))

(declare-fun b!133336 () Bool)

(declare-fun res!110766 () Bool)

(assert (=> b!133336 (=> (not res!110766) (not e!88413))))

(assert (=> b!133336 (= res!110766 (bvsle (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205803))) (currentByte!5929 (_2!6079 lt!205803)) (currentBit!5924 (_2!6079 lt!205803))) (bitIndex!0 (size!2771 (buf!3144 (_2!6081 lt!205096))) (currentByte!5929 (_2!6081 lt!205096)) (currentBit!5924 (_2!6081 lt!205096)))))))

(declare-fun b!133337 () Bool)

(declare-fun e!88414 () Bool)

(assert (=> b!133337 (= e!88413 e!88414)))

(declare-fun res!110767 () Bool)

(assert (=> b!133337 (=> res!110767 e!88414)))

(assert (=> b!133337 (= res!110767 (= (size!2771 (buf!3144 (_2!6079 lt!205803))) #b00000000000000000000000000000000))))

(declare-fun b!133338 () Bool)

(assert (=> b!133338 (= e!88414 (arrayBitRangesEq!0 (buf!3144 (_2!6079 lt!205803)) (buf!3144 (_2!6081 lt!205096)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2771 (buf!3144 (_2!6079 lt!205803))) (currentByte!5929 (_2!6079 lt!205803)) (currentBit!5924 (_2!6079 lt!205803)))))))

(assert (= (and d!42586 res!110768) b!133336))

(assert (= (and b!133336 res!110766) b!133337))

(assert (= (and b!133337 (not res!110767)) b!133338))

(assert (=> b!133336 m!201661))

(assert (=> b!133336 m!200883))

(assert (=> b!133338 m!201661))

(assert (=> b!133338 m!201661))

(declare-fun m!202027 () Bool)

(assert (=> b!133338 m!202027))

(assert (=> b!133108 d!42586))

(assert (=> d!42339 d!42365))

(declare-fun b!133348 () Bool)

(declare-fun res!110776 () Bool)

(declare-fun e!88422 () Bool)

(assert (=> b!133348 (=> (not res!110776) (not e!88422))))

(declare-fun _$37!11 () tuple2!11550)

(assert (=> b!133348 (= res!110776 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6081 _$37!11))) (currentByte!5929 (_2!6081 _$37!11)) (currentBit!5924 (_2!6081 _$37!11))) (bvadd (bitIndex!0 (size!2771 (buf!3144 thiss!1634)) (currentByte!5929 thiss!1634) (currentBit!5924 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun d!42588 () Bool)

(assert (=> d!42588 e!88422))

(declare-fun res!110777 () Bool)

(assert (=> d!42588 (=> (not res!110777) (not e!88422))))

(assert (=> d!42588 (= res!110777 (= (size!2771 (buf!3144 thiss!1634)) (size!2771 (buf!3144 (_2!6081 _$37!11)))))))

(declare-fun e!88423 () Bool)

(assert (=> d!42588 (and (inv!12 (_2!6081 _$37!11)) e!88423)))

(assert (=> d!42588 (= (choose!6 thiss!1634 (select (arr!3406 arr!237) from!447)) _$37!11)))

(declare-fun b!133349 () Bool)

(declare-fun res!110775 () Bool)

(assert (=> b!133349 (=> (not res!110775) (not e!88422))))

(assert (=> b!133349 (= res!110775 (isPrefixOf!0 thiss!1634 (_2!6081 _$37!11)))))

(declare-fun b!133347 () Bool)

(assert (=> b!133347 (= e!88423 (array_inv!2560 (buf!3144 (_2!6081 _$37!11))))))

(declare-fun lt!206252 () tuple2!11548)

(declare-fun b!133350 () Bool)

(declare-fun lt!206251 () tuple2!11546)

(assert (=> b!133350 (= e!88422 (and (= (_2!6080 lt!206252) (select (arr!3406 arr!237) from!447)) (= (_1!6080 lt!206252) (_2!6079 lt!206251))))))

(assert (=> b!133350 (= lt!206252 (readBytePure!0 (_1!6079 lt!206251)))))

(assert (=> b!133350 (= lt!206251 (reader!0 thiss!1634 (_2!6081 _$37!11)))))

(assert (= d!42588 b!133347))

(assert (= (and d!42588 res!110777) b!133348))

(assert (= (and b!133348 res!110776) b!133349))

(assert (= (and b!133349 res!110775) b!133350))

(declare-fun m!202029 () Bool)

(assert (=> b!133349 m!202029))

(declare-fun m!202031 () Bool)

(assert (=> b!133347 m!202031))

(declare-fun m!202033 () Bool)

(assert (=> b!133348 m!202033))

(assert (=> b!133348 m!200859))

(declare-fun m!202035 () Bool)

(assert (=> d!42588 m!202035))

(declare-fun m!202037 () Bool)

(assert (=> b!133350 m!202037))

(declare-fun m!202039 () Bool)

(assert (=> b!133350 m!202039))

(assert (=> d!42414 d!42588))

(declare-fun d!42590 () Bool)

(assert (=> d!42590 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2771 (buf!3144 thiss!1634))) ((_ sign_extend 32) (currentByte!5929 thiss!1634)) ((_ sign_extend 32) (currentBit!5924 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!10401 () Bool)

(assert (= bs!10401 d!42590))

(assert (=> bs!10401 m!201359))

(assert (=> d!42414 d!42590))

(declare-fun d!42592 () Bool)

(declare-fun lt!206257 () (_ BitVec 8))

(declare-fun lt!206258 () (_ BitVec 8))

(assert (=> d!42592 (= lt!206257 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3406 (buf!3144 lt!205078)) (currentByte!5929 lt!205078))) ((_ sign_extend 24) lt!206258))))))

(assert (=> d!42592 (= lt!206258 ((_ extract 7 0) (currentBit!5924 lt!205078)))))

(declare-fun e!88425 () Bool)

(assert (=> d!42592 e!88425))

(declare-fun res!110778 () Bool)

(assert (=> d!42592 (=> (not res!110778) (not e!88425))))

(assert (=> d!42592 (= res!110778 (validate_offset_bits!1 ((_ sign_extend 32) (size!2771 (buf!3144 lt!205078))) ((_ sign_extend 32) (currentByte!5929 lt!205078)) ((_ sign_extend 32) (currentBit!5924 lt!205078)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8223 () Unit!8174)

(declare-fun Unit!8224 () Unit!8174)

(assert (=> d!42592 (= (readByte!0 lt!205078) (tuple2!11565 (_2!6093 (ite (bvsgt ((_ sign_extend 24) lt!206258) #b00000000000000000000000000000000) (tuple2!11567 Unit!8223 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206257) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3406 (buf!3144 lt!205078)) (bvadd (currentByte!5929 lt!205078) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206258)))))))) (tuple2!11567 Unit!8224 lt!206257))) (BitStream!4807 (buf!3144 lt!205078) (bvadd (currentByte!5929 lt!205078) #b00000000000000000000000000000001) (currentBit!5924 lt!205078))))))

(declare-fun b!133351 () Bool)

(declare-fun e!88424 () Bool)

(assert (=> b!133351 (= e!88425 e!88424)))

(declare-fun res!110779 () Bool)

(assert (=> b!133351 (=> (not res!110779) (not e!88424))))

(declare-fun lt!206255 () tuple2!11564)

(assert (=> b!133351 (= res!110779 (= (buf!3144 (_2!6090 lt!206255)) (buf!3144 lt!205078)))))

(declare-fun lt!206254 () (_ BitVec 8))

(declare-fun lt!206259 () (_ BitVec 8))

(declare-fun Unit!8225 () Unit!8174)

(declare-fun Unit!8226 () Unit!8174)

(assert (=> b!133351 (= lt!206255 (tuple2!11565 (_2!6093 (ite (bvsgt ((_ sign_extend 24) lt!206259) #b00000000000000000000000000000000) (tuple2!11567 Unit!8225 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!206254) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3406 (buf!3144 lt!205078)) (bvadd (currentByte!5929 lt!205078) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!206259)))))))) (tuple2!11567 Unit!8226 lt!206254))) (BitStream!4807 (buf!3144 lt!205078) (bvadd (currentByte!5929 lt!205078) #b00000000000000000000000000000001) (currentBit!5924 lt!205078))))))

(assert (=> b!133351 (= lt!206254 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3406 (buf!3144 lt!205078)) (currentByte!5929 lt!205078))) ((_ sign_extend 24) lt!206259))))))

(assert (=> b!133351 (= lt!206259 ((_ extract 7 0) (currentBit!5924 lt!205078)))))

(declare-fun lt!206253 () (_ BitVec 64))

(declare-fun lt!206256 () (_ BitVec 64))

(declare-fun b!133352 () Bool)

(assert (=> b!133352 (= e!88424 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206255))) (currentByte!5929 (_2!6090 lt!206255)) (currentBit!5924 (_2!6090 lt!206255))) (bvadd lt!206256 lt!206253)))))

(assert (=> b!133352 (or (not (= (bvand lt!206256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206253 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206256 lt!206253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!133352 (= lt!206253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!133352 (= lt!206256 (bitIndex!0 (size!2771 (buf!3144 lt!205078)) (currentByte!5929 lt!205078) (currentBit!5924 lt!205078)))))

(assert (= (and d!42592 res!110778) b!133351))

(assert (= (and b!133351 res!110779) b!133352))

(declare-fun m!202041 () Bool)

(assert (=> d!42592 m!202041))

(declare-fun m!202043 () Bool)

(assert (=> d!42592 m!202043))

(declare-fun m!202045 () Bool)

(assert (=> d!42592 m!202045))

(assert (=> b!133351 m!202045))

(assert (=> b!133351 m!202041))

(declare-fun m!202047 () Bool)

(assert (=> b!133352 m!202047))

(declare-fun m!202049 () Bool)

(assert (=> b!133352 m!202049))

(assert (=> d!42390 d!42592))

(assert (=> b!133106 d!42351))

(declare-fun d!42594 () Bool)

(assert (=> d!42594 (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205096)) (buf!3144 thiss!1634) lt!205814 lt!205807)))

(declare-fun lt!206260 () Unit!8174)

(assert (=> d!42594 (= lt!206260 (choose!8 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205096)) lt!205814 lt!205807))))

(assert (=> d!42594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!205814) (bvsle lt!205814 lt!205807))))

(assert (=> d!42594 (= (arrayBitRangesEqSymmetric!0 (buf!3144 thiss!1634) (buf!3144 (_2!6081 lt!205096)) lt!205814 lt!205807) lt!206260)))

(declare-fun bs!10402 () Bool)

(assert (= bs!10402 d!42594))

(assert (=> bs!10402 m!201483))

(declare-fun m!202051 () Bool)

(assert (=> bs!10402 m!202051))

(assert (=> b!133106 d!42594))

(declare-fun d!42596 () Bool)

(declare-fun res!110781 () Bool)

(declare-fun e!88426 () Bool)

(assert (=> d!42596 (=> res!110781 e!88426)))

(assert (=> d!42596 (= res!110781 (bvsge lt!205814 lt!205807))))

(assert (=> d!42596 (= (arrayBitRangesEq!0 (buf!3144 (_2!6081 lt!205096)) (buf!3144 thiss!1634) lt!205814 lt!205807) e!88426)))

(declare-fun b!133353 () Bool)

(declare-fun e!88431 () Bool)

(declare-fun e!88427 () Bool)

(assert (=> b!133353 (= e!88431 e!88427)))

(declare-fun c!7614 () Bool)

(declare-fun lt!206261 () tuple4!110)

(assert (=> b!133353 (= c!7614 (= (_3!309 lt!206261) (_4!55 lt!206261)))))

(declare-fun b!133354 () Bool)

(declare-fun e!88429 () Bool)

(declare-fun lt!206262 () (_ BitVec 32))

(assert (=> b!133354 (= e!88429 (byteRangesEq!0 (select (arr!3406 (buf!3144 (_2!6081 lt!205096))) (_4!55 lt!206261)) (select (arr!3406 (buf!3144 thiss!1634)) (_4!55 lt!206261)) #b00000000000000000000000000000000 lt!206262))))

(declare-fun b!133355 () Bool)

(declare-fun e!88430 () Bool)

(assert (=> b!133355 (= e!88427 e!88430)))

(declare-fun res!110780 () Bool)

(declare-fun call!1686 () Bool)

(assert (=> b!133355 (= res!110780 call!1686)))

(assert (=> b!133355 (=> (not res!110780) (not e!88430))))

(declare-fun b!133356 () Bool)

(assert (=> b!133356 (= e!88426 e!88431)))

(declare-fun res!110782 () Bool)

(assert (=> b!133356 (=> (not res!110782) (not e!88431))))

(declare-fun e!88428 () Bool)

(assert (=> b!133356 (= res!110782 e!88428)))

(declare-fun res!110783 () Bool)

(assert (=> b!133356 (=> res!110783 e!88428)))

(assert (=> b!133356 (= res!110783 (bvsge (_1!6092 lt!206261) (_2!6092 lt!206261)))))

(assert (=> b!133356 (= lt!206262 ((_ extract 31 0) (bvsrem lt!205807 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!206263 () (_ BitVec 32))

(assert (=> b!133356 (= lt!206263 ((_ extract 31 0) (bvsrem lt!205814 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!133356 (= lt!206261 (arrayBitIndices!0 lt!205814 lt!205807))))

(declare-fun bm!1683 () Bool)

(assert (=> bm!1683 (= call!1686 (byteRangesEq!0 (select (arr!3406 (buf!3144 (_2!6081 lt!205096))) (_3!309 lt!206261)) (select (arr!3406 (buf!3144 thiss!1634)) (_3!309 lt!206261)) lt!206263 (ite c!7614 lt!206262 #b00000000000000000000000000001000)))))

(declare-fun b!133357 () Bool)

(assert (=> b!133357 (= e!88427 call!1686)))

(declare-fun b!133358 () Bool)

(declare-fun res!110784 () Bool)

(assert (=> b!133358 (= res!110784 (= lt!206262 #b00000000000000000000000000000000))))

(assert (=> b!133358 (=> res!110784 e!88429)))

(assert (=> b!133358 (= e!88430 e!88429)))

(declare-fun b!133359 () Bool)

(assert (=> b!133359 (= e!88428 (arrayRangesEq!174 (buf!3144 (_2!6081 lt!205096)) (buf!3144 thiss!1634) (_1!6092 lt!206261) (_2!6092 lt!206261)))))

(assert (= (and d!42596 (not res!110781)) b!133356))

(assert (= (and b!133356 (not res!110783)) b!133359))

(assert (= (and b!133356 res!110782) b!133353))

(assert (= (and b!133353 c!7614) b!133357))

(assert (= (and b!133353 (not c!7614)) b!133355))

(assert (= (and b!133355 res!110780) b!133358))

(assert (= (and b!133358 (not res!110784)) b!133354))

(assert (= (or b!133357 b!133355) bm!1683))

(declare-fun m!202053 () Bool)

(assert (=> b!133354 m!202053))

(declare-fun m!202055 () Bool)

(assert (=> b!133354 m!202055))

(assert (=> b!133354 m!202053))

(assert (=> b!133354 m!202055))

(declare-fun m!202057 () Bool)

(assert (=> b!133354 m!202057))

(declare-fun m!202059 () Bool)

(assert (=> b!133356 m!202059))

(declare-fun m!202061 () Bool)

(assert (=> bm!1683 m!202061))

(declare-fun m!202063 () Bool)

(assert (=> bm!1683 m!202063))

(assert (=> bm!1683 m!202061))

(assert (=> bm!1683 m!202063))

(declare-fun m!202065 () Bool)

(assert (=> bm!1683 m!202065))

(declare-fun m!202067 () Bool)

(assert (=> b!133359 m!202067))

(assert (=> b!133106 d!42596))

(declare-fun lt!206289 () tuple3!506)

(declare-fun call!1689 () Bool)

(declare-fun c!7615 () Bool)

(declare-fun bm!1684 () Bool)

(assert (=> bm!1684 (= call!1689 (arrayRangesEq!174 arr!237 (ite c!7615 (_3!308 lt!206289) arr!237) #b00000000000000000000000000000000 (ite c!7615 (bvadd #b00000000000000000000000000000001 from!447) (size!2771 arr!237))))))

(declare-fun bm!1685 () Bool)

(declare-fun call!1687 () (_ BitVec 64))

(assert (=> bm!1685 (= call!1687 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205100))) (currentByte!5929 (_1!6079 lt!205100)) (currentBit!5924 (_1!6079 lt!205100))))))

(declare-fun lt!206278 () array!6120)

(declare-fun bm!1686 () Bool)

(declare-fun lt!206290 () (_ BitVec 32))

(declare-fun lt!206277 () array!6120)

(declare-fun call!1688 () Bool)

(declare-fun lt!206294 () tuple2!11564)

(declare-fun lt!206269 () (_ BitVec 32))

(assert (=> bm!1686 (= call!1688 (arrayRangesEq!174 (ite c!7615 arr!237 lt!206278) (ite c!7615 (array!6121 (store (arr!3406 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206294)) (size!2771 arr!237)) lt!206277) (ite c!7615 #b00000000000000000000000000000000 lt!206290) (ite c!7615 (bvadd #b00000000000000000000000000000001 from!447) lt!206269)))))

(declare-fun lt!206287 () tuple3!506)

(declare-fun b!133361 () Bool)

(declare-fun e!88433 () Bool)

(assert (=> b!133361 (= e!88433 (= (select (arr!3406 (_3!308 lt!206287)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6080 (readBytePure!0 (_1!6079 lt!205100)))))))

(assert (=> b!133361 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2771 (_3!308 lt!206287))))))

(declare-fun b!133362 () Bool)

(declare-fun e!88432 () tuple3!506)

(declare-fun lt!206280 () Unit!8174)

(assert (=> b!133362 (= e!88432 (tuple3!507 lt!206280 (_2!6091 lt!206289) (_3!308 lt!206289)))))

(assert (=> b!133362 (= lt!206294 (readByte!0 (_1!6079 lt!205100)))))

(declare-fun lt!206274 () array!6120)

(assert (=> b!133362 (= lt!206274 (array!6121 (store (arr!3406 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206294)) (size!2771 arr!237)))))

(declare-fun lt!206266 () (_ BitVec 64))

(assert (=> b!133362 (= lt!206266 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!206273 () (_ BitVec 32))

(assert (=> b!133362 (= lt!206273 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206292 () Unit!8174)

(assert (=> b!133362 (= lt!206292 (validateOffsetBytesFromBitIndexLemma!0 (_1!6079 lt!205100) (_2!6090 lt!206294) lt!206266 lt!206273))))

(assert (=> b!133362 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2771 (buf!3144 (_2!6090 lt!206294)))) ((_ sign_extend 32) (currentByte!5929 (_2!6090 lt!206294))) ((_ sign_extend 32) (currentBit!5924 (_2!6090 lt!206294))) (bvsub lt!206273 ((_ extract 31 0) (bvsdiv (bvadd lt!206266 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!206275 () Unit!8174)

(assert (=> b!133362 (= lt!206275 lt!206292)))

(assert (=> b!133362 (= lt!206289 (readByteArrayLoop!0 (_2!6090 lt!206294) lt!206274 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!133362 (= (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206294))) (currentByte!5929 (_2!6090 lt!206294)) (currentBit!5924 (_2!6090 lt!206294))) (bvadd call!1687 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!206279 () Unit!8174)

(declare-fun Unit!8227 () Unit!8174)

(assert (=> b!133362 (= lt!206279 Unit!8227)))

(assert (=> b!133362 (= (bvadd (bitIndex!0 (size!2771 (buf!3144 (_2!6090 lt!206294))) (currentByte!5929 (_2!6090 lt!206294)) (currentBit!5924 (_2!6090 lt!206294))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206289))) (currentByte!5929 (_2!6091 lt!206289)) (currentBit!5924 (_2!6091 lt!206289))))))

(declare-fun lt!206297 () Unit!8174)

(declare-fun Unit!8228 () Unit!8174)

(assert (=> b!133362 (= lt!206297 Unit!8228)))

(assert (=> b!133362 (= (bvadd call!1687 (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206289))) (currentByte!5929 (_2!6091 lt!206289)) (currentBit!5924 (_2!6091 lt!206289))))))

(declare-fun lt!206264 () Unit!8174)

(declare-fun Unit!8229 () Unit!8174)

(assert (=> b!133362 (= lt!206264 Unit!8229)))

(assert (=> b!133362 (and (= (buf!3144 (_1!6079 lt!205100)) (buf!3144 (_2!6091 lt!206289))) (= (size!2771 arr!237) (size!2771 (_3!308 lt!206289))))))

(declare-fun lt!206270 () Unit!8174)

(declare-fun Unit!8230 () Unit!8174)

(assert (=> b!133362 (= lt!206270 Unit!8230)))

(declare-fun lt!206281 () Unit!8174)

(assert (=> b!133362 (= lt!206281 (arrayUpdatedAtPrefixLemma!1 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206294)))))

(assert (=> b!133362 call!1688))

(declare-fun lt!206284 () Unit!8174)

(assert (=> b!133362 (= lt!206284 lt!206281)))

(declare-fun lt!206282 () (_ BitVec 32))

(assert (=> b!133362 (= lt!206282 #b00000000000000000000000000000000)))

(declare-fun lt!206296 () Unit!8174)

(assert (=> b!133362 (= lt!206296 (arrayRangesEqTransitive!1 arr!237 lt!206274 (_3!308 lt!206289) lt!206282 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133362 (arrayRangesEq!174 arr!237 (_3!308 lt!206289) lt!206282 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!206293 () Unit!8174)

(assert (=> b!133362 (= lt!206293 lt!206296)))

(assert (=> b!133362 call!1689))

(declare-fun lt!206276 () Unit!8174)

(declare-fun Unit!8231 () Unit!8174)

(assert (=> b!133362 (= lt!206276 Unit!8231)))

(declare-fun lt!206285 () Unit!8174)

(assert (=> b!133362 (= lt!206285 (arrayRangesEqImpliesEq!1 lt!206274 (_3!308 lt!206289) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!133362 (= (select (store (arr!3406 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6090 lt!206294)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3406 (_3!308 lt!206289)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!206265 () Unit!8174)

(assert (=> b!133362 (= lt!206265 lt!206285)))

(declare-fun lt!206283 () Bool)

(assert (=> b!133362 (= lt!206283 (= (select (arr!3406 (_3!308 lt!206289)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6090 lt!206294)))))

(declare-fun Unit!8232 () Unit!8174)

(assert (=> b!133362 (= lt!206280 Unit!8232)))

(assert (=> b!133362 lt!206283))

(declare-fun lt!206267 () Unit!8174)

(declare-fun b!133363 () Bool)

(assert (=> b!133363 (= e!88432 (tuple3!507 lt!206267 (_1!6079 lt!205100) arr!237))))

(assert (=> b!133363 (= call!1687 call!1687)))

(declare-fun lt!206291 () Unit!8174)

(declare-fun Unit!8233 () Unit!8174)

(assert (=> b!133363 (= lt!206291 Unit!8233)))

(declare-fun lt!206272 () Unit!8174)

(assert (=> b!133363 (= lt!206272 (arrayRangesEqReflexiveLemma!1 arr!237))))

(assert (=> b!133363 call!1689))

(declare-fun lt!206295 () Unit!8174)

(assert (=> b!133363 (= lt!206295 lt!206272)))

(assert (=> b!133363 (= lt!206278 arr!237)))

(assert (=> b!133363 (= lt!206277 arr!237)))

(declare-fun lt!206298 () (_ BitVec 32))

(assert (=> b!133363 (= lt!206298 #b00000000000000000000000000000000)))

(declare-fun lt!206271 () (_ BitVec 32))

(assert (=> b!133363 (= lt!206271 (size!2771 arr!237))))

(assert (=> b!133363 (= lt!206290 #b00000000000000000000000000000000)))

(assert (=> b!133363 (= lt!206269 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!133363 (= lt!206267 (arrayRangesEqSlicedLemma!1 lt!206278 lt!206277 lt!206298 lt!206271 lt!206290 lt!206269))))

(assert (=> b!133363 call!1688))

(declare-fun b!133364 () Bool)

(declare-fun res!110785 () Bool)

(declare-fun e!88434 () Bool)

(assert (=> b!133364 (=> (not res!110785) (not e!88434))))

(assert (=> b!133364 (= res!110785 (and (= (buf!3144 (_1!6079 lt!205100)) (buf!3144 (_2!6091 lt!206287))) (= (size!2771 arr!237) (size!2771 (_3!308 lt!206287)))))))

(declare-fun b!133360 () Bool)

(assert (=> b!133360 (= e!88434 (arrayRangesEq!174 arr!237 (_3!308 lt!206287) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun d!42598 () Bool)

(assert (=> d!42598 e!88433))

(declare-fun res!110787 () Bool)

(assert (=> d!42598 (=> res!110787 e!88433)))

(assert (=> d!42598 (= res!110787 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!206288 () Bool)

(assert (=> d!42598 (= lt!206288 e!88434)))

(declare-fun res!110786 () Bool)

(assert (=> d!42598 (=> (not res!110786) (not e!88434))))

(declare-fun lt!206268 () (_ BitVec 64))

(declare-fun lt!206299 () (_ BitVec 64))

(assert (=> d!42598 (= res!110786 (= (bvadd lt!206268 lt!206299) (bitIndex!0 (size!2771 (buf!3144 (_2!6091 lt!206287))) (currentByte!5929 (_2!6091 lt!206287)) (currentBit!5924 (_2!6091 lt!206287)))))))

(assert (=> d!42598 (or (not (= (bvand lt!206268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!206299 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!206268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!206268 lt!206299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!206286 () (_ BitVec 64))

(assert (=> d!42598 (= lt!206299 (bvmul lt!206286 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!42598 (or (= lt!206286 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!206286 #b0000000000000000000000000000000000000000000000000000000000001000) lt!206286)))))

(assert (=> d!42598 (= lt!206286 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!42598 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!42598 (= lt!206268 (bitIndex!0 (size!2771 (buf!3144 (_1!6079 lt!205100))) (currentByte!5929 (_1!6079 lt!205100)) (currentBit!5924 (_1!6079 lt!205100))))))

(assert (=> d!42598 (= lt!206287 e!88432)))

(assert (=> d!42598 (= c!7615 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!42598 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2771 arr!237)))))

(assert (=> d!42598 (= (readByteArrayLoop!0 (_1!6079 lt!205100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!206287)))

(assert (= (and d!42598 c!7615) b!133362))

(assert (= (and d!42598 (not c!7615)) b!133363))

(assert (= (or b!133362 b!133363) bm!1686))

(assert (= (or b!133362 b!133363) bm!1684))

(assert (= (or b!133362 b!133363) bm!1685))

(assert (= (and d!42598 res!110786) b!133364))

(assert (= (and b!133364 res!110785) b!133360))

(assert (= (and d!42598 (not res!110787)) b!133361))

(declare-fun m!202069 () Bool)

(assert (=> b!133362 m!202069))

(declare-fun m!202071 () Bool)

(assert (=> b!133362 m!202071))

(declare-fun m!202073 () Bool)

(assert (=> b!133362 m!202073))

(declare-fun m!202075 () Bool)

(assert (=> b!133362 m!202075))

(declare-fun m!202077 () Bool)

(assert (=> b!133362 m!202077))

(declare-fun m!202079 () Bool)

(assert (=> b!133362 m!202079))

(declare-fun m!202081 () Bool)

(assert (=> b!133362 m!202081))

(declare-fun m!202083 () Bool)

(assert (=> b!133362 m!202083))

(declare-fun m!202085 () Bool)

(assert (=> b!133362 m!202085))

(declare-fun m!202087 () Bool)

(assert (=> b!133362 m!202087))

(declare-fun m!202089 () Bool)

(assert (=> b!133362 m!202089))

(declare-fun m!202091 () Bool)

(assert (=> b!133362 m!202091))

(declare-fun m!202093 () Bool)

(assert (=> b!133362 m!202093))

(assert (=> bm!1686 m!202073))

(declare-fun m!202095 () Bool)

(assert (=> bm!1686 m!202095))

(declare-fun m!202097 () Bool)

(assert (=> b!133361 m!202097))

(declare-fun m!202099 () Bool)

(assert (=> b!133361 m!202099))

(declare-fun m!202101 () Bool)

(assert (=> b!133360 m!202101))

(declare-fun m!202103 () Bool)

(assert (=> bm!1685 m!202103))

(declare-fun m!202105 () Bool)

(assert (=> d!42598 m!202105))

(assert (=> d!42598 m!202103))

(assert (=> b!133363 m!201893))

(declare-fun m!202107 () Bool)

(assert (=> b!133363 m!202107))

(declare-fun m!202109 () Bool)

(assert (=> bm!1684 m!202109))

(assert (=> d!42355 d!42598))

(check-sat (not bm!1663) (not d!42502) (not b!133214) (not b!133347) (not b!133332) (not d!42438) (not d!42528) (not bm!1665) (not d!42548) (not b!133359) (not b!133336) (not b!133298) (not b!133327) (not b!133191) (not d!42532) (not b!133294) (not b!133211) (not b!133230) (not b!133319) (not d!42512) (not d!42452) (not b!133320) (not b!133264) (not b!133291) (not b!133361) (not d!42420) (not d!42436) (not b!133172) (not b!133189) (not d!42462) (not b!133316) (not d!42518) (not bm!1674) (not b!133207) (not d!42458) (not b!133281) (not b!133354) (not d!42590) (not d!42530) (not bm!1680) (not b!133297) (not b!133286) (not bm!1666) (not d!42426) (not b!133267) (not b!133195) (not b!133360) (not b!133237) (not b!133315) (not b!133292) (not b!133279) (not b!133295) (not b!133235) (not b!133163) (not b!133145) (not b!133204) (not b!133314) (not b!133233) (not d!42484) (not d!42580) (not b!133180) (not b!133194) (not b!133313) (not b!133206) (not bm!1678) (not b!133362) (not b!133193) (not d!42440) (not d!42570) (not d!42498) (not b!133350) (not d!42442) (not d!42546) (not d!42504) (not bm!1677) (not bm!1664) (not b!133182) (not b!133143) (not d!42554) (not b!133329) (not b!133284) (not d!42510) (not b!133245) (not b!133363) (not d!42520) (not b!133323) (not bm!1679) (not d!42456) (not b!133352) (not b!133200) (not d!42588) (not d!42480) (not b!133174) (not b!133306) (not b!133216) (not b!133192) (not b!133338) (not d!42598) (not b!133198) (not b!133176) (not b!133322) (not bm!1683) (not b!133228) (not b!133201) (not b!133303) (not b!133302) (not d!42488) (not b!133328) (not b!133349) (not b!133278) (not d!42466) (not b!133289) (not b!133161) (not d!42490) (not b!133308) (not bm!1673) (not b!133326) (not b!133280) (not bm!1685) (not b!133309) (not bm!1676) (not d!42562) (not d!42482) (not d!42556) (not d!42592) (not d!42470) (not bm!1681) (not b!133356) (not b!133249) (not bm!1684) (not d!42486) (not d!42536) (not b!133300) (not b!133213) (not d!42560) (not b!133305) (not d!42594) (not b!133218) (not d!42448) (not b!133166) (not b!133296) (not d!42516) (not d!42566) (not b!133186) (not b!133266) (not b!133179) (not d!42584) (not b!133240) (not b!133265) (not d!42568) (not b!133184) (not b!133311) (not b!133263) (not d!42564) (not d!42496) (not b!133203) (not b!133325) (not b!133251) (not bm!1675) (not d!42540) (not bm!1686) (not b!133231) (not b!133317) (not d!42578) (not b!133348) (not bm!1682) (not b!133209) (not b!133197))
(check-sat)
