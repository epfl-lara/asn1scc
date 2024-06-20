; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8286 () Bool)

(assert start!8286)

(declare-fun b!41421 () Bool)

(declare-fun e!27474 () Bool)

(assert (=> b!41421 (= e!27474 true)))

(declare-datatypes ((array!2089 0))(
  ( (array!2090 (arr!1443 (Array (_ BitVec 32) (_ BitVec 8))) (size!944 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1632 0))(
  ( (BitStream!1633 (buf!1272 array!2089) (currentByte!2715 (_ BitVec 32)) (currentBit!2710 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1632)

(declare-datatypes ((tuple2!3998 0))(
  ( (tuple2!3999 (_1!2086 array!2089) (_2!2086 BitStream!1632)) )
))
(declare-fun lt!62616 () tuple2!3998)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!1632 (_ BitVec 64)) tuple2!3998)

(declare-datatypes ((tuple2!4000 0))(
  ( (tuple2!4001 (_1!2087 BitStream!1632) (_2!2087 BitStream!1632)) )
))
(declare-fun reader!0 (BitStream!1632 BitStream!1632) tuple2!4000)

(assert (=> b!41421 (= lt!62616 (readBits!0 (_1!2087 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41422 () Bool)

(declare-fun res!35237 () Bool)

(assert (=> b!41422 (=> res!35237 e!27474)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41422 (= res!35237 (not (invariant!0 (currentBit!2710 thiss!1379) (currentByte!2715 thiss!1379) (size!944 (buf!1272 thiss!1379)))))))

(declare-fun b!41424 () Bool)

(declare-fun e!27471 () Bool)

(declare-fun array_inv!869 (array!2089) Bool)

(assert (=> b!41424 (= e!27471 (array_inv!869 (buf!1272 thiss!1379)))))

(declare-fun b!41425 () Bool)

(declare-fun e!27475 () Bool)

(assert (=> b!41425 (= e!27475 (not e!27474))))

(declare-fun res!35235 () Bool)

(assert (=> b!41425 (=> res!35235 e!27474)))

(declare-fun lt!62617 () (_ BitVec 64))

(assert (=> b!41425 (= res!35235 (or (bvslt i!635 to!314) (not (= lt!62617 (bvsub (bvadd lt!62617 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1632 BitStream!1632) Bool)

(assert (=> b!41425 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2936 0))(
  ( (Unit!2937) )
))
(declare-fun lt!62615 () Unit!2936)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1632) Unit!2936)

(assert (=> b!41425 (= lt!62615 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41425 (= lt!62617 (bitIndex!0 (size!944 (buf!1272 thiss!1379)) (currentByte!2715 thiss!1379) (currentBit!2710 thiss!1379)))))

(declare-fun b!41423 () Bool)

(declare-fun res!35236 () Bool)

(assert (=> b!41423 (=> (not res!35236) (not e!27475))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41423 (= res!35236 (validate_offset_bits!1 ((_ sign_extend 32) (size!944 (buf!1272 thiss!1379))) ((_ sign_extend 32) (currentByte!2715 thiss!1379)) ((_ sign_extend 32) (currentBit!2710 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35238 () Bool)

(assert (=> start!8286 (=> (not res!35238) (not e!27475))))

(declare-fun srcBuffer!2 () array!2089)

(assert (=> start!8286 (= res!35238 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!944 srcBuffer!2))))))))

(assert (=> start!8286 e!27475))

(assert (=> start!8286 true))

(assert (=> start!8286 (array_inv!869 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1632) Bool)

(assert (=> start!8286 (and (inv!12 thiss!1379) e!27471)))

(assert (= (and start!8286 res!35238) b!41423))

(assert (= (and b!41423 res!35236) b!41425))

(assert (= (and b!41425 (not res!35235)) b!41422))

(assert (= (and b!41422 (not res!35237)) b!41421))

(assert (= start!8286 b!41424))

(declare-fun m!63147 () Bool)

(assert (=> b!41424 m!63147))

(declare-fun m!63149 () Bool)

(assert (=> b!41421 m!63149))

(declare-fun m!63151 () Bool)

(assert (=> b!41421 m!63151))

(declare-fun m!63153 () Bool)

(assert (=> b!41422 m!63153))

(declare-fun m!63155 () Bool)

(assert (=> b!41423 m!63155))

(declare-fun m!63157 () Bool)

(assert (=> start!8286 m!63157))

(declare-fun m!63159 () Bool)

(assert (=> start!8286 m!63159))

(declare-fun m!63161 () Bool)

(assert (=> b!41425 m!63161))

(declare-fun m!63163 () Bool)

(assert (=> b!41425 m!63163))

(declare-fun m!63165 () Bool)

(assert (=> b!41425 m!63165))

(check-sat (not b!41422) (not b!41421) (not b!41423) (not b!41424) (not b!41425) (not start!8286))
