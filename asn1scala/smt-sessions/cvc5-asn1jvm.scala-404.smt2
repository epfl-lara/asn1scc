; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10410 () Bool)

(assert start!10410)

(declare-fun res!43682 () Bool)

(declare-fun e!34661 () Bool)

(assert (=> start!10410 (=> (not res!43682) (not e!34661))))

(declare-datatypes ((array!2431 0))(
  ( (array!2432 (arr!1646 (Array (_ BitVec 32) (_ BitVec 8))) (size!1110 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2431)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10410 (= res!43682 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1110 srcBuffer!2))))))))

(assert (=> start!10410 e!34661))

(assert (=> start!10410 true))

(declare-fun array_inv!1015 (array!2431) Bool)

(assert (=> start!10410 (array_inv!1015 srcBuffer!2)))

(declare-datatypes ((BitStream!1912 0))(
  ( (BitStream!1913 (buf!1460 array!2431) (currentByte!3003 (_ BitVec 32)) (currentBit!2998 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1912)

(declare-fun e!34660 () Bool)

(declare-fun inv!12 (BitStream!1912) Bool)

(assert (=> start!10410 (and (inv!12 thiss!1379) e!34660)))

(declare-fun b!52298 () Bool)

(declare-fun res!43683 () Bool)

(assert (=> b!52298 (=> (not res!43683) (not e!34661))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52298 (= res!43683 (validate_offset_bits!1 ((_ sign_extend 32) (size!1110 (buf!1460 thiss!1379))) ((_ sign_extend 32) (currentByte!3003 thiss!1379)) ((_ sign_extend 32) (currentBit!2998 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52299 () Bool)

(assert (=> b!52299 (= e!34661 (not (or (bvsge i!635 to!314) (bvsge (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1912 BitStream!1912) Bool)

(assert (=> b!52299 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3624 0))(
  ( (Unit!3625) )
))
(declare-fun lt!81333 () Unit!3624)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1912) Unit!3624)

(assert (=> b!52299 (= lt!81333 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81334 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52299 (= lt!81334 (bitIndex!0 (size!1110 (buf!1460 thiss!1379)) (currentByte!3003 thiss!1379) (currentBit!2998 thiss!1379)))))

(declare-fun b!52300 () Bool)

(assert (=> b!52300 (= e!34660 (array_inv!1015 (buf!1460 thiss!1379)))))

(assert (= (and start!10410 res!43682) b!52298))

(assert (= (and b!52298 res!43683) b!52299))

(assert (= start!10410 b!52300))

(declare-fun m!82567 () Bool)

(assert (=> start!10410 m!82567))

(declare-fun m!82569 () Bool)

(assert (=> start!10410 m!82569))

(declare-fun m!82571 () Bool)

(assert (=> b!52298 m!82571))

(declare-fun m!82573 () Bool)

(assert (=> b!52299 m!82573))

(declare-fun m!82575 () Bool)

(assert (=> b!52299 m!82575))

(declare-fun m!82577 () Bool)

(assert (=> b!52299 m!82577))

(declare-fun m!82579 () Bool)

(assert (=> b!52300 m!82579))

(push 1)

(assert (not start!10410))

(assert (not b!52299))

(assert (not b!52298))

(assert (not b!52300))

(check-sat)

(pop 1)

(push 1)

(check-sat)

