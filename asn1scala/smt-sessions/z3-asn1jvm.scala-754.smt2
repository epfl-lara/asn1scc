; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21612 () Bool)

(assert start!21612)

(declare-fun b!109086 () Bool)

(declare-fun e!71465 () Bool)

(declare-datatypes ((array!4975 0))(
  ( (array!4976 (arr!2857 (Array (_ BitVec 32) (_ BitVec 8))) (size!2264 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4002 0))(
  ( (BitStream!4003 (buf!2655 array!4975) (currentByte!5191 (_ BitVec 32)) (currentBit!5186 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9044 0))(
  ( (tuple2!9045 (_1!4779 BitStream!4002) (_2!4779 Bool)) )
))
(declare-fun lt!164755 () tuple2!9044)

(declare-fun lt!164740 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109086 (= e!71465 (= (bitIndex!0 (size!2264 (buf!2655 (_1!4779 lt!164755))) (currentByte!5191 (_1!4779 lt!164755)) (currentBit!5186 (_1!4779 lt!164755))) lt!164740))))

(declare-fun b!109087 () Bool)

(declare-fun res!89986 () Bool)

(declare-fun e!71455 () Bool)

(assert (=> b!109087 (=> (not res!89986) (not e!71455))))

(declare-fun thiss!1305 () BitStream!4002)

(declare-datatypes ((Unit!6669 0))(
  ( (Unit!6670) )
))
(declare-datatypes ((tuple2!9046 0))(
  ( (tuple2!9047 (_1!4780 Unit!6669) (_2!4780 BitStream!4002)) )
))
(declare-fun lt!164735 () tuple2!9046)

(declare-fun isPrefixOf!0 (BitStream!4002 BitStream!4002) Bool)

(assert (=> b!109087 (= res!89986 (isPrefixOf!0 thiss!1305 (_2!4780 lt!164735)))))

(declare-fun res!89985 () Bool)

(declare-fun e!71460 () Bool)

(assert (=> start!21612 (=> (not res!89985) (not e!71460))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21612 (= res!89985 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21612 e!71460))

(assert (=> start!21612 true))

(declare-fun e!71456 () Bool)

(declare-fun inv!12 (BitStream!4002) Bool)

(assert (=> start!21612 (and (inv!12 thiss!1305) e!71456)))

(declare-fun b!109088 () Bool)

(declare-fun e!71463 () Bool)

(declare-fun lt!164734 () tuple2!9044)

(declare-fun lt!164749 () tuple2!9044)

(assert (=> b!109088 (= e!71463 (= (_2!4779 lt!164734) (_2!4779 lt!164749)))))

(declare-fun b!109089 () Bool)

(declare-fun e!71459 () Bool)

(assert (=> b!109089 (= e!71459 e!71455)))

(declare-fun res!89980 () Bool)

(assert (=> b!109089 (=> (not res!89980) (not e!71455))))

(declare-fun lt!164742 () (_ BitVec 64))

(assert (=> b!109089 (= res!89980 (= lt!164740 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164742)))))

(assert (=> b!109089 (= lt!164740 (bitIndex!0 (size!2264 (buf!2655 (_2!4780 lt!164735))) (currentByte!5191 (_2!4780 lt!164735)) (currentBit!5186 (_2!4780 lt!164735))))))

(assert (=> b!109089 (= lt!164742 (bitIndex!0 (size!2264 (buf!2655 thiss!1305)) (currentByte!5191 thiss!1305) (currentBit!5186 thiss!1305)))))

(declare-fun b!109090 () Bool)

(declare-fun res!89988 () Bool)

(declare-fun e!71464 () Bool)

(assert (=> b!109090 (=> (not res!89988) (not e!71464))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!109090 (= res!89988 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!109091 () Bool)

(assert (=> b!109091 (= e!71460 e!71464)))

(declare-fun res!89982 () Bool)

(assert (=> b!109091 (=> (not res!89982) (not e!71464))))

(declare-fun lt!164743 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!109091 (= res!89982 (validate_offset_bits!1 ((_ sign_extend 32) (size!2264 (buf!2655 thiss!1305))) ((_ sign_extend 32) (currentByte!5191 thiss!1305)) ((_ sign_extend 32) (currentBit!5186 thiss!1305)) lt!164743))))

(assert (=> b!109091 (= lt!164743 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!109092 () Bool)

(declare-fun res!89990 () Bool)

(declare-fun e!71457 () Bool)

(assert (=> b!109092 (=> (not res!89990) (not e!71457))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!109092 (= res!89990 (invariant!0 (currentBit!5186 thiss!1305) (currentByte!5191 thiss!1305) (size!2264 (buf!2655 (_2!4780 lt!164735)))))))

(declare-fun b!109093 () Bool)

(declare-fun e!71461 () Bool)

(assert (=> b!109093 (= e!71461 true)))

(declare-fun e!71458 () Bool)

(assert (=> b!109093 e!71458))

(declare-fun res!89989 () Bool)

(assert (=> b!109093 (=> (not res!89989) (not e!71458))))

(declare-fun lt!164738 () (_ BitVec 64))

(declare-datatypes ((tuple2!9048 0))(
  ( (tuple2!9049 (_1!4781 BitStream!4002) (_2!4781 BitStream!4002)) )
))
(declare-fun lt!164751 () tuple2!9048)

(declare-fun lt!164744 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4002 (_ BitVec 64)) BitStream!4002)

(assert (=> b!109093 (= res!89989 (= (_1!4781 lt!164751) (withMovedBitIndex!0 (_2!4781 lt!164751) (bvsub lt!164738 lt!164744))))))

(assert (=> b!109093 (= lt!164738 (bitIndex!0 (size!2264 (buf!2655 (_2!4780 lt!164735))) (currentByte!5191 (_2!4780 lt!164735)) (currentBit!5186 (_2!4780 lt!164735))))))

(declare-fun lt!164759 () tuple2!9048)

(declare-fun lt!164732 () (_ BitVec 64))

(assert (=> b!109093 (= (_1!4781 lt!164759) (withMovedBitIndex!0 (_2!4781 lt!164759) (bvsub lt!164732 lt!164744)))))

(declare-fun lt!164746 () tuple2!9046)

(assert (=> b!109093 (= lt!164744 (bitIndex!0 (size!2264 (buf!2655 (_2!4780 lt!164746))) (currentByte!5191 (_2!4780 lt!164746)) (currentBit!5186 (_2!4780 lt!164746))))))

(assert (=> b!109093 (= lt!164732 (bitIndex!0 (size!2264 (buf!2655 thiss!1305)) (currentByte!5191 thiss!1305) (currentBit!5186 thiss!1305)))))

(declare-datatypes ((tuple2!9050 0))(
  ( (tuple2!9051 (_1!4782 BitStream!4002) (_2!4782 (_ BitVec 64))) )
))
(declare-fun lt!164753 () tuple2!9050)

(declare-fun lt!164758 () tuple2!9050)

(assert (=> b!109093 (and (= (_2!4782 lt!164753) (_2!4782 lt!164758)) (= (_1!4782 lt!164753) (_1!4782 lt!164758)))))

(declare-fun lt!164747 () Unit!6669)

(declare-fun lt!164736 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6669)

(assert (=> b!109093 (= lt!164747 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4781 lt!164759) nBits!396 i!615 lt!164736))))

(declare-fun lt!164731 () (_ BitVec 64))

(declare-fun lt!164737 () BitStream!4002)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9050)

(assert (=> b!109093 (= lt!164758 (readNLeastSignificantBitsLoopPure!0 lt!164737 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164731))))

(assert (=> b!109093 (= lt!164737 (withMovedBitIndex!0 (_1!4781 lt!164759) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!109094 () Bool)

(declare-fun lt!164757 () tuple2!9050)

(assert (=> b!109094 (= e!71458 (and (= lt!164732 (bvsub lt!164738 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4781 lt!164751) lt!164737)) (and (= (_2!4782 lt!164753) (_2!4782 lt!164757)) (= (_1!4782 lt!164753) (_2!4781 lt!164759))))))))

(declare-fun b!109095 () Bool)

(declare-fun res!89984 () Bool)

(assert (=> b!109095 (=> (not res!89984) (not e!71464))))

(assert (=> b!109095 (= res!89984 (bvslt i!615 nBits!396))))

(declare-fun b!109096 () Bool)

(assert (=> b!109096 (= e!71457 (invariant!0 (currentBit!5186 thiss!1305) (currentByte!5191 thiss!1305) (size!2264 (buf!2655 (_2!4780 lt!164746)))))))

(declare-fun b!109097 () Bool)

(declare-fun array_inv!2066 (array!4975) Bool)

(assert (=> b!109097 (= e!71456 (array_inv!2066 (buf!2655 thiss!1305)))))

(declare-fun b!109098 () Bool)

(assert (=> b!109098 (= e!71464 (not e!71461))))

(declare-fun res!89983 () Bool)

(assert (=> b!109098 (=> res!89983 e!71461)))

(assert (=> b!109098 (= res!89983 (not (= (_1!4782 lt!164757) (_2!4781 lt!164751))))))

(assert (=> b!109098 (= lt!164757 (readNLeastSignificantBitsLoopPure!0 (_1!4781 lt!164751) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164731))))

(declare-fun lt!164754 () (_ BitVec 64))

(assert (=> b!109098 (validate_offset_bits!1 ((_ sign_extend 32) (size!2264 (buf!2655 (_2!4780 lt!164746)))) ((_ sign_extend 32) (currentByte!5191 (_2!4780 lt!164735))) ((_ sign_extend 32) (currentBit!5186 (_2!4780 lt!164735))) lt!164754)))

(declare-fun lt!164750 () Unit!6669)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4002 array!4975 (_ BitVec 64)) Unit!6669)

(assert (=> b!109098 (= lt!164750 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4780 lt!164735) (buf!2655 (_2!4780 lt!164746)) lt!164754))))

