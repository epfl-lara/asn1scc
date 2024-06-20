; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10308 () Bool)

(assert start!10308)

(declare-fun b!52039 () Bool)

(declare-fun e!34343 () Bool)

(declare-datatypes ((array!2372 0))(
  ( (array!2373 (arr!1618 (Array (_ BitVec 32) (_ BitVec 8))) (size!1082 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1868 0))(
  ( (BitStream!1869 (buf!1438 array!2372) (currentByte!2973 (_ BitVec 32)) (currentBit!2968 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1868)

(declare-fun array_inv!987 (array!2372) Bool)

(assert (=> b!52039 (= e!34343 (array_inv!987 (buf!1438 thiss!1379)))))

(declare-fun b!52036 () Bool)

(declare-fun res!43487 () Bool)

(declare-fun e!34342 () Bool)

(assert (=> b!52036 (=> (not res!43487) (not e!34342))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52036 (= res!43487 (validate_offset_bits!1 ((_ sign_extend 32) (size!1082 (buf!1438 thiss!1379))) ((_ sign_extend 32) (currentByte!2973 thiss!1379)) ((_ sign_extend 32) (currentBit!2968 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!43488 () Bool)

(assert (=> start!10308 (=> (not res!43488) (not e!34342))))

(declare-fun srcBuffer!2 () array!2372)

(assert (=> start!10308 (= res!43488 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1082 srcBuffer!2))))))))

(assert (=> start!10308 e!34342))

(assert (=> start!10308 true))

(assert (=> start!10308 (array_inv!987 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1868) Bool)

(assert (=> start!10308 (and (inv!12 thiss!1379) e!34343)))

(declare-fun b!52038 () Bool)

(declare-fun e!34340 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!52038 (= e!34340 (invariant!0 (currentBit!2968 thiss!1379) (currentByte!2973 thiss!1379) (size!1082 (buf!1438 thiss!1379))))))

(declare-fun b!52037 () Bool)

(assert (=> b!52037 (= e!34342 (not e!34340))))

(declare-fun res!43486 () Bool)

(assert (=> b!52037 (=> res!43486 e!34340)))

(declare-fun lt!81147 () (_ BitVec 64))

(assert (=> b!52037 (= res!43486 (not (= lt!81147 (bvsub (bvadd lt!81147 to!314) i!635))))))

(declare-fun isPrefixOf!0 (BitStream!1868 BitStream!1868) Bool)

(assert (=> b!52037 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3586 0))(
  ( (Unit!3587) )
))
(declare-fun lt!81148 () Unit!3586)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1868) Unit!3586)

(assert (=> b!52037 (= lt!81148 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52037 (= lt!81147 (bitIndex!0 (size!1082 (buf!1438 thiss!1379)) (currentByte!2973 thiss!1379) (currentBit!2968 thiss!1379)))))

(assert (= (and start!10308 res!43488) b!52036))

(assert (= (and b!52036 res!43487) b!52037))

(assert (= (and b!52037 (not res!43486)) b!52038))

(assert (= start!10308 b!52039))

(declare-fun m!82229 () Bool)

(assert (=> b!52039 m!82229))

(declare-fun m!82231 () Bool)

(assert (=> b!52036 m!82231))

(declare-fun m!82233 () Bool)

(assert (=> b!52037 m!82233))

(declare-fun m!82235 () Bool)

(assert (=> b!52037 m!82235))

(declare-fun m!82237 () Bool)

(assert (=> b!52037 m!82237))

(declare-fun m!82239 () Bool)

(assert (=> start!10308 m!82239))

(declare-fun m!82241 () Bool)

(assert (=> start!10308 m!82241))

(declare-fun m!82243 () Bool)

(assert (=> b!52038 m!82243))

(push 1)

(assert (not b!52039))

(assert (not start!10308))

(assert (not b!52036))

(assert (not b!52038))

(assert (not b!52037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

