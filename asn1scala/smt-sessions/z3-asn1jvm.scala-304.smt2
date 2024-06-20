; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5998 () Bool)

(assert start!5998)

(declare-fun b!27828 () Bool)

(declare-fun e!18782 () Bool)

(declare-fun e!18778 () Bool)

(assert (=> b!27828 (= e!18782 (not e!18778))))

(declare-fun res!24110 () Bool)

(assert (=> b!27828 (=> res!24110 e!18778)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!27828 (= res!24110 (bvsge i!635 to!314))))

(declare-datatypes ((array!1735 0))(
  ( (array!1736 (arr!1212 (Array (_ BitVec 32) (_ BitVec 8))) (size!750 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1332 0))(
  ( (BitStream!1333 (buf!1077 array!1735) (currentByte!2402 (_ BitVec 32)) (currentBit!2397 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1332)

(declare-fun isPrefixOf!0 (BitStream!1332 BitStream!1332) Bool)

(assert (=> b!27828 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2203 0))(
  ( (Unit!2204) )
))
(declare-fun lt!39344 () Unit!2203)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1332) Unit!2203)

(assert (=> b!27828 (= lt!39344 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!39345 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27828 (= lt!39345 (bitIndex!0 (size!750 (buf!1077 thiss!1379)) (currentByte!2402 thiss!1379) (currentBit!2397 thiss!1379)))))

(declare-fun b!27829 () Bool)

(declare-fun e!18781 () Bool)

(declare-fun e!18776 () Bool)

(assert (=> b!27829 (= e!18781 e!18776)))

(declare-fun res!24106 () Bool)

(assert (=> b!27829 (=> res!24106 e!18776)))

(declare-fun lt!39338 () (_ BitVec 64))

(assert (=> b!27829 (= res!24106 (not (= lt!39338 (bvsub (bvadd lt!39345 to!314) i!635))))))

(declare-datatypes ((tuple2!3030 0))(
  ( (tuple2!3031 (_1!1602 Unit!2203) (_2!1602 BitStream!1332)) )
))
(declare-fun lt!39340 () tuple2!3030)

(assert (=> b!27829 (= lt!39338 (bitIndex!0 (size!750 (buf!1077 (_2!1602 lt!39340))) (currentByte!2402 (_2!1602 lt!39340)) (currentBit!2397 (_2!1602 lt!39340))))))

(declare-fun b!27830 () Bool)

(declare-fun res!24107 () Bool)

(declare-fun e!18780 () Bool)

(assert (=> b!27830 (=> res!24107 e!18780)))

(declare-fun lt!39342 () tuple2!3030)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27830 (= res!24107 (not (invariant!0 (currentBit!2397 (_2!1602 lt!39342)) (currentByte!2402 (_2!1602 lt!39342)) (size!750 (buf!1077 (_2!1602 lt!39340))))))))

(declare-fun b!27831 () Bool)

(declare-fun e!18783 () Bool)

(assert (=> b!27831 (= e!18783 true)))

(declare-fun lt!39348 () (_ BitVec 64))

(declare-datatypes ((tuple2!3032 0))(
  ( (tuple2!3033 (_1!1603 BitStream!1332) (_2!1603 BitStream!1332)) )
))
(declare-fun lt!39335 () tuple2!3032)

(assert (=> b!27831 (= lt!39348 (bitIndex!0 (size!750 (buf!1077 (_1!1603 lt!39335))) (currentByte!2402 (_1!1603 lt!39335)) (currentBit!2397 (_1!1603 lt!39335))))))

(declare-fun lt!39351 () (_ BitVec 64))

(declare-fun lt!39346 () tuple2!3032)

(assert (=> b!27831 (= lt!39351 (bitIndex!0 (size!750 (buf!1077 (_1!1603 lt!39346))) (currentByte!2402 (_1!1603 lt!39346)) (currentBit!2397 (_1!1603 lt!39346))))))

(declare-fun res!24120 () Bool)

(assert (=> start!5998 (=> (not res!24120) (not e!18782))))

(declare-fun srcBuffer!2 () array!1735)

(assert (=> start!5998 (= res!24120 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!750 srcBuffer!2))))))))

