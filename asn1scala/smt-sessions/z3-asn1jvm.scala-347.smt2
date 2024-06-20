; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8196 () Bool)

(assert start!8196)

(declare-fun b!41008 () Bool)

(declare-fun e!27106 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!41008 (= e!27106 (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-datatypes ((array!2044 0))(
  ( (array!2045 (arr!1422 (Array (_ BitVec 32) (_ BitVec 8))) (size!923 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1590 0))(
  ( (BitStream!1591 (buf!1251 array!2044) (currentByte!2685 (_ BitVec 32)) (currentBit!2680 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3924 0))(
  ( (tuple2!3925 (_1!2049 BitStream!1590) (_2!2049 BitStream!1590)) )
))
(declare-fun lt!62183 () tuple2!3924)

(declare-fun thiss!1379 () BitStream!1590)

(declare-fun reader!0 (BitStream!1590 BitStream!1590) tuple2!3924)

(assert (=> b!41008 (= lt!62183 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!41009 () Bool)

(declare-fun e!27103 () Bool)

(declare-fun array_inv!848 (array!2044) Bool)

(assert (=> b!41009 (= e!27103 (array_inv!848 (buf!1251 thiss!1379)))))

(declare-fun b!41010 () Bool)

(declare-fun res!34903 () Bool)

(assert (=> b!41010 (=> res!34903 e!27106)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41010 (= res!34903 (not (invariant!0 (currentBit!2680 thiss!1379) (currentByte!2685 thiss!1379) (size!923 (buf!1251 thiss!1379)))))))

(declare-fun b!41011 () Bool)

(declare-fun res!34902 () Bool)

(declare-fun e!27105 () Bool)

(assert (=> b!41011 (=> (not res!34902) (not e!27105))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41011 (= res!34902 (validate_offset_bits!1 ((_ sign_extend 32) (size!923 (buf!1251 thiss!1379))) ((_ sign_extend 32) (currentByte!2685 thiss!1379)) ((_ sign_extend 32) (currentBit!2680 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41007 () Bool)

(assert (=> b!41007 (= e!27105 (not e!27106))))

(declare-fun res!34904 () Bool)

(assert (=> b!41007 (=> res!34904 e!27106)))

(declare-fun lt!62184 () (_ BitVec 64))

(assert (=> b!41007 (= res!34904 (or (bvslt i!635 to!314) (not (= lt!62184 (bvsub (bvadd lt!62184 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1590 BitStream!1590) Bool)

(assert (=> b!41007 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2891 0))(
  ( (Unit!2892) )
))
(declare-fun lt!62185 () Unit!2891)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1590) Unit!2891)

(assert (=> b!41007 (= lt!62185 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41007 (= lt!62184 (bitIndex!0 (size!923 (buf!1251 thiss!1379)) (currentByte!2685 thiss!1379) (currentBit!2680 thiss!1379)))))

(declare-fun res!34905 () Bool)

(assert (=> start!8196 (=> (not res!34905) (not e!27105))))

(declare-fun srcBuffer!2 () array!2044)

(assert (=> start!8196 (= res!34905 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!923 srcBuffer!2))))))))

(assert (=> start!8196 e!27105))

(assert (=> start!8196 true))

(assert (=> start!8196 (array_inv!848 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1590) Bool)

(assert (=> start!8196 (and (inv!12 thiss!1379) e!27103)))

(assert (= (and start!8196 res!34905) b!41011))

(assert (= (and b!41011 res!34902) b!41007))

(assert (= (and b!41007 (not res!34904)) b!41010))

(assert (= (and b!41010 (not res!34903)) b!41008))

(assert (= start!8196 b!41009))

(declare-fun m!62647 () Bool)

(assert (=> b!41007 m!62647))

(declare-fun m!62649 () Bool)

(assert (=> b!41007 m!62649))

(declare-fun m!62651 () Bool)

(assert (=> b!41007 m!62651))

(declare-fun m!62653 () Bool)

(assert (=> b!41009 m!62653))

(declare-fun m!62655 () Bool)

(assert (=> b!41008 m!62655))

(declare-fun m!62657 () Bool)

(assert (=> b!41010 m!62657))

(declare-fun m!62659 () Bool)

(assert (=> b!41011 m!62659))

(declare-fun m!62661 () Bool)

(assert (=> start!8196 m!62661))

(declare-fun m!62663 () Bool)

(assert (=> start!8196 m!62663))

(check-sat (not b!41009) (not b!41007) (not start!8196) (not b!41008) (not b!41010) (not b!41011))
(check-sat)
