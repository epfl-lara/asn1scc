; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8190 () Bool)

(assert start!8190)

(declare-fun res!34875 () Bool)

(declare-fun e!27062 () Bool)

(assert (=> start!8190 (=> (not res!34875) (not e!27062))))

(declare-datatypes ((array!2038 0))(
  ( (array!2039 (arr!1419 (Array (_ BitVec 32) (_ BitVec 8))) (size!920 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2038)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8190 (= res!34875 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!920 srcBuffer!2))))))))

(assert (=> start!8190 e!27062))

(assert (=> start!8190 true))

(declare-fun array_inv!845 (array!2038) Bool)

(assert (=> start!8190 (array_inv!845 srcBuffer!2)))

(declare-datatypes ((BitStream!1584 0))(
  ( (BitStream!1585 (buf!1248 array!2038) (currentByte!2682 (_ BitVec 32)) (currentBit!2677 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1584)

(declare-fun e!27063 () Bool)

(declare-fun inv!12 (BitStream!1584) Bool)

(assert (=> start!8190 (and (inv!12 thiss!1379) e!27063)))

(declare-fun b!40970 () Bool)

(declare-fun res!34874 () Bool)

(assert (=> b!40970 (=> (not res!34874) (not e!27062))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40970 (= res!34874 (validate_offset_bits!1 ((_ sign_extend 32) (size!920 (buf!1248 thiss!1379))) ((_ sign_extend 32) (currentByte!2682 thiss!1379)) ((_ sign_extend 32) (currentBit!2677 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40971 () Bool)

(assert (=> b!40971 (= e!27062 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1584 BitStream!1584) Bool)

(assert (=> b!40971 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2885 0))(
  ( (Unit!2886) )
))
(declare-fun lt!62161 () Unit!2885)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1584) Unit!2885)

(assert (=> b!40971 (= lt!62161 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62160 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40971 (= lt!62160 (bitIndex!0 (size!920 (buf!1248 thiss!1379)) (currentByte!2682 thiss!1379) (currentBit!2677 thiss!1379)))))

(declare-fun b!40972 () Bool)

(assert (=> b!40972 (= e!27063 (array_inv!845 (buf!1248 thiss!1379)))))

(assert (= (and start!8190 res!34875) b!40970))

(assert (= (and b!40970 res!34874) b!40971))

(assert (= start!8190 b!40972))

(declare-fun m!62601 () Bool)

(assert (=> start!8190 m!62601))

(declare-fun m!62603 () Bool)

(assert (=> start!8190 m!62603))

(declare-fun m!62605 () Bool)

(assert (=> b!40970 m!62605))

(declare-fun m!62607 () Bool)

(assert (=> b!40971 m!62607))

(declare-fun m!62609 () Bool)

(assert (=> b!40971 m!62609))

(declare-fun m!62611 () Bool)

(assert (=> b!40971 m!62611))

(declare-fun m!62613 () Bool)

(assert (=> b!40972 m!62613))

(check-sat (not b!40971) (not start!8190) (not b!40972) (not b!40970))
