; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28538 () Bool)

(assert start!28538)

(declare-fun b!147736 () Bool)

(declare-fun res!123647 () Bool)

(declare-fun e!98549 () Bool)

(assert (=> b!147736 (=> (not res!123647) (not e!98549))))

(declare-datatypes ((array!6655 0))(
  ( (array!6656 (arr!3780 (Array (_ BitVec 32) (_ BitVec 8))) (size!3011 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5280 0))(
  ( (BitStream!5281 (buf!3476 array!6655) (currentByte!6384 (_ BitVec 32)) (currentBit!6379 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9310 0))(
  ( (Unit!9311) )
))
(declare-datatypes ((tuple2!13156 0))(
  ( (tuple2!13157 (_1!6937 Unit!9310) (_2!6937 BitStream!5280)) )
))
(declare-fun lt!229959 () tuple2!13156)

(declare-fun lt!229954 () tuple2!13156)

(declare-fun isPrefixOf!0 (BitStream!5280 BitStream!5280) Bool)

(assert (=> b!147736 (= res!123647 (isPrefixOf!0 (_2!6937 lt!229959) (_2!6937 lt!229954)))))

(declare-fun b!147737 () Bool)

(declare-fun e!98548 () Bool)

(assert (=> b!147737 (= e!98549 (not e!98548))))

(declare-fun res!123638 () Bool)

(assert (=> b!147737 (=> res!123638 e!98548)))

(declare-datatypes ((tuple2!13158 0))(
  ( (tuple2!13159 (_1!6938 BitStream!5280) (_2!6938 array!6655)) )
))
(declare-fun lt!229963 () tuple2!13158)

(declare-datatypes ((tuple2!13160 0))(
  ( (tuple2!13161 (_1!6939 BitStream!5280) (_2!6939 BitStream!5280)) )
))
(declare-fun lt!229956 () tuple2!13160)

(declare-fun arr!237 () array!6655)

(assert (=> b!147737 (= res!123638 (or (not (= (size!3011 (_2!6938 lt!229963)) (size!3011 arr!237))) (not (= (_1!6938 lt!229963) (_2!6939 lt!229956)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5280 array!6655 (_ BitVec 32) (_ BitVec 32)) tuple2!13158)

(assert (=> b!147737 (= lt!229963 (readByteArrayLoopPure!0 (_1!6939 lt!229956) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229952 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147737 (validate_offset_bits!1 ((_ sign_extend 32) (size!3011 (buf!3476 (_2!6937 lt!229954)))) ((_ sign_extend 32) (currentByte!6384 (_2!6937 lt!229959))) ((_ sign_extend 32) (currentBit!6379 (_2!6937 lt!229959))) lt!229952)))

(declare-fun lt!229957 () Unit!9310)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5280 array!6655 (_ BitVec 64)) Unit!9310)

(assert (=> b!147737 (= lt!229957 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6937 lt!229959) (buf!3476 (_2!6937 lt!229954)) lt!229952))))

(declare-fun reader!0 (BitStream!5280 BitStream!5280) tuple2!13160)

(assert (=> b!147737 (= lt!229956 (reader!0 (_2!6937 lt!229959) (_2!6937 lt!229954)))))

(declare-fun res!123641 () Bool)

(declare-fun e!98543 () Bool)

(assert (=> start!28538 (=> (not res!123641) (not e!98543))))

(assert (=> start!28538 (= res!123641 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3011 arr!237))))))

(assert (=> start!28538 e!98543))

(assert (=> start!28538 true))

(declare-fun array_inv!2800 (array!6655) Bool)

(assert (=> start!28538 (array_inv!2800 arr!237)))

(declare-fun thiss!1634 () BitStream!5280)

(declare-fun e!98541 () Bool)

(declare-fun inv!12 (BitStream!5280) Bool)

(assert (=> start!28538 (and (inv!12 thiss!1634) e!98541)))

(declare-fun b!147738 () Bool)

(declare-fun arrayRangesEq!327 (array!6655 array!6655 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147738 (= e!98548 (not (arrayRangesEq!327 arr!237 (_2!6938 lt!229963) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147739 () Bool)

(assert (=> b!147739 (= e!98541 (array_inv!2800 (buf!3476 thiss!1634)))))

(declare-fun b!147740 () Bool)

(declare-fun res!123640 () Bool)

(assert (=> b!147740 (=> (not res!123640) (not e!98543))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147740 (= res!123640 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3011 (buf!3476 thiss!1634))) ((_ sign_extend 32) (currentByte!6384 thiss!1634)) ((_ sign_extend 32) (currentBit!6379 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!147741 () Bool)

(declare-fun e!98547 () Bool)

(assert (=> b!147741 (= e!98547 e!98549)))

(declare-fun res!123646 () Bool)

(assert (=> b!147741 (=> (not res!123646) (not e!98549))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147741 (= res!123646 (= (bitIndex!0 (size!3011 (buf!3476 (_2!6937 lt!229954))) (currentByte!6384 (_2!6937 lt!229954)) (currentBit!6379 (_2!6937 lt!229954))) (bvadd (bitIndex!0 (size!3011 (buf!3476 (_2!6937 lt!229959))) (currentByte!6384 (_2!6937 lt!229959)) (currentBit!6379 (_2!6937 lt!229959))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!229952))))))

(assert (=> b!147741 (= lt!229952 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!147742 () Bool)

(declare-fun res!123645 () Bool)

(assert (=> b!147742 (=> (not res!123645) (not e!98543))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147742 (= res!123645 (invariant!0 (currentBit!6379 thiss!1634) (currentByte!6384 thiss!1634) (size!3011 (buf!3476 thiss!1634))))))

(declare-fun b!147743 () Bool)

(declare-fun res!123635 () Bool)

(assert (=> b!147743 (=> (not res!123635) (not e!98543))))

(assert (=> b!147743 (= res!123635 (bvslt from!447 to!404))))

(declare-fun b!147744 () Bool)

(declare-fun e!98544 () Bool)

(declare-datatypes ((tuple2!13162 0))(
  ( (tuple2!13163 (_1!6940 BitStream!5280) (_2!6940 (_ BitVec 8))) )
))
(declare-fun lt!229958 () tuple2!13162)

(declare-fun lt!229950 () tuple2!13162)

(assert (=> b!147744 (= e!98544 (= (_2!6940 lt!229958) (_2!6940 lt!229950)))))

(declare-fun b!147745 () Bool)

(declare-fun e!98545 () Bool)

(assert (=> b!147745 (= e!98545 (invariant!0 (currentBit!6379 thiss!1634) (currentByte!6384 thiss!1634) (size!3011 (buf!3476 (_2!6937 lt!229959)))))))

(declare-fun b!147746 () Bool)

(declare-fun res!123634 () Bool)

(declare-fun e!98546 () Bool)

(assert (=> b!147746 (=> (not res!123634) (not e!98546))))

(assert (=> b!147746 (= res!123634 (= (bitIndex!0 (size!3011 (buf!3476 (_2!6937 lt!229959))) (currentByte!6384 (_2!6937 lt!229959)) (currentBit!6379 (_2!6937 lt!229959))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3011 (buf!3476 thiss!1634)) (currentByte!6384 thiss!1634) (currentBit!6379 thiss!1634)))))))

(declare-fun b!147747 () Bool)

(declare-fun e!98542 () Bool)

(assert (=> b!147747 (= e!98542 (bvsle #b00000000000000000000000000000000 to!404))))

(declare-fun lt!229943 () tuple2!13158)

(declare-fun lt!229949 () tuple2!13158)

(assert (=> b!147747 (arrayRangesEq!327 (_2!6938 lt!229943) (_2!6938 lt!229949) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!229947 () Unit!9310)

(declare-fun arrayRangesEqSymmetricLemma!59 (array!6655 array!6655 (_ BitVec 32) (_ BitVec 32)) Unit!9310)

(assert (=> b!147747 (= lt!229947 (arrayRangesEqSymmetricLemma!59 (_2!6938 lt!229949) (_2!6938 lt!229943) #b00000000000000000000000000000000 to!404))))

(declare-fun b!147748 () Bool)

(declare-fun lt!229953 () tuple2!13162)

(declare-fun lt!229961 () tuple2!13160)

(assert (=> b!147748 (= e!98546 (and (= (_2!6940 lt!229953) (select (arr!3780 arr!237) from!447)) (= (_1!6940 lt!229953) (_2!6939 lt!229961))))))

(declare-fun readBytePure!0 (BitStream!5280) tuple2!13162)

(assert (=> b!147748 (= lt!229953 (readBytePure!0 (_1!6939 lt!229961)))))

(assert (=> b!147748 (= lt!229961 (reader!0 thiss!1634 (_2!6937 lt!229959)))))

(declare-fun b!147749 () Bool)

(assert (=> b!147749 (= e!98543 (not e!98542))))

(declare-fun res!123644 () Bool)

(assert (=> b!147749 (=> res!123644 e!98542)))

(assert (=> b!147749 (= res!123644 (not (arrayRangesEq!327 (_2!6938 lt!229949) (_2!6938 lt!229943) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!229946 () tuple2!13158)

(assert (=> b!147749 (arrayRangesEq!327 (_2!6938 lt!229949) (_2!6938 lt!229946) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!229942 () tuple2!13160)

(declare-fun lt!229955 () Unit!9310)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5280 array!6655 (_ BitVec 32) (_ BitVec 32)) Unit!9310)

(assert (=> b!147749 (= lt!229955 (readByteArrayLoopArrayPrefixLemma!0 (_1!6939 lt!229942) arr!237 from!447 to!404))))

(declare-fun lt!229966 () array!6655)

(declare-fun withMovedByteIndex!0 (BitStream!5280 (_ BitVec 32)) BitStream!5280)

(assert (=> b!147749 (= lt!229946 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6939 lt!229942) #b00000000000000000000000000000001) lt!229966 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229967 () tuple2!13160)

(assert (=> b!147749 (= lt!229943 (readByteArrayLoopPure!0 (_1!6939 lt!229967) lt!229966 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229944 () tuple2!13162)

(assert (=> b!147749 (= lt!229966 (array!6656 (store (arr!3780 arr!237) from!447 (_2!6940 lt!229944)) (size!3011 arr!237)))))

(declare-fun lt!229948 () (_ BitVec 32))

(assert (=> b!147749 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3011 (buf!3476 (_2!6937 lt!229954)))) ((_ sign_extend 32) (currentByte!6384 (_2!6937 lt!229959))) ((_ sign_extend 32) (currentBit!6379 (_2!6937 lt!229959))) lt!229948)))

(declare-fun lt!229951 () Unit!9310)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5280 array!6655 (_ BitVec 32)) Unit!9310)

(assert (=> b!147749 (= lt!229951 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6937 lt!229959) (buf!3476 (_2!6937 lt!229954)) lt!229948))))

(assert (=> b!147749 (= (_1!6938 lt!229949) (_2!6939 lt!229942))))

(assert (=> b!147749 (= lt!229949 (readByteArrayLoopPure!0 (_1!6939 lt!229942) arr!237 from!447 to!404))))

(assert (=> b!147749 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3011 (buf!3476 (_2!6937 lt!229954)))) ((_ sign_extend 32) (currentByte!6384 thiss!1634)) ((_ sign_extend 32) (currentBit!6379 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!229945 () Unit!9310)

(assert (=> b!147749 (= lt!229945 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3476 (_2!6937 lt!229954)) (bvsub to!404 from!447)))))

(assert (=> b!147749 (= (_2!6940 lt!229944) (select (arr!3780 arr!237) from!447))))

(assert (=> b!147749 (= lt!229944 (readBytePure!0 (_1!6939 lt!229942)))))

(assert (=> b!147749 (= lt!229967 (reader!0 (_2!6937 lt!229959) (_2!6937 lt!229954)))))

(assert (=> b!147749 (= lt!229942 (reader!0 thiss!1634 (_2!6937 lt!229954)))))

(assert (=> b!147749 e!98544))

(declare-fun res!123637 () Bool)

(assert (=> b!147749 (=> (not res!123637) (not e!98544))))

(assert (=> b!147749 (= res!123637 (= (bitIndex!0 (size!3011 (buf!3476 (_1!6940 lt!229958))) (currentByte!6384 (_1!6940 lt!229958)) (currentBit!6379 (_1!6940 lt!229958))) (bitIndex!0 (size!3011 (buf!3476 (_1!6940 lt!229950))) (currentByte!6384 (_1!6940 lt!229950)) (currentBit!6379 (_1!6940 lt!229950)))))))

(declare-fun lt!229960 () Unit!9310)

(declare-fun lt!229962 () BitStream!5280)

(declare-fun readBytePrefixLemma!0 (BitStream!5280 BitStream!5280) Unit!9310)

(assert (=> b!147749 (= lt!229960 (readBytePrefixLemma!0 lt!229962 (_2!6937 lt!229954)))))

(assert (=> b!147749 (= lt!229950 (readBytePure!0 (BitStream!5281 (buf!3476 (_2!6937 lt!229954)) (currentByte!6384 thiss!1634) (currentBit!6379 thiss!1634))))))

(assert (=> b!147749 (= lt!229958 (readBytePure!0 lt!229962))))

(assert (=> b!147749 (= lt!229962 (BitStream!5281 (buf!3476 (_2!6937 lt!229959)) (currentByte!6384 thiss!1634) (currentBit!6379 thiss!1634)))))

(assert (=> b!147749 e!98545))

(declare-fun res!123642 () Bool)

(assert (=> b!147749 (=> (not res!123642) (not e!98545))))

(assert (=> b!147749 (= res!123642 (isPrefixOf!0 thiss!1634 (_2!6937 lt!229954)))))

(declare-fun lt!229965 () Unit!9310)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5280 BitStream!5280 BitStream!5280) Unit!9310)

(assert (=> b!147749 (= lt!229965 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6937 lt!229959) (_2!6937 lt!229954)))))

(assert (=> b!147749 e!98547))

(declare-fun res!123636 () Bool)

(assert (=> b!147749 (=> (not res!123636) (not e!98547))))

(assert (=> b!147749 (= res!123636 (= (size!3011 (buf!3476 (_2!6937 lt!229959))) (size!3011 (buf!3476 (_2!6937 lt!229954)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5280 array!6655 (_ BitVec 32) (_ BitVec 32)) tuple2!13156)

(assert (=> b!147749 (= lt!229954 (appendByteArrayLoop!0 (_2!6937 lt!229959) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147749 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3011 (buf!3476 (_2!6937 lt!229959)))) ((_ sign_extend 32) (currentByte!6384 (_2!6937 lt!229959))) ((_ sign_extend 32) (currentBit!6379 (_2!6937 lt!229959))) lt!229948)))

(assert (=> b!147749 (= lt!229948 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!229964 () Unit!9310)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5280 BitStream!5280 (_ BitVec 64) (_ BitVec 32)) Unit!9310)

(assert (=> b!147749 (= lt!229964 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6937 lt!229959) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!147749 e!98546))

(declare-fun res!123639 () Bool)

(assert (=> b!147749 (=> (not res!123639) (not e!98546))))

(assert (=> b!147749 (= res!123639 (= (size!3011 (buf!3476 thiss!1634)) (size!3011 (buf!3476 (_2!6937 lt!229959)))))))

(declare-fun appendByte!0 (BitStream!5280 (_ BitVec 8)) tuple2!13156)

(assert (=> b!147749 (= lt!229959 (appendByte!0 thiss!1634 (select (arr!3780 arr!237) from!447)))))

(declare-fun b!147750 () Bool)

(declare-fun res!123643 () Bool)

(assert (=> b!147750 (=> (not res!123643) (not e!98546))))

(assert (=> b!147750 (= res!123643 (isPrefixOf!0 thiss!1634 (_2!6937 lt!229959)))))

(assert (= (and start!28538 res!123641) b!147740))

(assert (= (and b!147740 res!123640) b!147743))

(assert (= (and b!147743 res!123635) b!147742))

(assert (= (and b!147742 res!123645) b!147749))

(assert (= (and b!147749 res!123639) b!147746))

(assert (= (and b!147746 res!123634) b!147750))

(assert (= (and b!147750 res!123643) b!147748))

(assert (= (and b!147749 res!123636) b!147741))

(assert (= (and b!147741 res!123646) b!147736))

(assert (= (and b!147736 res!123647) b!147737))

(assert (= (and b!147737 (not res!123638)) b!147738))

(assert (= (and b!147749 res!123642) b!147745))

(assert (= (and b!147749 res!123637) b!147744))

(assert (= (and b!147749 (not res!123644)) b!147747))

(assert (= start!28538 b!147739))

(declare-fun m!228827 () Bool)

(assert (=> b!147750 m!228827))

(declare-fun m!228829 () Bool)

(assert (=> b!147746 m!228829))

(declare-fun m!228831 () Bool)

(assert (=> b!147746 m!228831))

(declare-fun m!228833 () Bool)

(assert (=> b!147737 m!228833))

(declare-fun m!228835 () Bool)

(assert (=> b!147737 m!228835))

(declare-fun m!228837 () Bool)

(assert (=> b!147737 m!228837))

(declare-fun m!228839 () Bool)

(assert (=> b!147737 m!228839))

(declare-fun m!228841 () Bool)

(assert (=> b!147741 m!228841))

(assert (=> b!147741 m!228829))

(declare-fun m!228843 () Bool)

(assert (=> b!147742 m!228843))

(declare-fun m!228845 () Bool)

(assert (=> b!147738 m!228845))

(declare-fun m!228847 () Bool)

(assert (=> b!147740 m!228847))

(declare-fun m!228849 () Bool)

(assert (=> b!147739 m!228849))

(declare-fun m!228851 () Bool)

(assert (=> b!147749 m!228851))

(declare-fun m!228853 () Bool)

(assert (=> b!147749 m!228853))

(declare-fun m!228855 () Bool)

(assert (=> b!147749 m!228855))

(declare-fun m!228857 () Bool)

(assert (=> b!147749 m!228857))

(declare-fun m!228859 () Bool)

(assert (=> b!147749 m!228859))

(assert (=> b!147749 m!228839))

(declare-fun m!228861 () Bool)

(assert (=> b!147749 m!228861))

(declare-fun m!228863 () Bool)

(assert (=> b!147749 m!228863))

(declare-fun m!228865 () Bool)

(assert (=> b!147749 m!228865))

(declare-fun m!228867 () Bool)

(assert (=> b!147749 m!228867))

(declare-fun m!228869 () Bool)

(assert (=> b!147749 m!228869))

(declare-fun m!228871 () Bool)

(assert (=> b!147749 m!228871))

(declare-fun m!228873 () Bool)

(assert (=> b!147749 m!228873))

(declare-fun m!228875 () Bool)

(assert (=> b!147749 m!228875))

(declare-fun m!228877 () Bool)

(assert (=> b!147749 m!228877))

(declare-fun m!228879 () Bool)

(assert (=> b!147749 m!228879))

(declare-fun m!228881 () Bool)

(assert (=> b!147749 m!228881))

(declare-fun m!228883 () Bool)

(assert (=> b!147749 m!228883))

(declare-fun m!228885 () Bool)

(assert (=> b!147749 m!228885))

(declare-fun m!228887 () Bool)

(assert (=> b!147749 m!228887))

(declare-fun m!228889 () Bool)

(assert (=> b!147749 m!228889))

(declare-fun m!228891 () Bool)

(assert (=> b!147749 m!228891))

(assert (=> b!147749 m!228891))

(declare-fun m!228893 () Bool)

(assert (=> b!147749 m!228893))

(declare-fun m!228895 () Bool)

(assert (=> b!147749 m!228895))

(declare-fun m!228897 () Bool)

(assert (=> b!147749 m!228897))

(assert (=> b!147749 m!228869))

(declare-fun m!228899 () Bool)

(assert (=> b!147749 m!228899))

(declare-fun m!228901 () Bool)

(assert (=> b!147749 m!228901))

(declare-fun m!228903 () Bool)

(assert (=> start!28538 m!228903))

(declare-fun m!228905 () Bool)

(assert (=> start!28538 m!228905))

(declare-fun m!228907 () Bool)

(assert (=> b!147736 m!228907))

(declare-fun m!228909 () Bool)

(assert (=> b!147747 m!228909))

(declare-fun m!228911 () Bool)

(assert (=> b!147747 m!228911))

(assert (=> b!147748 m!228869))

(declare-fun m!228913 () Bool)

(assert (=> b!147748 m!228913))

(declare-fun m!228915 () Bool)

(assert (=> b!147748 m!228915))

(declare-fun m!228917 () Bool)

(assert (=> b!147745 m!228917))

(check-sat (not b!147739) (not b!147740) (not b!147749) (not b!147741) (not b!147748) (not b!147750) (not b!147737) (not b!147746) (not b!147742) (not b!147736) (not b!147747) (not start!28538) (not b!147745) (not b!147738))
(check-sat)
