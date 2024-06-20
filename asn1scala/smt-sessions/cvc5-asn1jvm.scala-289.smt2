; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5714 () Bool)

(assert start!5714)

(declare-fun b!24630 () Bool)

(declare-fun e!16811 () Bool)

(declare-datatypes ((array!1637 0))(
  ( (array!1638 (arr!1160 (Array (_ BitVec 32) (_ BitVec 8))) (size!704 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1240 0))(
  ( (BitStream!1241 (buf!1025 array!1637) (currentByte!2338 (_ BitVec 32)) (currentBit!2333 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1240)

(declare-fun array_inv!673 (array!1637) Bool)

(assert (=> b!24630 (= e!16811 (array_inv!673 (buf!1025 thiss!1379)))))

(declare-fun b!24631 () Bool)

(declare-fun res!21271 () Bool)

(declare-fun e!16809 () Bool)

(assert (=> b!24631 (=> (not res!21271) (not e!16809))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24631 (= res!21271 (validate_offset_bits!1 ((_ sign_extend 32) (size!704 (buf!1025 thiss!1379))) ((_ sign_extend 32) (currentByte!2338 thiss!1379)) ((_ sign_extend 32) (currentBit!2333 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24632 () Bool)

(declare-fun lt!35115 () (_ BitVec 64))

(declare-fun e!16807 () Bool)

(declare-datatypes ((Unit!2051 0))(
  ( (Unit!2052) )
))
(declare-datatypes ((tuple2!2798 0))(
  ( (tuple2!2799 (_1!1486 Unit!2051) (_2!1486 BitStream!1240)) )
))
(declare-fun lt!35112 () tuple2!2798)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24632 (= e!16807 (= lt!35115 (bvsub (bvsub (bvadd (bitIndex!0 (size!704 (buf!1025 (_2!1486 lt!35112))) (currentByte!2338 (_2!1486 lt!35112)) (currentBit!2333 (_2!1486 lt!35112))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!21278 () Bool)

(assert (=> start!5714 (=> (not res!21278) (not e!16809))))

(declare-fun srcBuffer!2 () array!1637)

(assert (=> start!5714 (= res!21278 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!704 srcBuffer!2))))))))

(assert (=> start!5714 e!16809))

(assert (=> start!5714 true))

(assert (=> start!5714 (array_inv!673 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1240) Bool)

(assert (=> start!5714 (and (inv!12 thiss!1379) e!16811)))

(declare-fun b!24633 () Bool)

(declare-fun res!21279 () Bool)

(declare-fun e!16804 () Bool)

(assert (=> b!24633 (=> res!21279 e!16804)))

(declare-fun lt!35118 () tuple2!2798)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24633 (= res!21279 (not (invariant!0 (currentBit!2333 (_2!1486 lt!35118)) (currentByte!2338 (_2!1486 lt!35118)) (size!704 (buf!1025 (_2!1486 lt!35118))))))))

(declare-fun e!16808 () Bool)

(declare-fun b!24634 () Bool)

(declare-datatypes ((tuple2!2800 0))(
  ( (tuple2!2801 (_1!1487 BitStream!1240) (_2!1487 BitStream!1240)) )
))
(declare-fun lt!35107 () tuple2!2800)

(declare-datatypes ((List!321 0))(
  ( (Nil!318) (Cons!317 (h!436 Bool) (t!1071 List!321)) )
))
(declare-fun head!158 (List!321) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1240 array!1637 (_ BitVec 64) (_ BitVec 64)) List!321)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1240 BitStream!1240 (_ BitVec 64)) List!321)

(assert (=> b!24634 (= e!16808 (= (head!158 (byteArrayBitContentToList!0 (_2!1486 lt!35112) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!158 (bitStreamReadBitsIntoList!0 (_2!1486 lt!35112) (_1!1487 lt!35107) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24635 () Bool)

(declare-fun e!16812 () Bool)

(assert (=> b!24635 (= e!16812 e!16804)))

(declare-fun res!21275 () Bool)

(assert (=> b!24635 (=> res!21275 e!16804)))

(declare-fun lt!35113 () (_ BitVec 64))

(assert (=> b!24635 (= res!21275 (not (= lt!35115 (bvsub (bvadd lt!35113 to!314) i!635))))))

(assert (=> b!24635 (= lt!35115 (bitIndex!0 (size!704 (buf!1025 (_2!1486 lt!35118))) (currentByte!2338 (_2!1486 lt!35118)) (currentBit!2333 (_2!1486 lt!35118))))))

(declare-fun b!24636 () Bool)

(declare-fun e!16805 () Bool)

(assert (=> b!24636 (= e!16809 (not e!16805))))

(declare-fun res!21268 () Bool)

(assert (=> b!24636 (=> res!21268 e!16805)))

(assert (=> b!24636 (= res!21268 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1240 BitStream!1240) Bool)

(assert (=> b!24636 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35108 () Unit!2051)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1240) Unit!2051)

(assert (=> b!24636 (= lt!35108 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24636 (= lt!35113 (bitIndex!0 (size!704 (buf!1025 thiss!1379)) (currentByte!2338 thiss!1379) (currentBit!2333 thiss!1379)))))

(declare-fun b!24637 () Bool)

(declare-fun res!21270 () Bool)

(declare-fun e!16813 () Bool)

(assert (=> b!24637 (=> res!21270 e!16813)))

(assert (=> b!24637 (= res!21270 (not (invariant!0 (currentBit!2333 (_2!1486 lt!35112)) (currentByte!2338 (_2!1486 lt!35112)) (size!704 (buf!1025 (_2!1486 lt!35112))))))))

(declare-fun b!24638 () Bool)

(declare-fun res!21276 () Bool)

(assert (=> b!24638 (=> res!21276 e!16804)))

(assert (=> b!24638 (= res!21276 (not (= (size!704 (buf!1025 thiss!1379)) (size!704 (buf!1025 (_2!1486 lt!35118))))))))

(declare-fun b!24639 () Bool)

(assert (=> b!24639 (= e!16804 e!16813)))

(declare-fun res!21272 () Bool)

(assert (=> b!24639 (=> res!21272 e!16813)))

(assert (=> b!24639 (= res!21272 (not (= (size!704 (buf!1025 (_2!1486 lt!35112))) (size!704 (buf!1025 (_2!1486 lt!35118))))))))

(assert (=> b!24639 e!16807))

(declare-fun res!21267 () Bool)

(assert (=> b!24639 (=> (not res!21267) (not e!16807))))

(assert (=> b!24639 (= res!21267 (= (size!704 (buf!1025 (_2!1486 lt!35118))) (size!704 (buf!1025 thiss!1379))))))

(declare-fun b!24640 () Bool)

(assert (=> b!24640 (= e!16813 true)))

(declare-fun lt!35114 () (_ BitVec 64))

(assert (=> b!24640 (validate_offset_bits!1 ((_ sign_extend 32) (size!704 (buf!1025 (_2!1486 lt!35118)))) ((_ sign_extend 32) (currentByte!2338 (_2!1486 lt!35112))) ((_ sign_extend 32) (currentBit!2333 (_2!1486 lt!35112))) lt!35114)))

(declare-fun lt!35109 () Unit!2051)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1240 array!1637 (_ BitVec 64)) Unit!2051)

(assert (=> b!24640 (= lt!35109 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1486 lt!35112) (buf!1025 (_2!1486 lt!35118)) lt!35114))))

(declare-fun lt!35116 () tuple2!2800)

(declare-fun reader!0 (BitStream!1240 BitStream!1240) tuple2!2800)

(assert (=> b!24640 (= lt!35116 (reader!0 (_2!1486 lt!35112) (_2!1486 lt!35118)))))

(assert (=> b!24640 (validate_offset_bits!1 ((_ sign_extend 32) (size!704 (buf!1025 (_2!1486 lt!35118)))) ((_ sign_extend 32) (currentByte!2338 thiss!1379)) ((_ sign_extend 32) (currentBit!2333 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35111 () Unit!2051)

(assert (=> b!24640 (= lt!35111 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1025 (_2!1486 lt!35118)) (bvsub to!314 i!635)))))

(declare-fun lt!35117 () tuple2!2800)

(assert (=> b!24640 (= lt!35117 (reader!0 thiss!1379 (_2!1486 lt!35118)))))

(declare-fun b!24641 () Bool)

(declare-fun e!16810 () Bool)

(assert (=> b!24641 (= e!16810 e!16812)))

(declare-fun res!21274 () Bool)

(assert (=> b!24641 (=> res!21274 e!16812)))

(assert (=> b!24641 (= res!21274 (not (isPrefixOf!0 (_2!1486 lt!35112) (_2!1486 lt!35118))))))

(assert (=> b!24641 (isPrefixOf!0 thiss!1379 (_2!1486 lt!35118))))

(declare-fun lt!35110 () Unit!2051)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1240 BitStream!1240 BitStream!1240) Unit!2051)

(assert (=> b!24641 (= lt!35110 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1486 lt!35112) (_2!1486 lt!35118)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1240 array!1637 (_ BitVec 64) (_ BitVec 64)) tuple2!2798)

(assert (=> b!24641 (= lt!35118 (appendBitsMSBFirstLoop!0 (_2!1486 lt!35112) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24641 e!16808))

(declare-fun res!21277 () Bool)

(assert (=> b!24641 (=> (not res!21277) (not e!16808))))

(assert (=> b!24641 (= res!21277 (validate_offset_bits!1 ((_ sign_extend 32) (size!704 (buf!1025 (_2!1486 lt!35112)))) ((_ sign_extend 32) (currentByte!2338 thiss!1379)) ((_ sign_extend 32) (currentBit!2333 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35119 () Unit!2051)

(assert (=> b!24641 (= lt!35119 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1025 (_2!1486 lt!35112)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24641 (= lt!35107 (reader!0 thiss!1379 (_2!1486 lt!35112)))))

(declare-fun b!24642 () Bool)

(declare-fun res!21273 () Bool)

(assert (=> b!24642 (=> res!21273 e!16813)))

(assert (=> b!24642 (= res!21273 (not (invariant!0 (currentBit!2333 (_2!1486 lt!35112)) (currentByte!2338 (_2!1486 lt!35112)) (size!704 (buf!1025 (_2!1486 lt!35118))))))))

(declare-fun b!24643 () Bool)

(assert (=> b!24643 (= e!16805 e!16810)))

(declare-fun res!21269 () Bool)

(assert (=> b!24643 (=> res!21269 e!16810)))

(assert (=> b!24643 (= res!21269 (not (isPrefixOf!0 thiss!1379 (_2!1486 lt!35112))))))

(assert (=> b!24643 (validate_offset_bits!1 ((_ sign_extend 32) (size!704 (buf!1025 (_2!1486 lt!35112)))) ((_ sign_extend 32) (currentByte!2338 (_2!1486 lt!35112))) ((_ sign_extend 32) (currentBit!2333 (_2!1486 lt!35112))) lt!35114)))

(assert (=> b!24643 (= lt!35114 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35106 () Unit!2051)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1240 BitStream!1240 (_ BitVec 64) (_ BitVec 64)) Unit!2051)

(assert (=> b!24643 (= lt!35106 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1486 lt!35112) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1240 (_ BitVec 8) (_ BitVec 32)) tuple2!2798)

(assert (=> b!24643 (= lt!35112 (appendBitFromByte!0 thiss!1379 (select (arr!1160 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5714 res!21278) b!24631))

(assert (= (and b!24631 res!21271) b!24636))

(assert (= (and b!24636 (not res!21268)) b!24643))

(assert (= (and b!24643 (not res!21269)) b!24641))

(assert (= (and b!24641 res!21277) b!24634))

(assert (= (and b!24641 (not res!21274)) b!24635))

(assert (= (and b!24635 (not res!21275)) b!24633))

(assert (= (and b!24633 (not res!21279)) b!24638))

(assert (= (and b!24638 (not res!21276)) b!24639))

(assert (= (and b!24639 res!21267) b!24632))

(assert (= (and b!24639 (not res!21272)) b!24637))

(assert (= (and b!24637 (not res!21270)) b!24642))

(assert (= (and b!24642 (not res!21273)) b!24640))

(assert (= start!5714 b!24630))

(declare-fun m!34821 () Bool)

(assert (=> start!5714 m!34821))

(declare-fun m!34823 () Bool)

(assert (=> start!5714 m!34823))

(declare-fun m!34825 () Bool)

(assert (=> b!24635 m!34825))

(declare-fun m!34827 () Bool)

(assert (=> b!24642 m!34827))

(declare-fun m!34829 () Bool)

(assert (=> b!24630 m!34829))

(declare-fun m!34831 () Bool)

(assert (=> b!24636 m!34831))

(declare-fun m!34833 () Bool)

(assert (=> b!24636 m!34833))

(declare-fun m!34835 () Bool)

(assert (=> b!24636 m!34835))

(declare-fun m!34837 () Bool)

(assert (=> b!24640 m!34837))

(declare-fun m!34839 () Bool)

(assert (=> b!24640 m!34839))

(declare-fun m!34841 () Bool)

(assert (=> b!24640 m!34841))

(declare-fun m!34843 () Bool)

(assert (=> b!24640 m!34843))

(declare-fun m!34845 () Bool)

(assert (=> b!24640 m!34845))

(declare-fun m!34847 () Bool)

(assert (=> b!24640 m!34847))

(declare-fun m!34849 () Bool)

(assert (=> b!24631 m!34849))

(declare-fun m!34851 () Bool)

(assert (=> b!24633 m!34851))

(declare-fun m!34853 () Bool)

(assert (=> b!24641 m!34853))

(declare-fun m!34855 () Bool)

(assert (=> b!24641 m!34855))

(declare-fun m!34857 () Bool)

(assert (=> b!24641 m!34857))

(declare-fun m!34859 () Bool)

(assert (=> b!24641 m!34859))

(declare-fun m!34861 () Bool)

(assert (=> b!24641 m!34861))

(declare-fun m!34863 () Bool)

(assert (=> b!24641 m!34863))

(declare-fun m!34865 () Bool)

(assert (=> b!24641 m!34865))

(declare-fun m!34867 () Bool)

(assert (=> b!24632 m!34867))

(declare-fun m!34869 () Bool)

(assert (=> b!24643 m!34869))

(declare-fun m!34871 () Bool)

(assert (=> b!24643 m!34871))

(declare-fun m!34873 () Bool)

(assert (=> b!24643 m!34873))

(declare-fun m!34875 () Bool)

(assert (=> b!24643 m!34875))

(assert (=> b!24643 m!34871))

(declare-fun m!34877 () Bool)

(assert (=> b!24643 m!34877))

(declare-fun m!34879 () Bool)

(assert (=> b!24634 m!34879))

(assert (=> b!24634 m!34879))

(declare-fun m!34881 () Bool)

(assert (=> b!24634 m!34881))

(declare-fun m!34883 () Bool)

(assert (=> b!24634 m!34883))

(assert (=> b!24634 m!34883))

(declare-fun m!34885 () Bool)

(assert (=> b!24634 m!34885))

(declare-fun m!34887 () Bool)

(assert (=> b!24637 m!34887))

(push 1)

