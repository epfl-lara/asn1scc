; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10430 () Bool)

(assert start!10430)

(declare-fun res!43742 () Bool)

(declare-fun e!34781 () Bool)

(assert (=> start!10430 (=> (not res!43742) (not e!34781))))

(declare-datatypes ((array!2451 0))(
  ( (array!2452 (arr!1656 (Array (_ BitVec 32) (_ BitVec 8))) (size!1120 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2451)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10430 (= res!43742 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1120 srcBuffer!2))))))))

(assert (=> start!10430 e!34781))

(assert (=> start!10430 true))

(declare-fun array_inv!1025 (array!2451) Bool)

(assert (=> start!10430 (array_inv!1025 srcBuffer!2)))

(declare-datatypes ((BitStream!1932 0))(
  ( (BitStream!1933 (buf!1470 array!2451) (currentByte!3013 (_ BitVec 32)) (currentBit!3008 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1932)

(declare-fun e!34779 () Bool)

(declare-fun inv!12 (BitStream!1932) Bool)

(assert (=> start!10430 (and (inv!12 thiss!1379) e!34779)))

(declare-fun b!52388 () Bool)

(declare-fun res!43743 () Bool)

(assert (=> b!52388 (=> (not res!43743) (not e!34781))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52388 (= res!43743 (validate_offset_bits!1 ((_ sign_extend 32) (size!1120 (buf!1470 thiss!1379))) ((_ sign_extend 32) (currentByte!3013 thiss!1379)) ((_ sign_extend 32) (currentBit!3008 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52389 () Bool)

(assert (=> b!52389 (= e!34781 (not (or (bvsge i!635 to!314) (bvslt (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1932 BitStream!1932) Bool)

(assert (=> b!52389 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3644 0))(
  ( (Unit!3645) )
))
(declare-fun lt!81393 () Unit!3644)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1932) Unit!3644)

(assert (=> b!52389 (= lt!81393 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81394 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52389 (= lt!81394 (bitIndex!0 (size!1120 (buf!1470 thiss!1379)) (currentByte!3013 thiss!1379) (currentBit!3008 thiss!1379)))))

(declare-fun b!52390 () Bool)

(assert (=> b!52390 (= e!34779 (array_inv!1025 (buf!1470 thiss!1379)))))

(assert (= (and start!10430 res!43742) b!52388))

(assert (= (and b!52388 res!43743) b!52389))

(assert (= start!10430 b!52390))

(declare-fun m!82707 () Bool)

(assert (=> start!10430 m!82707))

(declare-fun m!82709 () Bool)

(assert (=> start!10430 m!82709))

(declare-fun m!82711 () Bool)

(assert (=> b!52388 m!82711))

(declare-fun m!82713 () Bool)

(assert (=> b!52389 m!82713))

(declare-fun m!82715 () Bool)

(assert (=> b!52389 m!82715))

(declare-fun m!82717 () Bool)

(assert (=> b!52389 m!82717))

(declare-fun m!82719 () Bool)

(assert (=> b!52390 m!82719))

(check-sat (not b!52388) (not b!52389) (not start!10430) (not b!52390))
(check-sat)
