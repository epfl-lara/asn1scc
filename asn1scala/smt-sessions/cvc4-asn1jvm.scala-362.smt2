; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8390 () Bool)

(assert start!8390)

(declare-fun b!41993 () Bool)

(declare-fun e!27963 () Bool)

(declare-fun e!27966 () Bool)

(assert (=> b!41993 (= e!27963 e!27966)))

(declare-fun res!35718 () Bool)

(assert (=> b!41993 (=> res!35718 e!27966)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41993 (= res!35718 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!2142 0))(
  ( (array!2143 (arr!1468 (Array (_ BitVec 32) (_ BitVec 8))) (size!969 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1682 0))(
  ( (BitStream!1683 (buf!1297 array!2142) (currentByte!2749 (_ BitVec 32)) (currentBit!2744 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1682)

(declare-datatypes ((tuple2!4098 0))(
  ( (tuple2!4099 (_1!2139 array!2142) (_2!2139 BitStream!1682)) )
))
(declare-fun lt!63173 () tuple2!4098)

(declare-fun readBits!0 (BitStream!1682 (_ BitVec 64)) tuple2!4098)

(declare-datatypes ((tuple2!4100 0))(
  ( (tuple2!4101 (_1!2140 BitStream!1682) (_2!2140 BitStream!1682)) )
))
(declare-fun reader!0 (BitStream!1682 BitStream!1682) tuple2!4100)

(assert (=> b!41993 (= lt!63173 (readBits!0 (_1!2140 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41994 () Bool)

(declare-fun e!27967 () Bool)

(declare-fun array_inv!894 (array!2142) Bool)

(assert (=> b!41994 (= e!27967 (array_inv!894 (buf!1297 thiss!1379)))))

(declare-fun b!41995 () Bool)

(declare-fun e!27965 () Bool)

(assert (=> b!41995 (= e!27965 (not e!27963))))

(declare-fun res!35715 () Bool)

(assert (=> b!41995 (=> res!35715 e!27963)))

(declare-fun lt!63174 () (_ BitVec 64))

(assert (=> b!41995 (= res!35715 (or (bvslt i!635 to!314) (not (= lt!63174 (bvsub (bvadd lt!63174 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1682 BitStream!1682) Bool)

(assert (=> b!41995 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2989 0))(
  ( (Unit!2990) )
))
(declare-fun lt!63172 () Unit!2989)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1682) Unit!2989)

(assert (=> b!41995 (= lt!63172 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41995 (= lt!63174 (bitIndex!0 (size!969 (buf!1297 thiss!1379)) (currentByte!2749 thiss!1379) (currentBit!2744 thiss!1379)))))

(declare-fun b!41996 () Bool)

(declare-fun res!35716 () Bool)

(assert (=> b!41996 (=> res!35716 e!27963)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41996 (= res!35716 (not (invariant!0 (currentBit!2744 thiss!1379) (currentByte!2749 thiss!1379) (size!969 (buf!1297 thiss!1379)))))))

(declare-fun b!41997 () Bool)

(declare-fun res!35714 () Bool)

(assert (=> b!41997 (=> (not res!35714) (not e!27965))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41997 (= res!35714 (validate_offset_bits!1 ((_ sign_extend 32) (size!969 (buf!1297 thiss!1379))) ((_ sign_extend 32) (currentByte!2749 thiss!1379)) ((_ sign_extend 32) (currentBit!2744 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35717 () Bool)

(assert (=> start!8390 (=> (not res!35717) (not e!27965))))

(declare-fun srcBuffer!2 () array!2142)

(assert (=> start!8390 (= res!35717 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!969 srcBuffer!2))))))))

(assert (=> start!8390 e!27965))

(assert (=> start!8390 true))

(assert (=> start!8390 (array_inv!894 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1682) Bool)

(assert (=> start!8390 (and (inv!12 thiss!1379) e!27967)))

(declare-fun b!41998 () Bool)

(assert (=> b!41998 (= e!27966 true)))

(declare-fun lt!63175 () Unit!2989)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1682 array!2142 (_ BitVec 64)) Unit!2989)

(assert (=> b!41998 (= lt!63175 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1297 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun checkByteArrayBitContent!0 (BitStream!1682 array!2142 array!2142 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41998 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2139 lt!63173) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!8390 res!35717) b!41997))

(assert (= (and b!41997 res!35714) b!41995))

(assert (= (and b!41995 (not res!35715)) b!41996))

(assert (= (and b!41996 (not res!35716)) b!41993))

(assert (= (and b!41993 (not res!35718)) b!41998))

(assert (= start!8390 b!41994))

(declare-fun m!63805 () Bool)

(assert (=> b!41995 m!63805))

(declare-fun m!63807 () Bool)

(assert (=> b!41995 m!63807))

(declare-fun m!63809 () Bool)

(assert (=> b!41995 m!63809))

(declare-fun m!63811 () Bool)

(assert (=> b!41996 m!63811))

(declare-fun m!63813 () Bool)

(assert (=> start!8390 m!63813))

(declare-fun m!63815 () Bool)

(assert (=> start!8390 m!63815))

(declare-fun m!63817 () Bool)

(assert (=> b!41993 m!63817))

(declare-fun m!63819 () Bool)

(assert (=> b!41993 m!63819))

(declare-fun m!63821 () Bool)

(assert (=> b!41994 m!63821))

(declare-fun m!63823 () Bool)

(assert (=> b!41997 m!63823))

(declare-fun m!63825 () Bool)

(assert (=> b!41998 m!63825))

(declare-fun m!63827 () Bool)

(assert (=> b!41998 m!63827))

(push 1)

(assert (not b!41994))

(assert (not b!41998))

(assert (not b!41993))

(assert (not b!41996))

(assert (not start!8390))

(assert (not b!41997))

(assert (not b!41995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

