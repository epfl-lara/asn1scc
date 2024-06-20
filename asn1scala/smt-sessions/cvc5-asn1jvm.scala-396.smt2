; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10362 () Bool)

(assert start!10362)

(declare-fun b!52149 () Bool)

(declare-fun res!43581 () Bool)

(declare-fun e!34454 () Bool)

(assert (=> b!52149 (=> res!43581 e!34454)))

(declare-datatypes ((array!2389 0))(
  ( (array!2390 (arr!1625 (Array (_ BitVec 32) (_ BitVec 8))) (size!1089 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1882 0))(
  ( (BitStream!1883 (buf!1445 array!2389) (currentByte!2988 (_ BitVec 32)) (currentBit!2983 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1882)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!52149 (= res!43581 (not (invariant!0 (currentBit!2983 thiss!1379) (currentByte!2988 thiss!1379) (size!1089 (buf!1445 thiss!1379)))))))

(declare-fun b!52150 () Bool)

(declare-fun res!43578 () Bool)

(declare-fun e!34455 () Bool)

(assert (=> b!52150 (=> (not res!43578) (not e!34455))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52150 (= res!43578 (validate_offset_bits!1 ((_ sign_extend 32) (size!1089 (buf!1445 thiss!1379))) ((_ sign_extend 32) (currentByte!2988 thiss!1379)) ((_ sign_extend 32) (currentBit!2983 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52151 () Bool)

(assert (=> b!52151 (= e!34455 (not e!34454))))

(declare-fun res!43580 () Bool)

(assert (=> b!52151 (=> res!43580 e!34454)))

(declare-fun lt!81256 () (_ BitVec 64))

(assert (=> b!52151 (= res!43580 (or (bvslt i!635 to!314) (not (= lt!81256 (bvsub (bvadd lt!81256 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1882 BitStream!1882) Bool)

(assert (=> b!52151 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3600 0))(
  ( (Unit!3601) )
))
(declare-fun lt!81255 () Unit!3600)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1882) Unit!3600)

(assert (=> b!52151 (= lt!81255 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52151 (= lt!81256 (bitIndex!0 (size!1089 (buf!1445 thiss!1379)) (currentByte!2988 thiss!1379) (currentBit!2983 thiss!1379)))))

(declare-fun res!43579 () Bool)

(assert (=> start!10362 (=> (not res!43579) (not e!34455))))

(declare-fun srcBuffer!2 () array!2389)

(assert (=> start!10362 (= res!43579 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1089 srcBuffer!2))))))))

(assert (=> start!10362 e!34455))

(assert (=> start!10362 true))

(declare-fun array_inv!994 (array!2389) Bool)

(assert (=> start!10362 (array_inv!994 srcBuffer!2)))

(declare-fun e!34456 () Bool)

(declare-fun inv!12 (BitStream!1882) Bool)

(assert (=> start!10362 (and (inv!12 thiss!1379) e!34456)))

(declare-fun b!52152 () Bool)

(assert (=> b!52152 (= e!34456 (array_inv!994 (buf!1445 thiss!1379)))))

(declare-fun b!52153 () Bool)

(assert (=> b!52153 (= e!34454 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4748 0))(
  ( (tuple2!4749 (_1!2479 array!2389) (_2!2479 BitStream!1882)) )
))
(declare-fun lt!81254 () tuple2!4748)

(declare-fun readBits!0 (BitStream!1882 (_ BitVec 64)) tuple2!4748)

(declare-datatypes ((tuple2!4750 0))(
  ( (tuple2!4751 (_1!2480 BitStream!1882) (_2!2480 BitStream!1882)) )
))
(declare-fun reader!0 (BitStream!1882 BitStream!1882) tuple2!4750)

(assert (=> b!52153 (= lt!81254 (readBits!0 (_1!2480 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!10362 res!43579) b!52150))

(assert (= (and b!52150 res!43578) b!52151))

(assert (= (and b!52151 (not res!43580)) b!52149))

(assert (= (and b!52149 (not res!43581)) b!52153))

(assert (= start!10362 b!52152))

(declare-fun m!82345 () Bool)

(assert (=> b!52149 m!82345))

(declare-fun m!82347 () Bool)

(assert (=> b!52152 m!82347))

(declare-fun m!82349 () Bool)

(assert (=> start!10362 m!82349))

(declare-fun m!82351 () Bool)

(assert (=> start!10362 m!82351))

(declare-fun m!82353 () Bool)

(assert (=> b!52153 m!82353))

(declare-fun m!82355 () Bool)

(assert (=> b!52153 m!82355))

(declare-fun m!82357 () Bool)

(assert (=> b!52150 m!82357))

(declare-fun m!82359 () Bool)

(assert (=> b!52151 m!82359))

(declare-fun m!82361 () Bool)

(assert (=> b!52151 m!82361))

(declare-fun m!82363 () Bool)

(assert (=> b!52151 m!82363))

(push 1)

(assert (not start!10362))

(assert (not b!52153))

(assert (not b!52150))

(assert (not b!52149))

(assert (not b!52151))

(assert (not b!52152))

(check-sat)

(pop 1)

(push 1)

(check-sat)

