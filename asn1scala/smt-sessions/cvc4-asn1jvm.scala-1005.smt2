; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28540 () Bool)

(assert start!28540)

(declare-fun b!147781 () Bool)

(declare-fun e!98579 () Bool)

(declare-fun e!98577 () Bool)

(assert (=> b!147781 (= e!98579 e!98577)))

(declare-fun res!123684 () Bool)

(assert (=> b!147781 (=> (not res!123684) (not e!98577))))

(declare-fun lt!230027 () (_ BitVec 64))

(declare-datatypes ((array!6657 0))(
  ( (array!6658 (arr!3781 (Array (_ BitVec 32) (_ BitVec 8))) (size!3012 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5282 0))(
  ( (BitStream!5283 (buf!3477 array!6657) (currentByte!6385 (_ BitVec 32)) (currentBit!6380 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9312 0))(
  ( (Unit!9313) )
))
(declare-datatypes ((tuple2!13164 0))(
  ( (tuple2!13165 (_1!6941 Unit!9312) (_2!6941 BitStream!5282)) )
))
(declare-fun lt!230043 () tuple2!13164)

(declare-fun lt!230030 () tuple2!13164)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147781 (= res!123684 (= (bitIndex!0 (size!3012 (buf!3477 (_2!6941 lt!230030))) (currentByte!6385 (_2!6941 lt!230030)) (currentBit!6380 (_2!6941 lt!230030))) (bvadd (bitIndex!0 (size!3012 (buf!3477 (_2!6941 lt!230043))) (currentByte!6385 (_2!6941 lt!230043)) (currentBit!6380 (_2!6941 lt!230043))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!230027))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!147781 (= lt!230027 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!147782 () Bool)

(declare-fun res!123682 () Bool)

(declare-fun e!98578 () Bool)

(assert (=> b!147782 (=> (not res!123682) (not e!98578))))

(declare-fun thiss!1634 () BitStream!5282)

(declare-fun isPrefixOf!0 (BitStream!5282 BitStream!5282) Bool)

(assert (=> b!147782 (= res!123682 (isPrefixOf!0 thiss!1634 (_2!6941 lt!230043)))))

(declare-fun b!147783 () Bool)

(declare-fun e!98573 () Bool)

(assert (=> b!147783 (= e!98577 (not e!98573))))

(declare-fun res!123689 () Bool)

(assert (=> b!147783 (=> res!123689 e!98573)))

(declare-datatypes ((tuple2!13166 0))(
  ( (tuple2!13167 (_1!6942 BitStream!5282) (_2!6942 array!6657)) )
))
(declare-fun lt!230029 () tuple2!13166)

(declare-datatypes ((tuple2!13168 0))(
  ( (tuple2!13169 (_1!6943 BitStream!5282) (_2!6943 BitStream!5282)) )
))
(declare-fun lt!230040 () tuple2!13168)

(declare-fun arr!237 () array!6657)

(assert (=> b!147783 (= res!123689 (or (not (= (size!3012 (_2!6942 lt!230029)) (size!3012 arr!237))) (not (= (_1!6942 lt!230029) (_2!6943 lt!230040)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5282 array!6657 (_ BitVec 32) (_ BitVec 32)) tuple2!13166)

(assert (=> b!147783 (= lt!230029 (readByteArrayLoopPure!0 (_1!6943 lt!230040) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147783 (validate_offset_bits!1 ((_ sign_extend 32) (size!3012 (buf!3477 (_2!6941 lt!230030)))) ((_ sign_extend 32) (currentByte!6385 (_2!6941 lt!230043))) ((_ sign_extend 32) (currentBit!6380 (_2!6941 lt!230043))) lt!230027)))

(declare-fun lt!230045 () Unit!9312)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5282 array!6657 (_ BitVec 64)) Unit!9312)

(assert (=> b!147783 (= lt!230045 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6941 lt!230043) (buf!3477 (_2!6941 lt!230030)) lt!230027))))

(declare-fun reader!0 (BitStream!5282 BitStream!5282) tuple2!13168)

(assert (=> b!147783 (= lt!230040 (reader!0 (_2!6941 lt!230043) (_2!6941 lt!230030)))))

(declare-fun b!147784 () Bool)

(declare-fun res!123685 () Bool)

(assert (=> b!147784 (=> (not res!123685) (not e!98578))))

(assert (=> b!147784 (= res!123685 (= (bitIndex!0 (size!3012 (buf!3477 (_2!6941 lt!230043))) (currentByte!6385 (_2!6941 lt!230043)) (currentBit!6380 (_2!6941 lt!230043))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3012 (buf!3477 thiss!1634)) (currentByte!6385 thiss!1634) (currentBit!6380 thiss!1634)))))))

(declare-fun b!147785 () Bool)

(declare-fun e!98581 () Bool)

(declare-fun array_inv!2801 (array!6657) Bool)

(assert (=> b!147785 (= e!98581 (array_inv!2801 (buf!3477 thiss!1634)))))

(declare-fun b!147786 () Bool)

(declare-fun res!123681 () Bool)

(declare-fun e!98574 () Bool)

(assert (=> b!147786 (=> (not res!123681) (not e!98574))))

(assert (=> b!147786 (= res!123681 (bvslt from!447 to!404))))

(declare-fun b!147787 () Bool)

(declare-fun res!123683 () Bool)

(assert (=> b!147787 (=> (not res!123683) (not e!98577))))

(assert (=> b!147787 (= res!123683 (isPrefixOf!0 (_2!6941 lt!230043) (_2!6941 lt!230030)))))

(declare-fun lt!230036 () tuple2!13168)

(declare-fun b!147789 () Bool)

(declare-datatypes ((tuple2!13170 0))(
  ( (tuple2!13171 (_1!6944 BitStream!5282) (_2!6944 (_ BitVec 8))) )
))
(declare-fun lt!230042 () tuple2!13170)

(assert (=> b!147789 (= e!98578 (and (= (_2!6944 lt!230042) (select (arr!3781 arr!237) from!447)) (= (_1!6944 lt!230042) (_2!6943 lt!230036))))))

(declare-fun readBytePure!0 (BitStream!5282) tuple2!13170)

(assert (=> b!147789 (= lt!230042 (readBytePure!0 (_1!6943 lt!230036)))))

(assert (=> b!147789 (= lt!230036 (reader!0 thiss!1634 (_2!6941 lt!230043)))))

(declare-fun b!147790 () Bool)

(declare-fun arrayRangesEq!328 (array!6657 array!6657 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147790 (= e!98573 (not (arrayRangesEq!328 arr!237 (_2!6942 lt!230029) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147791 () Bool)

(declare-fun e!98580 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147791 (= e!98580 (invariant!0 (currentBit!6380 thiss!1634) (currentByte!6385 thiss!1634) (size!3012 (buf!3477 (_2!6941 lt!230043)))))))

(declare-fun res!123677 () Bool)

(assert (=> start!28540 (=> (not res!123677) (not e!98574))))

(assert (=> start!28540 (= res!123677 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3012 arr!237))))))

(assert (=> start!28540 e!98574))

(assert (=> start!28540 true))

(assert (=> start!28540 (array_inv!2801 arr!237)))

(declare-fun inv!12 (BitStream!5282) Bool)

(assert (=> start!28540 (and (inv!12 thiss!1634) e!98581)))

(declare-fun b!147788 () Bool)

(declare-fun e!98576 () Bool)

(assert (=> b!147788 (= e!98576 (bvsle #b00000000000000000000000000000000 to!404))))

(declare-fun lt!230039 () tuple2!13166)

(declare-fun lt!230034 () tuple2!13166)

(assert (=> b!147788 (arrayRangesEq!328 (_2!6942 lt!230039) (_2!6942 lt!230034) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230022 () Unit!9312)

(declare-fun arrayRangesEqSymmetricLemma!60 (array!6657 array!6657 (_ BitVec 32) (_ BitVec 32)) Unit!9312)

(assert (=> b!147788 (= lt!230022 (arrayRangesEqSymmetricLemma!60 (_2!6942 lt!230034) (_2!6942 lt!230039) #b00000000000000000000000000000000 to!404))))

(declare-fun b!147792 () Bool)

(assert (=> b!147792 (= e!98574 (not e!98576))))

(declare-fun res!123688 () Bool)

(assert (=> b!147792 (=> res!123688 e!98576)))

(assert (=> b!147792 (= res!123688 (not (arrayRangesEq!328 (_2!6942 lt!230034) (_2!6942 lt!230039) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!230023 () tuple2!13166)

(assert (=> b!147792 (arrayRangesEq!328 (_2!6942 lt!230034) (_2!6942 lt!230023) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!230025 () Unit!9312)

(declare-fun lt!230038 () tuple2!13168)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5282 array!6657 (_ BitVec 32) (_ BitVec 32)) Unit!9312)

(assert (=> b!147792 (= lt!230025 (readByteArrayLoopArrayPrefixLemma!0 (_1!6943 lt!230038) arr!237 from!447 to!404))))

(declare-fun lt!230032 () array!6657)

(declare-fun withMovedByteIndex!0 (BitStream!5282 (_ BitVec 32)) BitStream!5282)

(assert (=> b!147792 (= lt!230023 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6943 lt!230038) #b00000000000000000000000000000001) lt!230032 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230041 () tuple2!13168)

(assert (=> b!147792 (= lt!230039 (readByteArrayLoopPure!0 (_1!6943 lt!230041) lt!230032 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!230044 () tuple2!13170)

(assert (=> b!147792 (= lt!230032 (array!6658 (store (arr!3781 arr!237) from!447 (_2!6944 lt!230044)) (size!3012 arr!237)))))

(declare-fun lt!230035 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147792 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3012 (buf!3477 (_2!6941 lt!230030)))) ((_ sign_extend 32) (currentByte!6385 (_2!6941 lt!230043))) ((_ sign_extend 32) (currentBit!6380 (_2!6941 lt!230043))) lt!230035)))

(declare-fun lt!230033 () Unit!9312)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5282 array!6657 (_ BitVec 32)) Unit!9312)

(assert (=> b!147792 (= lt!230033 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6941 lt!230043) (buf!3477 (_2!6941 lt!230030)) lt!230035))))

(assert (=> b!147792 (= (_1!6942 lt!230034) (_2!6943 lt!230038))))

(assert (=> b!147792 (= lt!230034 (readByteArrayLoopPure!0 (_1!6943 lt!230038) arr!237 from!447 to!404))))

(assert (=> b!147792 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3012 (buf!3477 (_2!6941 lt!230030)))) ((_ sign_extend 32) (currentByte!6385 thiss!1634)) ((_ sign_extend 32) (currentBit!6380 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!230037 () Unit!9312)

(assert (=> b!147792 (= lt!230037 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3477 (_2!6941 lt!230030)) (bvsub to!404 from!447)))))

(assert (=> b!147792 (= (_2!6944 lt!230044) (select (arr!3781 arr!237) from!447))))

(assert (=> b!147792 (= lt!230044 (readBytePure!0 (_1!6943 lt!230038)))))

(assert (=> b!147792 (= lt!230041 (reader!0 (_2!6941 lt!230043) (_2!6941 lt!230030)))))

(assert (=> b!147792 (= lt!230038 (reader!0 thiss!1634 (_2!6941 lt!230030)))))

(declare-fun e!98582 () Bool)

(assert (=> b!147792 e!98582))

(declare-fun res!123687 () Bool)

(assert (=> b!147792 (=> (not res!123687) (not e!98582))))

(declare-fun lt!230026 () tuple2!13170)

(declare-fun lt!230031 () tuple2!13170)

(assert (=> b!147792 (= res!123687 (= (bitIndex!0 (size!3012 (buf!3477 (_1!6944 lt!230026))) (currentByte!6385 (_1!6944 lt!230026)) (currentBit!6380 (_1!6944 lt!230026))) (bitIndex!0 (size!3012 (buf!3477 (_1!6944 lt!230031))) (currentByte!6385 (_1!6944 lt!230031)) (currentBit!6380 (_1!6944 lt!230031)))))))

(declare-fun lt!230021 () Unit!9312)

(declare-fun lt!230024 () BitStream!5282)

(declare-fun readBytePrefixLemma!0 (BitStream!5282 BitStream!5282) Unit!9312)

(assert (=> b!147792 (= lt!230021 (readBytePrefixLemma!0 lt!230024 (_2!6941 lt!230030)))))

(assert (=> b!147792 (= lt!230031 (readBytePure!0 (BitStream!5283 (buf!3477 (_2!6941 lt!230030)) (currentByte!6385 thiss!1634) (currentBit!6380 thiss!1634))))))

(assert (=> b!147792 (= lt!230026 (readBytePure!0 lt!230024))))

(assert (=> b!147792 (= lt!230024 (BitStream!5283 (buf!3477 (_2!6941 lt!230043)) (currentByte!6385 thiss!1634) (currentBit!6380 thiss!1634)))))

(assert (=> b!147792 e!98580))

(declare-fun res!123679 () Bool)

(assert (=> b!147792 (=> (not res!123679) (not e!98580))))

(assert (=> b!147792 (= res!123679 (isPrefixOf!0 thiss!1634 (_2!6941 lt!230030)))))

(declare-fun lt!230028 () Unit!9312)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5282 BitStream!5282 BitStream!5282) Unit!9312)

(assert (=> b!147792 (= lt!230028 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6941 lt!230043) (_2!6941 lt!230030)))))

(assert (=> b!147792 e!98579))

(declare-fun res!123676 () Bool)

(assert (=> b!147792 (=> (not res!123676) (not e!98579))))

(assert (=> b!147792 (= res!123676 (= (size!3012 (buf!3477 (_2!6941 lt!230043))) (size!3012 (buf!3477 (_2!6941 lt!230030)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5282 array!6657 (_ BitVec 32) (_ BitVec 32)) tuple2!13164)

(assert (=> b!147792 (= lt!230030 (appendByteArrayLoop!0 (_2!6941 lt!230043) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147792 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3012 (buf!3477 (_2!6941 lt!230043)))) ((_ sign_extend 32) (currentByte!6385 (_2!6941 lt!230043))) ((_ sign_extend 32) (currentBit!6380 (_2!6941 lt!230043))) lt!230035)))

(assert (=> b!147792 (= lt!230035 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!230020 () Unit!9312)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5282 BitStream!5282 (_ BitVec 64) (_ BitVec 32)) Unit!9312)

(assert (=> b!147792 (= lt!230020 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6941 lt!230043) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!147792 e!98578))

(declare-fun res!123686 () Bool)

(assert (=> b!147792 (=> (not res!123686) (not e!98578))))

(assert (=> b!147792 (= res!123686 (= (size!3012 (buf!3477 thiss!1634)) (size!3012 (buf!3477 (_2!6941 lt!230043)))))))

(declare-fun appendByte!0 (BitStream!5282 (_ BitVec 8)) tuple2!13164)

(assert (=> b!147792 (= lt!230043 (appendByte!0 thiss!1634 (select (arr!3781 arr!237) from!447)))))

(declare-fun b!147793 () Bool)

(declare-fun res!123678 () Bool)

(assert (=> b!147793 (=> (not res!123678) (not e!98574))))

(assert (=> b!147793 (= res!123678 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3012 (buf!3477 thiss!1634))) ((_ sign_extend 32) (currentByte!6385 thiss!1634)) ((_ sign_extend 32) (currentBit!6380 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!147794 () Bool)

(declare-fun res!123680 () Bool)

(assert (=> b!147794 (=> (not res!123680) (not e!98574))))

(assert (=> b!147794 (= res!123680 (invariant!0 (currentBit!6380 thiss!1634) (currentByte!6385 thiss!1634) (size!3012 (buf!3477 thiss!1634))))))

(declare-fun b!147795 () Bool)

(assert (=> b!147795 (= e!98582 (= (_2!6944 lt!230026) (_2!6944 lt!230031)))))

(assert (= (and start!28540 res!123677) b!147793))

(assert (= (and b!147793 res!123678) b!147786))

(assert (= (and b!147786 res!123681) b!147794))

(assert (= (and b!147794 res!123680) b!147792))

(assert (= (and b!147792 res!123686) b!147784))

(assert (= (and b!147784 res!123685) b!147782))

(assert (= (and b!147782 res!123682) b!147789))

(assert (= (and b!147792 res!123676) b!147781))

(assert (= (and b!147781 res!123684) b!147787))

(assert (= (and b!147787 res!123683) b!147783))

(assert (= (and b!147783 (not res!123689)) b!147790))

(assert (= (and b!147792 res!123679) b!147791))

(assert (= (and b!147792 res!123687) b!147795))

(assert (= (and b!147792 (not res!123688)) b!147788))

(assert (= start!28540 b!147785))

(declare-fun m!228919 () Bool)

(assert (=> b!147793 m!228919))

(declare-fun m!228921 () Bool)

(assert (=> b!147794 m!228921))

(declare-fun m!228923 () Bool)

(assert (=> b!147785 m!228923))

(declare-fun m!228925 () Bool)

(assert (=> start!28540 m!228925))

(declare-fun m!228927 () Bool)

(assert (=> start!28540 m!228927))

(declare-fun m!228929 () Bool)

(assert (=> b!147787 m!228929))

(declare-fun m!228931 () Bool)

(assert (=> b!147788 m!228931))

(declare-fun m!228933 () Bool)

(assert (=> b!147788 m!228933))

(declare-fun m!228935 () Bool)

(assert (=> b!147791 m!228935))

(declare-fun m!228937 () Bool)

(assert (=> b!147784 m!228937))

(declare-fun m!228939 () Bool)

(assert (=> b!147784 m!228939))

(declare-fun m!228941 () Bool)

(assert (=> b!147792 m!228941))

(declare-fun m!228943 () Bool)

(assert (=> b!147792 m!228943))

(declare-fun m!228945 () Bool)

(assert (=> b!147792 m!228945))

(declare-fun m!228947 () Bool)

(assert (=> b!147792 m!228947))

(declare-fun m!228949 () Bool)

(assert (=> b!147792 m!228949))

(declare-fun m!228951 () Bool)

(assert (=> b!147792 m!228951))

(declare-fun m!228953 () Bool)

(assert (=> b!147792 m!228953))

(declare-fun m!228955 () Bool)

(assert (=> b!147792 m!228955))

(declare-fun m!228957 () Bool)

(assert (=> b!147792 m!228957))

(declare-fun m!228959 () Bool)

(assert (=> b!147792 m!228959))

(declare-fun m!228961 () Bool)

(assert (=> b!147792 m!228961))

(declare-fun m!228963 () Bool)

(assert (=> b!147792 m!228963))

(declare-fun m!228965 () Bool)

(assert (=> b!147792 m!228965))

(declare-fun m!228967 () Bool)

(assert (=> b!147792 m!228967))

(declare-fun m!228969 () Bool)

(assert (=> b!147792 m!228969))

(declare-fun m!228971 () Bool)

(assert (=> b!147792 m!228971))

(declare-fun m!228973 () Bool)

(assert (=> b!147792 m!228973))

(declare-fun m!228975 () Bool)

(assert (=> b!147792 m!228975))

(declare-fun m!228977 () Bool)

(assert (=> b!147792 m!228977))

(declare-fun m!228979 () Bool)

(assert (=> b!147792 m!228979))

(declare-fun m!228981 () Bool)

(assert (=> b!147792 m!228981))

(declare-fun m!228983 () Bool)

(assert (=> b!147792 m!228983))

(assert (=> b!147792 m!228957))

(declare-fun m!228985 () Bool)

(assert (=> b!147792 m!228985))

(declare-fun m!228987 () Bool)

(assert (=> b!147792 m!228987))

(declare-fun m!228989 () Bool)

(assert (=> b!147792 m!228989))

(declare-fun m!228991 () Bool)

(assert (=> b!147792 m!228991))

(declare-fun m!228993 () Bool)

(assert (=> b!147792 m!228993))

(assert (=> b!147792 m!228987))

(declare-fun m!228995 () Bool)

(assert (=> b!147781 m!228995))

(assert (=> b!147781 m!228937))

(declare-fun m!228997 () Bool)

(assert (=> b!147783 m!228997))

(declare-fun m!228999 () Bool)

(assert (=> b!147783 m!228999))

(declare-fun m!229001 () Bool)

(assert (=> b!147783 m!229001))

(assert (=> b!147783 m!228965))

(declare-fun m!229003 () Bool)

(assert (=> b!147790 m!229003))

(declare-fun m!229005 () Bool)

(assert (=> b!147782 m!229005))

(assert (=> b!147789 m!228987))

(declare-fun m!229007 () Bool)

(assert (=> b!147789 m!229007))

(declare-fun m!229009 () Bool)

(assert (=> b!147789 m!229009))

(push 1)

(assert (not b!147784))

(assert (not b!147781))

(assert (not b!147785))

(assert (not b!147790))

(assert (not start!28540))

(assert (not b!147793))

(assert (not b!147783))

(assert (not b!147788))

(assert (not b!147782))

(assert (not b!147792))

(assert (not b!147789))

(assert (not b!147791))

(assert (not b!147787))

(assert (not b!147794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

