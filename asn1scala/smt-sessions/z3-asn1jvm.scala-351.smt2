; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8268 () Bool)

(assert start!8268)

(declare-fun b!41286 () Bool)

(declare-fun e!27340 () Bool)

(declare-datatypes ((array!2071 0))(
  ( (array!2072 (arr!1434 (Array (_ BitVec 32) (_ BitVec 8))) (size!935 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1614 0))(
  ( (BitStream!1615 (buf!1263 array!2071) (currentByte!2706 (_ BitVec 32)) (currentBit!2701 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1614)

(declare-fun array_inv!860 (array!2071) Bool)

(assert (=> b!41286 (= e!27340 (array_inv!860 (buf!1263 thiss!1379)))))

(declare-fun b!41287 () Bool)

(declare-fun res!35129 () Bool)

(declare-fun e!27336 () Bool)

(assert (=> b!41287 (=> (not res!35129) (not e!27336))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41287 (= res!35129 (validate_offset_bits!1 ((_ sign_extend 32) (size!935 (buf!1263 thiss!1379))) ((_ sign_extend 32) (currentByte!2706 thiss!1379)) ((_ sign_extend 32) (currentBit!2701 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41288 () Bool)

(declare-fun e!27339 () Bool)

(assert (=> b!41288 (= e!27339 true)))

(declare-datatypes ((tuple2!3962 0))(
  ( (tuple2!3963 (_1!2068 array!2071) (_2!2068 BitStream!1614)) )
))
(declare-fun lt!62536 () tuple2!3962)

(declare-fun readBits!0 (BitStream!1614 (_ BitVec 64)) tuple2!3962)

(declare-datatypes ((tuple2!3964 0))(
  ( (tuple2!3965 (_1!2069 BitStream!1614) (_2!2069 BitStream!1614)) )
))
(declare-fun reader!0 (BitStream!1614 BitStream!1614) tuple2!3964)

(assert (=> b!41288 (= lt!62536 (readBits!0 (_1!2069 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35128 () Bool)

(assert (=> start!8268 (=> (not res!35128) (not e!27336))))

(declare-fun srcBuffer!2 () array!2071)

(assert (=> start!8268 (= res!35128 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!935 srcBuffer!2))))))))

(assert (=> start!8268 e!27336))

(assert (=> start!8268 true))

(assert (=> start!8268 (array_inv!860 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1614) Bool)

(assert (=> start!8268 (and (inv!12 thiss!1379) e!27340)))

(declare-fun b!41289 () Bool)

(assert (=> b!41289 (= e!27336 (not e!27339))))

(declare-fun res!35127 () Bool)

(assert (=> b!41289 (=> res!35127 e!27339)))

(declare-fun lt!62535 () (_ BitVec 64))

(assert (=> b!41289 (= res!35127 (or (bvslt i!635 to!314) (not (= lt!62535 (bvsub (bvadd lt!62535 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1614 BitStream!1614) Bool)

(assert (=> b!41289 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2918 0))(
  ( (Unit!2919) )
))
(declare-fun lt!62534 () Unit!2918)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1614) Unit!2918)

(assert (=> b!41289 (= lt!62534 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41289 (= lt!62535 (bitIndex!0 (size!935 (buf!1263 thiss!1379)) (currentByte!2706 thiss!1379) (currentBit!2701 thiss!1379)))))

(declare-fun b!41290 () Bool)

(declare-fun res!35130 () Bool)

(assert (=> b!41290 (=> res!35130 e!27339)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41290 (= res!35130 (not (invariant!0 (currentBit!2701 thiss!1379) (currentByte!2706 thiss!1379) (size!935 (buf!1263 thiss!1379)))))))

(assert (= (and start!8268 res!35128) b!41287))

(assert (= (and b!41287 res!35129) b!41289))

(assert (= (and b!41289 (not res!35127)) b!41290))

(assert (= (and b!41290 (not res!35130)) b!41288))

(assert (= start!8268 b!41286))

(declare-fun m!62967 () Bool)

(assert (=> b!41289 m!62967))

(declare-fun m!62969 () Bool)

(assert (=> b!41289 m!62969))

(declare-fun m!62971 () Bool)

(assert (=> b!41289 m!62971))

(declare-fun m!62973 () Bool)

(assert (=> b!41290 m!62973))

(declare-fun m!62975 () Bool)

(assert (=> b!41287 m!62975))

(declare-fun m!62977 () Bool)

(assert (=> start!8268 m!62977))

(declare-fun m!62979 () Bool)

(assert (=> start!8268 m!62979))

(declare-fun m!62981 () Bool)

(assert (=> b!41286 m!62981))

(declare-fun m!62983 () Bool)

(assert (=> b!41288 m!62983))

(declare-fun m!62985 () Bool)

(assert (=> b!41288 m!62985))

(check-sat (not b!41290) (not b!41289) (not start!8268) (not b!41287) (not b!41288) (not b!41286))
