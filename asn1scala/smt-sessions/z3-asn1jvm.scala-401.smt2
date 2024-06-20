; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10394 () Bool)

(assert start!10394)

(declare-fun res!43634 () Bool)

(declare-fun e!34562 () Bool)

(assert (=> start!10394 (=> (not res!43634) (not e!34562))))

(declare-datatypes ((array!2415 0))(
  ( (array!2416 (arr!1638 (Array (_ BitVec 32) (_ BitVec 8))) (size!1102 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2415)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10394 (= res!43634 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1102 srcBuffer!2))))))))

(assert (=> start!10394 e!34562))

(assert (=> start!10394 true))

(declare-fun array_inv!1007 (array!2415) Bool)

(assert (=> start!10394 (array_inv!1007 srcBuffer!2)))

(declare-datatypes ((BitStream!1896 0))(
  ( (BitStream!1897 (buf!1452 array!2415) (currentByte!2995 (_ BitVec 32)) (currentBit!2990 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1896)

(declare-fun e!34563 () Bool)

(declare-fun inv!12 (BitStream!1896) Bool)

(assert (=> start!10394 (and (inv!12 thiss!1379) e!34563)))

(declare-fun b!52226 () Bool)

(declare-fun res!43635 () Bool)

(assert (=> b!52226 (=> (not res!43635) (not e!34562))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52226 (= res!43635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1102 (buf!1452 thiss!1379))) ((_ sign_extend 32) (currentByte!2995 thiss!1379)) ((_ sign_extend 32) (currentBit!2990 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52227 () Bool)

(assert (=> b!52227 (= e!34562 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1896 BitStream!1896) Bool)

(assert (=> b!52227 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3608 0))(
  ( (Unit!3609) )
))
(declare-fun lt!81285 () Unit!3608)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1896) Unit!3608)

(assert (=> b!52227 (= lt!81285 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81286 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52227 (= lt!81286 (bitIndex!0 (size!1102 (buf!1452 thiss!1379)) (currentByte!2995 thiss!1379) (currentBit!2990 thiss!1379)))))

(declare-fun b!52228 () Bool)

(assert (=> b!52228 (= e!34563 (array_inv!1007 (buf!1452 thiss!1379)))))

(assert (= (and start!10394 res!43634) b!52226))

(assert (= (and b!52226 res!43635) b!52227))

(assert (= start!10394 b!52228))

(declare-fun m!82455 () Bool)

(assert (=> start!10394 m!82455))

(declare-fun m!82457 () Bool)

(assert (=> start!10394 m!82457))

(declare-fun m!82459 () Bool)

(assert (=> b!52226 m!82459))

(declare-fun m!82461 () Bool)

(assert (=> b!52227 m!82461))

(declare-fun m!82463 () Bool)

(assert (=> b!52227 m!82463))

(declare-fun m!82465 () Bool)

(assert (=> b!52227 m!82465))

(declare-fun m!82467 () Bool)

(assert (=> b!52228 m!82467))

(check-sat (not b!52228) (not b!52227) (not start!10394) (not b!52226))
