; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4818 () Bool)

(assert start!4818)

(declare-fun b!18958 () Bool)

(declare-fun e!12378 () Bool)

(declare-fun e!12379 () Bool)

(assert (=> b!18958 (= e!12378 (not e!12379))))

(declare-fun res!16590 () Bool)

(assert (=> b!18958 (=> res!16590 e!12379)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!18958 (= res!16590 (bvsge i!635 to!314))))

(declare-datatypes ((array!1342 0))(
  ( (array!1343 (arr!1007 (Array (_ BitVec 32) (_ BitVec 8))) (size!566 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!966 0))(
  ( (BitStream!967 (buf!866 array!1342) (currentByte!2146 (_ BitVec 32)) (currentBit!2141 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!966)

(declare-fun isPrefixOf!0 (BitStream!966 BitStream!966) Bool)

(assert (=> b!18958 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1676 0))(
  ( (Unit!1677) )
))
(declare-fun lt!27046 () Unit!1676)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!966) Unit!1676)

(assert (=> b!18958 (= lt!27046 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27043 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18958 (= lt!27043 (bitIndex!0 (size!566 (buf!866 thiss!1379)) (currentByte!2146 thiss!1379) (currentBit!2141 thiss!1379)))))

(declare-fun res!16589 () Bool)

(assert (=> start!4818 (=> (not res!16589) (not e!12378))))

(declare-fun srcBuffer!2 () array!1342)

(assert (=> start!4818 (= res!16589 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!566 srcBuffer!2))))))))

(assert (=> start!4818 e!12378))

(assert (=> start!4818 true))

(declare-fun array_inv!536 (array!1342) Bool)

(assert (=> start!4818 (array_inv!536 srcBuffer!2)))

(declare-fun e!12376 () Bool)

(declare-fun inv!12 (BitStream!966) Bool)

(assert (=> start!4818 (and (inv!12 thiss!1379) e!12376)))

(declare-fun b!18959 () Bool)

(declare-fun res!16591 () Bool)

(assert (=> b!18959 (=> (not res!16591) (not e!12378))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18959 (= res!16591 (validate_offset_bits!1 ((_ sign_extend 32) (size!566 (buf!866 thiss!1379))) ((_ sign_extend 32) (currentByte!2146 thiss!1379)) ((_ sign_extend 32) (currentBit!2141 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18960 () Bool)

(assert (=> b!18960 (= e!12376 (array_inv!536 (buf!866 thiss!1379)))))

(declare-fun b!18961 () Bool)

(declare-fun e!12377 () Bool)

(assert (=> b!18961 (= e!12377 true)))

(declare-fun lt!27044 () (_ BitVec 64))

(declare-datatypes ((tuple2!2140 0))(
  ( (tuple2!2141 (_1!1155 Unit!1676) (_2!1155 BitStream!966)) )
))
(declare-fun lt!27045 () tuple2!2140)

(assert (=> b!18961 (= lt!27044 (bitIndex!0 (size!566 (buf!866 (_2!1155 lt!27045))) (currentByte!2146 (_2!1155 lt!27045)) (currentBit!2141 (_2!1155 lt!27045))))))

(declare-fun b!18962 () Bool)

(assert (=> b!18962 (= e!12379 e!12377)))

(declare-fun res!16592 () Bool)

(assert (=> b!18962 (=> res!16592 e!12377)))

(assert (=> b!18962 (= res!16592 (not (= (size!566 (buf!866 thiss!1379)) (size!566 (buf!866 (_2!1155 lt!27045))))))))

(declare-fun appendBitFromByte!0 (BitStream!966 (_ BitVec 8) (_ BitVec 32)) tuple2!2140)

(assert (=> b!18962 (= lt!27045 (appendBitFromByte!0 thiss!1379 (select (arr!1007 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!4818 res!16589) b!18959))

(assert (= (and b!18959 res!16591) b!18958))

(assert (= (and b!18958 (not res!16590)) b!18962))

(assert (= (and b!18962 (not res!16592)) b!18961))

(assert (= start!4818 b!18960))

(declare-fun m!25415 () Bool)

(assert (=> b!18959 m!25415))

(declare-fun m!25417 () Bool)

(assert (=> b!18960 m!25417))

(declare-fun m!25419 () Bool)

(assert (=> start!4818 m!25419))

(declare-fun m!25421 () Bool)

(assert (=> start!4818 m!25421))

(declare-fun m!25423 () Bool)

(assert (=> b!18958 m!25423))

(declare-fun m!25425 () Bool)

(assert (=> b!18958 m!25425))

(declare-fun m!25427 () Bool)

(assert (=> b!18958 m!25427))

(declare-fun m!25429 () Bool)

(assert (=> b!18961 m!25429))

(declare-fun m!25431 () Bool)

(assert (=> b!18962 m!25431))

(assert (=> b!18962 m!25431))

(declare-fun m!25433 () Bool)

(assert (=> b!18962 m!25433))

(check-sat (not b!18960) (not b!18959) (not start!4818) (not b!18961) (not b!18962) (not b!18958))
