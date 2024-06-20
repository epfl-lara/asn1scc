; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28004 () Bool)

(assert start!28004)

(declare-datatypes ((array!6596 0))(
  ( (array!6597 (arr!3719 (Array (_ BitVec 32) (_ BitVec 8))) (size!2986 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5230 0))(
  ( (BitStream!5231 (buf!3425 array!6596) (currentByte!6315 (_ BitVec 32)) (currentBit!6310 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12930 0))(
  ( (tuple2!12931 (_1!6811 BitStream!5230) (_2!6811 BitStream!5230)) )
))
(declare-fun lt!224568 () tuple2!12930)

(declare-fun e!96572 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12932 0))(
  ( (tuple2!12933 (_1!6812 BitStream!5230) (_2!6812 (_ BitVec 8))) )
))
(declare-fun lt!224560 () tuple2!12932)

(declare-fun b!144890 () Bool)

(declare-fun arr!237 () array!6596)

(assert (=> b!144890 (= e!96572 (and (= (_2!6812 lt!224560) (select (arr!3719 arr!237) from!447)) (= (_1!6812 lt!224560) (_2!6811 lt!224568))))))

(declare-fun readBytePure!0 (BitStream!5230) tuple2!12932)

(assert (=> b!144890 (= lt!224560 (readBytePure!0 (_1!6811 lt!224568)))))

(declare-fun thiss!1634 () BitStream!5230)

(declare-datatypes ((Unit!9045 0))(
  ( (Unit!9046) )
))
(declare-datatypes ((tuple2!12934 0))(
  ( (tuple2!12935 (_1!6813 Unit!9045) (_2!6813 BitStream!5230)) )
))
(declare-fun lt!224569 () tuple2!12934)

(declare-fun reader!0 (BitStream!5230 BitStream!5230) tuple2!12930)

(assert (=> b!144890 (= lt!224568 (reader!0 thiss!1634 (_2!6813 lt!224569)))))

(declare-fun b!144891 () Bool)

(declare-fun e!96573 () Bool)

(declare-fun lt!224572 () tuple2!12932)

(declare-fun lt!224561 () tuple2!12932)

(assert (=> b!144891 (= e!96573 (= (_2!6812 lt!224572) (_2!6812 lt!224561)))))

(declare-fun b!144892 () Bool)

(declare-fun e!96569 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144892 (= e!96569 (invariant!0 (currentBit!6310 thiss!1634) (currentByte!6315 thiss!1634) (size!2986 (buf!3425 (_2!6813 lt!224569)))))))

(declare-fun res!121106 () Bool)

(declare-fun e!96570 () Bool)

(assert (=> start!28004 (=> (not res!121106) (not e!96570))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!28004 (= res!121106 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2986 arr!237))))))

(assert (=> start!28004 e!96570))

(assert (=> start!28004 true))

(declare-fun array_inv!2775 (array!6596) Bool)

(assert (=> start!28004 (array_inv!2775 arr!237)))

(declare-fun e!96575 () Bool)

(declare-fun inv!12 (BitStream!5230) Bool)

(assert (=> start!28004 (and (inv!12 thiss!1634) e!96575)))

(declare-fun b!144893 () Bool)

(declare-fun e!96576 () Bool)

(declare-fun e!96579 () Bool)

(assert (=> b!144893 (= e!96576 e!96579)))

(declare-fun res!121102 () Bool)

(assert (=> b!144893 (=> (not res!121102) (not e!96579))))

(declare-fun lt!224574 () tuple2!12934)

(declare-fun lt!224562 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144893 (= res!121102 (= (bitIndex!0 (size!2986 (buf!3425 (_2!6813 lt!224574))) (currentByte!6315 (_2!6813 lt!224574)) (currentBit!6310 (_2!6813 lt!224574))) (bvadd (bitIndex!0 (size!2986 (buf!3425 (_2!6813 lt!224569))) (currentByte!6315 (_2!6813 lt!224569)) (currentBit!6310 (_2!6813 lt!224569))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224562))))))

(assert (=> b!144893 (= lt!224562 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144894 () Bool)

(assert (=> b!144894 (= e!96570 (not true))))

(declare-fun e!96571 () Bool)

(assert (=> b!144894 e!96571))

(declare-fun res!121109 () Bool)

(assert (=> b!144894 (=> (not res!121109) (not e!96571))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144894 (= res!121109 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2986 (buf!3425 (_2!6813 lt!224574)))) ((_ sign_extend 32) (currentByte!6315 thiss!1634)) ((_ sign_extend 32) (currentBit!6310 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224567 () Unit!9045)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5230 array!6596 (_ BitVec 32)) Unit!9045)

(assert (=> b!144894 (= lt!224567 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3425 (_2!6813 lt!224574)) (bvsub to!404 from!447)))))

