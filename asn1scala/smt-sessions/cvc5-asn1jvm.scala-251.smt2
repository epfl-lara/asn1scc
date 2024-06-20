; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4864 () Bool)

(assert start!4864)

(declare-fun b!19294 () Bool)

(declare-fun res!16859 () Bool)

(declare-fun e!12781 () Bool)

(assert (=> b!19294 (=> (not res!16859) (not e!12781))))

(declare-datatypes ((array!1388 0))(
  ( (array!1389 (arr!1030 (Array (_ BitVec 32) (_ BitVec 8))) (size!589 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1012 0))(
  ( (BitStream!1013 (buf!889 array!1388) (currentByte!2169 (_ BitVec 32)) (currentBit!2164 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1012)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19294 (= res!16859 (validate_offset_bits!1 ((_ sign_extend 32) (size!589 (buf!889 thiss!1379))) ((_ sign_extend 32) (currentByte!2169 thiss!1379)) ((_ sign_extend 32) (currentBit!2164 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19295 () Bool)

(declare-fun e!12784 () Bool)

(declare-fun array_inv!559 (array!1388) Bool)

(assert (=> b!19295 (= e!12784 (array_inv!559 (buf!889 thiss!1379)))))

(declare-fun res!16857 () Bool)

(assert (=> start!4864 (=> (not res!16857) (not e!12781))))

(declare-fun srcBuffer!2 () array!1388)

(assert (=> start!4864 (= res!16857 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!589 srcBuffer!2))))))))

(assert (=> start!4864 e!12781))

(assert (=> start!4864 true))

(assert (=> start!4864 (array_inv!559 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1012) Bool)

(assert (=> start!4864 (and (inv!12 thiss!1379) e!12784)))

(declare-fun b!19296 () Bool)

(declare-fun e!12786 () Bool)

(declare-fun e!12785 () Bool)

(assert (=> b!19296 (= e!12786 e!12785)))

(declare-fun res!16856 () Bool)

(assert (=> b!19296 (=> res!16856 e!12785)))

(declare-datatypes ((Unit!1722 0))(
  ( (Unit!1723) )
))
(declare-datatypes ((tuple2!2204 0))(
  ( (tuple2!2205 (_1!1187 Unit!1722) (_2!1187 BitStream!1012)) )
))
(declare-fun lt!27360 () tuple2!2204)

(declare-fun isPrefixOf!0 (BitStream!1012 BitStream!1012) Bool)

(assert (=> b!19296 (= res!16856 (not (isPrefixOf!0 thiss!1379 (_2!1187 lt!27360))))))

(assert (=> b!19296 (validate_offset_bits!1 ((_ sign_extend 32) (size!589 (buf!889 (_2!1187 lt!27360)))) ((_ sign_extend 32) (currentByte!2169 (_2!1187 lt!27360))) ((_ sign_extend 32) (currentBit!2164 (_2!1187 lt!27360))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27363 () Unit!1722)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1012 BitStream!1012 (_ BitVec 64) (_ BitVec 64)) Unit!1722)

(assert (=> b!19296 (= lt!27363 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1187 lt!27360) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1012 (_ BitVec 8) (_ BitVec 32)) tuple2!2204)

(assert (=> b!19296 (= lt!27360 (appendBitFromByte!0 thiss!1379 (select (arr!1030 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19297 () Bool)

(assert (=> b!19297 (= e!12785 true)))

(assert (=> b!19297 (validate_offset_bits!1 ((_ sign_extend 32) (size!589 (buf!889 (_2!1187 lt!27360)))) ((_ sign_extend 32) (currentByte!2169 thiss!1379)) ((_ sign_extend 32) (currentBit!2164 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27361 () Unit!1722)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1012 array!1388 (_ BitVec 64)) Unit!1722)

(assert (=> b!19297 (= lt!27361 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!889 (_2!1187 lt!27360)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2206 0))(
  ( (tuple2!2207 (_1!1188 BitStream!1012) (_2!1188 BitStream!1012)) )
))
(declare-fun lt!27362 () tuple2!2206)

(declare-fun reader!0 (BitStream!1012 BitStream!1012) tuple2!2206)

(assert (=> b!19297 (= lt!27362 (reader!0 thiss!1379 (_2!1187 lt!27360)))))

(declare-fun b!19298 () Bool)

(assert (=> b!19298 (= e!12781 (not e!12786))))

(declare-fun res!16858 () Bool)

(assert (=> b!19298 (=> res!16858 e!12786)))

(assert (=> b!19298 (= res!16858 (bvsge i!635 to!314))))

(assert (=> b!19298 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27364 () Unit!1722)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1012) Unit!1722)

(assert (=> b!19298 (= lt!27364 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27359 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19298 (= lt!27359 (bitIndex!0 (size!589 (buf!889 thiss!1379)) (currentByte!2169 thiss!1379) (currentBit!2164 thiss!1379)))))

(assert (= (and start!4864 res!16857) b!19294))

(assert (= (and b!19294 res!16859) b!19298))

(assert (= (and b!19298 (not res!16858)) b!19296))

(assert (= (and b!19296 (not res!16856)) b!19297))

(assert (= start!4864 b!19295))

(declare-fun m!25941 () Bool)

(assert (=> b!19298 m!25941))

(declare-fun m!25943 () Bool)

(assert (=> b!19298 m!25943))

(declare-fun m!25945 () Bool)

(assert (=> b!19298 m!25945))

(declare-fun m!25947 () Bool)

(assert (=> b!19294 m!25947))

(declare-fun m!25949 () Bool)

(assert (=> b!19296 m!25949))

(declare-fun m!25951 () Bool)

(assert (=> b!19296 m!25951))

(declare-fun m!25953 () Bool)

(assert (=> b!19296 m!25953))

(declare-fun m!25955 () Bool)

(assert (=> b!19296 m!25955))

(assert (=> b!19296 m!25951))

(declare-fun m!25957 () Bool)

(assert (=> b!19296 m!25957))

(declare-fun m!25959 () Bool)

(assert (=> b!19295 m!25959))

(declare-fun m!25961 () Bool)

(assert (=> b!19297 m!25961))

(declare-fun m!25963 () Bool)

(assert (=> b!19297 m!25963))

(declare-fun m!25965 () Bool)

(assert (=> b!19297 m!25965))

(declare-fun m!25967 () Bool)

(assert (=> start!4864 m!25967))

(declare-fun m!25969 () Bool)

(assert (=> start!4864 m!25969))

(push 1)

(assert (not b!19294))

(assert (not b!19298))

(assert (not b!19297))

(assert (not start!4864))

(assert (not b!19295))

(assert (not b!19296))

(check-sat)

(pop 1)

