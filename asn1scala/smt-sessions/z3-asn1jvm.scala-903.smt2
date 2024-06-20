; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25494 () Bool)

(assert start!25494)

(declare-fun b!129093 () Bool)

(declare-fun e!85569 () Bool)

(assert (=> b!129093 (= e!85569 (not true))))

(declare-fun lt!199759 () Bool)

(declare-datatypes ((array!5979 0))(
  ( (array!5980 (arr!3322 (Array (_ BitVec 32) (_ BitVec 8))) (size!2705 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4674 0))(
  ( (BitStream!4675 (buf!3063 array!5979) (currentByte!5824 (_ BitVec 32)) (currentBit!5819 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8015 0))(
  ( (Unit!8016) )
))
(declare-datatypes ((tuple2!10998 0))(
  ( (tuple2!10999 (_1!5796 Unit!8015) (_2!5796 BitStream!4674)) )
))
(declare-fun lt!199763 () tuple2!10998)

(declare-fun lt!199757 () tuple2!10998)

(declare-fun isPrefixOf!0 (BitStream!4674 BitStream!4674) Bool)

(assert (=> b!129093 (= lt!199759 (isPrefixOf!0 (_2!5796 lt!199763) (_2!5796 lt!199757)))))

(declare-fun lt!199764 () Bool)

(declare-fun thiss!1634 () BitStream!4674)

(assert (=> b!129093 (= lt!199764 (isPrefixOf!0 thiss!1634 (_2!5796 lt!199763)))))

(declare-fun e!85572 () Bool)

(assert (=> b!129093 e!85572))

(declare-fun res!106885 () Bool)

(assert (=> b!129093 (=> (not res!106885) (not e!85572))))

(assert (=> b!129093 (= res!106885 (= (size!2705 (buf!3063 (_2!5796 lt!199763))) (size!2705 (buf!3063 (_2!5796 lt!199757)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5979)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!4674 array!5979 (_ BitVec 32) (_ BitVec 32)) tuple2!10998)

(assert (=> b!129093 (= lt!199757 (appendByteArrayLoop!0 (_2!5796 lt!199763) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!129093 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2705 (buf!3063 (_2!5796 lt!199763)))) ((_ sign_extend 32) (currentByte!5824 (_2!5796 lt!199763))) ((_ sign_extend 32) (currentBit!5819 (_2!5796 lt!199763))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199765 () Unit!8015)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4674 BitStream!4674 (_ BitVec 64) (_ BitVec 32)) Unit!8015)

(assert (=> b!129093 (= lt!199765 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5796 lt!199763) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!85574 () Bool)

(assert (=> b!129093 e!85574))

(declare-fun res!106883 () Bool)

(assert (=> b!129093 (=> (not res!106883) (not e!85574))))

(assert (=> b!129093 (= res!106883 (= (size!2705 (buf!3063 thiss!1634)) (size!2705 (buf!3063 (_2!5796 lt!199763)))))))

(declare-fun appendByte!0 (BitStream!4674 (_ BitVec 8)) tuple2!10998)

(assert (=> b!129093 (= lt!199763 (appendByte!0 thiss!1634 (select (arr!3322 arr!237) from!447)))))

(declare-fun b!129094 () Bool)

(declare-fun e!85571 () Bool)

(assert (=> b!129094 (= e!85572 e!85571)))

(declare-fun res!106880 () Bool)

(assert (=> b!129094 (=> (not res!106880) (not e!85571))))

(declare-fun lt!199758 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!129094 (= res!106880 (= (bitIndex!0 (size!2705 (buf!3063 (_2!5796 lt!199757))) (currentByte!5824 (_2!5796 lt!199757)) (currentBit!5819 (_2!5796 lt!199757))) (bvadd (bitIndex!0 (size!2705 (buf!3063 (_2!5796 lt!199763))) (currentByte!5824 (_2!5796 lt!199763)) (currentBit!5819 (_2!5796 lt!199763))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!199758))))))

(assert (=> b!129094 (= lt!199758 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-datatypes ((tuple2!11000 0))(
  ( (tuple2!11001 (_1!5797 BitStream!4674) (_2!5797 array!5979)) )
))
(declare-fun lt!199760 () tuple2!11000)

(declare-fun b!129095 () Bool)

(declare-fun e!85567 () Bool)

(declare-fun arrayRangesEq!108 (array!5979 array!5979 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129095 (= e!85567 (not (arrayRangesEq!108 arr!237 (_2!5797 lt!199760) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!106882 () Bool)

(assert (=> start!25494 (=> (not res!106882) (not e!85569))))

(assert (=> start!25494 (= res!106882 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2705 arr!237))))))

(assert (=> start!25494 e!85569))

(assert (=> start!25494 true))

(declare-fun array_inv!2494 (array!5979) Bool)

(assert (=> start!25494 (array_inv!2494 arr!237)))

(declare-fun e!85570 () Bool)

(declare-fun inv!12 (BitStream!4674) Bool)

(assert (=> start!25494 (and (inv!12 thiss!1634) e!85570)))

(declare-fun b!129096 () Bool)

(declare-fun res!106876 () Bool)

(assert (=> b!129096 (=> (not res!106876) (not e!85569))))

(assert (=> b!129096 (= res!106876 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2705 (buf!3063 thiss!1634))) ((_ sign_extend 32) (currentByte!5824 thiss!1634)) ((_ sign_extend 32) (currentBit!5819 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!129097 () Bool)

(declare-fun res!106878 () Bool)

(assert (=> b!129097 (=> (not res!106878) (not e!85574))))

(assert (=> b!129097 (= res!106878 (= (bitIndex!0 (size!2705 (buf!3063 (_2!5796 lt!199763))) (currentByte!5824 (_2!5796 lt!199763)) (currentBit!5819 (_2!5796 lt!199763))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2705 (buf!3063 thiss!1634)) (currentByte!5824 thiss!1634) (currentBit!5819 thiss!1634)))))))

(declare-fun b!129098 () Bool)

(assert (=> b!129098 (= e!85570 (array_inv!2494 (buf!3063 thiss!1634)))))

(declare-fun b!129099 () Bool)

(assert (=> b!129099 (= e!85571 (not e!85567))))

(declare-fun res!106877 () Bool)

(assert (=> b!129099 (=> res!106877 e!85567)))

(declare-datatypes ((tuple2!11002 0))(
  ( (tuple2!11003 (_1!5798 BitStream!4674) (_2!5798 BitStream!4674)) )
))
(declare-fun lt!199756 () tuple2!11002)

(assert (=> b!129099 (= res!106877 (or (not (= (size!2705 (_2!5797 lt!199760)) (size!2705 arr!237))) (not (= (_1!5797 lt!199760) (_2!5798 lt!199756)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4674 array!5979 (_ BitVec 32) (_ BitVec 32)) tuple2!11000)

(assert (=> b!129099 (= lt!199760 (readByteArrayLoopPure!0 (_1!5798 lt!199756) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!129099 (validate_offset_bits!1 ((_ sign_extend 32) (size!2705 (buf!3063 (_2!5796 lt!199757)))) ((_ sign_extend 32) (currentByte!5824 (_2!5796 lt!199763))) ((_ sign_extend 32) (currentBit!5819 (_2!5796 lt!199763))) lt!199758)))

(declare-fun lt!199761 () Unit!8015)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4674 array!5979 (_ BitVec 64)) Unit!8015)

(assert (=> b!129099 (= lt!199761 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5796 lt!199763) (buf!3063 (_2!5796 lt!199757)) lt!199758))))

(declare-fun reader!0 (BitStream!4674 BitStream!4674) tuple2!11002)

(assert (=> b!129099 (= lt!199756 (reader!0 (_2!5796 lt!199763) (_2!5796 lt!199757)))))

(declare-fun b!129100 () Bool)

(declare-fun res!106881 () Bool)

(assert (=> b!129100 (=> (not res!106881) (not e!85571))))

(assert (=> b!129100 (= res!106881 (isPrefixOf!0 (_2!5796 lt!199763) (_2!5796 lt!199757)))))

(declare-fun b!129101 () Bool)

(declare-fun res!106879 () Bool)

(assert (=> b!129101 (=> (not res!106879) (not e!85569))))

(assert (=> b!129101 (= res!106879 (bvslt from!447 to!404))))

(declare-fun b!129102 () Bool)

(declare-datatypes ((tuple2!11004 0))(
  ( (tuple2!11005 (_1!5799 BitStream!4674) (_2!5799 (_ BitVec 8))) )
))
(declare-fun lt!199766 () tuple2!11004)

(declare-fun lt!199762 () tuple2!11002)

(assert (=> b!129102 (= e!85574 (and (= (_2!5799 lt!199766) (select (arr!3322 arr!237) from!447)) (= (_1!5799 lt!199766) (_2!5798 lt!199762))))))

(declare-fun readBytePure!0 (BitStream!4674) tuple2!11004)

(assert (=> b!129102 (= lt!199766 (readBytePure!0 (_1!5798 lt!199762)))))

(assert (=> b!129102 (= lt!199762 (reader!0 thiss!1634 (_2!5796 lt!199763)))))

(declare-fun b!129103 () Bool)

(declare-fun res!106875 () Bool)

(assert (=> b!129103 (=> (not res!106875) (not e!85574))))

(assert (=> b!129103 (= res!106875 (isPrefixOf!0 thiss!1634 (_2!5796 lt!199763)))))

(declare-fun b!129104 () Bool)

(declare-fun res!106884 () Bool)

(assert (=> b!129104 (=> (not res!106884) (not e!85569))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!129104 (= res!106884 (invariant!0 (currentBit!5819 thiss!1634) (currentByte!5824 thiss!1634) (size!2705 (buf!3063 thiss!1634))))))

(assert (= (and start!25494 res!106882) b!129096))

(assert (= (and b!129096 res!106876) b!129101))

(assert (= (and b!129101 res!106879) b!129104))

(assert (= (and b!129104 res!106884) b!129093))

(assert (= (and b!129093 res!106883) b!129097))

(assert (= (and b!129097 res!106878) b!129103))

(assert (= (and b!129103 res!106875) b!129102))

(assert (= (and b!129093 res!106885) b!129094))

(assert (= (and b!129094 res!106880) b!129100))

(assert (= (and b!129100 res!106881) b!129099))

(assert (= (and b!129099 (not res!106877)) b!129095))

(assert (= start!25494 b!129098))

(declare-fun m!194865 () Bool)

(assert (=> b!129097 m!194865))

(declare-fun m!194867 () Bool)

(assert (=> b!129097 m!194867))

(declare-fun m!194869 () Bool)

(assert (=> b!129099 m!194869))

(declare-fun m!194871 () Bool)

(assert (=> b!129099 m!194871))

(declare-fun m!194873 () Bool)

(assert (=> b!129099 m!194873))

(declare-fun m!194875 () Bool)

(assert (=> b!129099 m!194875))

(declare-fun m!194877 () Bool)

(assert (=> b!129102 m!194877))

(declare-fun m!194879 () Bool)

(assert (=> b!129102 m!194879))

(declare-fun m!194881 () Bool)

(assert (=> b!129102 m!194881))

(declare-fun m!194883 () Bool)

(assert (=> b!129093 m!194883))

(declare-fun m!194885 () Bool)

(assert (=> b!129093 m!194885))

(declare-fun m!194887 () Bool)

(assert (=> b!129093 m!194887))

(assert (=> b!129093 m!194877))

(declare-fun m!194889 () Bool)

(assert (=> b!129093 m!194889))

(assert (=> b!129093 m!194877))

(declare-fun m!194891 () Bool)

(assert (=> b!129093 m!194891))

(declare-fun m!194893 () Bool)

(assert (=> b!129093 m!194893))

(assert (=> b!129100 m!194891))

(declare-fun m!194895 () Bool)

(assert (=> start!25494 m!194895))

(declare-fun m!194897 () Bool)

(assert (=> start!25494 m!194897))

(declare-fun m!194899 () Bool)

(assert (=> b!129104 m!194899))

(assert (=> b!129103 m!194883))

(declare-fun m!194901 () Bool)

(assert (=> b!129096 m!194901))

(declare-fun m!194903 () Bool)

(assert (=> b!129094 m!194903))

(assert (=> b!129094 m!194865))

(declare-fun m!194905 () Bool)

(assert (=> b!129095 m!194905))

(declare-fun m!194907 () Bool)

(assert (=> b!129098 m!194907))

(check-sat (not b!129095) (not b!129104) (not b!129100) (not b!129099) (not start!25494) (not b!129096) (not b!129103) (not b!129102) (not b!129097) (not b!129094) (not b!129098) (not b!129093))
