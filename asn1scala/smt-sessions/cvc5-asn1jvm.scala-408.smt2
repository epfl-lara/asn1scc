; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10434 () Bool)

(assert start!10434)

(declare-fun res!43754 () Bool)

(declare-fun e!34804 () Bool)

(assert (=> start!10434 (=> (not res!43754) (not e!34804))))

(declare-datatypes ((array!2455 0))(
  ( (array!2456 (arr!1658 (Array (_ BitVec 32) (_ BitVec 8))) (size!1122 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2455)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!10434 (= res!43754 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1122 srcBuffer!2))))))))

(assert (=> start!10434 e!34804))

(assert (=> start!10434 true))

(declare-fun array_inv!1027 (array!2455) Bool)

(assert (=> start!10434 (array_inv!1027 srcBuffer!2)))

(declare-datatypes ((BitStream!1936 0))(
  ( (BitStream!1937 (buf!1472 array!2455) (currentByte!3015 (_ BitVec 32)) (currentBit!3010 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1936)

(declare-fun e!34802 () Bool)

(declare-fun inv!12 (BitStream!1936) Bool)

(assert (=> start!10434 (and (inv!12 thiss!1379) e!34802)))

(declare-fun b!52406 () Bool)

(declare-fun res!43755 () Bool)

(assert (=> b!52406 (=> (not res!43755) (not e!34804))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52406 (= res!43755 (validate_offset_bits!1 ((_ sign_extend 32) (size!1122 (buf!1472 thiss!1379))) ((_ sign_extend 32) (currentByte!3015 thiss!1379)) ((_ sign_extend 32) (currentBit!3010 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52407 () Bool)

(assert (=> b!52407 (= e!34804 (not (or (bvsge i!635 to!314) (bvsge (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1936 BitStream!1936) Bool)

(assert (=> b!52407 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3648 0))(
  ( (Unit!3649) )
))
(declare-fun lt!81405 () Unit!3648)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1936) Unit!3648)

(assert (=> b!52407 (= lt!81405 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81406 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52407 (= lt!81406 (bitIndex!0 (size!1122 (buf!1472 thiss!1379)) (currentByte!3015 thiss!1379) (currentBit!3010 thiss!1379)))))

(declare-fun b!52408 () Bool)

(assert (=> b!52408 (= e!34802 (array_inv!1027 (buf!1472 thiss!1379)))))

(assert (= (and start!10434 res!43754) b!52406))

(assert (= (and b!52406 res!43755) b!52407))

(assert (= start!10434 b!52408))

(declare-fun m!82735 () Bool)

(assert (=> start!10434 m!82735))

(declare-fun m!82737 () Bool)

(assert (=> start!10434 m!82737))

(declare-fun m!82739 () Bool)

(assert (=> b!52406 m!82739))

(declare-fun m!82741 () Bool)

(assert (=> b!52407 m!82741))

(declare-fun m!82743 () Bool)

(assert (=> b!52407 m!82743))

(declare-fun m!82745 () Bool)

(assert (=> b!52407 m!82745))

(declare-fun m!82747 () Bool)

(assert (=> b!52408 m!82747))

(push 1)

(assert (not b!52406))

(assert (not b!52408))

(assert (not b!52407))

(assert (not start!10434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

