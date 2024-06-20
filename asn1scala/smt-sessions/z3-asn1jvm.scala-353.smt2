; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8280 () Bool)

(assert start!8280)

(declare-fun b!41376 () Bool)

(declare-fun e!27426 () Bool)

(declare-datatypes ((array!2083 0))(
  ( (array!2084 (arr!1440 (Array (_ BitVec 32) (_ BitVec 8))) (size!941 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1626 0))(
  ( (BitStream!1627 (buf!1269 array!2083) (currentByte!2712 (_ BitVec 32)) (currentBit!2707 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1626)

(declare-fun array_inv!866 (array!2083) Bool)

(assert (=> b!41376 (= e!27426 (array_inv!866 (buf!1269 thiss!1379)))))

(declare-fun b!41377 () Bool)

(declare-fun e!27428 () Bool)

(assert (=> b!41377 (= e!27428 true)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((tuple2!3986 0))(
  ( (tuple2!3987 (_1!2080 array!2083) (_2!2080 BitStream!1626)) )
))
(declare-fun lt!62588 () tuple2!3986)

(declare-fun readBits!0 (BitStream!1626 (_ BitVec 64)) tuple2!3986)

(declare-datatypes ((tuple2!3988 0))(
  ( (tuple2!3989 (_1!2081 BitStream!1626) (_2!2081 BitStream!1626)) )
))
(declare-fun reader!0 (BitStream!1626 BitStream!1626) tuple2!3988)

(assert (=> b!41377 (= lt!62588 (readBits!0 (_1!2081 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41378 () Bool)

(declare-fun res!35199 () Bool)

(declare-fun e!27429 () Bool)

(assert (=> b!41378 (=> (not res!35199) (not e!27429))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41378 (= res!35199 (validate_offset_bits!1 ((_ sign_extend 32) (size!941 (buf!1269 thiss!1379))) ((_ sign_extend 32) (currentByte!2712 thiss!1379)) ((_ sign_extend 32) (currentBit!2707 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35201 () Bool)

(assert (=> start!8280 (=> (not res!35201) (not e!27429))))

(declare-fun srcBuffer!2 () array!2083)

(assert (=> start!8280 (= res!35201 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!941 srcBuffer!2))))))))

(assert (=> start!8280 e!27429))

(assert (=> start!8280 true))

(assert (=> start!8280 (array_inv!866 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1626) Bool)

(assert (=> start!8280 (and (inv!12 thiss!1379) e!27426)))

(declare-fun b!41379 () Bool)

(assert (=> b!41379 (= e!27429 (not e!27428))))

(declare-fun res!35202 () Bool)

(assert (=> b!41379 (=> res!35202 e!27428)))

(declare-fun lt!62590 () (_ BitVec 64))

(assert (=> b!41379 (= res!35202 (or (bvslt i!635 to!314) (not (= lt!62590 (bvsub (bvadd lt!62590 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1626 BitStream!1626) Bool)

(assert (=> b!41379 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2930 0))(
  ( (Unit!2931) )
))
(declare-fun lt!62589 () Unit!2930)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1626) Unit!2930)

(assert (=> b!41379 (= lt!62589 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41379 (= lt!62590 (bitIndex!0 (size!941 (buf!1269 thiss!1379)) (currentByte!2712 thiss!1379) (currentBit!2707 thiss!1379)))))

(declare-fun b!41380 () Bool)

(declare-fun res!35200 () Bool)

(assert (=> b!41380 (=> res!35200 e!27428)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41380 (= res!35200 (not (invariant!0 (currentBit!2707 thiss!1379) (currentByte!2712 thiss!1379) (size!941 (buf!1269 thiss!1379)))))))

(assert (= (and start!8280 res!35201) b!41378))

(assert (= (and b!41378 res!35199) b!41379))

(assert (= (and b!41379 (not res!35202)) b!41380))

(assert (= (and b!41380 (not res!35200)) b!41377))

(assert (= start!8280 b!41376))

(declare-fun m!63087 () Bool)

(assert (=> b!41377 m!63087))

(declare-fun m!63089 () Bool)

(assert (=> b!41377 m!63089))

(declare-fun m!63091 () Bool)

(assert (=> b!41379 m!63091))

(declare-fun m!63093 () Bool)

(assert (=> b!41379 m!63093))

(declare-fun m!63095 () Bool)

(assert (=> b!41379 m!63095))

(declare-fun m!63097 () Bool)

(assert (=> b!41380 m!63097))

(declare-fun m!63099 () Bool)

(assert (=> b!41376 m!63099))

(declare-fun m!63101 () Bool)

(assert (=> start!8280 m!63101))

(declare-fun m!63103 () Bool)

(assert (=> start!8280 m!63103))

(declare-fun m!63105 () Bool)

(assert (=> b!41378 m!63105))

(check-sat (not start!8280) (not b!41378) (not b!41380) (not b!41377) (not b!41376) (not b!41379))
