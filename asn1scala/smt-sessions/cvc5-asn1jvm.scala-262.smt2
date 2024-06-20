; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5128 () Bool)

(assert start!5128)

(declare-fun b!20466 () Bool)

(declare-fun e!13752 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20466 (= e!13752 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314))))))

(declare-fun e!13750 () Bool)

(assert (=> b!20466 e!13750))

(declare-fun res!17777 () Bool)

(assert (=> b!20466 (=> (not res!17777) (not e!13750))))

(declare-datatypes ((array!1463 0))(
  ( (array!1464 (arr!1066 (Array (_ BitVec 32) (_ BitVec 8))) (size!622 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1078 0))(
  ( (BitStream!1079 (buf!931 array!1463) (currentByte!2220 (_ BitVec 32)) (currentBit!2215 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1797 0))(
  ( (Unit!1798) )
))
(declare-datatypes ((tuple2!2396 0))(
  ( (tuple2!2397 (_1!1283 Unit!1797) (_2!1283 BitStream!1078)) )
))
(declare-fun lt!29168 () tuple2!2396)

(declare-fun thiss!1379 () BitStream!1078)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20466 (= res!17777 (validate_offset_bits!1 ((_ sign_extend 32) (size!622 (buf!931 (_2!1283 lt!29168)))) ((_ sign_extend 32) (currentByte!2220 thiss!1379)) ((_ sign_extend 32) (currentBit!2215 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29172 () Unit!1797)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1078 array!1463 (_ BitVec 64)) Unit!1797)

(assert (=> b!20466 (= lt!29172 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!931 (_2!1283 lt!29168)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2398 0))(
  ( (tuple2!2399 (_1!1284 BitStream!1078) (_2!1284 BitStream!1078)) )
))
(declare-fun lt!29169 () tuple2!2398)

(declare-fun reader!0 (BitStream!1078 BitStream!1078) tuple2!2398)

(assert (=> b!20466 (= lt!29169 (reader!0 thiss!1379 (_2!1283 lt!29168)))))

(declare-fun b!20467 () Bool)

(declare-fun e!13748 () Bool)

(declare-fun array_inv!592 (array!1463) Bool)

(assert (=> b!20467 (= e!13748 (array_inv!592 (buf!931 thiss!1379)))))

(declare-fun b!20468 () Bool)

(declare-fun e!13751 () Bool)

(declare-fun e!13747 () Bool)

(assert (=> b!20468 (= e!13751 (not e!13747))))

(declare-fun res!17779 () Bool)

(assert (=> b!20468 (=> res!17779 e!13747)))

(assert (=> b!20468 (= res!17779 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1078 BitStream!1078) Bool)

(assert (=> b!20468 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29173 () Unit!1797)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1078) Unit!1797)

(assert (=> b!20468 (= lt!29173 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29170 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20468 (= lt!29170 (bitIndex!0 (size!622 (buf!931 thiss!1379)) (currentByte!2220 thiss!1379) (currentBit!2215 thiss!1379)))))

(declare-fun srcBuffer!2 () array!1463)

(declare-fun b!20469 () Bool)

(declare-datatypes ((List!240 0))(
  ( (Nil!237) (Cons!236 (h!355 Bool) (t!990 List!240)) )
))
(declare-fun head!77 (List!240) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1078 array!1463 (_ BitVec 64) (_ BitVec 64)) List!240)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1078 BitStream!1078 (_ BitVec 64)) List!240)

(assert (=> b!20469 (= e!13750 (= (head!77 (byteArrayBitContentToList!0 (_2!1283 lt!29168) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!77 (bitStreamReadBitsIntoList!0 (_2!1283 lt!29168) (_1!1284 lt!29169) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!17780 () Bool)

(assert (=> start!5128 (=> (not res!17780) (not e!13751))))

(assert (=> start!5128 (= res!17780 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!622 srcBuffer!2))))))))

(assert (=> start!5128 e!13751))

(assert (=> start!5128 true))

(assert (=> start!5128 (array_inv!592 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1078) Bool)

(assert (=> start!5128 (and (inv!12 thiss!1379) e!13748)))

(declare-fun b!20470 () Bool)

(declare-fun res!17776 () Bool)

(assert (=> b!20470 (=> (not res!17776) (not e!13751))))

(assert (=> b!20470 (= res!17776 (validate_offset_bits!1 ((_ sign_extend 32) (size!622 (buf!931 thiss!1379))) ((_ sign_extend 32) (currentByte!2220 thiss!1379)) ((_ sign_extend 32) (currentBit!2215 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20471 () Bool)

(assert (=> b!20471 (= e!13747 e!13752)))

(declare-fun res!17778 () Bool)

(assert (=> b!20471 (=> res!17778 e!13752)))

(assert (=> b!20471 (= res!17778 (not (isPrefixOf!0 thiss!1379 (_2!1283 lt!29168))))))

(assert (=> b!20471 (validate_offset_bits!1 ((_ sign_extend 32) (size!622 (buf!931 (_2!1283 lt!29168)))) ((_ sign_extend 32) (currentByte!2220 (_2!1283 lt!29168))) ((_ sign_extend 32) (currentBit!2215 (_2!1283 lt!29168))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29171 () Unit!1797)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1078 BitStream!1078 (_ BitVec 64) (_ BitVec 64)) Unit!1797)

(assert (=> b!20471 (= lt!29171 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1283 lt!29168) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1078 (_ BitVec 8) (_ BitVec 32)) tuple2!2396)

(assert (=> b!20471 (= lt!29168 (appendBitFromByte!0 thiss!1379 (select (arr!1066 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5128 res!17780) b!20470))

(assert (= (and b!20470 res!17776) b!20468))

(assert (= (and b!20468 (not res!17779)) b!20471))

(assert (= (and b!20471 (not res!17778)) b!20466))

(assert (= (and b!20466 res!17777) b!20469))

(assert (= start!5128 b!20467))

(declare-fun m!27777 () Bool)

(assert (=> b!20466 m!27777))

(declare-fun m!27779 () Bool)

(assert (=> b!20466 m!27779))

(declare-fun m!27781 () Bool)

(assert (=> b!20466 m!27781))

(declare-fun m!27783 () Bool)

(assert (=> b!20469 m!27783))

(assert (=> b!20469 m!27783))

(declare-fun m!27785 () Bool)

(assert (=> b!20469 m!27785))

(declare-fun m!27787 () Bool)

(assert (=> b!20469 m!27787))

(assert (=> b!20469 m!27787))

(declare-fun m!27789 () Bool)

(assert (=> b!20469 m!27789))

(declare-fun m!27791 () Bool)

(assert (=> b!20467 m!27791))

(declare-fun m!27793 () Bool)

(assert (=> b!20471 m!27793))

(declare-fun m!27795 () Bool)

(assert (=> b!20471 m!27795))

(declare-fun m!27797 () Bool)

(assert (=> b!20471 m!27797))

(declare-fun m!27799 () Bool)

(assert (=> b!20471 m!27799))

(declare-fun m!27801 () Bool)

(assert (=> b!20471 m!27801))

(assert (=> b!20471 m!27797))

(declare-fun m!27803 () Bool)

(assert (=> b!20470 m!27803))

(declare-fun m!27805 () Bool)

(assert (=> start!5128 m!27805))

(declare-fun m!27807 () Bool)

(assert (=> start!5128 m!27807))

(declare-fun m!27809 () Bool)

(assert (=> b!20468 m!27809))

(declare-fun m!27811 () Bool)

(assert (=> b!20468 m!27811))

(declare-fun m!27813 () Bool)

(assert (=> b!20468 m!27813))

(push 1)

(assert (not b!20466))

(assert (not b!20468))

(assert (not b!20467))

(assert (not b!20471))

(assert (not b!20470))

(assert (not b!20469))

(assert (not start!5128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

