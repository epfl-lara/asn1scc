; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28764 () Bool)

(assert start!28764)

(declare-fun b!149115 () Bool)

(declare-fun res!124875 () Bool)

(declare-fun e!99524 () Bool)

(assert (=> b!149115 (=> (not res!124875) (not e!99524))))

(declare-datatypes ((array!6686 0))(
  ( (array!6687 (arr!3809 (Array (_ BitVec 32) (_ BitVec 8))) (size!3025 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5308 0))(
  ( (BitStream!5309 (buf!3500 array!6686) (currentByte!6414 (_ BitVec 32)) (currentBit!6409 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9441 0))(
  ( (Unit!9442) )
))
(declare-datatypes ((tuple2!13278 0))(
  ( (tuple2!13279 (_1!7003 Unit!9441) (_2!7003 BitStream!5308)) )
))
(declare-fun lt!232601 () tuple2!13278)

(declare-fun lt!232598 () tuple2!13278)

(declare-fun isPrefixOf!0 (BitStream!5308 BitStream!5308) Bool)

(assert (=> b!149115 (= res!124875 (isPrefixOf!0 (_2!7003 lt!232601) (_2!7003 lt!232598)))))

(declare-fun b!149116 () Bool)

(declare-fun res!124878 () Bool)

(declare-fun e!99527 () Bool)

(assert (=> b!149116 (=> (not res!124878) (not e!99527))))

(declare-fun thiss!1634 () BitStream!5308)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149116 (= res!124878 (invariant!0 (currentBit!6409 thiss!1634) (currentByte!6414 thiss!1634) (size!3025 (buf!3500 thiss!1634))))))

(declare-fun b!149117 () Bool)

(declare-fun res!124871 () Bool)

(declare-fun e!99528 () Bool)

(assert (=> b!149117 (=> (not res!124871) (not e!99528))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149117 (= res!124871 (= (bitIndex!0 (size!3025 (buf!3500 (_2!7003 lt!232601))) (currentByte!6414 (_2!7003 lt!232601)) (currentBit!6409 (_2!7003 lt!232601))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3025 (buf!3500 thiss!1634)) (currentByte!6414 thiss!1634) (currentBit!6409 thiss!1634)))))))

(declare-fun b!149118 () Bool)

(declare-fun res!124874 () Bool)

(assert (=> b!149118 (=> (not res!124874) (not e!99527))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!149118 (= res!124874 (bvslt from!447 to!404))))

(declare-fun e!99522 () Bool)

(declare-fun arr!237 () array!6686)

(declare-datatypes ((tuple2!13280 0))(
  ( (tuple2!13281 (_1!7004 BitStream!5308) (_2!7004 array!6686)) )
))
(declare-fun lt!232585 () tuple2!13280)

(declare-fun b!149119 () Bool)

