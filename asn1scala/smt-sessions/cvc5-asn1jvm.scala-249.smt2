; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4852 () Bool)

(assert start!4852)

(declare-fun b!19204 () Bool)

(declare-fun e!12678 () Bool)

(declare-fun e!12674 () Bool)

(assert (=> b!19204 (= e!12678 (not e!12674))))

(declare-fun res!16784 () Bool)

(assert (=> b!19204 (=> res!16784 e!12674)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19204 (= res!16784 (bvsge i!635 to!314))))

(declare-datatypes ((array!1376 0))(
  ( (array!1377 (arr!1024 (Array (_ BitVec 32) (_ BitVec 8))) (size!583 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1000 0))(
  ( (BitStream!1001 (buf!883 array!1376) (currentByte!2163 (_ BitVec 32)) (currentBit!2158 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1000)

(declare-fun isPrefixOf!0 (BitStream!1000 BitStream!1000) Bool)

(assert (=> b!19204 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1710 0))(
  ( (Unit!1711) )
))
(declare-fun lt!27271 () Unit!1710)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1000) Unit!1710)

(assert (=> b!19204 (= lt!27271 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27267 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19204 (= lt!27267 (bitIndex!0 (size!583 (buf!883 thiss!1379)) (currentByte!2163 thiss!1379) (currentBit!2158 thiss!1379)))))

(declare-fun b!19205 () Bool)

(declare-fun e!12676 () Bool)

(declare-fun array_inv!553 (array!1376) Bool)

(assert (=> b!19205 (= e!12676 (array_inv!553 (buf!883 thiss!1379)))))

(declare-fun b!19206 () Bool)

(declare-fun e!12677 () Bool)

(assert (=> b!19206 (= e!12677 true)))

(declare-datatypes ((tuple2!2180 0))(
  ( (tuple2!2181 (_1!1175 BitStream!1000) (_2!1175 BitStream!1000)) )
))
(declare-fun lt!27270 () tuple2!2180)

(declare-datatypes ((tuple2!2182 0))(
  ( (tuple2!2183 (_1!1176 Unit!1710) (_2!1176 BitStream!1000)) )
))
(declare-fun lt!27268 () tuple2!2182)

(declare-fun reader!0 (BitStream!1000 BitStream!1000) tuple2!2180)

(assert (=> b!19206 (= lt!27270 (reader!0 thiss!1379 (_2!1176 lt!27268)))))

(declare-fun b!19207 () Bool)

(declare-fun res!16787 () Bool)

(assert (=> b!19207 (=> (not res!16787) (not e!12678))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19207 (= res!16787 (validate_offset_bits!1 ((_ sign_extend 32) (size!583 (buf!883 thiss!1379))) ((_ sign_extend 32) (currentByte!2163 thiss!1379)) ((_ sign_extend 32) (currentBit!2158 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19208 () Bool)

(assert (=> b!19208 (= e!12674 e!12677)))

(declare-fun res!16786 () Bool)

(assert (=> b!19208 (=> res!16786 e!12677)))

(assert (=> b!19208 (= res!16786 (not (isPrefixOf!0 thiss!1379 (_2!1176 lt!27268))))))

(assert (=> b!19208 (validate_offset_bits!1 ((_ sign_extend 32) (size!583 (buf!883 (_2!1176 lt!27268)))) ((_ sign_extend 32) (currentByte!2163 (_2!1176 lt!27268))) ((_ sign_extend 32) (currentBit!2158 (_2!1176 lt!27268))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27269 () Unit!1710)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1000 BitStream!1000 (_ BitVec 64) (_ BitVec 64)) Unit!1710)

(assert (=> b!19208 (= lt!27269 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1176 lt!27268) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1376)

(declare-fun appendBitFromByte!0 (BitStream!1000 (_ BitVec 8) (_ BitVec 32)) tuple2!2182)

(assert (=> b!19208 (= lt!27268 (appendBitFromByte!0 thiss!1379 (select (arr!1024 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!16785 () Bool)

(assert (=> start!4852 (=> (not res!16785) (not e!12678))))

(assert (=> start!4852 (= res!16785 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!583 srcBuffer!2))))))))

(assert (=> start!4852 e!12678))

(assert (=> start!4852 true))

(assert (=> start!4852 (array_inv!553 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1000) Bool)

(assert (=> start!4852 (and (inv!12 thiss!1379) e!12676)))

(assert (= (and start!4852 res!16785) b!19207))

(assert (= (and b!19207 res!16787) b!19204))

(assert (= (and b!19204 (not res!16784)) b!19208))

(assert (= (and b!19208 (not res!16786)) b!19206))

(assert (= start!4852 b!19205))

(declare-fun m!25785 () Bool)

(assert (=> b!19207 m!25785))

(declare-fun m!25787 () Bool)

(assert (=> start!4852 m!25787))

(declare-fun m!25789 () Bool)

(assert (=> start!4852 m!25789))

(declare-fun m!25791 () Bool)

(assert (=> b!19206 m!25791))

(declare-fun m!25793 () Bool)

(assert (=> b!19205 m!25793))

(declare-fun m!25795 () Bool)

(assert (=> b!19208 m!25795))

(declare-fun m!25797 () Bool)

(assert (=> b!19208 m!25797))

(declare-fun m!25799 () Bool)

(assert (=> b!19208 m!25799))

(declare-fun m!25801 () Bool)

(assert (=> b!19208 m!25801))

(assert (=> b!19208 m!25797))

(declare-fun m!25803 () Bool)

(assert (=> b!19208 m!25803))

(declare-fun m!25805 () Bool)

(assert (=> b!19204 m!25805))

(declare-fun m!25807 () Bool)

(assert (=> b!19204 m!25807))

(declare-fun m!25809 () Bool)

(assert (=> b!19204 m!25809))

(push 1)

(assert (not b!19208))

(assert (not b!19204))

(assert (not b!19206))

(assert (not b!19207))

(assert (not start!4852))

(assert (not b!19205))

(check-sat)

(pop 1)

