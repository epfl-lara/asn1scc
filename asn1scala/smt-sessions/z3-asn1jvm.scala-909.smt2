; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25530 () Bool)

(assert start!25530)

(declare-fun res!107628 () Bool)

(declare-fun e!86082 () Bool)

(assert (=> start!25530 (=> (not res!107628) (not e!86082))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6015 0))(
  ( (array!6016 (arr!3340 (Array (_ BitVec 32) (_ BitVec 8))) (size!2723 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6015)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25530 (= res!107628 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2723 arr!237))))))

(assert (=> start!25530 e!86082))

(assert (=> start!25530 true))

(declare-fun array_inv!2512 (array!6015) Bool)

(assert (=> start!25530 (array_inv!2512 arr!237)))

(declare-datatypes ((BitStream!4710 0))(
  ( (BitStream!4711 (buf!3081 array!6015) (currentByte!5842 (_ BitVec 32)) (currentBit!5837 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4710)

(declare-fun e!86089 () Bool)

(declare-fun inv!12 (BitStream!4710) Bool)

(assert (=> start!25530 (and (inv!12 thiss!1634) e!86089)))

(declare-fun b!129895 () Bool)

(declare-fun e!86081 () Bool)

(declare-fun e!86084 () Bool)

(assert (=> b!129895 (= e!86081 (not e!86084))))

(declare-fun res!107625 () Bool)

(assert (=> b!129895 (=> res!107625 e!86084)))

(declare-datatypes ((tuple2!11142 0))(
  ( (tuple2!11143 (_1!5868 BitStream!4710) (_2!5868 BitStream!4710)) )
))
(declare-fun lt!200442 () tuple2!11142)

(declare-datatypes ((tuple2!11144 0))(
  ( (tuple2!11145 (_1!5869 BitStream!4710) (_2!5869 array!6015)) )
))
(declare-fun lt!200445 () tuple2!11144)

(assert (=> b!129895 (= res!107625 (or (not (= (size!2723 (_2!5869 lt!200445)) (size!2723 arr!237))) (not (= (_1!5869 lt!200445) (_2!5868 lt!200442)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4710 array!6015 (_ BitVec 32) (_ BitVec 32)) tuple2!11144)

(assert (=> b!129895 (= lt!200445 (readByteArrayLoopPure!0 (_1!5868 lt!200442) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8051 0))(
  ( (Unit!8052) )
))
(declare-datatypes ((tuple2!11146 0))(
  ( (tuple2!11147 (_1!5870 Unit!8051) (_2!5870 BitStream!4710)) )
))
(declare-fun lt!200441 () tuple2!11146)

(declare-fun lt!200439 () tuple2!11146)

(declare-fun lt!200449 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129895 (validate_offset_bits!1 ((_ sign_extend 32) (size!2723 (buf!3081 (_2!5870 lt!200441)))) ((_ sign_extend 32) (currentByte!5842 (_2!5870 lt!200439))) ((_ sign_extend 32) (currentBit!5837 (_2!5870 lt!200439))) lt!200449)))

(declare-fun lt!200444 () Unit!8051)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4710 array!6015 (_ BitVec 64)) Unit!8051)

(assert (=> b!129895 (= lt!200444 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5870 lt!200439) (buf!3081 (_2!5870 lt!200441)) lt!200449))))

(declare-fun reader!0 (BitStream!4710 BitStream!4710) tuple2!11142)

(assert (=> b!129895 (= lt!200442 (reader!0 (_2!5870 lt!200439) (_2!5870 lt!200441)))))

(declare-fun e!86088 () Bool)

(declare-datatypes ((tuple2!11148 0))(
  ( (tuple2!11149 (_1!5871 BitStream!4710) (_2!5871 (_ BitVec 8))) )
))
(declare-fun lt!200437 () tuple2!11148)

(declare-fun lt!200447 () tuple2!11142)

(declare-fun b!129896 () Bool)

(assert (=> b!129896 (= e!86088 (and (= (_2!5871 lt!200437) (select (arr!3340 arr!237) from!447)) (= (_1!5871 lt!200437) (_2!5868 lt!200447))))))

(declare-fun readBytePure!0 (BitStream!4710) tuple2!11148)

(assert (=> b!129896 (= lt!200437 (readBytePure!0 (_1!5868 lt!200447)))))

(assert (=> b!129896 (= lt!200447 (reader!0 thiss!1634 (_2!5870 lt!200439)))))

(declare-fun b!129897 () Bool)

(declare-fun res!107627 () Bool)

(assert (=> b!129897 (=> (not res!107627) (not e!86088))))

(declare-fun isPrefixOf!0 (BitStream!4710 BitStream!4710) Bool)

(assert (=> b!129897 (= res!107627 (isPrefixOf!0 thiss!1634 (_2!5870 lt!200439)))))

(declare-fun b!129898 () Bool)

(declare-fun res!107633 () Bool)

(assert (=> b!129898 (=> (not res!107633) (not e!86088))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129898 (= res!107633 (= (bitIndex!0 (size!2723 (buf!3081 (_2!5870 lt!200439))) (currentByte!5842 (_2!5870 lt!200439)) (currentBit!5837 (_2!5870 lt!200439))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2723 (buf!3081 thiss!1634)) (currentByte!5842 thiss!1634) (currentBit!5837 thiss!1634)))))))

(declare-fun b!129899 () Bool)

(declare-fun res!107626 () Bool)

(assert (=> b!129899 (=> (not res!107626) (not e!86082))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129899 (= res!107626 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2723 (buf!3081 thiss!1634))) ((_ sign_extend 32) (currentByte!5842 thiss!1634)) ((_ sign_extend 32) (currentBit!5837 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129900 () Bool)

(declare-fun e!86087 () Bool)

(assert (=> b!129900 (= e!86087 e!86081)))

(declare-fun res!107623 () Bool)

(assert (=> b!129900 (=> (not res!107623) (not e!86081))))

(assert (=> b!129900 (= res!107623 (= (bitIndex!0 (size!2723 (buf!3081 (_2!5870 lt!200441))) (currentByte!5842 (_2!5870 lt!200441)) (currentBit!5837 (_2!5870 lt!200441))) (bvadd (bitIndex!0 (size!2723 (buf!3081 (_2!5870 lt!200439))) (currentByte!5842 (_2!5870 lt!200439)) (currentBit!5837 (_2!5870 lt!200439))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!200449))))))

(assert (=> b!129900 (= lt!200449 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!129901 () Bool)

(declare-fun res!107630 () Bool)

(assert (=> b!129901 (=> (not res!107630) (not e!86082))))

(assert (=> b!129901 (= res!107630 (bvslt from!447 to!404))))

(declare-fun b!129902 () Bool)

(assert (=> b!129902 (= e!86082 (not true))))

(declare-fun e!86085 () Bool)

(assert (=> b!129902 e!86085))

(declare-fun res!107632 () Bool)

(assert (=> b!129902 (=> (not res!107632) (not e!86085))))

(declare-fun lt!200446 () tuple2!11148)

(declare-fun lt!200443 () tuple2!11148)

(assert (=> b!129902 (= res!107632 (= (bitIndex!0 (size!2723 (buf!3081 (_1!5871 lt!200446))) (currentByte!5842 (_1!5871 lt!200446)) (currentBit!5837 (_1!5871 lt!200446))) (bitIndex!0 (size!2723 (buf!3081 (_1!5871 lt!200443))) (currentByte!5842 (_1!5871 lt!200443)) (currentBit!5837 (_1!5871 lt!200443)))))))

(declare-fun lt!200450 () Unit!8051)

(declare-fun lt!200448 () BitStream!4710)

(declare-fun readBytePrefixLemma!0 (BitStream!4710 BitStream!4710) Unit!8051)

(assert (=> b!129902 (= lt!200450 (readBytePrefixLemma!0 lt!200448 (_2!5870 lt!200441)))))

(assert (=> b!129902 (= lt!200443 (readBytePure!0 (BitStream!4711 (buf!3081 (_2!5870 lt!200441)) (currentByte!5842 thiss!1634) (currentBit!5837 thiss!1634))))))

(assert (=> b!129902 (= lt!200446 (readBytePure!0 lt!200448))))

(assert (=> b!129902 (= lt!200448 (BitStream!4711 (buf!3081 (_2!5870 lt!200439)) (currentByte!5842 thiss!1634) (currentBit!5837 thiss!1634)))))

(declare-fun e!86086 () Bool)

(assert (=> b!129902 e!86086))

(declare-fun res!107634 () Bool)

(assert (=> b!129902 (=> (not res!107634) (not e!86086))))

(assert (=> b!129902 (= res!107634 (isPrefixOf!0 thiss!1634 (_2!5870 lt!200441)))))

(declare-fun lt!200438 () Unit!8051)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4710 BitStream!4710 BitStream!4710) Unit!8051)

(assert (=> b!129902 (= lt!200438 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5870 lt!200439) (_2!5870 lt!200441)))))

(assert (=> b!129902 e!86087))

(declare-fun res!107629 () Bool)

(assert (=> b!129902 (=> (not res!107629) (not e!86087))))

(assert (=> b!129902 (= res!107629 (= (size!2723 (buf!3081 (_2!5870 lt!200439))) (size!2723 (buf!3081 (_2!5870 lt!200441)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4710 array!6015 (_ BitVec 32) (_ BitVec 32)) tuple2!11146)

(assert (=> b!129902 (= lt!200441 (appendByteArrayLoop!0 (_2!5870 lt!200439) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!129902 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2723 (buf!3081 (_2!5870 lt!200439)))) ((_ sign_extend 32) (currentByte!5842 (_2!5870 lt!200439))) ((_ sign_extend 32) (currentBit!5837 (_2!5870 lt!200439))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!200440 () Unit!8051)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4710 BitStream!4710 (_ BitVec 64) (_ BitVec 32)) Unit!8051)

(assert (=> b!129902 (= lt!200440 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5870 lt!200439) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!129902 e!86088))

(declare-fun res!107635 () Bool)

(assert (=> b!129902 (=> (not res!107635) (not e!86088))))

(assert (=> b!129902 (= res!107635 (= (size!2723 (buf!3081 thiss!1634)) (size!2723 (buf!3081 (_2!5870 lt!200439)))))))

(declare-fun appendByte!0 (BitStream!4710 (_ BitVec 8)) tuple2!11146)

(assert (=> b!129902 (= lt!200439 (appendByte!0 thiss!1634 (select (arr!3340 arr!237) from!447)))))

(declare-fun b!129903 () Bool)

(declare-fun res!107631 () Bool)

(assert (=> b!129903 (=> (not res!107631) (not e!86081))))

(assert (=> b!129903 (= res!107631 (isPrefixOf!0 (_2!5870 lt!200439) (_2!5870 lt!200441)))))

(declare-fun b!129904 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129904 (= e!86086 (invariant!0 (currentBit!5837 thiss!1634) (currentByte!5842 thiss!1634) (size!2723 (buf!3081 (_2!5870 lt!200439)))))))

(declare-fun b!129905 () Bool)

(assert (=> b!129905 (= e!86089 (array_inv!2512 (buf!3081 thiss!1634)))))

(declare-fun b!129906 () Bool)

(declare-fun res!107624 () Bool)

(assert (=> b!129906 (=> (not res!107624) (not e!86082))))

(assert (=> b!129906 (= res!107624 (invariant!0 (currentBit!5837 thiss!1634) (currentByte!5842 thiss!1634) (size!2723 (buf!3081 thiss!1634))))))

(declare-fun b!129907 () Bool)

(assert (=> b!129907 (= e!86085 (= (_2!5871 lt!200446) (_2!5871 lt!200443)))))

(declare-fun b!129908 () Bool)

(declare-fun arrayRangesEq!126 (array!6015 array!6015 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129908 (= e!86084 (not (arrayRangesEq!126 arr!237 (_2!5869 lt!200445) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!25530 res!107628) b!129899))

(assert (= (and b!129899 res!107626) b!129901))

(assert (= (and b!129901 res!107630) b!129906))

(assert (= (and b!129906 res!107624) b!129902))

(assert (= (and b!129902 res!107635) b!129898))

(assert (= (and b!129898 res!107633) b!129897))

(assert (= (and b!129897 res!107627) b!129896))

(assert (= (and b!129902 res!107629) b!129900))

(assert (= (and b!129900 res!107623) b!129903))

(assert (= (and b!129903 res!107631) b!129895))

(assert (= (and b!129895 (not res!107625)) b!129908))

(assert (= (and b!129902 res!107634) b!129904))

(assert (= (and b!129902 res!107632) b!129907))

(assert (= start!25530 b!129905))

(declare-fun m!195841 () Bool)

(assert (=> b!129897 m!195841))

(declare-fun m!195843 () Bool)

(assert (=> start!25530 m!195843))

(declare-fun m!195845 () Bool)

(assert (=> start!25530 m!195845))

(declare-fun m!195847 () Bool)

(assert (=> b!129908 m!195847))

(declare-fun m!195849 () Bool)

(assert (=> b!129903 m!195849))

(declare-fun m!195851 () Bool)

(assert (=> b!129898 m!195851))

(declare-fun m!195853 () Bool)

(assert (=> b!129898 m!195853))

(declare-fun m!195855 () Bool)

(assert (=> b!129905 m!195855))

(declare-fun m!195857 () Bool)

(assert (=> b!129906 m!195857))

(declare-fun m!195859 () Bool)

(assert (=> b!129900 m!195859))

(assert (=> b!129900 m!195851))

(declare-fun m!195861 () Bool)

(assert (=> b!129896 m!195861))

(declare-fun m!195863 () Bool)

(assert (=> b!129896 m!195863))

(declare-fun m!195865 () Bool)

(assert (=> b!129896 m!195865))

(declare-fun m!195867 () Bool)

(assert (=> b!129904 m!195867))

(declare-fun m!195869 () Bool)

(assert (=> b!129899 m!195869))

(declare-fun m!195871 () Bool)

(assert (=> b!129895 m!195871))

(declare-fun m!195873 () Bool)

(assert (=> b!129895 m!195873))

(declare-fun m!195875 () Bool)

(assert (=> b!129895 m!195875))

(declare-fun m!195877 () Bool)

(assert (=> b!129895 m!195877))

(declare-fun m!195879 () Bool)

(assert (=> b!129902 m!195879))

(declare-fun m!195881 () Bool)

(assert (=> b!129902 m!195881))

(declare-fun m!195883 () Bool)

(assert (=> b!129902 m!195883))

(declare-fun m!195885 () Bool)

(assert (=> b!129902 m!195885))

(declare-fun m!195887 () Bool)

(assert (=> b!129902 m!195887))

(declare-fun m!195889 () Bool)

(assert (=> b!129902 m!195889))

(assert (=> b!129902 m!195861))

(declare-fun m!195891 () Bool)

(assert (=> b!129902 m!195891))

(assert (=> b!129902 m!195861))

(declare-fun m!195893 () Bool)

(assert (=> b!129902 m!195893))

(declare-fun m!195895 () Bool)

(assert (=> b!129902 m!195895))

(declare-fun m!195897 () Bool)

(assert (=> b!129902 m!195897))

(declare-fun m!195899 () Bool)

(assert (=> b!129902 m!195899))

(check-sat (not b!129904) (not b!129900) (not b!129905) (not b!129895) (not b!129902) (not b!129903) (not b!129898) (not b!129899) (not b!129908) (not start!25530) (not b!129906) (not b!129897) (not b!129896))
