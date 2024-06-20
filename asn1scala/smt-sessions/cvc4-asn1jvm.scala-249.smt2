; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4856 () Bool)

(assert start!4856)

(declare-fun b!19234 () Bool)

(declare-fun e!12712 () Bool)

(declare-fun e!12713 () Bool)

(assert (=> b!19234 (= e!12712 (not e!12713))))

(declare-fun res!16811 () Bool)

(assert (=> b!19234 (=> res!16811 e!12713)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19234 (= res!16811 (bvsge i!635 to!314))))

(declare-datatypes ((array!1380 0))(
  ( (array!1381 (arr!1026 (Array (_ BitVec 32) (_ BitVec 8))) (size!585 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1004 0))(
  ( (BitStream!1005 (buf!885 array!1380) (currentByte!2165 (_ BitVec 32)) (currentBit!2160 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1004)

(declare-fun isPrefixOf!0 (BitStream!1004 BitStream!1004) Bool)

(assert (=> b!19234 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1714 0))(
  ( (Unit!1715) )
))
(declare-fun lt!27298 () Unit!1714)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1004) Unit!1714)

(assert (=> b!19234 (= lt!27298 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27300 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19234 (= lt!27300 (bitIndex!0 (size!585 (buf!885 thiss!1379)) (currentByte!2165 thiss!1379) (currentBit!2160 thiss!1379)))))

(declare-fun b!19235 () Bool)

(declare-fun e!12710 () Bool)

(assert (=> b!19235 (= e!12713 e!12710)))

(declare-fun res!16809 () Bool)

(assert (=> b!19235 (=> res!16809 e!12710)))

(declare-datatypes ((tuple2!2188 0))(
  ( (tuple2!2189 (_1!1179 Unit!1714) (_2!1179 BitStream!1004)) )
))
(declare-fun lt!27301 () tuple2!2188)

(assert (=> b!19235 (= res!16809 (not (isPrefixOf!0 thiss!1379 (_2!1179 lt!27301))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19235 (validate_offset_bits!1 ((_ sign_extend 32) (size!585 (buf!885 (_2!1179 lt!27301)))) ((_ sign_extend 32) (currentByte!2165 (_2!1179 lt!27301))) ((_ sign_extend 32) (currentBit!2160 (_2!1179 lt!27301))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27297 () Unit!1714)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1004 BitStream!1004 (_ BitVec 64) (_ BitVec 64)) Unit!1714)

(assert (=> b!19235 (= lt!27297 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1179 lt!27301) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1380)

(declare-fun appendBitFromByte!0 (BitStream!1004 (_ BitVec 8) (_ BitVec 32)) tuple2!2188)

(assert (=> b!19235 (= lt!27301 (appendBitFromByte!0 thiss!1379 (select (arr!1026 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19237 () Bool)

(declare-fun res!16810 () Bool)

(assert (=> b!19237 (=> (not res!16810) (not e!12712))))

(assert (=> b!19237 (= res!16810 (validate_offset_bits!1 ((_ sign_extend 32) (size!585 (buf!885 thiss!1379))) ((_ sign_extend 32) (currentByte!2165 thiss!1379)) ((_ sign_extend 32) (currentBit!2160 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19238 () Bool)

(assert (=> b!19238 (= e!12710 true)))

(declare-datatypes ((tuple2!2190 0))(
  ( (tuple2!2191 (_1!1180 BitStream!1004) (_2!1180 BitStream!1004)) )
))
(declare-fun lt!27299 () tuple2!2190)

(declare-fun reader!0 (BitStream!1004 BitStream!1004) tuple2!2190)

(assert (=> b!19238 (= lt!27299 (reader!0 thiss!1379 (_2!1179 lt!27301)))))

(declare-fun res!16808 () Bool)

(assert (=> start!4856 (=> (not res!16808) (not e!12712))))

(assert (=> start!4856 (= res!16808 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!585 srcBuffer!2))))))))

(assert (=> start!4856 e!12712))

(assert (=> start!4856 true))

(declare-fun array_inv!555 (array!1380) Bool)

(assert (=> start!4856 (array_inv!555 srcBuffer!2)))

(declare-fun e!12709 () Bool)

(declare-fun inv!12 (BitStream!1004) Bool)

(assert (=> start!4856 (and (inv!12 thiss!1379) e!12709)))

(declare-fun b!19236 () Bool)

(assert (=> b!19236 (= e!12709 (array_inv!555 (buf!885 thiss!1379)))))

(assert (= (and start!4856 res!16808) b!19237))

(assert (= (and b!19237 res!16810) b!19234))

(assert (= (and b!19234 (not res!16811)) b!19235))

(assert (= (and b!19235 (not res!16809)) b!19238))

(assert (= start!4856 b!19236))

(declare-fun m!25837 () Bool)

(assert (=> start!4856 m!25837))

(declare-fun m!25839 () Bool)

(assert (=> start!4856 m!25839))

(declare-fun m!25841 () Bool)

(assert (=> b!19237 m!25841))

(declare-fun m!25843 () Bool)

(assert (=> b!19238 m!25843))

(declare-fun m!25845 () Bool)

(assert (=> b!19236 m!25845))

(declare-fun m!25847 () Bool)

(assert (=> b!19234 m!25847))

(declare-fun m!25849 () Bool)

(assert (=> b!19234 m!25849))

(declare-fun m!25851 () Bool)

(assert (=> b!19234 m!25851))

(declare-fun m!25853 () Bool)

(assert (=> b!19235 m!25853))

(declare-fun m!25855 () Bool)

(assert (=> b!19235 m!25855))

(declare-fun m!25857 () Bool)

(assert (=> b!19235 m!25857))

(declare-fun m!25859 () Bool)

(assert (=> b!19235 m!25859))

(assert (=> b!19235 m!25853))

(declare-fun m!25861 () Bool)

(assert (=> b!19235 m!25861))

(push 1)

(assert (not start!4856))

(assert (not b!19237))

(assert (not b!19235))

(assert (not b!19238))

(assert (not b!19236))

(assert (not b!19234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

