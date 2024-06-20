; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28762 () Bool)

(assert start!28762)

(declare-datatypes ((array!6684 0))(
  ( (array!6685 (arr!3808 (Array (_ BitVec 32) (_ BitVec 8))) (size!3024 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6684)

(declare-datatypes ((BitStream!5306 0))(
  ( (BitStream!5307 (buf!3499 array!6684) (currentByte!6413 (_ BitVec 32)) (currentBit!6408 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13270 0))(
  ( (tuple2!13271 (_1!6999 BitStream!5306) (_2!6999 array!6684)) )
))
(declare-fun lt!232510 () tuple2!13270)

(declare-fun b!149070 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!99498 () Bool)

(declare-fun arrayRangesEq!340 (array!6684 array!6684 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149070 (= e!99498 (not (arrayRangesEq!340 arr!237 (_2!6999 lt!232510) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!149071 () Bool)

(declare-fun res!124826 () Bool)

(declare-fun e!99495 () Bool)

(assert (=> b!149071 (=> (not res!124826) (not e!99495))))

(declare-datatypes ((Unit!9439 0))(
  ( (Unit!9440) )
))
(declare-datatypes ((tuple2!13272 0))(
  ( (tuple2!13273 (_1!7000 Unit!9439) (_2!7000 BitStream!5306)) )
))
(declare-fun lt!232500 () tuple2!13272)

(declare-fun lt!232512 () tuple2!13272)

(declare-fun isPrefixOf!0 (BitStream!5306 BitStream!5306) Bool)

(assert (=> b!149071 (= res!124826 (isPrefixOf!0 (_2!7000 lt!232500) (_2!7000 lt!232512)))))

(declare-fun b!149072 () Bool)

(declare-fun res!124838 () Bool)

(declare-fun e!99497 () Bool)

(assert (=> b!149072 (=> (not res!124838) (not e!99497))))

(declare-fun thiss!1634 () BitStream!5306)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149072 (= res!124838 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3024 (buf!3499 thiss!1634))) ((_ sign_extend 32) (currentByte!6413 thiss!1634)) ((_ sign_extend 32) (currentBit!6408 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149073 () Bool)

(declare-fun res!124830 () Bool)

(assert (=> b!149073 (=> (not res!124830) (not e!99497))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149073 (= res!124830 (invariant!0 (currentBit!6408 thiss!1634) (currentByte!6413 thiss!1634) (size!3024 (buf!3499 thiss!1634))))))

(declare-fun res!124828 () Bool)

(assert (=> start!28762 (=> (not res!124828) (not e!99497))))

(assert (=> start!28762 (= res!124828 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3024 arr!237))))))

(assert (=> start!28762 e!99497))

(assert (=> start!28762 true))

(declare-fun array_inv!2813 (array!6684) Bool)

(assert (=> start!28762 (array_inv!2813 arr!237)))

(declare-fun e!99493 () Bool)

(declare-fun inv!12 (BitStream!5306) Bool)

(assert (=> start!28762 (and (inv!12 thiss!1634) e!99493)))

(declare-fun b!149074 () Bool)

(declare-fun res!124829 () Bool)

(declare-fun e!99489 () Bool)

(assert (=> b!149074 (=> (not res!124829) (not e!99489))))

(assert (=> b!149074 (= res!124829 (isPrefixOf!0 thiss!1634 (_2!7000 lt!232500)))))

(declare-fun b!149075 () Bool)

(assert (=> b!149075 (= e!99495 (not e!99498))))

(declare-fun res!124825 () Bool)

(assert (=> b!149075 (=> res!124825 e!99498)))

(declare-datatypes ((tuple2!13274 0))(
  ( (tuple2!13275 (_1!7001 BitStream!5306) (_2!7001 BitStream!5306)) )
))
(declare-fun lt!232498 () tuple2!13274)

(assert (=> b!149075 (= res!124825 (or (not (= (size!3024 (_2!6999 lt!232510)) (size!3024 arr!237))) (not (= (_1!6999 lt!232510) (_2!7001 lt!232498)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5306 array!6684 (_ BitVec 32) (_ BitVec 32)) tuple2!13270)

(assert (=> b!149075 (= lt!232510 (readByteArrayLoopPure!0 (_1!7001 lt!232498) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232507 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149075 (validate_offset_bits!1 ((_ sign_extend 32) (size!3024 (buf!3499 (_2!7000 lt!232512)))) ((_ sign_extend 32) (currentByte!6413 (_2!7000 lt!232500))) ((_ sign_extend 32) (currentBit!6408 (_2!7000 lt!232500))) lt!232507)))

(declare-fun lt!232506 () Unit!9439)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5306 array!6684 (_ BitVec 64)) Unit!9439)

(assert (=> b!149075 (= lt!232506 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7000 lt!232500) (buf!3499 (_2!7000 lt!232512)) lt!232507))))

(declare-fun reader!0 (BitStream!5306 BitStream!5306) tuple2!13274)

(assert (=> b!149075 (= lt!232498 (reader!0 (_2!7000 lt!232500) (_2!7000 lt!232512)))))

(declare-fun b!149076 () Bool)

(declare-fun e!99499 () Bool)

(assert (=> b!149076 (= e!99497 (not e!99499))))

(declare-fun res!124836 () Bool)

(assert (=> b!149076 (=> res!124836 e!99499)))

(declare-fun lt!232513 () tuple2!13270)

(declare-fun lt!232517 () tuple2!13270)

(assert (=> b!149076 (= res!124836 (not (arrayRangesEq!340 (_2!6999 lt!232517) (_2!6999 lt!232513) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!232521 () tuple2!13270)

(assert (=> b!149076 (arrayRangesEq!340 (_2!6999 lt!232517) (_2!6999 lt!232521) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232511 () tuple2!13274)

(declare-fun lt!232509 () Unit!9439)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5306 array!6684 (_ BitVec 32) (_ BitVec 32)) Unit!9439)

(assert (=> b!149076 (= lt!232509 (readByteArrayLoopArrayPrefixLemma!0 (_1!7001 lt!232511) arr!237 from!447 to!404))))

(declare-fun lt!232501 () array!6684)

(declare-fun withMovedByteIndex!0 (BitStream!5306 (_ BitVec 32)) BitStream!5306)

(assert (=> b!149076 (= lt!232521 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7001 lt!232511) #b00000000000000000000000000000001) lt!232501 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!232505 () tuple2!13274)

(assert (=> b!149076 (= lt!232513 (readByteArrayLoopPure!0 (_1!7001 lt!232505) lt!232501 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13276 0))(
  ( (tuple2!13277 (_1!7002 BitStream!5306) (_2!7002 (_ BitVec 8))) )
))
(declare-fun lt!232496 () tuple2!13276)

(assert (=> b!149076 (= lt!232501 (array!6685 (store (arr!3808 arr!237) from!447 (_2!7002 lt!232496)) (size!3024 arr!237)))))

(declare-fun lt!232499 () (_ BitVec 32))

(assert (=> b!149076 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3024 (buf!3499 (_2!7000 lt!232512)))) ((_ sign_extend 32) (currentByte!6413 (_2!7000 lt!232500))) ((_ sign_extend 32) (currentBit!6408 (_2!7000 lt!232500))) lt!232499)))

(declare-fun lt!232508 () Unit!9439)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5306 array!6684 (_ BitVec 32)) Unit!9439)

(assert (=> b!149076 (= lt!232508 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7000 lt!232500) (buf!3499 (_2!7000 lt!232512)) lt!232499))))

(assert (=> b!149076 (= (_1!6999 lt!232517) (_2!7001 lt!232511))))

(assert (=> b!149076 (= lt!232517 (readByteArrayLoopPure!0 (_1!7001 lt!232511) arr!237 from!447 to!404))))

(assert (=> b!149076 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3024 (buf!3499 (_2!7000 lt!232512)))) ((_ sign_extend 32) (currentByte!6413 thiss!1634)) ((_ sign_extend 32) (currentBit!6408 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!232518 () Unit!9439)

(assert (=> b!149076 (= lt!232518 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3499 (_2!7000 lt!232512)) (bvsub to!404 from!447)))))

(assert (=> b!149076 (= (_2!7002 lt!232496) (select (arr!3808 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5306) tuple2!13276)

(assert (=> b!149076 (= lt!232496 (readBytePure!0 (_1!7001 lt!232511)))))

(assert (=> b!149076 (= lt!232505 (reader!0 (_2!7000 lt!232500) (_2!7000 lt!232512)))))

(assert (=> b!149076 (= lt!232511 (reader!0 thiss!1634 (_2!7000 lt!232512)))))

(declare-fun e!99491 () Bool)

(assert (=> b!149076 e!99491))

(declare-fun res!124835 () Bool)

(assert (=> b!149076 (=> (not res!124835) (not e!99491))))

(declare-fun lt!232519 () tuple2!13276)

(declare-fun lt!232502 () tuple2!13276)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149076 (= res!124835 (= (bitIndex!0 (size!3024 (buf!3499 (_1!7002 lt!232519))) (currentByte!6413 (_1!7002 lt!232519)) (currentBit!6408 (_1!7002 lt!232519))) (bitIndex!0 (size!3024 (buf!3499 (_1!7002 lt!232502))) (currentByte!6413 (_1!7002 lt!232502)) (currentBit!6408 (_1!7002 lt!232502)))))))

(declare-fun lt!232516 () Unit!9439)

(declare-fun lt!232520 () BitStream!5306)

(declare-fun readBytePrefixLemma!0 (BitStream!5306 BitStream!5306) Unit!9439)

(assert (=> b!149076 (= lt!232516 (readBytePrefixLemma!0 lt!232520 (_2!7000 lt!232512)))))

(assert (=> b!149076 (= lt!232502 (readBytePure!0 (BitStream!5307 (buf!3499 (_2!7000 lt!232512)) (currentByte!6413 thiss!1634) (currentBit!6408 thiss!1634))))))

(assert (=> b!149076 (= lt!232519 (readBytePure!0 lt!232520))))

(assert (=> b!149076 (= lt!232520 (BitStream!5307 (buf!3499 (_2!7000 lt!232500)) (currentByte!6413 thiss!1634) (currentBit!6408 thiss!1634)))))

(declare-fun e!99496 () Bool)

(assert (=> b!149076 e!99496))

(declare-fun res!124831 () Bool)

(assert (=> b!149076 (=> (not res!124831) (not e!99496))))

(assert (=> b!149076 (= res!124831 (isPrefixOf!0 thiss!1634 (_2!7000 lt!232512)))))

(declare-fun lt!232514 () Unit!9439)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5306 BitStream!5306 BitStream!5306) Unit!9439)

(assert (=> b!149076 (= lt!232514 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7000 lt!232500) (_2!7000 lt!232512)))))

(declare-fun e!99490 () Bool)

(assert (=> b!149076 e!99490))

(declare-fun res!124827 () Bool)

(assert (=> b!149076 (=> (not res!124827) (not e!99490))))

(assert (=> b!149076 (= res!124827 (= (size!3024 (buf!3499 (_2!7000 lt!232500))) (size!3024 (buf!3499 (_2!7000 lt!232512)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5306 array!6684 (_ BitVec 32) (_ BitVec 32)) tuple2!13272)

(assert (=> b!149076 (= lt!232512 (appendByteArrayLoop!0 (_2!7000 lt!232500) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149076 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3024 (buf!3499 (_2!7000 lt!232500)))) ((_ sign_extend 32) (currentByte!6413 (_2!7000 lt!232500))) ((_ sign_extend 32) (currentBit!6408 (_2!7000 lt!232500))) lt!232499)))

(assert (=> b!149076 (= lt!232499 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!232515 () Unit!9439)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5306 BitStream!5306 (_ BitVec 64) (_ BitVec 32)) Unit!9439)

(assert (=> b!149076 (= lt!232515 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7000 lt!232500) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149076 e!99489))

(declare-fun res!124832 () Bool)

(assert (=> b!149076 (=> (not res!124832) (not e!99489))))

(assert (=> b!149076 (= res!124832 (= (size!3024 (buf!3499 thiss!1634)) (size!3024 (buf!3499 (_2!7000 lt!232500)))))))

(declare-fun appendByte!0 (BitStream!5306 (_ BitVec 8)) tuple2!13272)

(assert (=> b!149076 (= lt!232500 (appendByte!0 thiss!1634 (select (arr!3808 arr!237) from!447)))))

(declare-fun b!149077 () Bool)

(declare-fun res!124837 () Bool)

(assert (=> b!149077 (=> (not res!124837) (not e!99497))))

(assert (=> b!149077 (= res!124837 (bvslt from!447 to!404))))

(declare-fun b!149078 () Bool)

(declare-fun lt!232503 () tuple2!13274)

(declare-fun lt!232497 () tuple2!13276)

(assert (=> b!149078 (= e!99489 (and (= (_2!7002 lt!232497) (select (arr!3808 arr!237) from!447)) (= (_1!7002 lt!232497) (_2!7001 lt!232503))))))

(assert (=> b!149078 (= lt!232497 (readBytePure!0 (_1!7001 lt!232503)))))

(assert (=> b!149078 (= lt!232503 (reader!0 thiss!1634 (_2!7000 lt!232500)))))

(declare-fun b!149079 () Bool)

(assert (=> b!149079 (= e!99491 (= (_2!7002 lt!232519) (_2!7002 lt!232502)))))

(declare-fun b!149080 () Bool)

(assert (=> b!149080 (= e!99499 true)))

(assert (=> b!149080 (arrayRangesEq!340 (_2!6999 lt!232513) (_2!6999 lt!232517) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!232504 () Unit!9439)

(declare-fun arrayRangesEqSymmetricLemma!72 (array!6684 array!6684 (_ BitVec 32) (_ BitVec 32)) Unit!9439)

(assert (=> b!149080 (= lt!232504 (arrayRangesEqSymmetricLemma!72 (_2!6999 lt!232517) (_2!6999 lt!232513) #b00000000000000000000000000000000 to!404))))

(declare-fun b!149081 () Bool)

(assert (=> b!149081 (= e!99490 e!99495)))

(declare-fun res!124833 () Bool)

(assert (=> b!149081 (=> (not res!124833) (not e!99495))))

(assert (=> b!149081 (= res!124833 (= (bitIndex!0 (size!3024 (buf!3499 (_2!7000 lt!232512))) (currentByte!6413 (_2!7000 lt!232512)) (currentBit!6408 (_2!7000 lt!232512))) (bvadd (bitIndex!0 (size!3024 (buf!3499 (_2!7000 lt!232500))) (currentByte!6413 (_2!7000 lt!232500)) (currentBit!6408 (_2!7000 lt!232500))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!232507))))))

(assert (=> b!149081 (= lt!232507 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149082 () Bool)

(assert (=> b!149082 (= e!99496 (invariant!0 (currentBit!6408 thiss!1634) (currentByte!6413 thiss!1634) (size!3024 (buf!3499 (_2!7000 lt!232500)))))))

(declare-fun b!149083 () Bool)

(assert (=> b!149083 (= e!99493 (array_inv!2813 (buf!3499 thiss!1634)))))

(declare-fun b!149084 () Bool)

(declare-fun res!124834 () Bool)

(assert (=> b!149084 (=> (not res!124834) (not e!99489))))

(assert (=> b!149084 (= res!124834 (= (bitIndex!0 (size!3024 (buf!3499 (_2!7000 lt!232500))) (currentByte!6413 (_2!7000 lt!232500)) (currentBit!6408 (_2!7000 lt!232500))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3024 (buf!3499 thiss!1634)) (currentByte!6413 thiss!1634) (currentBit!6408 thiss!1634)))))))

(assert (= (and start!28762 res!124828) b!149072))

(assert (= (and b!149072 res!124838) b!149077))

(assert (= (and b!149077 res!124837) b!149073))

(assert (= (and b!149073 res!124830) b!149076))

(assert (= (and b!149076 res!124832) b!149084))

(assert (= (and b!149084 res!124834) b!149074))

(assert (= (and b!149074 res!124829) b!149078))

(assert (= (and b!149076 res!124827) b!149081))

(assert (= (and b!149081 res!124833) b!149071))

(assert (= (and b!149071 res!124826) b!149075))

(assert (= (and b!149075 (not res!124825)) b!149070))

(assert (= (and b!149076 res!124831) b!149082))

(assert (= (and b!149076 res!124835) b!149079))

(assert (= (and b!149076 (not res!124836)) b!149080))

(assert (= start!28762 b!149083))

(declare-fun m!231763 () Bool)

(assert (=> b!149084 m!231763))

(declare-fun m!231765 () Bool)

(assert (=> b!149084 m!231765))

(declare-fun m!231767 () Bool)

(assert (=> start!28762 m!231767))

(declare-fun m!231769 () Bool)

(assert (=> start!28762 m!231769))

(declare-fun m!231771 () Bool)

(assert (=> b!149071 m!231771))

(declare-fun m!231773 () Bool)

(assert (=> b!149073 m!231773))

(declare-fun m!231775 () Bool)

(assert (=> b!149074 m!231775))

(declare-fun m!231777 () Bool)

(assert (=> b!149070 m!231777))

(declare-fun m!231779 () Bool)

(assert (=> b!149075 m!231779))

(declare-fun m!231781 () Bool)

(assert (=> b!149075 m!231781))

(declare-fun m!231783 () Bool)

(assert (=> b!149075 m!231783))

(declare-fun m!231785 () Bool)

(assert (=> b!149075 m!231785))

(declare-fun m!231787 () Bool)

(assert (=> b!149078 m!231787))

(declare-fun m!231789 () Bool)

(assert (=> b!149078 m!231789))

(declare-fun m!231791 () Bool)

(assert (=> b!149078 m!231791))

(declare-fun m!231793 () Bool)

(assert (=> b!149082 m!231793))

(declare-fun m!231795 () Bool)

(assert (=> b!149081 m!231795))

(assert (=> b!149081 m!231763))

(declare-fun m!231797 () Bool)

(assert (=> b!149072 m!231797))

(declare-fun m!231799 () Bool)

(assert (=> b!149080 m!231799))

(declare-fun m!231801 () Bool)

(assert (=> b!149080 m!231801))

(declare-fun m!231803 () Bool)

(assert (=> b!149076 m!231803))

(declare-fun m!231805 () Bool)

(assert (=> b!149076 m!231805))

(declare-fun m!231807 () Bool)

(assert (=> b!149076 m!231807))

(declare-fun m!231809 () Bool)

(assert (=> b!149076 m!231809))

(declare-fun m!231811 () Bool)

(assert (=> b!149076 m!231811))

(declare-fun m!231813 () Bool)

(assert (=> b!149076 m!231813))

(declare-fun m!231815 () Bool)

(assert (=> b!149076 m!231815))

(assert (=> b!149076 m!231815))

(declare-fun m!231817 () Bool)

(assert (=> b!149076 m!231817))

(declare-fun m!231819 () Bool)

(assert (=> b!149076 m!231819))

(declare-fun m!231821 () Bool)

(assert (=> b!149076 m!231821))

(declare-fun m!231823 () Bool)

(assert (=> b!149076 m!231823))

(declare-fun m!231825 () Bool)

(assert (=> b!149076 m!231825))

(declare-fun m!231827 () Bool)

(assert (=> b!149076 m!231827))

(assert (=> b!149076 m!231787))

(declare-fun m!231829 () Bool)

(assert (=> b!149076 m!231829))

(declare-fun m!231831 () Bool)

(assert (=> b!149076 m!231831))

(declare-fun m!231833 () Bool)

(assert (=> b!149076 m!231833))

(declare-fun m!231835 () Bool)

(assert (=> b!149076 m!231835))

(declare-fun m!231837 () Bool)

(assert (=> b!149076 m!231837))

(declare-fun m!231839 () Bool)

(assert (=> b!149076 m!231839))

(declare-fun m!231841 () Bool)

(assert (=> b!149076 m!231841))

(declare-fun m!231843 () Bool)

(assert (=> b!149076 m!231843))

(declare-fun m!231845 () Bool)

(assert (=> b!149076 m!231845))

(assert (=> b!149076 m!231785))

(declare-fun m!231847 () Bool)

(assert (=> b!149076 m!231847))

(assert (=> b!149076 m!231787))

(declare-fun m!231849 () Bool)

(assert (=> b!149076 m!231849))

(declare-fun m!231851 () Bool)

(assert (=> b!149076 m!231851))

(declare-fun m!231853 () Bool)

(assert (=> b!149083 m!231853))

(push 1)

(assert (not b!149074))

(assert (not b!149081))

(assert (not b!149073))

(assert (not b!149080))

(assert (not b!149083))

(assert (not b!149084))

(assert (not b!149082))

(assert (not b!149076))

(assert (not b!149078))

(assert (not b!149070))

(assert (not b!149072))

