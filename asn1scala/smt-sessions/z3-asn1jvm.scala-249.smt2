; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4854 () Bool)

(assert start!4854)

(declare-fun res!16798 () Bool)

(declare-fun e!12692 () Bool)

(assert (=> start!4854 (=> (not res!16798) (not e!12692))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1378 0))(
  ( (array!1379 (arr!1025 (Array (_ BitVec 32) (_ BitVec 8))) (size!584 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1378)

(assert (=> start!4854 (= res!16798 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!584 srcBuffer!2))))))))

(assert (=> start!4854 e!12692))

(assert (=> start!4854 true))

(declare-fun array_inv!554 (array!1378) Bool)

(assert (=> start!4854 (array_inv!554 srcBuffer!2)))

(declare-datatypes ((BitStream!1002 0))(
  ( (BitStream!1003 (buf!884 array!1378) (currentByte!2164 (_ BitVec 32)) (currentBit!2159 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1002)

(declare-fun e!12695 () Bool)

(declare-fun inv!12 (BitStream!1002) Bool)

(assert (=> start!4854 (and (inv!12 thiss!1379) e!12695)))

(declare-fun b!19219 () Bool)

(declare-fun e!12691 () Bool)

(assert (=> b!19219 (= e!12692 (not e!12691))))

(declare-fun res!16799 () Bool)

(assert (=> b!19219 (=> res!16799 e!12691)))

(assert (=> b!19219 (= res!16799 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1002 BitStream!1002) Bool)

(assert (=> b!19219 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1712 0))(
  ( (Unit!1713) )
))
(declare-fun lt!27282 () Unit!1712)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1002) Unit!1712)

(assert (=> b!19219 (= lt!27282 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27283 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19219 (= lt!27283 (bitIndex!0 (size!584 (buf!884 thiss!1379)) (currentByte!2164 thiss!1379) (currentBit!2159 thiss!1379)))))

(declare-fun b!19220 () Bool)

(declare-fun res!16796 () Bool)

(assert (=> b!19220 (=> (not res!16796) (not e!12692))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19220 (= res!16796 (validate_offset_bits!1 ((_ sign_extend 32) (size!584 (buf!884 thiss!1379))) ((_ sign_extend 32) (currentByte!2164 thiss!1379)) ((_ sign_extend 32) (currentBit!2159 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19221 () Bool)

(assert (=> b!19221 (= e!12695 (array_inv!554 (buf!884 thiss!1379)))))

(declare-fun b!19222 () Bool)

(declare-fun e!12693 () Bool)

(assert (=> b!19222 (= e!12691 e!12693)))

(declare-fun res!16797 () Bool)

(assert (=> b!19222 (=> res!16797 e!12693)))

(declare-datatypes ((tuple2!2184 0))(
  ( (tuple2!2185 (_1!1177 Unit!1712) (_2!1177 BitStream!1002)) )
))
(declare-fun lt!27286 () tuple2!2184)

(assert (=> b!19222 (= res!16797 (not (isPrefixOf!0 thiss!1379 (_2!1177 lt!27286))))))

(assert (=> b!19222 (validate_offset_bits!1 ((_ sign_extend 32) (size!584 (buf!884 (_2!1177 lt!27286)))) ((_ sign_extend 32) (currentByte!2164 (_2!1177 lt!27286))) ((_ sign_extend 32) (currentBit!2159 (_2!1177 lt!27286))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27284 () Unit!1712)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1002 BitStream!1002 (_ BitVec 64) (_ BitVec 64)) Unit!1712)

(assert (=> b!19222 (= lt!27284 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1177 lt!27286) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1002 (_ BitVec 8) (_ BitVec 32)) tuple2!2184)

(assert (=> b!19222 (= lt!27286 (appendBitFromByte!0 thiss!1379 (select (arr!1025 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19223 () Bool)

(assert (=> b!19223 (= e!12693 true)))

(declare-datatypes ((tuple2!2186 0))(
  ( (tuple2!2187 (_1!1178 BitStream!1002) (_2!1178 BitStream!1002)) )
))
(declare-fun lt!27285 () tuple2!2186)

(declare-fun reader!0 (BitStream!1002 BitStream!1002) tuple2!2186)

(assert (=> b!19223 (= lt!27285 (reader!0 thiss!1379 (_2!1177 lt!27286)))))

(assert (= (and start!4854 res!16798) b!19220))

(assert (= (and b!19220 res!16796) b!19219))

(assert (= (and b!19219 (not res!16799)) b!19222))

(assert (= (and b!19222 (not res!16797)) b!19223))

(assert (= start!4854 b!19221))

(declare-fun m!25811 () Bool)

(assert (=> b!19223 m!25811))

(declare-fun m!25813 () Bool)

(assert (=> start!4854 m!25813))

(declare-fun m!25815 () Bool)

(assert (=> start!4854 m!25815))

(declare-fun m!25817 () Bool)

(assert (=> b!19221 m!25817))

(declare-fun m!25819 () Bool)

(assert (=> b!19219 m!25819))

(declare-fun m!25821 () Bool)

(assert (=> b!19219 m!25821))

(declare-fun m!25823 () Bool)

(assert (=> b!19219 m!25823))

(declare-fun m!25825 () Bool)

(assert (=> b!19220 m!25825))

(declare-fun m!25827 () Bool)

(assert (=> b!19222 m!25827))

(declare-fun m!25829 () Bool)

(assert (=> b!19222 m!25829))

(declare-fun m!25831 () Bool)

(assert (=> b!19222 m!25831))

(declare-fun m!25833 () Bool)

(assert (=> b!19222 m!25833))

(assert (=> b!19222 m!25827))

(declare-fun m!25835 () Bool)

(assert (=> b!19222 m!25835))

(check-sat (not start!4854) (not b!19223) (not b!19221) (not b!19219) (not b!19222) (not b!19220))
