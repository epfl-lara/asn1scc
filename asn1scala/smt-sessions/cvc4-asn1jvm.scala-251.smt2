; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4868 () Bool)

(assert start!4868)

(declare-fun b!19324 () Bool)

(declare-fun res!16883 () Bool)

(declare-fun e!12819 () Bool)

(assert (=> b!19324 (=> (not res!16883) (not e!12819))))

(declare-datatypes ((array!1392 0))(
  ( (array!1393 (arr!1032 (Array (_ BitVec 32) (_ BitVec 8))) (size!591 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1016 0))(
  ( (BitStream!1017 (buf!891 array!1392) (currentByte!2171 (_ BitVec 32)) (currentBit!2166 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1016)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19324 (= res!16883 (validate_offset_bits!1 ((_ sign_extend 32) (size!591 (buf!891 thiss!1379))) ((_ sign_extend 32) (currentByte!2171 thiss!1379)) ((_ sign_extend 32) (currentBit!2166 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!16882 () Bool)

(assert (=> start!4868 (=> (not res!16882) (not e!12819))))

(declare-fun srcBuffer!2 () array!1392)

(assert (=> start!4868 (= res!16882 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!591 srcBuffer!2))))))))

(assert (=> start!4868 e!12819))

(assert (=> start!4868 true))

(declare-fun array_inv!561 (array!1392) Bool)

(assert (=> start!4868 (array_inv!561 srcBuffer!2)))

(declare-fun e!12818 () Bool)

(declare-fun inv!12 (BitStream!1016) Bool)

(assert (=> start!4868 (and (inv!12 thiss!1379) e!12818)))

(declare-fun b!19325 () Bool)

(declare-fun e!12820 () Bool)

(assert (=> b!19325 (= e!12819 (not e!12820))))

(declare-fun res!16881 () Bool)

(assert (=> b!19325 (=> res!16881 e!12820)))

(assert (=> b!19325 (= res!16881 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1016 BitStream!1016) Bool)

(assert (=> b!19325 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1726 0))(
  ( (Unit!1727) )
))
(declare-fun lt!27399 () Unit!1726)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1016) Unit!1726)

(assert (=> b!19325 (= lt!27399 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27397 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19325 (= lt!27397 (bitIndex!0 (size!591 (buf!891 thiss!1379)) (currentByte!2171 thiss!1379) (currentBit!2166 thiss!1379)))))

(declare-fun b!19326 () Bool)

(declare-fun e!12817 () Bool)

(assert (=> b!19326 (= e!12820 e!12817)))

(declare-fun res!16880 () Bool)

(assert (=> b!19326 (=> res!16880 e!12817)))

(declare-datatypes ((tuple2!2212 0))(
  ( (tuple2!2213 (_1!1191 Unit!1726) (_2!1191 BitStream!1016)) )
))
(declare-fun lt!27395 () tuple2!2212)

(assert (=> b!19326 (= res!16880 (not (isPrefixOf!0 thiss!1379 (_2!1191 lt!27395))))))

(assert (=> b!19326 (validate_offset_bits!1 ((_ sign_extend 32) (size!591 (buf!891 (_2!1191 lt!27395)))) ((_ sign_extend 32) (currentByte!2171 (_2!1191 lt!27395))) ((_ sign_extend 32) (currentBit!2166 (_2!1191 lt!27395))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27396 () Unit!1726)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1016 BitStream!1016 (_ BitVec 64) (_ BitVec 64)) Unit!1726)

(assert (=> b!19326 (= lt!27396 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1191 lt!27395) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1016 (_ BitVec 8) (_ BitVec 32)) tuple2!2212)

(assert (=> b!19326 (= lt!27395 (appendBitFromByte!0 thiss!1379 (select (arr!1032 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19327 () Bool)

(assert (=> b!19327 (= e!12817 true)))

(assert (=> b!19327 (validate_offset_bits!1 ((_ sign_extend 32) (size!591 (buf!891 (_2!1191 lt!27395)))) ((_ sign_extend 32) (currentByte!2171 thiss!1379)) ((_ sign_extend 32) (currentBit!2166 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27398 () Unit!1726)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1016 array!1392 (_ BitVec 64)) Unit!1726)

(assert (=> b!19327 (= lt!27398 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!891 (_2!1191 lt!27395)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2214 0))(
  ( (tuple2!2215 (_1!1192 BitStream!1016) (_2!1192 BitStream!1016)) )
))
(declare-fun lt!27400 () tuple2!2214)

(declare-fun reader!0 (BitStream!1016 BitStream!1016) tuple2!2214)

(assert (=> b!19327 (= lt!27400 (reader!0 thiss!1379 (_2!1191 lt!27395)))))

(declare-fun b!19328 () Bool)

(assert (=> b!19328 (= e!12818 (array_inv!561 (buf!891 thiss!1379)))))

(assert (= (and start!4868 res!16882) b!19324))

(assert (= (and b!19324 res!16883) b!19325))

(assert (= (and b!19325 (not res!16881)) b!19326))

(assert (= (and b!19326 (not res!16880)) b!19327))

(assert (= start!4868 b!19328))

(declare-fun m!26001 () Bool)

(assert (=> b!19324 m!26001))

(declare-fun m!26003 () Bool)

(assert (=> b!19327 m!26003))

(declare-fun m!26005 () Bool)

(assert (=> b!19327 m!26005))

(declare-fun m!26007 () Bool)

(assert (=> b!19327 m!26007))

(declare-fun m!26009 () Bool)

(assert (=> b!19328 m!26009))

(declare-fun m!26011 () Bool)

(assert (=> b!19325 m!26011))

(declare-fun m!26013 () Bool)

(assert (=> b!19325 m!26013))

(declare-fun m!26015 () Bool)

(assert (=> b!19325 m!26015))

(declare-fun m!26017 () Bool)

(assert (=> b!19326 m!26017))

(declare-fun m!26019 () Bool)

(assert (=> b!19326 m!26019))

(declare-fun m!26021 () Bool)

(assert (=> b!19326 m!26021))

(declare-fun m!26023 () Bool)

(assert (=> b!19326 m!26023))

(declare-fun m!26025 () Bool)

(assert (=> b!19326 m!26025))

(assert (=> b!19326 m!26021))

(declare-fun m!26027 () Bool)

(assert (=> start!4868 m!26027))

(declare-fun m!26029 () Bool)

(assert (=> start!4868 m!26029))

(push 1)

(assert (not b!19325))

(assert (not b!19324))

(assert (not b!19327))

(assert (not b!19328))

(assert (not b!19326))

(assert (not start!4868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

