; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8384 () Bool)

(assert start!8384)

(declare-fun b!41939 () Bool)

(declare-fun res!35671 () Bool)

(declare-fun e!27911 () Bool)

(assert (=> b!41939 (=> (not res!35671) (not e!27911))))

(declare-datatypes ((array!2136 0))(
  ( (array!2137 (arr!1465 (Array (_ BitVec 32) (_ BitVec 8))) (size!966 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1676 0))(
  ( (BitStream!1677 (buf!1294 array!2136) (currentByte!2746 (_ BitVec 32)) (currentBit!2741 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1676)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41939 (= res!35671 (validate_offset_bits!1 ((_ sign_extend 32) (size!966 (buf!1294 thiss!1379))) ((_ sign_extend 32) (currentByte!2746 thiss!1379)) ((_ sign_extend 32) (currentBit!2741 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41940 () Bool)

(declare-fun e!27913 () Bool)

(declare-fun array_inv!891 (array!2136) Bool)

(assert (=> b!41940 (= e!27913 (array_inv!891 (buf!1294 thiss!1379)))))

(declare-fun b!41941 () Bool)

(declare-fun e!27912 () Bool)

(assert (=> b!41941 (= e!27912 true)))

(declare-fun srcBuffer!2 () array!2136)

(declare-datatypes ((tuple2!4086 0))(
  ( (tuple2!4087 (_1!2133 array!2136) (_2!2133 BitStream!1676)) )
))
(declare-fun lt!63138 () tuple2!4086)

(declare-fun checkByteArrayBitContent!0 (BitStream!1676 array!2136 array!2136 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41941 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2133 lt!63138) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41942 () Bool)

(declare-fun e!27910 () Bool)

(assert (=> b!41942 (= e!27910 e!27912)))

(declare-fun res!35672 () Bool)

(assert (=> b!41942 (=> res!35672 e!27912)))

(assert (=> b!41942 (= res!35672 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1676 (_ BitVec 64)) tuple2!4086)

(declare-datatypes ((tuple2!4088 0))(
  ( (tuple2!4089 (_1!2134 BitStream!1676) (_2!2134 BitStream!1676)) )
))
(declare-fun reader!0 (BitStream!1676 BitStream!1676) tuple2!4088)

(assert (=> b!41942 (= lt!63138 (readBits!0 (_1!2134 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35670 () Bool)

(assert (=> start!8384 (=> (not res!35670) (not e!27911))))

(assert (=> start!8384 (= res!35670 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!966 srcBuffer!2))))))))

(assert (=> start!8384 e!27911))

(assert (=> start!8384 true))

(assert (=> start!8384 (array_inv!891 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1676) Bool)

(assert (=> start!8384 (and (inv!12 thiss!1379) e!27913)))

(declare-fun b!41943 () Bool)

(declare-fun res!35673 () Bool)

(assert (=> b!41943 (=> res!35673 e!27910)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41943 (= res!35673 (not (invariant!0 (currentBit!2741 thiss!1379) (currentByte!2746 thiss!1379) (size!966 (buf!1294 thiss!1379)))))))

(declare-fun b!41944 () Bool)

(assert (=> b!41944 (= e!27911 (not e!27910))))

(declare-fun res!35669 () Bool)

(assert (=> b!41944 (=> res!35669 e!27910)))

(declare-fun lt!63139 () (_ BitVec 64))

(assert (=> b!41944 (= res!35669 (or (bvslt i!635 to!314) (not (= lt!63139 (bvsub (bvadd lt!63139 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1676 BitStream!1676) Bool)

(assert (=> b!41944 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2983 0))(
  ( (Unit!2984) )
))
(declare-fun lt!63137 () Unit!2983)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1676) Unit!2983)

(assert (=> b!41944 (= lt!63137 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41944 (= lt!63139 (bitIndex!0 (size!966 (buf!1294 thiss!1379)) (currentByte!2746 thiss!1379) (currentBit!2741 thiss!1379)))))

(assert (= (and start!8384 res!35670) b!41939))

(assert (= (and b!41939 res!35671) b!41944))

(assert (= (and b!41944 (not res!35669)) b!41943))

(assert (= (and b!41943 (not res!35673)) b!41942))

(assert (= (and b!41942 (not res!35672)) b!41941))

(assert (= start!8384 b!41940))

(declare-fun m!63735 () Bool)

(assert (=> b!41943 m!63735))

(declare-fun m!63737 () Bool)

(assert (=> start!8384 m!63737))

(declare-fun m!63739 () Bool)

(assert (=> start!8384 m!63739))

(declare-fun m!63741 () Bool)

(assert (=> b!41941 m!63741))

(declare-fun m!63743 () Bool)

(assert (=> b!41944 m!63743))

(declare-fun m!63745 () Bool)

(assert (=> b!41944 m!63745))

(declare-fun m!63747 () Bool)

(assert (=> b!41944 m!63747))

(declare-fun m!63749 () Bool)

(assert (=> b!41939 m!63749))

(declare-fun m!63751 () Bool)

(assert (=> b!41940 m!63751))

(declare-fun m!63753 () Bool)

(assert (=> b!41942 m!63753))

(declare-fun m!63755 () Bool)

(assert (=> b!41942 m!63755))

(push 1)