(assert (=> start!5998 e!18782))

(assert (=> start!5998 true))

(declare-fun array_inv!719 (array!1735) Bool)

(assert (=> start!5998 (array_inv!719 srcBuffer!2)))

(declare-fun e!18784 () Bool)

(declare-fun inv!12 (BitStream!1332) Bool)

(assert (=> start!5998 (and (inv!12 thiss!1379) e!18784)))

(declare-fun e!18775 () Bool)

(declare-fun b!27832 () Bool)

(assert (=> b!27832 (= e!18775 (= lt!39338 (bvsub (bvsub (bvadd (bitIndex!0 (size!750 (buf!1077 (_2!1602 lt!39342))) (currentByte!2402 (_2!1602 lt!39342)) (currentBit!2397 (_2!1602 lt!39342))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27833 () Bool)

(declare-fun res!24105 () Bool)

(assert (=> b!27833 (=> res!24105 e!18783)))

(assert (=> b!27833 (= res!24105 (not (isPrefixOf!0 (_1!1603 lt!39346) (_2!1602 lt!39340))))))

(declare-fun b!27834 () Bool)

(declare-fun res!24109 () Bool)

(assert (=> b!27834 (=> res!24109 e!18783)))

(assert (=> b!27834 (= res!24109 (not (isPrefixOf!0 (_1!1603 lt!39335) (_2!1602 lt!39340))))))

(declare-fun b!27835 () Bool)

(declare-fun e!18779 () Bool)

(assert (=> b!27835 (= e!18779 e!18781)))

(declare-fun res!24114 () Bool)

(assert (=> b!27835 (=> res!24114 e!18781)))

(assert (=> b!27835 (= res!24114 (not (isPrefixOf!0 (_2!1602 lt!39342) (_2!1602 lt!39340))))))

(assert (=> b!27835 (isPrefixOf!0 thiss!1379 (_2!1602 lt!39340))))

(declare-fun lt!39352 () Unit!2203)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1332 BitStream!1332 BitStream!1332) Unit!2203)

(assert (=> b!27835 (= lt!39352 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1602 lt!39342) (_2!1602 lt!39340)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1332 array!1735 (_ BitVec 64) (_ BitVec 64)) tuple2!3030)

(assert (=> b!27835 (= lt!39340 (appendBitsMSBFirstLoop!0 (_2!1602 lt!39342) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18777 () Bool)

(assert (=> b!27835 e!18777))

(declare-fun res!24116 () Bool)

(assert (=> b!27835 (=> (not res!24116) (not e!18777))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27835 (= res!24116 (validate_offset_bits!1 ((_ sign_extend 32) (size!750 (buf!1077 (_2!1602 lt!39342)))) ((_ sign_extend 32) (currentByte!2402 thiss!1379)) ((_ sign_extend 32) (currentBit!2397 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39349 () Unit!2203)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1332 array!1735 (_ BitVec 64)) Unit!2203)

(assert (=> b!27835 (= lt!39349 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1077 (_2!1602 lt!39342)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39350 () tuple2!3032)

(declare-fun reader!0 (BitStream!1332 BitStream!1332) tuple2!3032)

(assert (=> b!27835 (= lt!39350 (reader!0 thiss!1379 (_2!1602 lt!39342)))))

(declare-fun b!27836 () Bool)

(declare-fun res!24122 () Bool)

(assert (=> b!27836 (=> res!24122 e!18776)))

(assert (=> b!27836 (= res!24122 (not (invariant!0 (currentBit!2397 (_2!1602 lt!39340)) (currentByte!2402 (_2!1602 lt!39340)) (size!750 (buf!1077 (_2!1602 lt!39340))))))))

(declare-fun b!27837 () Bool)

(assert (=> b!27837 (= e!18778 e!18779)))

(declare-fun res!24108 () Bool)

(assert (=> b!27837 (=> res!24108 e!18779)))

(assert (=> b!27837 (= res!24108 (not (isPrefixOf!0 thiss!1379 (_2!1602 lt!39342))))))

(declare-fun lt!39343 () (_ BitVec 64))

(assert (=> b!27837 (validate_offset_bits!1 ((_ sign_extend 32) (size!750 (buf!1077 (_2!1602 lt!39342)))) ((_ sign_extend 32) (currentByte!2402 (_2!1602 lt!39342))) ((_ sign_extend 32) (currentBit!2397 (_2!1602 lt!39342))) lt!39343)))

(assert (=> b!27837 (= lt!39343 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39347 () Unit!2203)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1332 BitStream!1332 (_ BitVec 64) (_ BitVec 64)) Unit!2203)

(assert (=> b!27837 (= lt!39347 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1602 lt!39342) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1332 (_ BitVec 8) (_ BitVec 32)) tuple2!3030)

(assert (=> b!27837 (= lt!39342 (appendBitFromByte!0 thiss!1379 (select (arr!1212 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27838 () Bool)

(assert (=> b!27838 (= e!18776 e!18780)))

(declare-fun res!24121 () Bool)

(assert (=> b!27838 (=> res!24121 e!18780)))

(assert (=> b!27838 (= res!24121 (not (= (size!750 (buf!1077 (_2!1602 lt!39342))) (size!750 (buf!1077 (_2!1602 lt!39340))))))))

(assert (=> b!27838 e!18775))

(declare-fun res!24111 () Bool)

(assert (=> b!27838 (=> (not res!24111) (not e!18775))))

(assert (=> b!27838 (= res!24111 (= (size!750 (buf!1077 (_2!1602 lt!39340))) (size!750 (buf!1077 thiss!1379))))))

(declare-fun b!27839 () Bool)

(declare-fun res!24113 () Bool)

(assert (=> b!27839 (=> res!24113 e!18780)))

(assert (=> b!27839 (= res!24113 (not (invariant!0 (currentBit!2397 (_2!1602 lt!39342)) (currentByte!2402 (_2!1602 lt!39342)) (size!750 (buf!1077 (_2!1602 lt!39342))))))))

(declare-fun b!27840 () Bool)

(declare-fun res!24119 () Bool)

(assert (=> b!27840 (=> res!24119 e!18783)))

(assert (=> b!27840 (= res!24119 (not (isPrefixOf!0 (_1!1603 lt!39346) (_1!1603 lt!39335))))))

(declare-fun b!27841 () Bool)

(assert (=> b!27841 (= e!18780 e!18783)))

(declare-fun res!24115 () Bool)

(assert (=> b!27841 (=> res!24115 e!18783)))

(assert (=> b!27841 (= res!24115 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!367 0))(
  ( (Nil!364) (Cons!363 (h!482 Bool) (t!1117 List!367)) )
))
(declare-fun lt!39341 () List!367)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1332 BitStream!1332 (_ BitVec 64)) List!367)

(assert (=> b!27841 (= lt!39341 (bitStreamReadBitsIntoList!0 (_2!1602 lt!39340) (_1!1603 lt!39335) lt!39343))))

(declare-fun lt!39336 () List!367)

(assert (=> b!27841 (= lt!39336 (bitStreamReadBitsIntoList!0 (_2!1602 lt!39340) (_1!1603 lt!39346) (bvsub to!314 i!635)))))

(assert (=> b!27841 (validate_offset_bits!1 ((_ sign_extend 32) (size!750 (buf!1077 (_2!1602 lt!39340)))) ((_ sign_extend 32) (currentByte!2402 (_2!1602 lt!39342))) ((_ sign_extend 32) (currentBit!2397 (_2!1602 lt!39342))) lt!39343)))

(declare-fun lt!39339 () Unit!2203)

(assert (=> b!27841 (= lt!39339 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1602 lt!39342) (buf!1077 (_2!1602 lt!39340)) lt!39343))))

(assert (=> b!27841 (= lt!39335 (reader!0 (_2!1602 lt!39342) (_2!1602 lt!39340)))))

(assert (=> b!27841 (validate_offset_bits!1 ((_ sign_extend 32) (size!750 (buf!1077 (_2!1602 lt!39340)))) ((_ sign_extend 32) (currentByte!2402 thiss!1379)) ((_ sign_extend 32) (currentBit!2397 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39337 () Unit!2203)

(assert (=> b!27841 (= lt!39337 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1077 (_2!1602 lt!39340)) (bvsub to!314 i!635)))))

(assert (=> b!27841 (= lt!39346 (reader!0 thiss!1379 (_2!1602 lt!39340)))))

(declare-fun b!27842 () Bool)

(declare-fun head!204 (List!367) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1332 array!1735 (_ BitVec 64) (_ BitVec 64)) List!367)

(assert (=> b!27842 (= e!18777 (= (head!204 (byteArrayBitContentToList!0 (_2!1602 lt!39342) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!204 (bitStreamReadBitsIntoList!0 (_2!1602 lt!39342) (_1!1603 lt!39350) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27843 () Bool)

(assert (=> b!27843 (= e!18784 (array_inv!719 (buf!1077 thiss!1379)))))

(declare-fun b!27844 () Bool)

(declare-fun res!24123 () Bool)

(assert (=> b!27844 (=> (not res!24123) (not e!18782))))

(assert (=> b!27844 (= res!24123 (validate_offset_bits!1 ((_ sign_extend 32) (size!750 (buf!1077 thiss!1379))) ((_ sign_extend 32) (currentByte!2402 thiss!1379)) ((_ sign_extend 32) (currentBit!2397 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27845 () Bool)

(declare-fun res!24117 () Bool)

(assert (=> b!27845 (=> res!24117 e!18776)))

(assert (=> b!27845 (= res!24117 (not (= (size!750 (buf!1077 thiss!1379)) (size!750 (buf!1077 (_2!1602 lt!39340))))))))

(declare-fun b!27846 () Bool)

(declare-fun res!24118 () Bool)

(assert (=> b!27846 (=> res!24118 e!18783)))

(assert (=> b!27846 (= res!24118 (or (not (= (buf!1077 (_1!1603 lt!39346)) (buf!1077 (_1!1603 lt!39335)))) (not (= (buf!1077 (_1!1603 lt!39346)) (buf!1077 (_2!1602 lt!39340)))) (bvsge lt!39338 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27847 () Bool)

(declare-fun res!24112 () Bool)

(assert (=> b!27847 (=> res!24112 e!18783)))

(declare-fun length!93 (List!367) Int)

(assert (=> b!27847 (= res!24112 (<= (length!93 lt!39336) 0))))

(assert (= (and start!5998 res!24120) b!27844))

(assert (= (and b!27844 res!24123) b!27828))

(assert (= (and b!27828 (not res!24110)) b!27837))

(assert (= (and b!27837 (not res!24108)) b!27835))

(assert (= (and b!27835 res!24116) b!27842))

(assert (= (and b!27835 (not res!24114)) b!27829))

(assert (= (and b!27829 (not res!24106)) b!27836))

(assert (= (and b!27836 (not res!24122)) b!27845))

(assert (= (and b!27845 (not res!24117)) b!27838))

(assert (= (and b!27838 res!24111) b!27832))

(assert (= (and b!27838 (not res!24121)) b!27839))

(assert (= (and b!27839 (not res!24113)) b!27830))

(assert (= (and b!27830 (not res!24107)) b!27841))

(assert (= (and b!27841 (not res!24115)) b!27847))

(assert (= (and b!27847 (not res!24112)) b!27833))

(assert (= (and b!27833 (not res!24105)) b!27834))

(assert (= (and b!27834 (not res!24109)) b!27840))

(assert (= (and b!27840 (not res!24119)) b!27846))

(assert (= (and b!27846 (not res!24118)) b!27831))

(assert (= start!5998 b!27843))

(declare-fun m!39861 () Bool)

(assert (=> b!27841 m!39861))

(declare-fun m!39863 () Bool)

(assert (=> b!27841 m!39863))

(declare-fun m!39865 () Bool)

(assert (=> b!27841 m!39865))

(declare-fun m!39867 () Bool)

(assert (=> b!27841 m!39867))

(declare-fun m!39869 () Bool)

(assert (=> b!27841 m!39869))

(declare-fun m!39871 () Bool)

(assert (=> b!27841 m!39871))

(declare-fun m!39873 () Bool)

(assert (=> b!27841 m!39873))

(declare-fun m!39875 () Bool)

(assert (=> b!27841 m!39875))

(declare-fun m!39877 () Bool)

(assert (=> b!27836 m!39877))

(declare-fun m!39879 () Bool)

(assert (=> b!27844 m!39879))

(declare-fun m!39881 () Bool)

(assert (=> b!27833 m!39881))

(declare-fun m!39883 () Bool)

(assert (=> b!27840 m!39883))

(declare-fun m!39885 () Bool)

(assert (=> b!27828 m!39885))

(declare-fun m!39887 () Bool)

(assert (=> b!27828 m!39887))

(declare-fun m!39889 () Bool)

(assert (=> b!27828 m!39889))

(declare-fun m!39891 () Bool)

(assert (=> start!5998 m!39891))

(declare-fun m!39893 () Bool)

(assert (=> start!5998 m!39893))

(declare-fun m!39895 () Bool)

(assert (=> b!27843 m!39895))

(declare-fun m!39897 () Bool)

(assert (=> b!27830 m!39897))

(declare-fun m!39899 () Bool)

(assert (=> b!27831 m!39899))

(declare-fun m!39901 () Bool)

(assert (=> b!27831 m!39901))

(declare-fun m!39903 () Bool)

(assert (=> b!27842 m!39903))

(assert (=> b!27842 m!39903))

(declare-fun m!39905 () Bool)

(assert (=> b!27842 m!39905))

(declare-fun m!39907 () Bool)

(assert (=> b!27842 m!39907))

(assert (=> b!27842 m!39907))

(declare-fun m!39909 () Bool)

(assert (=> b!27842 m!39909))

(declare-fun m!39911 () Bool)

(assert (=> b!27835 m!39911))

(declare-fun m!39913 () Bool)

(assert (=> b!27835 m!39913))

(declare-fun m!39915 () Bool)

(assert (=> b!27835 m!39915))

(declare-fun m!39917 () Bool)

(assert (=> b!27835 m!39917))

(declare-fun m!39919 () Bool)

(assert (=> b!27835 m!39919))

(declare-fun m!39921 () Bool)

(assert (=> b!27835 m!39921))

(declare-fun m!39923 () Bool)

(assert (=> b!27835 m!39923))

(declare-fun m!39925 () Bool)

(assert (=> b!27847 m!39925))

(declare-fun m!39927 () Bool)

(assert (=> b!27829 m!39927))

(declare-fun m!39929 () Bool)

(assert (=> b!27839 m!39929))

(declare-fun m!39931 () Bool)

(assert (=> b!27834 m!39931))

(declare-fun m!39933 () Bool)

(assert (=> b!27837 m!39933))

(declare-fun m!39935 () Bool)

(assert (=> b!27837 m!39935))

(declare-fun m!39937 () Bool)

(assert (=> b!27837 m!39937))

(assert (=> b!27837 m!39937))

(declare-fun m!39939 () Bool)

(assert (=> b!27837 m!39939))

(declare-fun m!39941 () Bool)

(assert (=> b!27837 m!39941))

(declare-fun m!39943 () Bool)

(assert (=> b!27832 m!39943))

(check-sat (not b!27840) (not b!27843) (not b!27833) (not b!27831) (not b!27841) (not b!27828) (not b!27839) (not b!27832) (not b!27842) (not b!27837) (not b!27847) (not start!5998) (not b!27835) (not b!27834) (not b!27844) (not b!27829) (not b!27836) (not b!27830))
