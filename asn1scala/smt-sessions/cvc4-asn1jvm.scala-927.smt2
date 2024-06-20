; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26340 () Bool)

(assert start!26340)

(declare-datatypes ((array!6140 0))(
  ( (array!6141 (arr!3443 (Array (_ BitVec 32) (_ BitVec 8))) (size!2778 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4820 0))(
  ( (BitStream!4821 (buf!3171 array!6140) (currentByte!5968 (_ BitVec 32)) (currentBit!5963 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11620 0))(
  ( (tuple2!11621 (_1!6126 BitStream!4820) (_2!6126 (_ BitVec 8))) )
))
(declare-fun lt!208666 () tuple2!11620)

(declare-datatypes ((tuple2!11622 0))(
  ( (tuple2!11623 (_1!6127 BitStream!4820) (_2!6127 BitStream!4820)) )
))
(declare-fun lt!208678 () tuple2!11622)

(declare-fun arr!237 () array!6140)

(declare-fun e!89265 () Bool)

(declare-fun b!134545 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!134545 (= e!89265 (and (= (_2!6126 lt!208666) (select (arr!3443 arr!237) from!447)) (= (_1!6126 lt!208666) (_2!6127 lt!208678))))))

(declare-fun readBytePure!0 (BitStream!4820) tuple2!11620)

(assert (=> b!134545 (= lt!208666 (readBytePure!0 (_1!6127 lt!208678)))))

(declare-fun thiss!1634 () BitStream!4820)

(declare-datatypes ((Unit!8394 0))(
  ( (Unit!8395) )
))
(declare-datatypes ((tuple2!11624 0))(
  ( (tuple2!11625 (_1!6128 Unit!8394) (_2!6128 BitStream!4820)) )
))
(declare-fun lt!208686 () tuple2!11624)

(declare-fun reader!0 (BitStream!4820 BitStream!4820) tuple2!11622)

(assert (=> b!134545 (= lt!208678 (reader!0 thiss!1634 (_2!6128 lt!208686)))))

(declare-fun b!134546 () Bool)

(declare-fun e!89270 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134546 (= e!89270 (invariant!0 (currentBit!5963 thiss!1634) (currentByte!5968 thiss!1634) (size!2778 (buf!3171 (_2!6128 lt!208686)))))))

(declare-fun b!134547 () Bool)

(declare-fun e!89271 () Bool)

(declare-fun e!89267 () Bool)

(assert (=> b!134547 (= e!89271 e!89267)))

(declare-fun res!111811 () Bool)

(assert (=> b!134547 (=> (not res!111811) (not e!89267))))

(declare-fun lt!208675 () tuple2!11624)

(declare-fun lt!208669 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134547 (= res!111811 (= (bitIndex!0 (size!2778 (buf!3171 (_2!6128 lt!208675))) (currentByte!5968 (_2!6128 lt!208675)) (currentBit!5963 (_2!6128 lt!208675))) (bvadd (bitIndex!0 (size!2778 (buf!3171 (_2!6128 lt!208686))) (currentByte!5968 (_2!6128 lt!208686)) (currentBit!5963 (_2!6128 lt!208686))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!208669))))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!134547 (= lt!208669 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134548 () Bool)

(declare-fun res!111815 () Bool)

(declare-fun e!89263 () Bool)

(assert (=> b!134548 (=> (not res!111815) (not e!89263))))

(assert (=> b!134548 (= res!111815 (bvslt from!447 to!404))))

(declare-fun e!89268 () Bool)

(declare-fun b!134549 () Bool)

(declare-datatypes ((tuple2!11626 0))(
  ( (tuple2!11627 (_1!6129 BitStream!4820) (_2!6129 array!6140)) )
))
(declare-fun lt!208677 () tuple2!11626)

(declare-fun arrayRangesEq!181 (array!6140 array!6140 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134549 (= e!89268 (not (arrayRangesEq!181 arr!237 (_2!6129 lt!208677) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134550 () Bool)

(declare-fun res!111812 () Bool)

(assert (=> b!134550 (=> (not res!111812) (not e!89267))))

(declare-fun isPrefixOf!0 (BitStream!4820 BitStream!4820) Bool)

(assert (=> b!134550 (= res!111812 (isPrefixOf!0 (_2!6128 lt!208686) (_2!6128 lt!208675)))))

(declare-fun b!134551 () Bool)

(declare-fun e!89264 () Bool)

(declare-fun lt!208683 () tuple2!11620)

(declare-fun lt!208667 () tuple2!11620)

(assert (=> b!134551 (= e!89264 (= (_2!6126 lt!208683) (_2!6126 lt!208667)))))

(declare-fun b!134552 () Bool)

(assert (=> b!134552 (= e!89267 (not e!89268))))

(declare-fun res!111816 () Bool)

(assert (=> b!134552 (=> res!111816 e!89268)))

(declare-fun lt!208665 () tuple2!11622)

(assert (=> b!134552 (= res!111816 (or (not (= (size!2778 (_2!6129 lt!208677)) (size!2778 arr!237))) (not (= (_1!6129 lt!208677) (_2!6127 lt!208665)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4820 array!6140 (_ BitVec 32) (_ BitVec 32)) tuple2!11626)

(assert (=> b!134552 (= lt!208677 (readByteArrayLoopPure!0 (_1!6127 lt!208665) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134552 (validate_offset_bits!1 ((_ sign_extend 32) (size!2778 (buf!3171 (_2!6128 lt!208675)))) ((_ sign_extend 32) (currentByte!5968 (_2!6128 lt!208686))) ((_ sign_extend 32) (currentBit!5963 (_2!6128 lt!208686))) lt!208669)))

(declare-fun lt!208685 () Unit!8394)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4820 array!6140 (_ BitVec 64)) Unit!8394)

(assert (=> b!134552 (= lt!208685 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6128 lt!208686) (buf!3171 (_2!6128 lt!208675)) lt!208669))))

(assert (=> b!134552 (= lt!208665 (reader!0 (_2!6128 lt!208686) (_2!6128 lt!208675)))))

(declare-fun b!134554 () Bool)

(declare-fun res!111817 () Bool)

(assert (=> b!134554 (=> (not res!111817) (not e!89265))))

(assert (=> b!134554 (= res!111817 (= (bitIndex!0 (size!2778 (buf!3171 (_2!6128 lt!208686))) (currentByte!5968 (_2!6128 lt!208686)) (currentBit!5963 (_2!6128 lt!208686))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2778 (buf!3171 thiss!1634)) (currentByte!5968 thiss!1634) (currentBit!5963 thiss!1634)))))))

(declare-fun b!134555 () Bool)

(declare-fun e!89269 () Bool)

(declare-fun array_inv!2567 (array!6140) Bool)

(assert (=> b!134555 (= e!89269 (array_inv!2567 (buf!3171 thiss!1634)))))

(declare-fun b!134556 () Bool)

(assert (=> b!134556 (= e!89263 (not true))))

(declare-fun lt!208687 () tuple2!11626)

(declare-fun lt!208681 () tuple2!11626)

(assert (=> b!134556 (arrayRangesEq!181 (_2!6129 lt!208687) (_2!6129 lt!208681) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!208680 () tuple2!11622)

(declare-fun lt!208668 () Unit!8394)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4820 array!6140 (_ BitVec 32) (_ BitVec 32)) Unit!8394)

(assert (=> b!134556 (= lt!208668 (readByteArrayLoopArrayPrefixLemma!0 (_1!6127 lt!208680) arr!237 from!447 to!404))))

(declare-fun lt!208682 () array!6140)

(declare-fun withMovedByteIndex!0 (BitStream!4820 (_ BitVec 32)) BitStream!4820)

(assert (=> b!134556 (= lt!208681 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6127 lt!208680) #b00000000000000000000000000000001) lt!208682 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208672 () tuple2!11626)

(declare-fun lt!208674 () tuple2!11622)

(assert (=> b!134556 (= lt!208672 (readByteArrayLoopPure!0 (_1!6127 lt!208674) lt!208682 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208663 () tuple2!11620)

(assert (=> b!134556 (= lt!208682 (array!6141 (store (arr!3443 arr!237) from!447 (_2!6126 lt!208663)) (size!2778 arr!237)))))

(declare-fun lt!208679 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134556 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2778 (buf!3171 (_2!6128 lt!208675)))) ((_ sign_extend 32) (currentByte!5968 (_2!6128 lt!208686))) ((_ sign_extend 32) (currentBit!5963 (_2!6128 lt!208686))) lt!208679)))

(declare-fun lt!208673 () Unit!8394)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4820 array!6140 (_ BitVec 32)) Unit!8394)

(assert (=> b!134556 (= lt!208673 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6128 lt!208686) (buf!3171 (_2!6128 lt!208675)) lt!208679))))

(assert (=> b!134556 (= (_1!6129 lt!208687) (_2!6127 lt!208680))))

(assert (=> b!134556 (= lt!208687 (readByteArrayLoopPure!0 (_1!6127 lt!208680) arr!237 from!447 to!404))))

(assert (=> b!134556 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2778 (buf!3171 (_2!6128 lt!208675)))) ((_ sign_extend 32) (currentByte!5968 thiss!1634)) ((_ sign_extend 32) (currentBit!5963 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!208671 () Unit!8394)

(assert (=> b!134556 (= lt!208671 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3171 (_2!6128 lt!208675)) (bvsub to!404 from!447)))))

(assert (=> b!134556 (= (_2!6126 lt!208663) (select (arr!3443 arr!237) from!447))))

(assert (=> b!134556 (= lt!208663 (readBytePure!0 (_1!6127 lt!208680)))))

(assert (=> b!134556 (= lt!208674 (reader!0 (_2!6128 lt!208686) (_2!6128 lt!208675)))))

(assert (=> b!134556 (= lt!208680 (reader!0 thiss!1634 (_2!6128 lt!208675)))))

(assert (=> b!134556 e!89264))

(declare-fun res!111813 () Bool)

(assert (=> b!134556 (=> (not res!111813) (not e!89264))))

(assert (=> b!134556 (= res!111813 (= (bitIndex!0 (size!2778 (buf!3171 (_1!6126 lt!208683))) (currentByte!5968 (_1!6126 lt!208683)) (currentBit!5963 (_1!6126 lt!208683))) (bitIndex!0 (size!2778 (buf!3171 (_1!6126 lt!208667))) (currentByte!5968 (_1!6126 lt!208667)) (currentBit!5963 (_1!6126 lt!208667)))))))

(declare-fun lt!208684 () Unit!8394)

(declare-fun lt!208664 () BitStream!4820)

(declare-fun readBytePrefixLemma!0 (BitStream!4820 BitStream!4820) Unit!8394)

(assert (=> b!134556 (= lt!208684 (readBytePrefixLemma!0 lt!208664 (_2!6128 lt!208675)))))

(assert (=> b!134556 (= lt!208667 (readBytePure!0 (BitStream!4821 (buf!3171 (_2!6128 lt!208675)) (currentByte!5968 thiss!1634) (currentBit!5963 thiss!1634))))))

(assert (=> b!134556 (= lt!208683 (readBytePure!0 lt!208664))))

(assert (=> b!134556 (= lt!208664 (BitStream!4821 (buf!3171 (_2!6128 lt!208686)) (currentByte!5968 thiss!1634) (currentBit!5963 thiss!1634)))))

(assert (=> b!134556 e!89270))

(declare-fun res!111819 () Bool)

(assert (=> b!134556 (=> (not res!111819) (not e!89270))))

(assert (=> b!134556 (= res!111819 (isPrefixOf!0 thiss!1634 (_2!6128 lt!208675)))))

(declare-fun lt!208676 () Unit!8394)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4820 BitStream!4820 BitStream!4820) Unit!8394)

(assert (=> b!134556 (= lt!208676 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6128 lt!208686) (_2!6128 lt!208675)))))

