; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4836 () Bool)

(assert start!4836)

(declare-fun b!19093 () Bool)

(declare-fun e!12542 () Bool)

(assert (=> b!19093 (= e!12542 true)))

(declare-fun lt!27154 () (_ BitVec 64))

(declare-datatypes ((array!1360 0))(
  ( (array!1361 (arr!1016 (Array (_ BitVec 32) (_ BitVec 8))) (size!575 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!984 0))(
  ( (BitStream!985 (buf!875 array!1360) (currentByte!2155 (_ BitVec 32)) (currentBit!2150 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1694 0))(
  ( (Unit!1695) )
))
(declare-datatypes ((tuple2!2158 0))(
  ( (tuple2!2159 (_1!1164 Unit!1694) (_2!1164 BitStream!984)) )
))
(declare-fun lt!27151 () tuple2!2158)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19093 (= lt!27154 (bitIndex!0 (size!575 (buf!875 (_2!1164 lt!27151))) (currentByte!2155 (_2!1164 lt!27151)) (currentBit!2150 (_2!1164 lt!27151))))))

(declare-fun b!19094 () Bool)

(declare-fun e!12539 () Bool)

(declare-fun e!12543 () Bool)

(assert (=> b!19094 (= e!12539 (not e!12543))))

(declare-fun res!16697 () Bool)

(assert (=> b!19094 (=> res!16697 e!12543)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19094 (= res!16697 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!984)

(declare-fun isPrefixOf!0 (BitStream!984 BitStream!984) Bool)

(assert (=> b!19094 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27153 () Unit!1694)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!984) Unit!1694)

(assert (=> b!19094 (= lt!27153 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27152 () (_ BitVec 64))

(assert (=> b!19094 (= lt!27152 (bitIndex!0 (size!575 (buf!875 thiss!1379)) (currentByte!2155 thiss!1379) (currentBit!2150 thiss!1379)))))

(declare-fun b!19095 () Bool)

(declare-fun e!12540 () Bool)

(declare-fun array_inv!545 (array!1360) Bool)

(assert (=> b!19095 (= e!12540 (array_inv!545 (buf!875 thiss!1379)))))

(declare-fun res!16699 () Bool)

(assert (=> start!4836 (=> (not res!16699) (not e!12539))))

(declare-fun srcBuffer!2 () array!1360)

(assert (=> start!4836 (= res!16699 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!575 srcBuffer!2))))))))

(assert (=> start!4836 e!12539))

(assert (=> start!4836 true))

(assert (=> start!4836 (array_inv!545 srcBuffer!2)))

(declare-fun inv!12 (BitStream!984) Bool)

(assert (=> start!4836 (and (inv!12 thiss!1379) e!12540)))

(declare-fun b!19096 () Bool)

(assert (=> b!19096 (= e!12543 e!12542)))

(declare-fun res!16698 () Bool)

(assert (=> b!19096 (=> res!16698 e!12542)))

(assert (=> b!19096 (= res!16698 (not (= (size!575 (buf!875 thiss!1379)) (size!575 (buf!875 (_2!1164 lt!27151))))))))

(declare-fun appendBitFromByte!0 (BitStream!984 (_ BitVec 8) (_ BitVec 32)) tuple2!2158)

(assert (=> b!19096 (= lt!27151 (appendBitFromByte!0 thiss!1379 (select (arr!1016 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19097 () Bool)

(declare-fun res!16700 () Bool)

(assert (=> b!19097 (=> (not res!16700) (not e!12539))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19097 (= res!16700 (validate_offset_bits!1 ((_ sign_extend 32) (size!575 (buf!875 thiss!1379))) ((_ sign_extend 32) (currentByte!2155 thiss!1379)) ((_ sign_extend 32) (currentBit!2150 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!4836 res!16699) b!19097))

(assert (= (and b!19097 res!16700) b!19094))

(assert (= (and b!19094 (not res!16697)) b!19096))

(assert (= (and b!19096 (not res!16698)) b!19093))

(assert (= start!4836 b!19095))

(declare-fun m!25595 () Bool)

(assert (=> b!19096 m!25595))

(assert (=> b!19096 m!25595))

(declare-fun m!25597 () Bool)

(assert (=> b!19096 m!25597))

(declare-fun m!25599 () Bool)

(assert (=> b!19094 m!25599))

(declare-fun m!25601 () Bool)

(assert (=> b!19094 m!25601))

(declare-fun m!25603 () Bool)

(assert (=> b!19094 m!25603))

(declare-fun m!25605 () Bool)

(assert (=> start!4836 m!25605))

(declare-fun m!25607 () Bool)

(assert (=> start!4836 m!25607))

(declare-fun m!25609 () Bool)

(assert (=> b!19095 m!25609))

(declare-fun m!25611 () Bool)

(assert (=> b!19097 m!25611))

(declare-fun m!25613 () Bool)

(assert (=> b!19093 m!25613))

(check-sat (not start!4836) (not b!19094) (not b!19096) (not b!19097) (not b!19093) (not b!19095))
