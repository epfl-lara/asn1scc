; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10350 () Bool)

(assert start!10350)

(declare-fun res!43539 () Bool)

(declare-fun e!34380 () Bool)

(assert (=> start!10350 (=> (not res!43539) (not e!34380))))

(declare-datatypes ((array!2377 0))(
  ( (array!2378 (arr!1619 (Array (_ BitVec 32) (_ BitVec 8))) (size!1083 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2377)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10350 (= res!43539 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1083 srcBuffer!2))))))))

(assert (=> start!10350 e!34380))

(assert (=> start!10350 true))

(declare-fun array_inv!988 (array!2377) Bool)

(assert (=> start!10350 (array_inv!988 srcBuffer!2)))

(declare-datatypes ((BitStream!1870 0))(
  ( (BitStream!1871 (buf!1439 array!2377) (currentByte!2982 (_ BitVec 32)) (currentBit!2977 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1870)

(declare-fun e!34382 () Bool)

(declare-fun inv!12 (BitStream!1870) Bool)

(assert (=> start!10350 (and (inv!12 thiss!1379) e!34382)))

(declare-fun b!52091 () Bool)

(declare-fun res!43538 () Bool)

(assert (=> b!52091 (=> (not res!43538) (not e!34380))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52091 (= res!43538 (validate_offset_bits!1 ((_ sign_extend 32) (size!1083 (buf!1439 thiss!1379))) ((_ sign_extend 32) (currentByte!2982 thiss!1379)) ((_ sign_extend 32) (currentBit!2977 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52092 () Bool)

(assert (=> b!52092 (= e!34380 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1870 BitStream!1870) Bool)

(assert (=> b!52092 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3588 0))(
  ( (Unit!3589) )
))
(declare-fun lt!81217 () Unit!3588)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1870) Unit!3588)

(assert (=> b!52092 (= lt!81217 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81216 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52092 (= lt!81216 (bitIndex!0 (size!1083 (buf!1439 thiss!1379)) (currentByte!2982 thiss!1379) (currentBit!2977 thiss!1379)))))

(declare-fun b!52093 () Bool)

(assert (=> b!52093 (= e!34382 (array_inv!988 (buf!1439 thiss!1379)))))

(assert (= (and start!10350 res!43539) b!52091))

(assert (= (and b!52091 res!43538) b!52092))

(assert (= start!10350 b!52093))

(declare-fun m!82261 () Bool)

(assert (=> start!10350 m!82261))

(declare-fun m!82263 () Bool)

(assert (=> start!10350 m!82263))

(declare-fun m!82265 () Bool)

(assert (=> b!52091 m!82265))

(declare-fun m!82267 () Bool)

(assert (=> b!52092 m!82267))

(declare-fun m!82269 () Bool)

(assert (=> b!52092 m!82269))

(declare-fun m!82271 () Bool)

(assert (=> b!52092 m!82271))

(declare-fun m!82273 () Bool)

(assert (=> b!52093 m!82273))

(push 1)

(assert (not b!52093))

(assert (not start!10350))

(assert (not b!52092))

(assert (not b!52091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

