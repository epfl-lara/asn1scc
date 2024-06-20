; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10412 () Bool)

(assert start!10412)

(declare-fun res!43688 () Bool)

(declare-fun e!34670 () Bool)

(assert (=> start!10412 (=> (not res!43688) (not e!34670))))

(declare-datatypes ((array!2433 0))(
  ( (array!2434 (arr!1647 (Array (_ BitVec 32) (_ BitVec 8))) (size!1111 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2433)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10412 (= res!43688 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1111 srcBuffer!2))))))))

(assert (=> start!10412 e!34670))

(assert (=> start!10412 true))

(declare-fun array_inv!1016 (array!2433) Bool)

(assert (=> start!10412 (array_inv!1016 srcBuffer!2)))

(declare-datatypes ((BitStream!1914 0))(
  ( (BitStream!1915 (buf!1461 array!2433) (currentByte!3004 (_ BitVec 32)) (currentBit!2999 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1914)

(declare-fun e!34673 () Bool)

(declare-fun inv!12 (BitStream!1914) Bool)

(assert (=> start!10412 (and (inv!12 thiss!1379) e!34673)))

(declare-fun b!52307 () Bool)

(declare-fun res!43689 () Bool)

(assert (=> b!52307 (=> (not res!43689) (not e!34670))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52307 (= res!43689 (validate_offset_bits!1 ((_ sign_extend 32) (size!1111 (buf!1461 thiss!1379))) ((_ sign_extend 32) (currentByte!3004 thiss!1379)) ((_ sign_extend 32) (currentBit!2999 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52308 () Bool)

(assert (=> b!52308 (= e!34670 (not (or (bvsge i!635 to!314) (bvsge (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1914 BitStream!1914) Bool)

(assert (=> b!52308 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3626 0))(
  ( (Unit!3627) )
))
(declare-fun lt!81340 () Unit!3626)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1914) Unit!3626)

(assert (=> b!52308 (= lt!81340 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81339 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52308 (= lt!81339 (bitIndex!0 (size!1111 (buf!1461 thiss!1379)) (currentByte!3004 thiss!1379) (currentBit!2999 thiss!1379)))))

(declare-fun b!52309 () Bool)

(assert (=> b!52309 (= e!34673 (array_inv!1016 (buf!1461 thiss!1379)))))

(assert (= (and start!10412 res!43688) b!52307))

(assert (= (and b!52307 res!43689) b!52308))

(assert (= start!10412 b!52309))

(declare-fun m!82581 () Bool)

(assert (=> start!10412 m!82581))

(declare-fun m!82583 () Bool)

(assert (=> start!10412 m!82583))

(declare-fun m!82585 () Bool)

(assert (=> b!52307 m!82585))

(declare-fun m!82587 () Bool)

(assert (=> b!52308 m!82587))

(declare-fun m!82589 () Bool)

(assert (=> b!52308 m!82589))

(declare-fun m!82591 () Bool)

(assert (=> b!52308 m!82591))

(declare-fun m!82593 () Bool)

(assert (=> b!52309 m!82593))

(check-sat (not start!10412) (not b!52307) (not b!52309) (not b!52308))
(check-sat)
