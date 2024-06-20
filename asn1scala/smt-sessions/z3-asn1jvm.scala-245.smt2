; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4830 () Bool)

(assert start!4830)

(declare-fun b!19048 () Bool)

(declare-fun e!12487 () Bool)

(assert (=> b!19048 (= e!12487 true)))

(declare-fun lt!27117 () (_ BitVec 64))

(declare-datatypes ((array!1354 0))(
  ( (array!1355 (arr!1013 (Array (_ BitVec 32) (_ BitVec 8))) (size!572 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!978 0))(
  ( (BitStream!979 (buf!872 array!1354) (currentByte!2152 (_ BitVec 32)) (currentBit!2147 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1688 0))(
  ( (Unit!1689) )
))
(declare-datatypes ((tuple2!2152 0))(
  ( (tuple2!2153 (_1!1161 Unit!1688) (_2!1161 BitStream!978)) )
))
(declare-fun lt!27118 () tuple2!2152)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19048 (= lt!27117 (bitIndex!0 (size!572 (buf!872 (_2!1161 lt!27118))) (currentByte!2152 (_2!1161 lt!27118)) (currentBit!2147 (_2!1161 lt!27118))))))

(declare-fun b!19049 () Bool)

(declare-fun res!16664 () Bool)

(declare-fun e!12486 () Bool)

(assert (=> b!19049 (=> (not res!16664) (not e!12486))))

(declare-fun thiss!1379 () BitStream!978)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19049 (= res!16664 (validate_offset_bits!1 ((_ sign_extend 32) (size!572 (buf!872 thiss!1379))) ((_ sign_extend 32) (currentByte!2152 thiss!1379)) ((_ sign_extend 32) (currentBit!2147 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!16661 () Bool)

(assert (=> start!4830 (=> (not res!16661) (not e!12486))))

(declare-fun srcBuffer!2 () array!1354)

(assert (=> start!4830 (= res!16661 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!572 srcBuffer!2))))))))

(assert (=> start!4830 e!12486))

(assert (=> start!4830 true))

(declare-fun array_inv!542 (array!1354) Bool)

(assert (=> start!4830 (array_inv!542 srcBuffer!2)))

(declare-fun e!12485 () Bool)

(declare-fun inv!12 (BitStream!978) Bool)

(assert (=> start!4830 (and (inv!12 thiss!1379) e!12485)))

(declare-fun b!19050 () Bool)

(assert (=> b!19050 (= e!12485 (array_inv!542 (buf!872 thiss!1379)))))

(declare-fun b!19051 () Bool)

(declare-fun e!12488 () Bool)

(assert (=> b!19051 (= e!12488 e!12487)))

(declare-fun res!16663 () Bool)

(assert (=> b!19051 (=> res!16663 e!12487)))

(assert (=> b!19051 (= res!16663 (not (= (size!572 (buf!872 thiss!1379)) (size!572 (buf!872 (_2!1161 lt!27118))))))))

(declare-fun appendBitFromByte!0 (BitStream!978 (_ BitVec 8) (_ BitVec 32)) tuple2!2152)

(assert (=> b!19051 (= lt!27118 (appendBitFromByte!0 thiss!1379 (select (arr!1013 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19052 () Bool)

(assert (=> b!19052 (= e!12486 (not e!12488))))

(declare-fun res!16662 () Bool)

(assert (=> b!19052 (=> res!16662 e!12488)))

(assert (=> b!19052 (= res!16662 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!978 BitStream!978) Bool)

(assert (=> b!19052 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27116 () Unit!1688)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!978) Unit!1688)

(assert (=> b!19052 (= lt!27116 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27115 () (_ BitVec 64))

(assert (=> b!19052 (= lt!27115 (bitIndex!0 (size!572 (buf!872 thiss!1379)) (currentByte!2152 thiss!1379) (currentBit!2147 thiss!1379)))))

(assert (= (and start!4830 res!16661) b!19049))

(assert (= (and b!19049 res!16664) b!19052))

(assert (= (and b!19052 (not res!16662)) b!19051))

(assert (= (and b!19051 (not res!16663)) b!19048))

(assert (= start!4830 b!19050))

(declare-fun m!25535 () Bool)

(assert (=> b!19048 m!25535))

(declare-fun m!25537 () Bool)

(assert (=> b!19049 m!25537))

(declare-fun m!25539 () Bool)

(assert (=> b!19052 m!25539))

(declare-fun m!25541 () Bool)

(assert (=> b!19052 m!25541))

(declare-fun m!25543 () Bool)

(assert (=> b!19052 m!25543))

(declare-fun m!25545 () Bool)

(assert (=> start!4830 m!25545))

(declare-fun m!25547 () Bool)

(assert (=> start!4830 m!25547))

(declare-fun m!25549 () Bool)

(assert (=> b!19051 m!25549))

(assert (=> b!19051 m!25549))

(declare-fun m!25551 () Bool)

(assert (=> b!19051 m!25551))

(declare-fun m!25553 () Bool)

(assert (=> b!19050 m!25553))

(check-sat (not b!19052) (not b!19050) (not b!19049) (not b!19051) (not start!4830) (not b!19048))