(assert (=> b!109098 (= lt!164754 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164733 () tuple2!9044)

(declare-fun lt!164752 () (_ BitVec 64))

(assert (=> b!109098 (= lt!164731 (bvor lt!164736 (ite (_2!4779 lt!164733) lt!164752 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109098 (= lt!164753 (readNLeastSignificantBitsLoopPure!0 (_1!4781 lt!164759) nBits!396 i!615 lt!164736))))

(assert (=> b!109098 (validate_offset_bits!1 ((_ sign_extend 32) (size!2264 (buf!2655 (_2!4780 lt!164746)))) ((_ sign_extend 32) (currentByte!5191 thiss!1305)) ((_ sign_extend 32) (currentBit!5186 thiss!1305)) lt!164743)))

(declare-fun lt!164739 () Unit!6669)

(assert (=> b!109098 (= lt!164739 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2655 (_2!4780 lt!164746)) lt!164743))))

(assert (=> b!109098 (= lt!164736 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!164745 () Bool)

(assert (=> b!109098 (= (_2!4779 lt!164733) lt!164745)))

(declare-fun readBitPure!0 (BitStream!4002) tuple2!9044)

(assert (=> b!109098 (= lt!164733 (readBitPure!0 (_1!4781 lt!164759)))))

(declare-fun reader!0 (BitStream!4002 BitStream!4002) tuple2!9048)

(assert (=> b!109098 (= lt!164751 (reader!0 (_2!4780 lt!164735) (_2!4780 lt!164746)))))

(assert (=> b!109098 (= lt!164759 (reader!0 thiss!1305 (_2!4780 lt!164746)))))

(assert (=> b!109098 e!71463))

(declare-fun res!89981 () Bool)

(assert (=> b!109098 (=> (not res!89981) (not e!71463))))

(assert (=> b!109098 (= res!89981 (= (bitIndex!0 (size!2264 (buf!2655 (_1!4779 lt!164734))) (currentByte!5191 (_1!4779 lt!164734)) (currentBit!5186 (_1!4779 lt!164734))) (bitIndex!0 (size!2264 (buf!2655 (_1!4779 lt!164749))) (currentByte!5191 (_1!4779 lt!164749)) (currentBit!5186 (_1!4779 lt!164749)))))))

(declare-fun lt!164748 () Unit!6669)

(declare-fun lt!164741 () BitStream!4002)

(declare-fun readBitPrefixLemma!0 (BitStream!4002 BitStream!4002) Unit!6669)

(assert (=> b!109098 (= lt!164748 (readBitPrefixLemma!0 lt!164741 (_2!4780 lt!164746)))))

(assert (=> b!109098 (= lt!164749 (readBitPure!0 (BitStream!4003 (buf!2655 (_2!4780 lt!164746)) (currentByte!5191 thiss!1305) (currentBit!5186 thiss!1305))))))

(assert (=> b!109098 (= lt!164734 (readBitPure!0 lt!164741))))

(assert (=> b!109098 (= lt!164741 (BitStream!4003 (buf!2655 (_2!4780 lt!164735)) (currentByte!5191 thiss!1305) (currentBit!5186 thiss!1305)))))

(assert (=> b!109098 e!71457))

(declare-fun res!89987 () Bool)

(assert (=> b!109098 (=> (not res!89987) (not e!71457))))

(assert (=> b!109098 (= res!89987 (isPrefixOf!0 thiss!1305 (_2!4780 lt!164746)))))

(declare-fun lt!164756 () Unit!6669)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4002 BitStream!4002 BitStream!4002) Unit!6669)

(assert (=> b!109098 (= lt!164756 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4780 lt!164735) (_2!4780 lt!164746)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4002 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9046)

(assert (=> b!109098 (= lt!164746 (appendNLeastSignificantBitsLoop!0 (_2!4780 lt!164735) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!109098 e!71459))

(declare-fun res!89991 () Bool)

(assert (=> b!109098 (=> (not res!89991) (not e!71459))))

(assert (=> b!109098 (= res!89991 (= (size!2264 (buf!2655 thiss!1305)) (size!2264 (buf!2655 (_2!4780 lt!164735)))))))

(declare-fun appendBit!0 (BitStream!4002 Bool) tuple2!9046)

(assert (=> b!109098 (= lt!164735 (appendBit!0 thiss!1305 lt!164745))))

(assert (=> b!109098 (= lt!164745 (not (= (bvand v!199 lt!164752) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!109098 (= lt!164752 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!109099 () Bool)

(assert (=> b!109099 (= e!71455 e!71465)))

(declare-fun res!89992 () Bool)

(assert (=> b!109099 (=> (not res!89992) (not e!71465))))

(assert (=> b!109099 (= res!89992 (and (= (_2!4779 lt!164755) lt!164745) (= (_1!4779 lt!164755) (_2!4780 lt!164735))))))

(declare-fun readerFrom!0 (BitStream!4002 (_ BitVec 32) (_ BitVec 32)) BitStream!4002)

(assert (=> b!109099 (= lt!164755 (readBitPure!0 (readerFrom!0 (_2!4780 lt!164735) (currentBit!5186 thiss!1305) (currentByte!5191 thiss!1305))))))

(assert (= (and start!21612 res!89985) b!109091))

(assert (= (and b!109091 res!89982) b!109090))

(assert (= (and b!109090 res!89988) b!109095))

(assert (= (and b!109095 res!89984) b!109098))

(assert (= (and b!109098 res!89991) b!109089))

(assert (= (and b!109089 res!89980) b!109087))

(assert (= (and b!109087 res!89986) b!109099))

(assert (= (and b!109099 res!89992) b!109086))

(assert (= (and b!109098 res!89987) b!109092))

(assert (= (and b!109092 res!89990) b!109096))

(assert (= (and b!109098 res!89981) b!109088))

(assert (= (and b!109098 (not res!89983)) b!109093))

(assert (= (and b!109093 res!89989) b!109094))

(assert (= start!21612 b!109097))

(declare-fun m!161839 () Bool)

(assert (=> b!109098 m!161839))

(declare-fun m!161841 () Bool)

(assert (=> b!109098 m!161841))

(declare-fun m!161843 () Bool)

(assert (=> b!109098 m!161843))

(declare-fun m!161845 () Bool)

(assert (=> b!109098 m!161845))

(declare-fun m!161847 () Bool)

(assert (=> b!109098 m!161847))

(declare-fun m!161849 () Bool)

(assert (=> b!109098 m!161849))

(declare-fun m!161851 () Bool)

(assert (=> b!109098 m!161851))

(declare-fun m!161853 () Bool)

(assert (=> b!109098 m!161853))

(declare-fun m!161855 () Bool)

(assert (=> b!109098 m!161855))

(declare-fun m!161857 () Bool)

(assert (=> b!109098 m!161857))

(declare-fun m!161859 () Bool)

(assert (=> b!109098 m!161859))

(declare-fun m!161861 () Bool)

(assert (=> b!109098 m!161861))

(declare-fun m!161863 () Bool)

(assert (=> b!109098 m!161863))

(declare-fun m!161865 () Bool)

(assert (=> b!109098 m!161865))

(declare-fun m!161867 () Bool)

(assert (=> b!109098 m!161867))

(declare-fun m!161869 () Bool)

(assert (=> b!109098 m!161869))

(declare-fun m!161871 () Bool)

(assert (=> b!109098 m!161871))

(declare-fun m!161873 () Bool)

(assert (=> b!109098 m!161873))

(declare-fun m!161875 () Bool)

(assert (=> b!109098 m!161875))

(declare-fun m!161877 () Bool)

(assert (=> start!21612 m!161877))

(declare-fun m!161879 () Bool)

(assert (=> b!109091 m!161879))

(declare-fun m!161881 () Bool)

(assert (=> b!109093 m!161881))

(declare-fun m!161883 () Bool)

(assert (=> b!109093 m!161883))

(declare-fun m!161885 () Bool)

(assert (=> b!109093 m!161885))

(declare-fun m!161887 () Bool)

(assert (=> b!109093 m!161887))

(declare-fun m!161889 () Bool)

(assert (=> b!109093 m!161889))

(declare-fun m!161891 () Bool)

(assert (=> b!109093 m!161891))

(declare-fun m!161893 () Bool)

(assert (=> b!109093 m!161893))

(declare-fun m!161895 () Bool)

(assert (=> b!109093 m!161895))

(declare-fun m!161897 () Bool)

(assert (=> b!109096 m!161897))

(declare-fun m!161899 () Bool)

(assert (=> b!109092 m!161899))

(declare-fun m!161901 () Bool)

(assert (=> b!109090 m!161901))

(declare-fun m!161903 () Bool)

(assert (=> b!109099 m!161903))

(assert (=> b!109099 m!161903))

(declare-fun m!161905 () Bool)

(assert (=> b!109099 m!161905))

(declare-fun m!161907 () Bool)

(assert (=> b!109097 m!161907))

(assert (=> b!109089 m!161891))

(assert (=> b!109089 m!161895))

(declare-fun m!161909 () Bool)

(assert (=> b!109086 m!161909))

(declare-fun m!161911 () Bool)

(assert (=> b!109087 m!161911))

(check-sat (not b!109089) (not b!109099) (not b!109096) (not b!109092) (not b!109093) (not b!109090) (not b!109097) (not b!109091) (not start!21612) (not b!109098) (not b!109086) (not b!109087))