(declare-fun lt!224564 () tuple2!12930)

(assert (=> b!144894 (= (_2!6812 (readBytePure!0 (_1!6811 lt!224564))) (select (arr!3719 arr!237) from!447))))

(declare-fun lt!224565 () tuple2!12930)

(assert (=> b!144894 (= lt!224565 (reader!0 (_2!6813 lt!224569) (_2!6813 lt!224574)))))

(assert (=> b!144894 (= lt!224564 (reader!0 thiss!1634 (_2!6813 lt!224574)))))

(assert (=> b!144894 e!96573))

(declare-fun res!121113 () Bool)

(assert (=> b!144894 (=> (not res!121113) (not e!96573))))

(assert (=> b!144894 (= res!121113 (= (bitIndex!0 (size!2986 (buf!3425 (_1!6812 lt!224572))) (currentByte!6315 (_1!6812 lt!224572)) (currentBit!6310 (_1!6812 lt!224572))) (bitIndex!0 (size!2986 (buf!3425 (_1!6812 lt!224561))) (currentByte!6315 (_1!6812 lt!224561)) (currentBit!6310 (_1!6812 lt!224561)))))))

(declare-fun lt!224563 () Unit!9045)

(declare-fun lt!224566 () BitStream!5230)

(declare-fun readBytePrefixLemma!0 (BitStream!5230 BitStream!5230) Unit!9045)

(assert (=> b!144894 (= lt!224563 (readBytePrefixLemma!0 lt!224566 (_2!6813 lt!224574)))))

(assert (=> b!144894 (= lt!224561 (readBytePure!0 (BitStream!5231 (buf!3425 (_2!6813 lt!224574)) (currentByte!6315 thiss!1634) (currentBit!6310 thiss!1634))))))

(assert (=> b!144894 (= lt!224572 (readBytePure!0 lt!224566))))

(assert (=> b!144894 (= lt!224566 (BitStream!5231 (buf!3425 (_2!6813 lt!224569)) (currentByte!6315 thiss!1634) (currentBit!6310 thiss!1634)))))

(assert (=> b!144894 e!96569))

(declare-fun res!121105 () Bool)

(assert (=> b!144894 (=> (not res!121105) (not e!96569))))

(declare-fun isPrefixOf!0 (BitStream!5230 BitStream!5230) Bool)

(assert (=> b!144894 (= res!121105 (isPrefixOf!0 thiss!1634 (_2!6813 lt!224574)))))

(declare-fun lt!224571 () Unit!9045)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5230 BitStream!5230 BitStream!5230) Unit!9045)

(assert (=> b!144894 (= lt!224571 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6813 lt!224569) (_2!6813 lt!224574)))))

(assert (=> b!144894 e!96576))

(declare-fun res!121103 () Bool)

(assert (=> b!144894 (=> (not res!121103) (not e!96576))))