(declare-fun arrayRangesEq!341 (array!6686 array!6686 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149119 (= e!99522 (not (arrayRangesEq!341 arr!237 (_2!7004 lt!232585) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!124873 () Bool)

(assert (=> start!28764 (=> (not res!124873) (not e!99527))))

(assert (=> start!28764 (= res!124873 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3025 arr!237))))))

(assert (=> start!28764 e!99527))

(assert (=> start!28764 true))

(declare-fun array_inv!2814 (array!6686) Bool)

(assert (=> start!28764 (array_inv!2814 arr!237)))

(declare-fun e!99529 () Bool)

(declare-fun inv!12 (BitStream!5308) Bool)

(assert (=> start!28764 (and (inv!12 thiss!1634) e!99529)))

(declare-fun b!149120 () Bool)

(declare-fun res!124880 () Bool)

(assert (=> b!149120 (=> (not res!124880) (not e!99527))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149120 (= res!124880 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3025 (buf!3500 thiss!1634))) ((_ sign_extend 32) (currentByte!6414 thiss!1634)) ((_ sign_extend 32) (currentBit!6409 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149121 () Bool)

(declare-datatypes ((tuple2!13282 0))(
  ( (tuple2!13283 (_1!7005 BitStream!5308) (_2!7005 BitStream!5308)) )
))
(declare-fun lt!232589 () tuple2!13282)

(declare-datatypes ((tuple2!13284 0))(
  ( (tuple2!13285 (_1!7006 BitStream!5308) (_2!7006 (_ BitVec 8))) )
))
(declare-fun lt!232582 () tuple2!13284)

(assert (=> b!149121 (= e!99528 (and (= (_2!7006 lt!232582) (select (arr!3809 arr!237) from!447)) (= (_1!7006 lt!232582) (_2!7005 lt!232589))))))

(declare-fun readBytePure!0 (BitStream!5308) tuple2!13284)

(assert (=> b!149121 (= lt!232582 (readBytePure!0 (_1!7005 lt!232589)))))

(declare-fun reader!0 (BitStream!5308 BitStream!5308) tuple2!13282)

(assert (=> b!149121 (= lt!232589 (reader!0 thiss!1634 (_2!7003 lt!232601)))))

(declare-fun b!149122 () Bool)

(assert (=> b!149122 (= e!99529 (array_inv!2814 (buf!3500 thiss!1634)))))

(declare-fun b!149123 () Bool)

(declare-fun e!99523 () Bool)

(assert (=> b!149123 (= e!99523 (invariant!0 (currentBit!6409 thiss!1634) (currentByte!6414 thiss!1634) (size!3025 (buf!3500 (_2!7003 lt!232601)))))))

(declare-fun b!149124 () Bool)

(declare-fun e!99532 () Bool)

(assert (=> b!149124 (= e!99532 true)))

(declare-fun lt!232576 () tuple2!13280)

(assert (=> b!149124 (arrayRangesEq!341 arr!237 (_2!7004 lt!232576) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232578 () tuple2!13280)

(declare-fun lt!232595 () Unit!9441)

(declare-fun arrayRangesEqTransitive!56 (array!6686 array!6686 array!6686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9441)

(assert (=> b!149124 (= lt!232595 (arrayRangesEqTransitive!56 arr!237 (_2!7004 lt!232578) (_2!7004 lt!232576) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149124 (arrayRangesEq!341 (_2!7004 lt!232578) (_2!7004 lt!232576) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232588 () Unit!9441)

(declare-fun arrayRangesEqSymmetricLemma!73 (array!6686 array!6686 (_ BitVec 32) (_ BitVec 32)) Unit!9441)

(assert (=> b!149124 (= lt!232588 (arrayRangesEqSymmetricLemma!73 (_2!7004 lt!232576) (_2!7004 lt!232578) #b00000000000000000000000000000000 to!404))))

(declare-fun b!149125 () Bool)

(assert (=> b!149125 (= e!99524 (not e!99522))))

(declare-fun res!124876 () Bool)

(assert (=> b!149125 (=> res!124876 e!99522)))

(declare-fun lt!232602 () tuple2!13282)

(assert (=> b!149125 (= res!124876 (or (not (= (size!3025 (_2!7004 lt!232585)) (size!3025 arr!237))) (not (= (_1!7004 lt!232585) (_2!7005 lt!232602)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5308 array!6686 (_ BitVec 32) (_ BitVec 32)) tuple2!13280)

(assert (=> b!149125 (= lt!232585 (readByteArrayLoopPure!0 (_1!7005 lt!232602) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232596 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149125 (validate_offset_bits!1 ((_ sign_extend 32) (size!3025 (buf!3500 (_2!7003 lt!232598)))) ((_ sign_extend 32) (currentByte!6414 (_2!7003 lt!232601))) ((_ sign_extend 32) (currentBit!6409 (_2!7003 lt!232601))) lt!232596)))

(declare-fun lt!232584 () Unit!9441)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5308 array!6686 (_ BitVec 64)) Unit!9441)

(assert (=> b!149125 (= lt!232584 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7003 lt!232601) (buf!3500 (_2!7003 lt!232598)) lt!232596))))

(assert (=> b!149125 (= lt!232602 (reader!0 (_2!7003 lt!232601) (_2!7003 lt!232598)))))

(declare-fun b!149126 () Bool)

(assert (=> b!149126 (= e!99527 (not e!99532))))

(declare-fun res!124867 () Bool)

(assert (=> b!149126 (=> res!124867 e!99532)))

(assert (=> b!149126 (= res!124867 (not (arrayRangesEq!341 (_2!7004 lt!232576) (_2!7004 lt!232578) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232599 () tuple2!13280)

(assert (=> b!149126 (arrayRangesEq!341 (_2!7004 lt!232576) (_2!7004 lt!232599) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232581 () Unit!9441)

(declare-fun lt!232590 () tuple2!13282)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5308 array!6686 (_ BitVec 32) (_ BitVec 32)) Unit!9441)

(assert (=> b!149126 (= lt!232581 (readByteArrayLoopArrayPrefixLemma!0 (_1!7005 lt!232590) arr!237 from!447 to!404))))

(declare-fun lt!232597 () array!6686)

(declare-fun withMovedByteIndex!0 (BitStream!5308 (_ BitVec 32)) BitStream!5308)

(assert (=> b!149126 (= lt!232599 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7005 lt!232590) #b00000000000000000000000000000001) lt!232597 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232600 () tuple2!13282)

(assert (=> b!149126 (= lt!232578 (readByteArrayLoopPure!0 (_1!7005 lt!232600) lt!232597 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232579 () tuple2!13284)

(assert (=> b!149126 (= lt!232597 (array!6687 (store (arr!3809 arr!237) from!447 (_2!7006 lt!232579)) (size!3025 arr!237)))))

(declare-fun lt!232591 () (_ BitVec 32))

(assert (=> b!149126 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3025 (buf!3500 (_2!7003 lt!232598)))) ((_ sign_extend 32) (currentByte!6414 (_2!7003 lt!232601))) ((_ sign_extend 32) (currentBit!6409 (_2!7003 lt!232601))) lt!232591)))

(declare-fun lt!232594 () Unit!9441)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5308 array!6686 (_ BitVec 32)) Unit!9441)

(assert (=> b!149126 (= lt!232594 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7003 lt!232601) (buf!3500 (_2!7003 lt!232598)) lt!232591))))

(assert (=> b!149126 (= (_1!7004 lt!232576) (_2!7005 lt!232590))))

(assert (=> b!149126 (= lt!232576 (readByteArrayLoopPure!0 (_1!7005 lt!232590) arr!237 from!447 to!404))))

(assert (=> b!149126 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3025 (buf!3500 (_2!7003 lt!232598)))) ((_ sign_extend 32) (currentByte!6414 thiss!1634)) ((_ sign_extend 32) (currentBit!6409 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232587 () Unit!9441)

(assert (=> b!149126 (= lt!232587 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3500 (_2!7003 lt!232598)) (bvsub to!404 from!447)))))

(assert (=> b!149126 (= (_2!7006 lt!232579) (select (arr!3809 arr!237) from!447))))

(assert (=> b!149126 (= lt!232579 (readBytePure!0 (_1!7005 lt!232590)))))

(assert (=> b!149126 (= lt!232600 (reader!0 (_2!7003 lt!232601) (_2!7003 lt!232598)))))

(assert (=> b!149126 (= lt!232590 (reader!0 thiss!1634 (_2!7003 lt!232598)))))

(declare-fun e!99530 () Bool)

(assert (=> b!149126 e!99530))

(declare-fun res!124870 () Bool)

(assert (=> b!149126 (=> (not res!124870) (not e!99530))))

(declare-fun lt!232583 () tuple2!13284)

(declare-fun lt!232580 () tuple2!13284)

(assert (=> b!149126 (= res!124870 (= (bitIndex!0 (size!3025 (buf!3500 (_1!7006 lt!232583))) (currentByte!6414 (_1!7006 lt!232583)) (currentBit!6409 (_1!7006 lt!232583))) (bitIndex!0 (size!3025 (buf!3500 (_1!7006 lt!232580))) (currentByte!6414 (_1!7006 lt!232580)) (currentBit!6409 (_1!7006 lt!232580)))))))

(declare-fun lt!232577 () Unit!9441)

(declare-fun lt!232593 () BitStream!5308)

(declare-fun readBytePrefixLemma!0 (BitStream!5308 BitStream!5308) Unit!9441)

(assert (=> b!149126 (= lt!232577 (readBytePrefixLemma!0 lt!232593 (_2!7003 lt!232598)))))

(assert (=> b!149126 (= lt!232580 (readBytePure!0 (BitStream!5309 (buf!3500 (_2!7003 lt!232598)) (currentByte!6414 thiss!1634) (currentBit!6409 thiss!1634))))))

(assert (=> b!149126 (= lt!232583 (readBytePure!0 lt!232593))))

(assert (=> b!149126 (= lt!232593 (BitStream!5309 (buf!3500 (_2!7003 lt!232601)) (currentByte!6414 thiss!1634) (currentBit!6409 thiss!1634)))))

(assert (=> b!149126 e!99523))

(declare-fun res!124869 () Bool)

(assert (=> b!149126 (=> (not res!124869) (not e!99523))))

(assert (=> b!149126 (= res!124869 (isPrefixOf!0 thiss!1634 (_2!7003 lt!232598)))))

(declare-fun lt!232586 () Unit!9441)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5308 BitStream!5308 BitStream!5308) Unit!9441)

(assert (=> b!149126 (= lt!232586 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7003 lt!232601) (_2!7003 lt!232598)))))

(declare-fun e!99526 () Bool)

(assert (=> b!149126 e!99526))

(declare-fun res!124877 () Bool)

(assert (=> b!149126 (=> (not res!124877) (not e!99526))))

(assert (=> b!149126 (= res!124877 (= (size!3025 (buf!3500 (_2!7003 lt!232601))) (size!3025 (buf!3500 (_2!7003 lt!232598)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5308 array!6686 (_ BitVec 32) (_ BitVec 32)) tuple2!13278)

(assert (=> b!149126 (= lt!232598 (appendByteArrayLoop!0 (_2!7003 lt!232601) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149126 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3025 (buf!3500 (_2!7003 lt!232601)))) ((_ sign_extend 32) (currentByte!6414 (_2!7003 lt!232601))) ((_ sign_extend 32) (currentBit!6409 (_2!7003 lt!232601))) lt!232591)))

(assert (=> b!149126 (= lt!232591 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232592 () Unit!9441)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5308 BitStream!5308 (_ BitVec 64) (_ BitVec 32)) Unit!9441)

(assert (=> b!149126 (= lt!232592 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7003 lt!232601) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149126 e!99528))

(declare-fun res!124868 () Bool)

(assert (=> b!149126 (=> (not res!124868) (not e!99528))))

(assert (=> b!149126 (= res!124868 (= (size!3025 (buf!3500 thiss!1634)) (size!3025 (buf!3500 (_2!7003 lt!232601)))))))

(declare-fun appendByte!0 (BitStream!5308 (_ BitVec 8)) tuple2!13278)

(assert (=> b!149126 (= lt!232601 (appendByte!0 thiss!1634 (select (arr!3809 arr!237) from!447)))))

(declare-fun b!149127 () Bool)

(declare-fun res!124872 () Bool)

(assert (=> b!149127 (=> (not res!124872) (not e!99528))))

(assert (=> b!149127 (= res!124872 (isPrefixOf!0 thiss!1634 (_2!7003 lt!232601)))))

(declare-fun b!149128 () Bool)

(assert (=> b!149128 (= e!99530 (= (_2!7006 lt!232583) (_2!7006 lt!232580)))))

(declare-fun b!149129 () Bool)

(assert (=> b!149129 (= e!99526 e!99524)))

(declare-fun res!124879 () Bool)

(assert (=> b!149129 (=> (not res!124879) (not e!99524))))

(assert (=> b!149129 (= res!124879 (= (bitIndex!0 (size!3025 (buf!3500 (_2!7003 lt!232598))) (currentByte!6414 (_2!7003 lt!232598)) (currentBit!6409 (_2!7003 lt!232598))) (bvadd (bitIndex!0 (size!3025 (buf!3500 (_2!7003 lt!232601))) (currentByte!6414 (_2!7003 lt!232601)) (currentBit!6409 (_2!7003 lt!232601))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232596))))))

(assert (=> b!149129 (= lt!232596 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!28764 res!124873) b!149120))

(assert (= (and b!149120 res!124880) b!149118))

(assert (= (and b!149118 res!124874) b!149116))

(assert (= (and b!149116 res!124878) b!149126))

(assert (= (and b!149126 res!124868) b!149117))

(assert (= (and b!149117 res!124871) b!149127))

(assert (= (and b!149127 res!124872) b!149121))

(assert (= (and b!149126 res!124877) b!149129))

(assert (= (and b!149129 res!124879) b!149115))

(assert (= (and b!149115 res!124875) b!149125))

(assert (= (and b!149125 (not res!124876)) b!149119))

(assert (= (and b!149126 res!124869) b!149123))

(assert (= (and b!149126 res!124870) b!149128))

(assert (= (and b!149126 (not res!124867)) b!149124))

(assert (= start!28764 b!149122))

(declare-fun m!231855 () Bool)

(assert (=> b!149117 m!231855))

(declare-fun m!231857 () Bool)

(assert (=> b!149117 m!231857))

(declare-fun m!231859 () Bool)

(assert (=> b!149125 m!231859))

(declare-fun m!231861 () Bool)

(assert (=> b!149125 m!231861))

(declare-fun m!231863 () Bool)

(assert (=> b!149125 m!231863))

(declare-fun m!231865 () Bool)

(assert (=> b!149125 m!231865))

(declare-fun m!231867 () Bool)

(assert (=> b!149126 m!231867))

(declare-fun m!231869 () Bool)

(assert (=> b!149126 m!231869))

(assert (=> b!149126 m!231865))

(declare-fun m!231871 () Bool)

(assert (=> b!149126 m!231871))

(declare-fun m!231873 () Bool)

(assert (=> b!149126 m!231873))

(declare-fun m!231875 () Bool)

(assert (=> b!149126 m!231875))

(declare-fun m!231877 () Bool)

(assert (=> b!149126 m!231877))

(declare-fun m!231879 () Bool)

(assert (=> b!149126 m!231879))

(declare-fun m!231881 () Bool)

(assert (=> b!149126 m!231881))

(declare-fun m!231883 () Bool)

(assert (=> b!149126 m!231883))

(assert (=> b!149126 m!231881))

(declare-fun m!231885 () Bool)

(assert (=> b!149126 m!231885))

(declare-fun m!231887 () Bool)

(assert (=> b!149126 m!231887))

(declare-fun m!231889 () Bool)

(assert (=> b!149126 m!231889))

(declare-fun m!231891 () Bool)

(assert (=> b!149126 m!231891))

(declare-fun m!231893 () Bool)

(assert (=> b!149126 m!231893))

(declare-fun m!231895 () Bool)

(assert (=> b!149126 m!231895))

(assert (=> b!149126 m!231885))

(declare-fun m!231897 () Bool)

(assert (=> b!149126 m!231897))

(declare-fun m!231899 () Bool)

(assert (=> b!149126 m!231899))

(declare-fun m!231901 () Bool)

(assert (=> b!149126 m!231901))

(declare-fun m!231903 () Bool)

(assert (=> b!149126 m!231903))

(declare-fun m!231905 () Bool)

(assert (=> b!149126 m!231905))

(declare-fun m!231907 () Bool)

(assert (=> b!149126 m!231907))

(declare-fun m!231909 () Bool)

(assert (=> b!149126 m!231909))

(declare-fun m!231911 () Bool)

(assert (=> b!149126 m!231911))

(declare-fun m!231913 () Bool)

(assert (=> b!149126 m!231913))

(declare-fun m!231915 () Bool)

(assert (=> b!149126 m!231915))

(declare-fun m!231917 () Bool)

(assert (=> b!149126 m!231917))

(declare-fun m!231919 () Bool)

(assert (=> b!149119 m!231919))

(declare-fun m!231921 () Bool)

(assert (=> b!149123 m!231921))

(declare-fun m!231923 () Bool)

(assert (=> b!149120 m!231923))

(declare-fun m!231925 () Bool)

(assert (=> b!149122 m!231925))

(declare-fun m!231927 () Bool)

(assert (=> b!149115 m!231927))

(declare-fun m!231929 () Bool)

(assert (=> b!149124 m!231929))

(declare-fun m!231931 () Bool)

(assert (=> b!149124 m!231931))

(declare-fun m!231933 () Bool)

(assert (=> b!149124 m!231933))

(declare-fun m!231935 () Bool)

(assert (=> b!149124 m!231935))

(assert (=> b!149121 m!231881))

(declare-fun m!231937 () Bool)

(assert (=> b!149121 m!231937))

(declare-fun m!231939 () Bool)

(assert (=> b!149121 m!231939))

(declare-fun m!231941 () Bool)

(assert (=> start!28764 m!231941))

(declare-fun m!231943 () Bool)

(assert (=> start!28764 m!231943))

(declare-fun m!231945 () Bool)

(assert (=> b!149127 m!231945))

(declare-fun m!231947 () Bool)

(assert (=> b!149116 m!231947))

(declare-fun m!231949 () Bool)

(assert (=> b!149129 m!231949))

(assert (=> b!149129 m!231855))

(push 1)

(assert (not b!149129))

(assert (not b!149124))

(assert (not b!149125))

(assert (not b!149115))

(assert (not b!149117))

(assert (not b!149122))

(assert (not b!149116))

(assert (not b!149121))

(assert (not start!28764))

(assert (not b!149127))

(assert (not b!149120))

(assert (not b!149126))

(assert (not b!149119))

(assert (not b!149123))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

