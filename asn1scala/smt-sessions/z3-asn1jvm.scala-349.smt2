; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8256 () Bool)

(assert start!8256)

(declare-fun res!35055 () Bool)

(declare-fun e!27248 () Bool)

(assert (=> start!8256 (=> (not res!35055) (not e!27248))))

(declare-datatypes ((array!2059 0))(
  ( (array!2060 (arr!1428 (Array (_ BitVec 32) (_ BitVec 8))) (size!929 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2059)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8256 (= res!35055 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!929 srcBuffer!2))))))))

(assert (=> start!8256 e!27248))

(assert (=> start!8256 true))

(declare-fun array_inv!854 (array!2059) Bool)

(assert (=> start!8256 (array_inv!854 srcBuffer!2)))

(declare-datatypes ((BitStream!1602 0))(
  ( (BitStream!1603 (buf!1257 array!2059) (currentByte!2700 (_ BitVec 32)) (currentBit!2695 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1602)

(declare-fun e!27250 () Bool)

(declare-fun inv!12 (BitStream!1602) Bool)

(assert (=> start!8256 (and (inv!12 thiss!1379) e!27250)))

(declare-fun b!41196 () Bool)

(declare-fun e!27247 () Bool)

(assert (=> b!41196 (= e!27248 (not e!27247))))

(declare-fun res!35057 () Bool)

(assert (=> b!41196 (=> res!35057 e!27247)))

(declare-fun lt!62480 () (_ BitVec 64))

(assert (=> b!41196 (= res!35057 (or (bvslt i!635 to!314) (not (= lt!62480 (bvsub (bvadd lt!62480 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1602 BitStream!1602) Bool)

(assert (=> b!41196 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2906 0))(
  ( (Unit!2907) )
))
(declare-fun lt!62482 () Unit!2906)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1602) Unit!2906)

(assert (=> b!41196 (= lt!62482 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41196 (= lt!62480 (bitIndex!0 (size!929 (buf!1257 thiss!1379)) (currentByte!2700 thiss!1379) (currentBit!2695 thiss!1379)))))

(declare-fun b!41197 () Bool)

(assert (=> b!41197 (= e!27247 true)))

(declare-datatypes ((tuple2!3938 0))(
  ( (tuple2!3939 (_1!2056 array!2059) (_2!2056 BitStream!1602)) )
))
(declare-fun lt!62481 () tuple2!3938)

(declare-fun readBits!0 (BitStream!1602 (_ BitVec 64)) tuple2!3938)

(declare-datatypes ((tuple2!3940 0))(
  ( (tuple2!3941 (_1!2057 BitStream!1602) (_2!2057 BitStream!1602)) )
))
(declare-fun reader!0 (BitStream!1602 BitStream!1602) tuple2!3940)

(assert (=> b!41197 (= lt!62481 (readBits!0 (_1!2057 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41198 () Bool)

(declare-fun res!35056 () Bool)

(assert (=> b!41198 (=> (not res!35056) (not e!27248))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41198 (= res!35056 (validate_offset_bits!1 ((_ sign_extend 32) (size!929 (buf!1257 thiss!1379))) ((_ sign_extend 32) (currentByte!2700 thiss!1379)) ((_ sign_extend 32) (currentBit!2695 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41199 () Bool)

(assert (=> b!41199 (= e!27250 (array_inv!854 (buf!1257 thiss!1379)))))

(declare-fun b!41200 () Bool)

(declare-fun res!35058 () Bool)

(assert (=> b!41200 (=> res!35058 e!27247)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41200 (= res!35058 (not (invariant!0 (currentBit!2695 thiss!1379) (currentByte!2700 thiss!1379) (size!929 (buf!1257 thiss!1379)))))))

(assert (= (and start!8256 res!35055) b!41198))

(assert (= (and b!41198 res!35056) b!41196))

(assert (= (and b!41196 (not res!35057)) b!41200))

(assert (= (and b!41200 (not res!35058)) b!41197))

(assert (= start!8256 b!41199))

(declare-fun m!62847 () Bool)

(assert (=> b!41199 m!62847))

(declare-fun m!62849 () Bool)

(assert (=> b!41198 m!62849))

(declare-fun m!62851 () Bool)

(assert (=> b!41200 m!62851))

(declare-fun m!62853 () Bool)

(assert (=> b!41197 m!62853))

(declare-fun m!62855 () Bool)

(assert (=> b!41197 m!62855))

(declare-fun m!62857 () Bool)

(assert (=> start!8256 m!62857))

(declare-fun m!62859 () Bool)

(assert (=> start!8256 m!62859))

(declare-fun m!62861 () Bool)

(assert (=> b!41196 m!62861))

(declare-fun m!62863 () Bool)

(assert (=> b!41196 m!62863))

(declare-fun m!62865 () Bool)

(assert (=> b!41196 m!62865))

(check-sat (not start!8256) (not b!41196) (not b!41197) (not b!41199) (not b!41198) (not b!41200))