(assert (=> b!134556 e!89271))

(declare-fun res!111818 () Bool)

(assert (=> b!134556 (=> (not res!111818) (not e!89271))))

(assert (=> b!134556 (= res!111818 (= (size!2778 (buf!3171 (_2!6128 lt!208686))) (size!2778 (buf!3171 (_2!6128 lt!208675)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4820 array!6140 (_ BitVec 32) (_ BitVec 32)) tuple2!11624)

(assert (=> b!134556 (= lt!208675 (appendByteArrayLoop!0 (_2!6128 lt!208686) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134556 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2778 (buf!3171 (_2!6128 lt!208686)))) ((_ sign_extend 32) (currentByte!5968 (_2!6128 lt!208686))) ((_ sign_extend 32) (currentBit!5963 (_2!6128 lt!208686))) lt!208679)))

(assert (=> b!134556 (= lt!208679 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!208670 () Unit!8394)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4820 BitStream!4820 (_ BitVec 64) (_ BitVec 32)) Unit!8394)

(assert (=> b!134556 (= lt!208670 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6128 lt!208686) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134556 e!89265))

(declare-fun res!111821 () Bool)

(assert (=> b!134556 (=> (not res!111821) (not e!89265))))

(assert (=> b!134556 (= res!111821 (= (size!2778 (buf!3171 thiss!1634)) (size!2778 (buf!3171 (_2!6128 lt!208686)))))))

(declare-fun appendByte!0 (BitStream!4820 (_ BitVec 8)) tuple2!11624)

(assert (=> b!134556 (= lt!208686 (appendByte!0 thiss!1634 (select (arr!3443 arr!237) from!447)))))

(declare-fun b!134557 () Bool)

(declare-fun res!111822 () Bool)

(assert (=> b!134557 (=> (not res!111822) (not e!89265))))

(assert (=> b!134557 (= res!111822 (isPrefixOf!0 thiss!1634 (_2!6128 lt!208686)))))

(declare-fun b!134558 () Bool)

(declare-fun res!111810 () Bool)

(assert (=> b!134558 (=> (not res!111810) (not e!89263))))

(assert (=> b!134558 (= res!111810 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2778 (buf!3171 thiss!1634))) ((_ sign_extend 32) (currentByte!5968 thiss!1634)) ((_ sign_extend 32) (currentBit!5963 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!111820 () Bool)

(assert (=> start!26340 (=> (not res!111820) (not e!89263))))

(assert (=> start!26340 (= res!111820 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2778 arr!237))))))

(assert (=> start!26340 e!89263))

(assert (=> start!26340 true))

(assert (=> start!26340 (array_inv!2567 arr!237)))

(declare-fun inv!12 (BitStream!4820) Bool)

(assert (=> start!26340 (and (inv!12 thiss!1634) e!89269)))

(declare-fun b!134553 () Bool)

(declare-fun res!111814 () Bool)

(assert (=> b!134553 (=> (not res!111814) (not e!89263))))

(assert (=> b!134553 (= res!111814 (invariant!0 (currentBit!5963 thiss!1634) (currentByte!5968 thiss!1634) (size!2778 (buf!3171 thiss!1634))))))

(assert (= (and start!26340 res!111820) b!134558))

(assert (= (and b!134558 res!111810) b!134548))

(assert (= (and b!134548 res!111815) b!134553))

(assert (= (and b!134553 res!111814) b!134556))

(assert (= (and b!134556 res!111821) b!134554))

(assert (= (and b!134554 res!111817) b!134557))

(assert (= (and b!134557 res!111822) b!134545))

(assert (= (and b!134556 res!111818) b!134547))

(assert (= (and b!134547 res!111811) b!134550))

(assert (= (and b!134550 res!111812) b!134552))

(assert (= (and b!134552 (not res!111816)) b!134549))

(assert (= (and b!134556 res!111819) b!134546))

(assert (= (and b!134556 res!111813) b!134551))

(assert (= start!26340 b!134555))

(declare-fun m!204797 () Bool)

(assert (=> b!134555 m!204797))

(declare-fun m!204799 () Bool)

(assert (=> b!134553 m!204799))

(declare-fun m!204801 () Bool)

(assert (=> b!134549 m!204801))

(declare-fun m!204803 () Bool)

(assert (=> b!134547 m!204803))

(declare-fun m!204805 () Bool)

(assert (=> b!134547 m!204805))

(declare-fun m!204807 () Bool)

(assert (=> b!134545 m!204807))

(declare-fun m!204809 () Bool)

(assert (=> b!134545 m!204809))

(declare-fun m!204811 () Bool)

(assert (=> b!134545 m!204811))

(assert (=> b!134554 m!204805))

(declare-fun m!204813 () Bool)

(assert (=> b!134554 m!204813))

(declare-fun m!204815 () Bool)

(assert (=> b!134556 m!204815))

(declare-fun m!204817 () Bool)

(assert (=> b!134556 m!204817))

(declare-fun m!204819 () Bool)

(assert (=> b!134556 m!204819))

(declare-fun m!204821 () Bool)

(assert (=> b!134556 m!204821))

(declare-fun m!204823 () Bool)

(assert (=> b!134556 m!204823))

(declare-fun m!204825 () Bool)

(assert (=> b!134556 m!204825))

(declare-fun m!204827 () Bool)

(assert (=> b!134556 m!204827))

(declare-fun m!204829 () Bool)

(assert (=> b!134556 m!204829))

(declare-fun m!204831 () Bool)

(assert (=> b!134556 m!204831))

(declare-fun m!204833 () Bool)

(assert (=> b!134556 m!204833))

(declare-fun m!204835 () Bool)

(assert (=> b!134556 m!204835))

(declare-fun m!204837 () Bool)

(assert (=> b!134556 m!204837))

(assert (=> b!134556 m!204825))

(declare-fun m!204839 () Bool)

(assert (=> b!134556 m!204839))

(declare-fun m!204841 () Bool)

(assert (=> b!134556 m!204841))

(declare-fun m!204843 () Bool)

(assert (=> b!134556 m!204843))

(declare-fun m!204845 () Bool)

(assert (=> b!134556 m!204845))

(declare-fun m!204847 () Bool)

(assert (=> b!134556 m!204847))

(declare-fun m!204849 () Bool)

(assert (=> b!134556 m!204849))

(declare-fun m!204851 () Bool)

(assert (=> b!134556 m!204851))

(declare-fun m!204853 () Bool)

(assert (=> b!134556 m!204853))

(declare-fun m!204855 () Bool)

(assert (=> b!134556 m!204855))

(declare-fun m!204857 () Bool)

(assert (=> b!134556 m!204857))

(declare-fun m!204859 () Bool)

(assert (=> b!134556 m!204859))

(assert (=> b!134556 m!204807))

(declare-fun m!204861 () Bool)

(assert (=> b!134556 m!204861))

(declare-fun m!204863 () Bool)

(assert (=> b!134556 m!204863))

(assert (=> b!134556 m!204807))

(declare-fun m!204865 () Bool)

(assert (=> b!134557 m!204865))

(declare-fun m!204867 () Bool)

(assert (=> b!134552 m!204867))

(declare-fun m!204869 () Bool)

(assert (=> b!134552 m!204869))

(declare-fun m!204871 () Bool)

(assert (=> b!134552 m!204871))

(assert (=> b!134552 m!204853))

(declare-fun m!204873 () Bool)

(assert (=> b!134558 m!204873))

(declare-fun m!204875 () Bool)

(assert (=> b!134546 m!204875))

(declare-fun m!204877 () Bool)

(assert (=> start!26340 m!204877))

(declare-fun m!204879 () Bool)

(assert (=> start!26340 m!204879))

(declare-fun m!204881 () Bool)

(assert (=> b!134550 m!204881))

(push 1)

(assert (not b!134555))

(assert (not b!134552))

(assert (not b!134545))

(assert (not start!26340))

(assert (not b!134556))

(assert (not b!134547))

(assert (not b!134554))

(assert (not b!134546))

(assert (not b!134550))

(assert (not b!134557))

(assert (not b!134558))

(assert (not b!134553))

(assert (not b!134549))

(check-sat)

