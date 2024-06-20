; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8388 () Bool)

(assert start!8388)

(declare-fun b!41975 () Bool)

(declare-fun e!27948 () Bool)

(declare-datatypes ((array!2140 0))(
  ( (array!2141 (arr!1467 (Array (_ BitVec 32) (_ BitVec 8))) (size!968 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1680 0))(
  ( (BitStream!1681 (buf!1296 array!2140) (currentByte!2748 (_ BitVec 32)) (currentBit!2743 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1680)

(declare-fun array_inv!893 (array!2140) Bool)

(assert (=> b!41975 (= e!27948 (array_inv!893 (buf!1296 thiss!1379)))))

(declare-fun res!35703 () Bool)

(declare-fun e!27944 () Bool)

(assert (=> start!8388 (=> (not res!35703) (not e!27944))))

(declare-fun srcBuffer!2 () array!2140)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8388 (= res!35703 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!968 srcBuffer!2))))))))

(assert (=> start!8388 e!27944))

(assert (=> start!8388 true))

(assert (=> start!8388 (array_inv!893 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1680) Bool)

(assert (=> start!8388 (and (inv!12 thiss!1379) e!27948)))

(declare-fun b!41976 () Bool)

(declare-fun res!35701 () Bool)

(declare-fun e!27947 () Bool)

(assert (=> b!41976 (=> res!35701 e!27947)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41976 (= res!35701 (not (invariant!0 (currentBit!2743 thiss!1379) (currentByte!2748 thiss!1379) (size!968 (buf!1296 thiss!1379)))))))

(declare-fun b!41977 () Bool)

(declare-fun res!35699 () Bool)

(assert (=> b!41977 (=> (not res!35699) (not e!27944))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41977 (= res!35699 (validate_offset_bits!1 ((_ sign_extend 32) (size!968 (buf!1296 thiss!1379))) ((_ sign_extend 32) (currentByte!2748 thiss!1379)) ((_ sign_extend 32) (currentBit!2743 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41978 () Bool)

(declare-fun e!27945 () Bool)

(assert (=> b!41978 (= e!27947 e!27945)))

(declare-fun res!35702 () Bool)

(assert (=> b!41978 (=> res!35702 e!27945)))

(assert (=> b!41978 (= res!35702 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4094 0))(
  ( (tuple2!4095 (_1!2137 array!2140) (_2!2137 BitStream!1680)) )
))
(declare-fun lt!63163 () tuple2!4094)

(declare-fun readBits!0 (BitStream!1680 (_ BitVec 64)) tuple2!4094)

(declare-datatypes ((tuple2!4096 0))(
  ( (tuple2!4097 (_1!2138 BitStream!1680) (_2!2138 BitStream!1680)) )
))
(declare-fun reader!0 (BitStream!1680 BitStream!1680) tuple2!4096)

(assert (=> b!41978 (= lt!63163 (readBits!0 (_1!2138 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41979 () Bool)

(assert (=> b!41979 (= e!27945 true)))

(declare-datatypes ((Unit!2987 0))(
  ( (Unit!2988) )
))
(declare-fun lt!63162 () Unit!2987)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1680 array!2140 (_ BitVec 64)) Unit!2987)

(assert (=> b!41979 (= lt!63162 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1296 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun checkByteArrayBitContent!0 (BitStream!1680 array!2140 array!2140 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41979 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2137 lt!63163) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41980 () Bool)

(assert (=> b!41980 (= e!27944 (not e!27947))))

(declare-fun res!35700 () Bool)

(assert (=> b!41980 (=> res!35700 e!27947)))

(declare-fun lt!63160 () (_ BitVec 64))

(assert (=> b!41980 (= res!35700 (or (bvslt i!635 to!314) (not (= lt!63160 (bvsub (bvadd lt!63160 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1680 BitStream!1680) Bool)

(assert (=> b!41980 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63161 () Unit!2987)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1680) Unit!2987)

(assert (=> b!41980 (= lt!63161 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41980 (= lt!63160 (bitIndex!0 (size!968 (buf!1296 thiss!1379)) (currentByte!2748 thiss!1379) (currentBit!2743 thiss!1379)))))

(assert (= (and start!8388 res!35703) b!41977))

(assert (= (and b!41977 res!35699) b!41980))

(assert (= (and b!41980 (not res!35700)) b!41976))

(assert (= (and b!41976 (not res!35701)) b!41978))

(assert (= (and b!41978 (not res!35702)) b!41979))

(assert (= start!8388 b!41975))

(declare-fun m!63781 () Bool)

(assert (=> b!41980 m!63781))

(declare-fun m!63783 () Bool)

(assert (=> b!41980 m!63783))

(declare-fun m!63785 () Bool)

(assert (=> b!41980 m!63785))

(declare-fun m!63787 () Bool)

(assert (=> b!41977 m!63787))

(declare-fun m!63789 () Bool)

(assert (=> start!8388 m!63789))

(declare-fun m!63791 () Bool)

(assert (=> start!8388 m!63791))

(declare-fun m!63793 () Bool)

(assert (=> b!41979 m!63793))

(declare-fun m!63795 () Bool)

(assert (=> b!41979 m!63795))

(declare-fun m!63797 () Bool)

(assert (=> b!41976 m!63797))

(declare-fun m!63799 () Bool)

(assert (=> b!41975 m!63799))

(declare-fun m!63801 () Bool)

(assert (=> b!41978 m!63801))

(declare-fun m!63803 () Bool)

(assert (=> b!41978 m!63803))

(check-sat (not b!41979) (not b!41978) (not b!41977) (not b!41975) (not b!41980) (not start!8388) (not b!41976))
