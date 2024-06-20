; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10418 () Bool)

(assert start!10418)

(declare-fun res!43706 () Bool)

(declare-fun e!34706 () Bool)

(assert (=> start!10418 (=> (not res!43706) (not e!34706))))

(declare-datatypes ((array!2439 0))(
  ( (array!2440 (arr!1650 (Array (_ BitVec 32) (_ BitVec 8))) (size!1114 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2439)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10418 (= res!43706 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1114 srcBuffer!2))))))))

(assert (=> start!10418 e!34706))

(assert (=> start!10418 true))

(declare-fun array_inv!1019 (array!2439) Bool)

(assert (=> start!10418 (array_inv!1019 srcBuffer!2)))

(declare-datatypes ((BitStream!1920 0))(
  ( (BitStream!1921 (buf!1464 array!2439) (currentByte!3007 (_ BitVec 32)) (currentBit!3002 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1920)

(declare-fun e!34709 () Bool)

(declare-fun inv!12 (BitStream!1920) Bool)

(assert (=> start!10418 (and (inv!12 thiss!1379) e!34709)))

(declare-fun b!52334 () Bool)

(declare-fun res!43707 () Bool)

(assert (=> b!52334 (=> (not res!43707) (not e!34706))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52334 (= res!43707 (validate_offset_bits!1 ((_ sign_extend 32) (size!1114 (buf!1464 thiss!1379))) ((_ sign_extend 32) (currentByte!3007 thiss!1379)) ((_ sign_extend 32) (currentBit!3002 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52335 () Bool)

(assert (=> b!52335 (= e!34706 (not (or (bvsge i!635 to!314) (let ((bdg!2518 ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) (and (bvsge bdg!2518 #b00000000000000000000000000000000) (bvslt bdg!2518 (size!1114 srcBuffer!2)))))))))

(declare-fun isPrefixOf!0 (BitStream!1920 BitStream!1920) Bool)

(assert (=> b!52335 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3632 0))(
  ( (Unit!3633) )
))
(declare-fun lt!81357 () Unit!3632)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1920) Unit!3632)

(assert (=> b!52335 (= lt!81357 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81358 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52335 (= lt!81358 (bitIndex!0 (size!1114 (buf!1464 thiss!1379)) (currentByte!3007 thiss!1379) (currentBit!3002 thiss!1379)))))

(declare-fun b!52336 () Bool)

(assert (=> b!52336 (= e!34709 (array_inv!1019 (buf!1464 thiss!1379)))))

(assert (= (and start!10418 res!43706) b!52334))

(assert (= (and b!52334 res!43707) b!52335))

(assert (= start!10418 b!52336))

(declare-fun m!82623 () Bool)

(assert (=> start!10418 m!82623))

(declare-fun m!82625 () Bool)

(assert (=> start!10418 m!82625))

(declare-fun m!82627 () Bool)

(assert (=> b!52334 m!82627))

(declare-fun m!82629 () Bool)

(assert (=> b!52335 m!82629))

(declare-fun m!82631 () Bool)

(assert (=> b!52335 m!82631))

(declare-fun m!82633 () Bool)

(assert (=> b!52335 m!82633))

(declare-fun m!82635 () Bool)

(assert (=> b!52336 m!82635))

(check-sat (not b!52334) (not b!52336) (not start!10418) (not b!52335))
(check-sat)
