; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10360 () Bool)

(assert start!10360)

(declare-fun res!43569 () Bool)

(declare-fun e!34442 () Bool)

(assert (=> start!10360 (=> (not res!43569) (not e!34442))))

(declare-datatypes ((array!2387 0))(
  ( (array!2388 (arr!1624 (Array (_ BitVec 32) (_ BitVec 8))) (size!1088 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2387)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10360 (= res!43569 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1088 srcBuffer!2))))))))

(assert (=> start!10360 e!34442))

(assert (=> start!10360 true))

(declare-fun array_inv!993 (array!2387) Bool)

(assert (=> start!10360 (array_inv!993 srcBuffer!2)))

(declare-datatypes ((BitStream!1880 0))(
  ( (BitStream!1881 (buf!1444 array!2387) (currentByte!2987 (_ BitVec 32)) (currentBit!2982 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1880)

(declare-fun e!34440 () Bool)

(declare-fun inv!12 (BitStream!1880) Bool)

(assert (=> start!10360 (and (inv!12 thiss!1379) e!34440)))

(declare-fun b!52136 () Bool)

(declare-fun res!43568 () Bool)

(assert (=> b!52136 (=> (not res!43568) (not e!34442))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52136 (= res!43568 (validate_offset_bits!1 ((_ sign_extend 32) (size!1088 (buf!1444 thiss!1379))) ((_ sign_extend 32) (currentByte!2987 thiss!1379)) ((_ sign_extend 32) (currentBit!2982 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52137 () Bool)

(assert (=> b!52137 (= e!34442 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1880 BitStream!1880) Bool)

(assert (=> b!52137 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3598 0))(
  ( (Unit!3599) )
))
(declare-fun lt!81247 () Unit!3598)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1880) Unit!3598)

(assert (=> b!52137 (= lt!81247 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81246 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52137 (= lt!81246 (bitIndex!0 (size!1088 (buf!1444 thiss!1379)) (currentByte!2987 thiss!1379) (currentBit!2982 thiss!1379)))))

(declare-fun b!52138 () Bool)

(assert (=> b!52138 (= e!34440 (array_inv!993 (buf!1444 thiss!1379)))))

(assert (= (and start!10360 res!43569) b!52136))

(assert (= (and b!52136 res!43568) b!52137))

(assert (= start!10360 b!52138))

(declare-fun m!82331 () Bool)

(assert (=> start!10360 m!82331))

(declare-fun m!82333 () Bool)

(assert (=> start!10360 m!82333))

(declare-fun m!82335 () Bool)

(assert (=> b!52136 m!82335))

(declare-fun m!82337 () Bool)

(assert (=> b!52137 m!82337))

(declare-fun m!82339 () Bool)

(assert (=> b!52137 m!82339))

(declare-fun m!82341 () Bool)

(assert (=> b!52137 m!82341))

(declare-fun m!82343 () Bool)

(assert (=> b!52138 m!82343))

(push 1)

(assert (not b!52136))

