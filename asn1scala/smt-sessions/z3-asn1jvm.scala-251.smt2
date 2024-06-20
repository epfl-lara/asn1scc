; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4866 () Bool)

(assert start!4866)

(declare-fun b!19309 () Bool)

(declare-fun res!16868 () Bool)

(declare-fun e!12801 () Bool)

(assert (=> b!19309 (=> (not res!16868) (not e!12801))))

(declare-datatypes ((array!1390 0))(
  ( (array!1391 (arr!1031 (Array (_ BitVec 32) (_ BitVec 8))) (size!590 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1014 0))(
  ( (BitStream!1015 (buf!890 array!1390) (currentByte!2170 (_ BitVec 32)) (currentBit!2165 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1014)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19309 (= res!16868 (validate_offset_bits!1 ((_ sign_extend 32) (size!590 (buf!890 thiss!1379))) ((_ sign_extend 32) (currentByte!2170 thiss!1379)) ((_ sign_extend 32) (currentBit!2165 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19311 () Bool)

(declare-fun e!12803 () Bool)

(assert (=> b!19311 (= e!12801 (not e!12803))))

(declare-fun res!16870 () Bool)

(assert (=> b!19311 (=> res!16870 e!12803)))

(assert (=> b!19311 (= res!16870 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1014 BitStream!1014) Bool)

(assert (=> b!19311 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1724 0))(
  ( (Unit!1725) )
))
(declare-fun lt!27381 () Unit!1724)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1014) Unit!1724)

(assert (=> b!19311 (= lt!27381 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27378 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19311 (= lt!27378 (bitIndex!0 (size!590 (buf!890 thiss!1379)) (currentByte!2170 thiss!1379) (currentBit!2165 thiss!1379)))))

(declare-fun b!19312 () Bool)

(declare-fun e!12804 () Bool)

(assert (=> b!19312 (= e!12803 e!12804)))

(declare-fun res!16869 () Bool)

(assert (=> b!19312 (=> res!16869 e!12804)))

(declare-datatypes ((tuple2!2208 0))(
  ( (tuple2!2209 (_1!1189 Unit!1724) (_2!1189 BitStream!1014)) )
))
(declare-fun lt!27380 () tuple2!2208)

(assert (=> b!19312 (= res!16869 (not (isPrefixOf!0 thiss!1379 (_2!1189 lt!27380))))))

(assert (=> b!19312 (validate_offset_bits!1 ((_ sign_extend 32) (size!590 (buf!890 (_2!1189 lt!27380)))) ((_ sign_extend 32) (currentByte!2170 (_2!1189 lt!27380))) ((_ sign_extend 32) (currentBit!2165 (_2!1189 lt!27380))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27379 () Unit!1724)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1014 BitStream!1014 (_ BitVec 64) (_ BitVec 64)) Unit!1724)

(assert (=> b!19312 (= lt!27379 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1189 lt!27380) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1390)

(declare-fun appendBitFromByte!0 (BitStream!1014 (_ BitVec 8) (_ BitVec 32)) tuple2!2208)

(assert (=> b!19312 (= lt!27380 (appendBitFromByte!0 thiss!1379 (select (arr!1031 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19313 () Bool)

(declare-fun e!12800 () Bool)

(declare-fun array_inv!560 (array!1390) Bool)

(assert (=> b!19313 (= e!12800 (array_inv!560 (buf!890 thiss!1379)))))

(declare-fun res!16871 () Bool)

(assert (=> start!4866 (=> (not res!16871) (not e!12801))))

(assert (=> start!4866 (= res!16871 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!590 srcBuffer!2))))))))

(assert (=> start!4866 e!12801))

(assert (=> start!4866 true))

(assert (=> start!4866 (array_inv!560 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1014) Bool)

(assert (=> start!4866 (and (inv!12 thiss!1379) e!12800)))

(declare-fun b!19310 () Bool)

(assert (=> b!19310 (= e!12804 true)))

(assert (=> b!19310 (validate_offset_bits!1 ((_ sign_extend 32) (size!590 (buf!890 (_2!1189 lt!27380)))) ((_ sign_extend 32) (currentByte!2170 thiss!1379)) ((_ sign_extend 32) (currentBit!2165 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27382 () Unit!1724)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1014 array!1390 (_ BitVec 64)) Unit!1724)

(assert (=> b!19310 (= lt!27382 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!890 (_2!1189 lt!27380)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2210 0))(
  ( (tuple2!2211 (_1!1190 BitStream!1014) (_2!1190 BitStream!1014)) )
))
(declare-fun lt!27377 () tuple2!2210)

(declare-fun reader!0 (BitStream!1014 BitStream!1014) tuple2!2210)

(assert (=> b!19310 (= lt!27377 (reader!0 thiss!1379 (_2!1189 lt!27380)))))

(assert (= (and start!4866 res!16871) b!19309))

(assert (= (and b!19309 res!16868) b!19311))

(assert (= (and b!19311 (not res!16870)) b!19312))

(assert (= (and b!19312 (not res!16869)) b!19310))

(assert (= start!4866 b!19313))

(declare-fun m!25971 () Bool)

(assert (=> b!19312 m!25971))

(assert (=> b!19312 m!25971))

(declare-fun m!25973 () Bool)

(assert (=> b!19312 m!25973))

(declare-fun m!25975 () Bool)

(assert (=> b!19312 m!25975))

(declare-fun m!25977 () Bool)

(assert (=> b!19312 m!25977))

(declare-fun m!25979 () Bool)

(assert (=> b!19312 m!25979))

(declare-fun m!25981 () Bool)

(assert (=> b!19310 m!25981))

(declare-fun m!25983 () Bool)

(assert (=> b!19310 m!25983))

(declare-fun m!25985 () Bool)

(assert (=> b!19310 m!25985))

(declare-fun m!25987 () Bool)

(assert (=> b!19309 m!25987))

(declare-fun m!25989 () Bool)

(assert (=> start!4866 m!25989))

(declare-fun m!25991 () Bool)

(assert (=> start!4866 m!25991))

(declare-fun m!25993 () Bool)

(assert (=> b!19313 m!25993))

(declare-fun m!25995 () Bool)

(assert (=> b!19311 m!25995))

(declare-fun m!25997 () Bool)

(assert (=> b!19311 m!25997))

(declare-fun m!25999 () Bool)

(assert (=> b!19311 m!25999))

(check-sat (not b!19313) (not b!19311) (not start!4866) (not b!19312) (not b!19310) (not b!19309))
