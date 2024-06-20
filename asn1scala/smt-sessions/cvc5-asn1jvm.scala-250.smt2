; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4858 () Bool)

(assert start!4858)

(declare-fun b!19249 () Bool)

(declare-fun e!12731 () Bool)

(declare-fun e!12732 () Bool)

(assert (=> b!19249 (= e!12731 (not e!12732))))

(declare-fun res!16820 () Bool)

(assert (=> b!19249 (=> res!16820 e!12732)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19249 (= res!16820 (bvsge i!635 to!314))))

(declare-datatypes ((array!1382 0))(
  ( (array!1383 (arr!1027 (Array (_ BitVec 32) (_ BitVec 8))) (size!586 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1006 0))(
  ( (BitStream!1007 (buf!886 array!1382) (currentByte!2166 (_ BitVec 32)) (currentBit!2161 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1006)

(declare-fun isPrefixOf!0 (BitStream!1006 BitStream!1006) Bool)

(assert (=> b!19249 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1716 0))(
  ( (Unit!1717) )
))
(declare-fun lt!27314 () Unit!1716)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1006) Unit!1716)

(assert (=> b!19249 (= lt!27314 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27312 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19249 (= lt!27312 (bitIndex!0 (size!586 (buf!886 thiss!1379)) (currentByte!2166 thiss!1379) (currentBit!2161 thiss!1379)))))

(declare-fun b!19251 () Bool)

(declare-fun res!16821 () Bool)

(assert (=> b!19251 (=> (not res!16821) (not e!12731))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19251 (= res!16821 (validate_offset_bits!1 ((_ sign_extend 32) (size!586 (buf!886 thiss!1379))) ((_ sign_extend 32) (currentByte!2166 thiss!1379)) ((_ sign_extend 32) (currentBit!2161 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19252 () Bool)

(declare-fun e!12727 () Bool)

(assert (=> b!19252 (= e!12732 e!12727)))

(declare-fun res!16822 () Bool)

(assert (=> b!19252 (=> res!16822 e!12727)))

(declare-datatypes ((tuple2!2192 0))(
  ( (tuple2!2193 (_1!1181 Unit!1716) (_2!1181 BitStream!1006)) )
))
(declare-fun lt!27316 () tuple2!2192)

(assert (=> b!19252 (= res!16822 (not (isPrefixOf!0 thiss!1379 (_2!1181 lt!27316))))))

(assert (=> b!19252 (validate_offset_bits!1 ((_ sign_extend 32) (size!586 (buf!886 (_2!1181 lt!27316)))) ((_ sign_extend 32) (currentByte!2166 (_2!1181 lt!27316))) ((_ sign_extend 32) (currentBit!2161 (_2!1181 lt!27316))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27313 () Unit!1716)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1006 BitStream!1006 (_ BitVec 64) (_ BitVec 64)) Unit!1716)

(assert (=> b!19252 (= lt!27313 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1181 lt!27316) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1382)

(declare-fun appendBitFromByte!0 (BitStream!1006 (_ BitVec 8) (_ BitVec 32)) tuple2!2192)

(assert (=> b!19252 (= lt!27316 (appendBitFromByte!0 thiss!1379 (select (arr!1027 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19253 () Bool)

(declare-fun e!12730 () Bool)

(declare-fun array_inv!556 (array!1382) Bool)

(assert (=> b!19253 (= e!12730 (array_inv!556 (buf!886 thiss!1379)))))

(declare-fun b!19250 () Bool)

(assert (=> b!19250 (= e!12727 true)))

(declare-datatypes ((tuple2!2194 0))(
  ( (tuple2!2195 (_1!1182 BitStream!1006) (_2!1182 BitStream!1006)) )
))
(declare-fun lt!27315 () tuple2!2194)

(declare-fun reader!0 (BitStream!1006 BitStream!1006) tuple2!2194)

(assert (=> b!19250 (= lt!27315 (reader!0 thiss!1379 (_2!1181 lt!27316)))))

(declare-fun res!16823 () Bool)

(assert (=> start!4858 (=> (not res!16823) (not e!12731))))

(assert (=> start!4858 (= res!16823 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!586 srcBuffer!2))))))))

(assert (=> start!4858 e!12731))

(assert (=> start!4858 true))

(assert (=> start!4858 (array_inv!556 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1006) Bool)

(assert (=> start!4858 (and (inv!12 thiss!1379) e!12730)))

(assert (= (and start!4858 res!16823) b!19251))

(assert (= (and b!19251 res!16821) b!19249))

(assert (= (and b!19249 (not res!16820)) b!19252))

(assert (= (and b!19252 (not res!16822)) b!19250))

(assert (= start!4858 b!19253))

(declare-fun m!25863 () Bool)

(assert (=> start!4858 m!25863))

(declare-fun m!25865 () Bool)

(assert (=> start!4858 m!25865))

(declare-fun m!25867 () Bool)

(assert (=> b!19252 m!25867))

(declare-fun m!25869 () Bool)

(assert (=> b!19252 m!25869))

(declare-fun m!25871 () Bool)

(assert (=> b!19252 m!25871))

(declare-fun m!25873 () Bool)

(assert (=> b!19252 m!25873))

(assert (=> b!19252 m!25869))

(declare-fun m!25875 () Bool)

(assert (=> b!19252 m!25875))

(declare-fun m!25877 () Bool)

(assert (=> b!19251 m!25877))

(declare-fun m!25879 () Bool)

(assert (=> b!19250 m!25879))

(declare-fun m!25881 () Bool)

(assert (=> b!19249 m!25881))

(declare-fun m!25883 () Bool)

(assert (=> b!19249 m!25883))

(declare-fun m!25885 () Bool)

(assert (=> b!19249 m!25885))

(declare-fun m!25887 () Bool)

(assert (=> b!19253 m!25887))

(push 1)

(assert (not b!19249))

(assert (not b!19250))

(assert (not b!19253))

(assert (not b!19252))

(assert (not start!4858))

(assert (not b!19251))

(check-sat)

(pop 1)

