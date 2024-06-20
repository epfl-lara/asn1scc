; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4944 () Bool)

(assert start!4944)

(declare-fun b!19627 () Bool)

(declare-fun e!13061 () Bool)

(declare-datatypes ((array!1411 0))(
  ( (array!1412 (arr!1040 (Array (_ BitVec 32) (_ BitVec 8))) (size!599 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1032 0))(
  ( (BitStream!1033 (buf!902 array!1411) (currentByte!2185 (_ BitVec 32)) (currentBit!2180 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1032)

(declare-fun array_inv!569 (array!1411) Bool)

(assert (=> b!19627 (= e!13061 (array_inv!569 (buf!902 thiss!1379)))))

(declare-fun b!19628 () Bool)

(declare-fun e!13062 () Bool)

(declare-fun e!13057 () Bool)

(assert (=> b!19628 (= e!13062 (not e!13057))))

(declare-fun res!17141 () Bool)

(assert (=> b!19628 (=> res!17141 e!13057)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19628 (= res!17141 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1032 BitStream!1032) Bool)

(assert (=> b!19628 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1745 0))(
  ( (Unit!1746) )
))
(declare-fun lt!27928 () Unit!1745)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1032) Unit!1745)

(assert (=> b!19628 (= lt!27928 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27923 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19628 (= lt!27923 (bitIndex!0 (size!599 (buf!902 thiss!1379)) (currentByte!2185 thiss!1379) (currentBit!2180 thiss!1379)))))

(declare-fun b!19629 () Bool)

(declare-fun e!13058 () Bool)

(assert (=> b!19629 (= e!13058 true)))

(declare-datatypes ((List!217 0))(
  ( (Nil!214) (Cons!213 (h!332 Bool) (t!967 List!217)) )
))
(declare-fun lt!27922 () List!217)

(declare-datatypes ((tuple2!2256 0))(
  ( (tuple2!2257 (_1!1213 Unit!1745) (_2!1213 BitStream!1032)) )
))
(declare-fun lt!27927 () tuple2!2256)

(declare-datatypes ((tuple2!2258 0))(
  ( (tuple2!2259 (_1!1214 BitStream!1032) (_2!1214 BitStream!1032)) )
))
(declare-fun lt!27926 () tuple2!2258)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1032 BitStream!1032 (_ BitVec 64)) List!217)

(assert (=> b!19629 (= lt!27922 (bitStreamReadBitsIntoList!0 (_2!1213 lt!27927) (_1!1214 lt!27926) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19629 (validate_offset_bits!1 ((_ sign_extend 32) (size!599 (buf!902 (_2!1213 lt!27927)))) ((_ sign_extend 32) (currentByte!2185 thiss!1379)) ((_ sign_extend 32) (currentBit!2180 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27925 () Unit!1745)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1032 array!1411 (_ BitVec 64)) Unit!1745)

(assert (=> b!19629 (= lt!27925 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!902 (_2!1213 lt!27927)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1032 BitStream!1032) tuple2!2258)

(assert (=> b!19629 (= lt!27926 (reader!0 thiss!1379 (_2!1213 lt!27927)))))

(declare-fun b!19630 () Bool)

(declare-fun res!17138 () Bool)

(assert (=> b!19630 (=> (not res!17138) (not e!13062))))

(assert (=> b!19630 (= res!17138 (validate_offset_bits!1 ((_ sign_extend 32) (size!599 (buf!902 thiss!1379))) ((_ sign_extend 32) (currentByte!2185 thiss!1379)) ((_ sign_extend 32) (currentBit!2180 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!17139 () Bool)

(assert (=> start!4944 (=> (not res!17139) (not e!13062))))

(declare-fun srcBuffer!2 () array!1411)

(assert (=> start!4944 (= res!17139 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!599 srcBuffer!2))))))))

(assert (=> start!4944 e!13062))

(assert (=> start!4944 true))

(assert (=> start!4944 (array_inv!569 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1032) Bool)

(assert (=> start!4944 (and (inv!12 thiss!1379) e!13061)))

(declare-fun b!19631 () Bool)

(assert (=> b!19631 (= e!13057 e!13058)))

(declare-fun res!17140 () Bool)

(assert (=> b!19631 (=> res!17140 e!13058)))

(assert (=> b!19631 (= res!17140 (not (isPrefixOf!0 thiss!1379 (_2!1213 lt!27927))))))

(assert (=> b!19631 (validate_offset_bits!1 ((_ sign_extend 32) (size!599 (buf!902 (_2!1213 lt!27927)))) ((_ sign_extend 32) (currentByte!2185 (_2!1213 lt!27927))) ((_ sign_extend 32) (currentBit!2180 (_2!1213 lt!27927))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27924 () Unit!1745)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1032 BitStream!1032 (_ BitVec 64) (_ BitVec 64)) Unit!1745)

(assert (=> b!19631 (= lt!27924 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1213 lt!27927) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1032 (_ BitVec 8) (_ BitVec 32)) tuple2!2256)

(assert (=> b!19631 (= lt!27927 (appendBitFromByte!0 thiss!1379 (select (arr!1040 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!4944 res!17139) b!19630))

(assert (= (and b!19630 res!17138) b!19628))

(assert (= (and b!19628 (not res!17141)) b!19631))

(assert (= (and b!19631 (not res!17140)) b!19629))

(assert (= start!4944 b!19627))

(declare-fun m!26483 () Bool)

(assert (=> b!19628 m!26483))

(declare-fun m!26485 () Bool)

(assert (=> b!19628 m!26485))

(declare-fun m!26487 () Bool)

(assert (=> b!19628 m!26487))

(declare-fun m!26489 () Bool)

(assert (=> b!19629 m!26489))

(declare-fun m!26491 () Bool)

(assert (=> b!19629 m!26491))

(declare-fun m!26493 () Bool)

(assert (=> b!19629 m!26493))

(declare-fun m!26495 () Bool)

(assert (=> b!19629 m!26495))

(declare-fun m!26497 () Bool)

(assert (=> start!4944 m!26497))

(declare-fun m!26499 () Bool)

(assert (=> start!4944 m!26499))

(declare-fun m!26501 () Bool)

(assert (=> b!19627 m!26501))

(declare-fun m!26503 () Bool)

(assert (=> b!19630 m!26503))

(declare-fun m!26505 () Bool)

(assert (=> b!19631 m!26505))

(declare-fun m!26507 () Bool)

(assert (=> b!19631 m!26507))

(assert (=> b!19631 m!26505))

(declare-fun m!26509 () Bool)

(assert (=> b!19631 m!26509))

(declare-fun m!26511 () Bool)

(assert (=> b!19631 m!26511))

(declare-fun m!26513 () Bool)

(assert (=> b!19631 m!26513))

(check-sat (not b!19630) (not b!19629) (not b!19631) (not start!4944) (not b!19627) (not b!19628))
