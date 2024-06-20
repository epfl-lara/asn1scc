; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10436 () Bool)

(assert start!10436)

(declare-fun res!43760 () Bool)

(declare-fun e!34817 () Bool)

(assert (=> start!10436 (=> (not res!43760) (not e!34817))))

(declare-datatypes ((array!2457 0))(
  ( (array!2458 (arr!1659 (Array (_ BitVec 32) (_ BitVec 8))) (size!1123 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2457)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10436 (= res!43760 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1123 srcBuffer!2))))))))

(assert (=> start!10436 e!34817))

(assert (=> start!10436 true))

(declare-fun array_inv!1028 (array!2457) Bool)

(assert (=> start!10436 (array_inv!1028 srcBuffer!2)))

(declare-datatypes ((BitStream!1938 0))(
  ( (BitStream!1939 (buf!1473 array!2457) (currentByte!3016 (_ BitVec 32)) (currentBit!3011 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1938)

(declare-fun e!34816 () Bool)

(declare-fun inv!12 (BitStream!1938) Bool)

(assert (=> start!10436 (and (inv!12 thiss!1379) e!34816)))

(declare-fun b!52415 () Bool)

(declare-fun res!43761 () Bool)

(assert (=> b!52415 (=> (not res!43761) (not e!34817))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52415 (= res!43761 (validate_offset_bits!1 ((_ sign_extend 32) (size!1123 (buf!1473 thiss!1379))) ((_ sign_extend 32) (currentByte!3016 thiss!1379)) ((_ sign_extend 32) (currentBit!3011 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52416 () Bool)

(assert (=> b!52416 (= e!34817 (not (or (bvsge i!635 to!314) (bvsge (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1938 BitStream!1938) Bool)

(assert (=> b!52416 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3650 0))(
  ( (Unit!3651) )
))
(declare-fun lt!81411 () Unit!3650)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1938) Unit!3650)

(assert (=> b!52416 (= lt!81411 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81412 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52416 (= lt!81412 (bitIndex!0 (size!1123 (buf!1473 thiss!1379)) (currentByte!3016 thiss!1379) (currentBit!3011 thiss!1379)))))

(declare-fun b!52417 () Bool)

(assert (=> b!52417 (= e!34816 (array_inv!1028 (buf!1473 thiss!1379)))))

(assert (= (and start!10436 res!43760) b!52415))

(assert (= (and b!52415 res!43761) b!52416))

(assert (= start!10436 b!52417))

(declare-fun m!82749 () Bool)

(assert (=> start!10436 m!82749))

(declare-fun m!82751 () Bool)

(assert (=> start!10436 m!82751))

(declare-fun m!82753 () Bool)

(assert (=> b!52415 m!82753))

(declare-fun m!82755 () Bool)

(assert (=> b!52416 m!82755))

(declare-fun m!82757 () Bool)

(assert (=> b!52416 m!82757))

(declare-fun m!82759 () Bool)

(assert (=> b!52416 m!82759))

(declare-fun m!82761 () Bool)

(assert (=> b!52417 m!82761))

(check-sat (not start!10436) (not b!52416) (not b!52415) (not b!52417))
(check-sat)
