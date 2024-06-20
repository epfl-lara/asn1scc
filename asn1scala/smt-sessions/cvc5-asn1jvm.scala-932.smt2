; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26366 () Bool)

(assert start!26366)

(declare-fun b!135111 () Bool)

(declare-fun e!89672 () Bool)

(declare-fun e!89677 () Bool)

(assert (=> b!135111 (= e!89672 (not e!89677))))

(declare-fun res!112340 () Bool)

(assert (=> b!135111 (=> res!112340 e!89677)))

(declare-datatypes ((array!6166 0))(
  ( (array!6167 (arr!3456 (Array (_ BitVec 32) (_ BitVec 8))) (size!2791 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6166)

(declare-datatypes ((BitStream!4846 0))(
  ( (BitStream!4847 (buf!3184 array!6166) (currentByte!5981 (_ BitVec 32)) (currentBit!5976 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11724 0))(
  ( (tuple2!11725 (_1!6178 BitStream!4846) (_2!6178 BitStream!4846)) )
))
(declare-fun lt!209668 () tuple2!11724)

(declare-datatypes ((tuple2!11726 0))(
  ( (tuple2!11727 (_1!6179 BitStream!4846) (_2!6179 array!6166)) )
))
(declare-fun lt!209663 () tuple2!11726)

(assert (=> b!135111 (= res!112340 (or (not (= (size!2791 (_2!6179 lt!209663)) (size!2791 arr!237))) (not (= (_1!6179 lt!209663) (_2!6178 lt!209668)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!4846 array!6166 (_ BitVec 32) (_ BitVec 32)) tuple2!11726)

(assert (=> b!135111 (= lt!209663 (readByteArrayLoopPure!0 (_1!6178 lt!209668) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!8420 0))(
  ( (Unit!8421) )
))
(declare-datatypes ((tuple2!11728 0))(
  ( (tuple2!11729 (_1!6180 Unit!8420) (_2!6180 BitStream!4846)) )
))
(declare-fun lt!209675 () tuple2!11728)

(declare-fun lt!209672 () tuple2!11728)

(declare-fun lt!209660 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135111 (validate_offset_bits!1 ((_ sign_extend 32) (size!2791 (buf!3184 (_2!6180 lt!209675)))) ((_ sign_extend 32) (currentByte!5981 (_2!6180 lt!209672))) ((_ sign_extend 32) (currentBit!5976 (_2!6180 lt!209672))) lt!209660)))

(declare-fun lt!209664 () Unit!8420)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4846 array!6166 (_ BitVec 64)) Unit!8420)

(assert (=> b!135111 (= lt!209664 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6180 lt!209672) (buf!3184 (_2!6180 lt!209675)) lt!209660))))

(declare-fun reader!0 (BitStream!4846 BitStream!4846) tuple2!11724)

(assert (=> b!135111 (= lt!209668 (reader!0 (_2!6180 lt!209672) (_2!6180 lt!209675)))))

(declare-fun b!135112 () Bool)

(declare-fun e!89674 () Bool)

(assert (=> b!135112 (= e!89674 e!89672)))

(declare-fun res!112350 () Bool)

(assert (=> b!135112 (=> (not res!112350) (not e!89672))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135112 (= res!112350 (= (bitIndex!0 (size!2791 (buf!3184 (_2!6180 lt!209675))) (currentByte!5981 (_2!6180 lt!209675)) (currentBit!5976 (_2!6180 lt!209675))) (bvadd (bitIndex!0 (size!2791 (buf!3184 (_2!6180 lt!209672))) (currentByte!5981 (_2!6180 lt!209672)) (currentBit!5976 (_2!6180 lt!209672))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209660))))))

(assert (=> b!135112 (= lt!209660 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135113 () Bool)

(declare-fun e!89679 () Bool)

(declare-fun thiss!1634 () BitStream!4846)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135113 (= e!89679 (invariant!0 (currentBit!5976 thiss!1634) (currentByte!5981 thiss!1634) (size!2791 (buf!3184 (_2!6180 lt!209672)))))))

(declare-fun b!135114 () Bool)

(declare-fun res!112339 () Bool)

(declare-fun e!89681 () Bool)

(assert (=> b!135114 (=> (not res!112339) (not e!89681))))

(declare-fun isPrefixOf!0 (BitStream!4846 BitStream!4846) Bool)

(assert (=> b!135114 (= res!112339 (isPrefixOf!0 thiss!1634 (_2!6180 lt!209672)))))

(declare-fun b!135115 () Bool)

(declare-fun res!112345 () Bool)

(declare-fun e!89682 () Bool)

(assert (=> b!135115 (=> (not res!112345) (not e!89682))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135115 (= res!112345 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2791 (buf!3184 thiss!1634))) ((_ sign_extend 32) (currentByte!5981 thiss!1634)) ((_ sign_extend 32) (currentBit!5976 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135116 () Bool)

(declare-fun e!89680 () Bool)

(declare-fun array_inv!2580 (array!6166) Bool)

(assert (=> b!135116 (= e!89680 (array_inv!2580 (buf!3184 thiss!1634)))))

(declare-fun res!112337 () Bool)

(assert (=> start!26366 (=> (not res!112337) (not e!89682))))

(assert (=> start!26366 (= res!112337 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2791 arr!237))))))

(assert (=> start!26366 e!89682))

(assert (=> start!26366 true))

(assert (=> start!26366 (array_inv!2580 arr!237)))

(declare-fun inv!12 (BitStream!4846) Bool)

(assert (=> start!26366 (and (inv!12 thiss!1634) e!89680)))

(declare-fun b!135117 () Bool)

(declare-fun e!89675 () Bool)

(declare-datatypes ((tuple2!11730 0))(
  ( (tuple2!11731 (_1!6181 BitStream!4846) (_2!6181 (_ BitVec 8))) )
))
(declare-fun lt!209676 () tuple2!11730)

(declare-fun lt!209671 () tuple2!11730)

(assert (=> b!135117 (= e!89675 (= (_2!6181 lt!209676) (_2!6181 lt!209671)))))

(declare-fun b!135118 () Bool)

(declare-fun arrayRangesEq!194 (array!6166 array!6166 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135118 (= e!89677 (not (arrayRangesEq!194 arr!237 (_2!6179 lt!209663) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135119 () Bool)

(declare-fun res!112338 () Bool)

(assert (=> b!135119 (=> (not res!112338) (not e!89682))))

(assert (=> b!135119 (= res!112338 (bvslt from!447 to!404))))

(declare-fun b!135120 () Bool)

(declare-fun e!89678 () Bool)

(assert (=> b!135120 (= e!89682 (not e!89678))))

(declare-fun res!112343 () Bool)

(assert (=> b!135120 (=> res!112343 e!89678)))

(declare-fun lt!209669 () tuple2!11726)

(declare-fun lt!209683 () tuple2!11726)

(assert (=> b!135120 (= res!112343 (not (arrayRangesEq!194 (_2!6179 lt!209669) (_2!6179 lt!209683) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209673 () tuple2!11726)

(assert (=> b!135120 (arrayRangesEq!194 (_2!6179 lt!209669) (_2!6179 lt!209673) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209678 () tuple2!11724)

(declare-fun lt!209677 () Unit!8420)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4846 array!6166 (_ BitVec 32) (_ BitVec 32)) Unit!8420)

(assert (=> b!135120 (= lt!209677 (readByteArrayLoopArrayPrefixLemma!0 (_1!6178 lt!209678) arr!237 from!447 to!404))))

(declare-fun lt!209662 () array!6166)

(declare-fun withMovedByteIndex!0 (BitStream!4846 (_ BitVec 32)) BitStream!4846)

(assert (=> b!135120 (= lt!209673 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6178 lt!209678) #b00000000000000000000000000000001) lt!209662 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209670 () tuple2!11724)

(assert (=> b!135120 (= lt!209683 (readByteArrayLoopPure!0 (_1!6178 lt!209670) lt!209662 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209667 () tuple2!11730)

(assert (=> b!135120 (= lt!209662 (array!6167 (store (arr!3456 arr!237) from!447 (_2!6181 lt!209667)) (size!2791 arr!237)))))

(declare-fun lt!209661 () (_ BitVec 32))

(assert (=> b!135120 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2791 (buf!3184 (_2!6180 lt!209675)))) ((_ sign_extend 32) (currentByte!5981 (_2!6180 lt!209672))) ((_ sign_extend 32) (currentBit!5976 (_2!6180 lt!209672))) lt!209661)))

(declare-fun lt!209681 () Unit!8420)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4846 array!6166 (_ BitVec 32)) Unit!8420)

(assert (=> b!135120 (= lt!209681 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6180 lt!209672) (buf!3184 (_2!6180 lt!209675)) lt!209661))))

(assert (=> b!135120 (= (_1!6179 lt!209669) (_2!6178 lt!209678))))

(assert (=> b!135120 (= lt!209669 (readByteArrayLoopPure!0 (_1!6178 lt!209678) arr!237 from!447 to!404))))

(assert (=> b!135120 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2791 (buf!3184 (_2!6180 lt!209675)))) ((_ sign_extend 32) (currentByte!5981 thiss!1634)) ((_ sign_extend 32) (currentBit!5976 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209658 () Unit!8420)

(assert (=> b!135120 (= lt!209658 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3184 (_2!6180 lt!209675)) (bvsub to!404 from!447)))))

(assert (=> b!135120 (= (_2!6181 lt!209667) (select (arr!3456 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4846) tuple2!11730)

(assert (=> b!135120 (= lt!209667 (readBytePure!0 (_1!6178 lt!209678)))))

(assert (=> b!135120 (= lt!209670 (reader!0 (_2!6180 lt!209672) (_2!6180 lt!209675)))))

(assert (=> b!135120 (= lt!209678 (reader!0 thiss!1634 (_2!6180 lt!209675)))))

(assert (=> b!135120 e!89675))

(declare-fun res!112341 () Bool)

(assert (=> b!135120 (=> (not res!112341) (not e!89675))))

(assert (=> b!135120 (= res!112341 (= (bitIndex!0 (size!2791 (buf!3184 (_1!6181 lt!209676))) (currentByte!5981 (_1!6181 lt!209676)) (currentBit!5976 (_1!6181 lt!209676))) (bitIndex!0 (size!2791 (buf!3184 (_1!6181 lt!209671))) (currentByte!5981 (_1!6181 lt!209671)) (currentBit!5976 (_1!6181 lt!209671)))))))

(declare-fun lt!209679 () Unit!8420)

(declare-fun lt!209659 () BitStream!4846)

(declare-fun readBytePrefixLemma!0 (BitStream!4846 BitStream!4846) Unit!8420)

(assert (=> b!135120 (= lt!209679 (readBytePrefixLemma!0 lt!209659 (_2!6180 lt!209675)))))

(assert (=> b!135120 (= lt!209671 (readBytePure!0 (BitStream!4847 (buf!3184 (_2!6180 lt!209675)) (currentByte!5981 thiss!1634) (currentBit!5976 thiss!1634))))))

(assert (=> b!135120 (= lt!209676 (readBytePure!0 lt!209659))))

(assert (=> b!135120 (= lt!209659 (BitStream!4847 (buf!3184 (_2!6180 lt!209672)) (currentByte!5981 thiss!1634) (currentBit!5976 thiss!1634)))))

(assert (=> b!135120 e!89679))

(declare-fun res!112348 () Bool)

(assert (=> b!135120 (=> (not res!112348) (not e!89679))))

(assert (=> b!135120 (= res!112348 (isPrefixOf!0 thiss!1634 (_2!6180 lt!209675)))))

(declare-fun lt!209680 () Unit!8420)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4846 BitStream!4846 BitStream!4846) Unit!8420)

(assert (=> b!135120 (= lt!209680 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6180 lt!209672) (_2!6180 lt!209675)))))

(assert (=> b!135120 e!89674))

(declare-fun res!112344 () Bool)

(assert (=> b!135120 (=> (not res!112344) (not e!89674))))

(assert (=> b!135120 (= res!112344 (= (size!2791 (buf!3184 (_2!6180 lt!209672))) (size!2791 (buf!3184 (_2!6180 lt!209675)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4846 array!6166 (_ BitVec 32) (_ BitVec 32)) tuple2!11728)

(assert (=> b!135120 (= lt!209675 (appendByteArrayLoop!0 (_2!6180 lt!209672) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135120 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2791 (buf!3184 (_2!6180 lt!209672)))) ((_ sign_extend 32) (currentByte!5981 (_2!6180 lt!209672))) ((_ sign_extend 32) (currentBit!5976 (_2!6180 lt!209672))) lt!209661)))

(assert (=> b!135120 (= lt!209661 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209665 () Unit!8420)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4846 BitStream!4846 (_ BitVec 64) (_ BitVec 32)) Unit!8420)

(assert (=> b!135120 (= lt!209665 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6180 lt!209672) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135120 e!89681))

(declare-fun res!112342 () Bool)

(assert (=> b!135120 (=> (not res!112342) (not e!89681))))

(assert (=> b!135120 (= res!112342 (= (size!2791 (buf!3184 thiss!1634)) (size!2791 (buf!3184 (_2!6180 lt!209672)))))))

(declare-fun appendByte!0 (BitStream!4846 (_ BitVec 8)) tuple2!11728)

(assert (=> b!135120 (= lt!209672 (appendByte!0 thiss!1634 (select (arr!3456 arr!237) from!447)))))

(declare-fun b!135121 () Bool)

(declare-fun res!112346 () Bool)

(assert (=> b!135121 (=> (not res!112346) (not e!89681))))

(assert (=> b!135121 (= res!112346 (= (bitIndex!0 (size!2791 (buf!3184 (_2!6180 lt!209672))) (currentByte!5981 (_2!6180 lt!209672)) (currentBit!5976 (_2!6180 lt!209672))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2791 (buf!3184 thiss!1634)) (currentByte!5981 thiss!1634) (currentBit!5976 thiss!1634)))))))

(declare-fun b!135122 () Bool)

(declare-fun res!112347 () Bool)

(assert (=> b!135122 (=> (not res!112347) (not e!89672))))

(assert (=> b!135122 (= res!112347 (isPrefixOf!0 (_2!6180 lt!209672) (_2!6180 lt!209675)))))

(declare-fun b!135123 () Bool)

(declare-fun res!112349 () Bool)

(assert (=> b!135123 (=> (not res!112349) (not e!89682))))

(assert (=> b!135123 (= res!112349 (invariant!0 (currentBit!5976 thiss!1634) (currentByte!5981 thiss!1634) (size!2791 (buf!3184 thiss!1634))))))

(declare-fun b!135124 () Bool)

(assert (=> b!135124 (= e!89678 true)))

(assert (=> b!135124 (arrayRangesEq!194 (_2!6179 lt!209683) (_2!6179 lt!209669) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209674 () Unit!8420)

(declare-fun arrayRangesEqSymmetricLemma!7 (array!6166 array!6166 (_ BitVec 32) (_ BitVec 32)) Unit!8420)

(assert (=> b!135124 (= lt!209674 (arrayRangesEqSymmetricLemma!7 (_2!6179 lt!209669) (_2!6179 lt!209683) #b00000000000000000000000000000000 to!404))))

(declare-fun lt!209682 () tuple2!11730)

(declare-fun lt!209666 () tuple2!11724)

(declare-fun b!135125 () Bool)

(assert (=> b!135125 (= e!89681 (and (= (_2!6181 lt!209682) (select (arr!3456 arr!237) from!447)) (= (_1!6181 lt!209682) (_2!6178 lt!209666))))))

(assert (=> b!135125 (= lt!209682 (readBytePure!0 (_1!6178 lt!209666)))))

(assert (=> b!135125 (= lt!209666 (reader!0 thiss!1634 (_2!6180 lt!209672)))))

(assert (= (and start!26366 res!112337) b!135115))

(assert (= (and b!135115 res!112345) b!135119))

(assert (= (and b!135119 res!112338) b!135123))

(assert (= (and b!135123 res!112349) b!135120))

(assert (= (and b!135120 res!112342) b!135121))

(assert (= (and b!135121 res!112346) b!135114))

(assert (= (and b!135114 res!112339) b!135125))

(assert (= (and b!135120 res!112344) b!135112))

(assert (= (and b!135112 res!112350) b!135122))

(assert (= (and b!135122 res!112347) b!135111))

(assert (= (and b!135111 (not res!112340)) b!135118))

(assert (= (and b!135120 res!112348) b!135113))

(assert (= (and b!135120 res!112341) b!135117))

(assert (= (and b!135120 (not res!112343)) b!135124))

(assert (= start!26366 b!135116))

(declare-fun m!205951 () Bool)

(assert (=> b!135115 m!205951))

(declare-fun m!205953 () Bool)

(assert (=> b!135116 m!205953))

(declare-fun m!205955 () Bool)

(assert (=> b!135122 m!205955))

(declare-fun m!205957 () Bool)

(assert (=> start!26366 m!205957))

(declare-fun m!205959 () Bool)

(assert (=> start!26366 m!205959))

(declare-fun m!205961 () Bool)

(assert (=> b!135114 m!205961))

(declare-fun m!205963 () Bool)

(assert (=> b!135121 m!205963))

(declare-fun m!205965 () Bool)

(assert (=> b!135121 m!205965))

(declare-fun m!205967 () Bool)

(assert (=> b!135124 m!205967))

(declare-fun m!205969 () Bool)

(assert (=> b!135124 m!205969))

(declare-fun m!205971 () Bool)

(assert (=> b!135118 m!205971))

(declare-fun m!205973 () Bool)

(assert (=> b!135112 m!205973))

(assert (=> b!135112 m!205963))

(declare-fun m!205975 () Bool)

(assert (=> b!135120 m!205975))

(declare-fun m!205977 () Bool)

(assert (=> b!135120 m!205977))

(declare-fun m!205979 () Bool)

(assert (=> b!135120 m!205979))

(declare-fun m!205981 () Bool)

(assert (=> b!135120 m!205981))

(declare-fun m!205983 () Bool)

(assert (=> b!135120 m!205983))

(declare-fun m!205985 () Bool)

(assert (=> b!135120 m!205985))

(declare-fun m!205987 () Bool)

(assert (=> b!135120 m!205987))

(declare-fun m!205989 () Bool)

(assert (=> b!135120 m!205989))

(declare-fun m!205991 () Bool)

(assert (=> b!135120 m!205991))

(declare-fun m!205993 () Bool)

(assert (=> b!135120 m!205993))

(declare-fun m!205995 () Bool)

(assert (=> b!135120 m!205995))

(declare-fun m!205997 () Bool)

(assert (=> b!135120 m!205997))

(declare-fun m!205999 () Bool)

(assert (=> b!135120 m!205999))

(declare-fun m!206001 () Bool)

(assert (=> b!135120 m!206001))

(declare-fun m!206003 () Bool)

(assert (=> b!135120 m!206003))

(declare-fun m!206005 () Bool)

(assert (=> b!135120 m!206005))

(declare-fun m!206007 () Bool)

(assert (=> b!135120 m!206007))

(declare-fun m!206009 () Bool)

(assert (=> b!135120 m!206009))

(declare-fun m!206011 () Bool)

(assert (=> b!135120 m!206011))

(declare-fun m!206013 () Bool)

(assert (=> b!135120 m!206013))

(declare-fun m!206015 () Bool)

(assert (=> b!135120 m!206015))

(declare-fun m!206017 () Bool)

(assert (=> b!135120 m!206017))

(declare-fun m!206019 () Bool)

(assert (=> b!135120 m!206019))

(declare-fun m!206021 () Bool)

(assert (=> b!135120 m!206021))

(assert (=> b!135120 m!206017))

(declare-fun m!206023 () Bool)

(assert (=> b!135120 m!206023))

(declare-fun m!206025 () Bool)

(assert (=> b!135120 m!206025))

(declare-fun m!206027 () Bool)

(assert (=> b!135120 m!206027))

(assert (=> b!135120 m!205993))

(declare-fun m!206029 () Bool)

(assert (=> b!135113 m!206029))

(declare-fun m!206031 () Bool)

(assert (=> b!135111 m!206031))

(declare-fun m!206033 () Bool)

(assert (=> b!135111 m!206033))

(declare-fun m!206035 () Bool)

(assert (=> b!135111 m!206035))

(assert (=> b!135111 m!205983))

(declare-fun m!206037 () Bool)

(assert (=> b!135123 m!206037))

(assert (=> b!135125 m!205993))

(declare-fun m!206039 () Bool)

(assert (=> b!135125 m!206039))

(declare-fun m!206041 () Bool)

(assert (=> b!135125 m!206041))

(push 1)

(assert (not b!135118))

(assert (not b!135111))

(assert (not b!135116))

(assert (not b!135115))

(assert (not b!135125))

(assert (not b!135124))

(assert (not b!135121))

(assert (not b!135120))

(assert (not b!135122))

(assert (not b!135114))

(assert (not b!135123))

(assert (not start!26366))

(assert (not b!135112))

(assert (not b!135113))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