(assert (=> b!144894 (= res!121103 (= (size!2986 (buf!3425 (_2!6813 lt!224569))) (size!2986 (buf!3425 (_2!6813 lt!224574)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5230 array!6596 (_ BitVec 32) (_ BitVec 32)) tuple2!12934)

(assert (=> b!144894 (= lt!224574 (appendByteArrayLoop!0 (_2!6813 lt!224569) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144894 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2986 (buf!3425 (_2!6813 lt!224569)))) ((_ sign_extend 32) (currentByte!6315 (_2!6813 lt!224569))) ((_ sign_extend 32) (currentBit!6310 (_2!6813 lt!224569))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224559 () Unit!9045)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5230 BitStream!5230 (_ BitVec 64) (_ BitVec 32)) Unit!9045)

(assert (=> b!144894 (= lt!224559 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6813 lt!224569) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144894 e!96572))

(declare-fun res!121108 () Bool)

(assert (=> b!144894 (=> (not res!121108) (not e!96572))))

(assert (=> b!144894 (= res!121108 (= (size!2986 (buf!3425 thiss!1634)) (size!2986 (buf!3425 (_2!6813 lt!224569)))))))

(declare-fun appendByte!0 (BitStream!5230 (_ BitVec 8)) tuple2!12934)

(assert (=> b!144894 (= lt!224569 (appendByte!0 thiss!1634 (select (arr!3719 arr!237) from!447)))))

(declare-fun b!144895 () Bool)

(declare-fun res!121110 () Bool)

(assert (=> b!144895 (=> (not res!121110) (not e!96572))))

(assert (=> b!144895 (= res!121110 (= (bitIndex!0 (size!2986 (buf!3425 (_2!6813 lt!224569))) (currentByte!6315 (_2!6813 lt!224569)) (currentBit!6310 (_2!6813 lt!224569))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2986 (buf!3425 thiss!1634)) (currentByte!6315 thiss!1634) (currentBit!6310 thiss!1634)))))))

(declare-fun b!144896 () Bool)

(declare-fun e!96577 () Bool)

(assert (=> b!144896 (= e!96579 (not e!96577))))

(declare-fun res!121114 () Bool)

(assert (=> b!144896 (=> res!121114 e!96577)))

(declare-fun lt!224558 () tuple2!12930)

(declare-datatypes ((tuple2!12936 0))(
  ( (tuple2!12937 (_1!6814 BitStream!5230) (_2!6814 array!6596)) )
))
(declare-fun lt!224570 () tuple2!12936)

(assert (=> b!144896 (= res!121114 (or (not (= (size!2986 (_2!6814 lt!224570)) (size!2986 arr!237))) (not (= (_1!6814 lt!224570) (_2!6811 lt!224558)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5230 array!6596 (_ BitVec 32) (_ BitVec 32)) tuple2!12936)

(assert (=> b!144896 (= lt!224570 (readByteArrayLoopPure!0 (_1!6811 lt!224558) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144896 (validate_offset_bits!1 ((_ sign_extend 32) (size!2986 (buf!3425 (_2!6813 lt!224574)))) ((_ sign_extend 32) (currentByte!6315 (_2!6813 lt!224569))) ((_ sign_extend 32) (currentBit!6310 (_2!6813 lt!224569))) lt!224562)))

(declare-fun lt!224573 () Unit!9045)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5230 array!6596 (_ BitVec 64)) Unit!9045)

(assert (=> b!144896 (= lt!224573 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6813 lt!224569) (buf!3425 (_2!6813 lt!224574)) lt!224562))))

(assert (=> b!144896 (= lt!224558 (reader!0 (_2!6813 lt!224569) (_2!6813 lt!224574)))))

(declare-fun b!144897 () Bool)

(declare-fun res!121107 () Bool)

(assert (=> b!144897 (=> (not res!121107) (not e!96570))))

(assert (=> b!144897 (= res!121107 (bvslt from!447 to!404))))

(declare-fun b!144898 () Bool)

(declare-fun res!121111 () Bool)

(assert (=> b!144898 (=> (not res!121111) (not e!96570))))

(assert (=> b!144898 (= res!121111 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2986 (buf!3425 thiss!1634))) ((_ sign_extend 32) (currentByte!6315 thiss!1634)) ((_ sign_extend 32) (currentBit!6310 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144899 () Bool)

(assert (=> b!144899 (= e!96575 (array_inv!2775 (buf!3425 thiss!1634)))))

(declare-fun b!144900 () Bool)

(assert (=> b!144900 (= e!96571 (= (_1!6814 (readByteArrayLoopPure!0 (_1!6811 lt!224564) arr!237 from!447 to!404)) (_2!6811 lt!224564)))))

(declare-fun b!144901 () Bool)

(declare-fun res!121104 () Bool)

(assert (=> b!144901 (=> (not res!121104) (not e!96579))))

(assert (=> b!144901 (= res!121104 (isPrefixOf!0 (_2!6813 lt!224569) (_2!6813 lt!224574)))))

(declare-fun b!144902 () Bool)

(declare-fun res!121101 () Bool)

(assert (=> b!144902 (=> (not res!121101) (not e!96570))))

(assert (=> b!144902 (= res!121101 (invariant!0 (currentBit!6310 thiss!1634) (currentByte!6315 thiss!1634) (size!2986 (buf!3425 thiss!1634))))))

(declare-fun b!144903 () Bool)

(declare-fun res!121112 () Bool)

(assert (=> b!144903 (=> (not res!121112) (not e!96572))))

(assert (=> b!144903 (= res!121112 (isPrefixOf!0 thiss!1634 (_2!6813 lt!224569)))))

(declare-fun b!144904 () Bool)

(declare-fun arrayRangesEq!302 (array!6596 array!6596 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144904 (= e!96577 (not (arrayRangesEq!302 arr!237 (_2!6814 lt!224570) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!28004 res!121106) b!144898))

(assert (= (and b!144898 res!121111) b!144897))

(assert (= (and b!144897 res!121107) b!144902))

(assert (= (and b!144902 res!121101) b!144894))

(assert (= (and b!144894 res!121108) b!144895))

(assert (= (and b!144895 res!121110) b!144903))

(assert (= (and b!144903 res!121112) b!144890))

(assert (= (and b!144894 res!121103) b!144893))

(assert (= (and b!144893 res!121102) b!144901))

(assert (= (and b!144901 res!121104) b!144896))

(assert (= (and b!144896 (not res!121114)) b!144904))

(assert (= (and b!144894 res!121105) b!144892))

(assert (= (and b!144894 res!121113) b!144891))

(assert (= (and b!144894 res!121109) b!144900))

(assert (= start!28004 b!144899))

(declare-fun m!222851 () Bool)

(assert (=> b!144904 m!222851))

(declare-fun m!222853 () Bool)

(assert (=> b!144899 m!222853))

(declare-fun m!222855 () Bool)

(assert (=> b!144900 m!222855))

(declare-fun m!222857 () Bool)

(assert (=> b!144890 m!222857))

(declare-fun m!222859 () Bool)

(assert (=> b!144890 m!222859))

(declare-fun m!222861 () Bool)

(assert (=> b!144890 m!222861))

(declare-fun m!222863 () Bool)

(assert (=> b!144898 m!222863))

(declare-fun m!222865 () Bool)

(assert (=> b!144901 m!222865))

(declare-fun m!222867 () Bool)

(assert (=> b!144895 m!222867))

(declare-fun m!222869 () Bool)

(assert (=> b!144895 m!222869))

(declare-fun m!222871 () Bool)

(assert (=> b!144903 m!222871))

(declare-fun m!222873 () Bool)

(assert (=> b!144892 m!222873))

(declare-fun m!222875 () Bool)

(assert (=> b!144893 m!222875))

(assert (=> b!144893 m!222867))

(declare-fun m!222877 () Bool)

(assert (=> b!144896 m!222877))

(declare-fun m!222879 () Bool)

(assert (=> b!144896 m!222879))

(declare-fun m!222881 () Bool)

(assert (=> b!144896 m!222881))

(declare-fun m!222883 () Bool)

(assert (=> b!144896 m!222883))

(declare-fun m!222885 () Bool)

(assert (=> b!144894 m!222885))

(declare-fun m!222887 () Bool)

(assert (=> b!144894 m!222887))

(declare-fun m!222889 () Bool)

(assert (=> b!144894 m!222889))

(declare-fun m!222891 () Bool)

(assert (=> b!144894 m!222891))

(declare-fun m!222893 () Bool)

(assert (=> b!144894 m!222893))

(declare-fun m!222895 () Bool)

(assert (=> b!144894 m!222895))

(declare-fun m!222897 () Bool)

(assert (=> b!144894 m!222897))

(declare-fun m!222899 () Bool)

(assert (=> b!144894 m!222899))

(declare-fun m!222901 () Bool)

(assert (=> b!144894 m!222901))

(assert (=> b!144894 m!222883))

(assert (=> b!144894 m!222857))

(declare-fun m!222903 () Bool)

(assert (=> b!144894 m!222903))

(assert (=> b!144894 m!222857))

(declare-fun m!222905 () Bool)

(assert (=> b!144894 m!222905))

(declare-fun m!222907 () Bool)

(assert (=> b!144894 m!222907))

(declare-fun m!222909 () Bool)

(assert (=> b!144894 m!222909))

(declare-fun m!222911 () Bool)

(assert (=> b!144894 m!222911))

(declare-fun m!222913 () Bool)

(assert (=> b!144894 m!222913))

(declare-fun m!222915 () Bool)

(assert (=> b!144902 m!222915))

(declare-fun m!222917 () Bool)

(assert (=> start!28004 m!222917))

(declare-fun m!222919 () Bool)

(assert (=> start!28004 m!222919))

(push 1)

(assert (not b!144893))

(assert (not b!144892))

(assert (not b!144899))

(assert (not b!144902))

(assert (not b!144895))

(assert (not b!144904))

(assert (not b!144903))

(assert (not b!144894))

(assert (not b!144901))

(assert (not b!144890))

(assert (not b!144898))

(assert (not b!144900))

(assert (not start!28004))

(assert (not b!144896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

