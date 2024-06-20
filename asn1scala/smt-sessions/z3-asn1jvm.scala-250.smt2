; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4860 () Bool)

(assert start!4860)

(declare-fun b!19264 () Bool)

(declare-fun e!12746 () Bool)

(declare-fun e!12749 () Bool)

(assert (=> b!19264 (= e!12746 (not e!12749))))

(declare-fun res!16832 () Bool)

(assert (=> b!19264 (=> res!16832 e!12749)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19264 (= res!16832 (bvsge i!635 to!314))))

(declare-datatypes ((array!1384 0))(
  ( (array!1385 (arr!1028 (Array (_ BitVec 32) (_ BitVec 8))) (size!587 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1008 0))(
  ( (BitStream!1009 (buf!887 array!1384) (currentByte!2167 (_ BitVec 32)) (currentBit!2162 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1008)

(declare-fun isPrefixOf!0 (BitStream!1008 BitStream!1008) Bool)

(assert (=> b!19264 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1718 0))(
  ( (Unit!1719) )
))
(declare-fun lt!27329 () Unit!1718)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1008) Unit!1718)

(assert (=> b!19264 (= lt!27329 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27328 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19264 (= lt!27328 (bitIndex!0 (size!587 (buf!887 thiss!1379)) (currentByte!2167 thiss!1379) (currentBit!2162 thiss!1379)))))

(declare-fun b!19265 () Bool)

(declare-fun res!16834 () Bool)

(assert (=> b!19265 (=> (not res!16834) (not e!12746))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19265 (= res!16834 (validate_offset_bits!1 ((_ sign_extend 32) (size!587 (buf!887 thiss!1379))) ((_ sign_extend 32) (currentByte!2167 thiss!1379)) ((_ sign_extend 32) (currentBit!2162 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!16835 () Bool)

(assert (=> start!4860 (=> (not res!16835) (not e!12746))))

(declare-fun srcBuffer!2 () array!1384)

(assert (=> start!4860 (= res!16835 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!587 srcBuffer!2))))))))

(assert (=> start!4860 e!12746))

(assert (=> start!4860 true))

(declare-fun array_inv!557 (array!1384) Bool)

(assert (=> start!4860 (array_inv!557 srcBuffer!2)))

(declare-fun e!12748 () Bool)

(declare-fun inv!12 (BitStream!1008) Bool)

(assert (=> start!4860 (and (inv!12 thiss!1379) e!12748)))

(declare-fun b!19266 () Bool)

(declare-fun e!12745 () Bool)

(assert (=> b!19266 (= e!12745 true)))

(declare-datatypes ((tuple2!2196 0))(
  ( (tuple2!2197 (_1!1183 BitStream!1008) (_2!1183 BitStream!1008)) )
))
(declare-fun lt!27330 () tuple2!2196)

(declare-datatypes ((tuple2!2198 0))(
  ( (tuple2!2199 (_1!1184 Unit!1718) (_2!1184 BitStream!1008)) )
))
(declare-fun lt!27331 () tuple2!2198)

(declare-fun reader!0 (BitStream!1008 BitStream!1008) tuple2!2196)

(assert (=> b!19266 (= lt!27330 (reader!0 thiss!1379 (_2!1184 lt!27331)))))

(declare-fun b!19267 () Bool)

(assert (=> b!19267 (= e!12748 (array_inv!557 (buf!887 thiss!1379)))))

(declare-fun b!19268 () Bool)

(assert (=> b!19268 (= e!12749 e!12745)))

(declare-fun res!16833 () Bool)

(assert (=> b!19268 (=> res!16833 e!12745)))

(assert (=> b!19268 (= res!16833 (not (isPrefixOf!0 thiss!1379 (_2!1184 lt!27331))))))

(assert (=> b!19268 (validate_offset_bits!1 ((_ sign_extend 32) (size!587 (buf!887 (_2!1184 lt!27331)))) ((_ sign_extend 32) (currentByte!2167 (_2!1184 lt!27331))) ((_ sign_extend 32) (currentBit!2162 (_2!1184 lt!27331))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27327 () Unit!1718)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1008 BitStream!1008 (_ BitVec 64) (_ BitVec 64)) Unit!1718)

(assert (=> b!19268 (= lt!27327 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1184 lt!27331) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1008 (_ BitVec 8) (_ BitVec 32)) tuple2!2198)

(assert (=> b!19268 (= lt!27331 (appendBitFromByte!0 thiss!1379 (select (arr!1028 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!4860 res!16835) b!19265))

(assert (= (and b!19265 res!16834) b!19264))

(assert (= (and b!19264 (not res!16832)) b!19268))

(assert (= (and b!19268 (not res!16833)) b!19266))

(assert (= start!4860 b!19267))

(declare-fun m!25889 () Bool)

(assert (=> b!19266 m!25889))

(declare-fun m!25891 () Bool)

(assert (=> b!19268 m!25891))

(declare-fun m!25893 () Bool)

(assert (=> b!19268 m!25893))

(declare-fun m!25895 () Bool)

(assert (=> b!19268 m!25895))

(declare-fun m!25897 () Bool)

(assert (=> b!19268 m!25897))

(assert (=> b!19268 m!25893))

(declare-fun m!25899 () Bool)

(assert (=> b!19268 m!25899))

(declare-fun m!25901 () Bool)

(assert (=> start!4860 m!25901))

(declare-fun m!25903 () Bool)

(assert (=> start!4860 m!25903))

(declare-fun m!25905 () Bool)

(assert (=> b!19265 m!25905))

(declare-fun m!25907 () Bool)

(assert (=> b!19267 m!25907))

(declare-fun m!25909 () Bool)

(assert (=> b!19264 m!25909))

(declare-fun m!25911 () Bool)

(assert (=> b!19264 m!25911))

(declare-fun m!25913 () Bool)

(assert (=> b!19264 m!25913))

(check-sat (not start!4860) (not b!19265) (not b!19268) (not b!19264) (not b!19266) (not b!19267))
