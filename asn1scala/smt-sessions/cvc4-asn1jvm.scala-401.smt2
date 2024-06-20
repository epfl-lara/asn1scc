; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10396 () Bool)

(assert start!10396)

(declare-fun res!43640 () Bool)

(declare-fun e!34576 () Bool)

(assert (=> start!10396 (=> (not res!43640) (not e!34576))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2417 0))(
  ( (array!2418 (arr!1639 (Array (_ BitVec 32) (_ BitVec 8))) (size!1103 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2417)

(assert (=> start!10396 (= res!43640 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1103 srcBuffer!2))))))))

(assert (=> start!10396 e!34576))

(assert (=> start!10396 true))

(declare-fun array_inv!1008 (array!2417) Bool)

(assert (=> start!10396 (array_inv!1008 srcBuffer!2)))

(declare-datatypes ((BitStream!1898 0))(
  ( (BitStream!1899 (buf!1453 array!2417) (currentByte!2996 (_ BitVec 32)) (currentBit!2991 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1898)

(declare-fun e!34574 () Bool)

(declare-fun inv!12 (BitStream!1898) Bool)

(assert (=> start!10396 (and (inv!12 thiss!1379) e!34574)))

(declare-fun b!52235 () Bool)

(declare-fun res!43641 () Bool)

(assert (=> b!52235 (=> (not res!43641) (not e!34576))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52235 (= res!43641 (validate_offset_bits!1 ((_ sign_extend 32) (size!1103 (buf!1453 thiss!1379))) ((_ sign_extend 32) (currentByte!2996 thiss!1379)) ((_ sign_extend 32) (currentBit!2991 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52236 () Bool)

(assert (=> b!52236 (= e!34576 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1898 BitStream!1898) Bool)

(assert (=> b!52236 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3610 0))(
  ( (Unit!3611) )
))
(declare-fun lt!81291 () Unit!3610)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1898) Unit!3610)

(assert (=> b!52236 (= lt!81291 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81292 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52236 (= lt!81292 (bitIndex!0 (size!1103 (buf!1453 thiss!1379)) (currentByte!2996 thiss!1379) (currentBit!2991 thiss!1379)))))

(declare-fun b!52237 () Bool)

(assert (=> b!52237 (= e!34574 (array_inv!1008 (buf!1453 thiss!1379)))))

(assert (= (and start!10396 res!43640) b!52235))

(assert (= (and b!52235 res!43641) b!52236))

(assert (= start!10396 b!52237))

(declare-fun m!82469 () Bool)

(assert (=> start!10396 m!82469))

(declare-fun m!82471 () Bool)

(assert (=> start!10396 m!82471))

(declare-fun m!82473 () Bool)

(assert (=> b!52235 m!82473))

(declare-fun m!82475 () Bool)

(assert (=> b!52236 m!82475))

(declare-fun m!82477 () Bool)

(assert (=> b!52236 m!82477))

(declare-fun m!82479 () Bool)

(assert (=> b!52236 m!82479))

(declare-fun m!82481 () Bool)

(assert (=> b!52237 m!82481))

(push 1)

(assert (not b!52235))

(assert (not b!52236))

(assert (not start!10396))

(assert (not b!52237))

