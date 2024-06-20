; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4824 () Bool)

(assert start!4824)

(declare-fun b!19003 () Bool)

(declare-fun e!12430 () Bool)

(declare-fun e!12434 () Bool)

(assert (=> b!19003 (= e!12430 (not e!12434))))

(declare-fun res!16626 () Bool)

(assert (=> b!19003 (=> res!16626 e!12434)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19003 (= res!16626 (bvsge i!635 to!314))))

(declare-datatypes ((array!1348 0))(
  ( (array!1349 (arr!1010 (Array (_ BitVec 32) (_ BitVec 8))) (size!569 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!972 0))(
  ( (BitStream!973 (buf!869 array!1348) (currentByte!2149 (_ BitVec 32)) (currentBit!2144 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!972)

(declare-fun isPrefixOf!0 (BitStream!972 BitStream!972) Bool)

(assert (=> b!19003 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1682 0))(
  ( (Unit!1683) )
))
(declare-fun lt!27080 () Unit!1682)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!972) Unit!1682)

(assert (=> b!19003 (= lt!27080 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27079 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19003 (= lt!27079 (bitIndex!0 (size!569 (buf!869 thiss!1379)) (currentByte!2149 thiss!1379) (currentBit!2144 thiss!1379)))))

(declare-fun b!19004 () Bool)

(declare-fun e!12431 () Bool)

(assert (=> b!19004 (= e!12434 e!12431)))

(declare-fun res!16627 () Bool)

(assert (=> b!19004 (=> res!16627 e!12431)))

(declare-datatypes ((tuple2!2146 0))(
  ( (tuple2!2147 (_1!1158 Unit!1682) (_2!1158 BitStream!972)) )
))
(declare-fun lt!27082 () tuple2!2146)

(assert (=> b!19004 (= res!16627 (not (= (size!569 (buf!869 thiss!1379)) (size!569 (buf!869 (_2!1158 lt!27082))))))))

(declare-fun srcBuffer!2 () array!1348)

(declare-fun appendBitFromByte!0 (BitStream!972 (_ BitVec 8) (_ BitVec 32)) tuple2!2146)

(assert (=> b!19004 (= lt!27082 (appendBitFromByte!0 thiss!1379 (select (arr!1010 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19005 () Bool)

(declare-fun res!16625 () Bool)

(assert (=> b!19005 (=> (not res!16625) (not e!12430))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19005 (= res!16625 (validate_offset_bits!1 ((_ sign_extend 32) (size!569 (buf!869 thiss!1379))) ((_ sign_extend 32) (currentByte!2149 thiss!1379)) ((_ sign_extend 32) (currentBit!2144 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19006 () Bool)

(assert (=> b!19006 (= e!12431 true)))

(declare-fun lt!27081 () (_ BitVec 64))

(assert (=> b!19006 (= lt!27081 (bitIndex!0 (size!569 (buf!869 (_2!1158 lt!27082))) (currentByte!2149 (_2!1158 lt!27082)) (currentBit!2144 (_2!1158 lt!27082))))))

(declare-fun b!19007 () Bool)

(declare-fun e!12433 () Bool)

(declare-fun array_inv!539 (array!1348) Bool)

(assert (=> b!19007 (= e!12433 (array_inv!539 (buf!869 thiss!1379)))))

(declare-fun res!16628 () Bool)

(assert (=> start!4824 (=> (not res!16628) (not e!12430))))

(assert (=> start!4824 (= res!16628 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!569 srcBuffer!2))))))))

(assert (=> start!4824 e!12430))

(assert (=> start!4824 true))

(assert (=> start!4824 (array_inv!539 srcBuffer!2)))

(declare-fun inv!12 (BitStream!972) Bool)

(assert (=> start!4824 (and (inv!12 thiss!1379) e!12433)))

(assert (= (and start!4824 res!16628) b!19005))

(assert (= (and b!19005 res!16625) b!19003))

(assert (= (and b!19003 (not res!16626)) b!19004))

(assert (= (and b!19004 (not res!16627)) b!19006))

(assert (= start!4824 b!19007))

(declare-fun m!25475 () Bool)

(assert (=> b!19005 m!25475))

(declare-fun m!25477 () Bool)

(assert (=> start!4824 m!25477))

(declare-fun m!25479 () Bool)

(assert (=> start!4824 m!25479))

(declare-fun m!25481 () Bool)

(assert (=> b!19007 m!25481))

(declare-fun m!25483 () Bool)

(assert (=> b!19006 m!25483))

(declare-fun m!25485 () Bool)

(assert (=> b!19003 m!25485))

(declare-fun m!25487 () Bool)

(assert (=> b!19003 m!25487))

(declare-fun m!25489 () Bool)

(assert (=> b!19003 m!25489))

(declare-fun m!25491 () Bool)

(assert (=> b!19004 m!25491))

(assert (=> b!19004 m!25491))

(declare-fun m!25493 () Bool)

(assert (=> b!19004 m!25493))

(check-sat (not b!19007) (not b!19005) (not b!19003) (not b!19006) (not start!4824) (not b!19004))
