; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5112 () Bool)

(assert start!5112)

(declare-fun b!20322 () Bool)

(declare-fun res!17658 () Bool)

(declare-fun e!13578 () Bool)

(assert (=> b!20322 (=> (not res!17658) (not e!13578))))

(declare-datatypes ((array!1447 0))(
  ( (array!1448 (arr!1058 (Array (_ BitVec 32) (_ BitVec 8))) (size!614 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1062 0))(
  ( (BitStream!1063 (buf!923 array!1447) (currentByte!2212 (_ BitVec 32)) (currentBit!2207 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1062)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20322 (= res!17658 (validate_offset_bits!1 ((_ sign_extend 32) (size!614 (buf!923 thiss!1379))) ((_ sign_extend 32) (currentByte!2212 thiss!1379)) ((_ sign_extend 32) (currentBit!2207 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20323 () Bool)

(declare-fun e!13581 () Bool)

(declare-fun array_inv!584 (array!1447) Bool)

(assert (=> b!20323 (= e!13581 (array_inv!584 (buf!923 thiss!1379)))))

(declare-fun b!20324 () Bool)

(declare-fun e!13579 () Bool)

(assert (=> b!20324 (= e!13579 true)))

(declare-fun e!13580 () Bool)

(assert (=> b!20324 e!13580))

(declare-fun res!17656 () Bool)

(assert (=> b!20324 (=> (not res!17656) (not e!13580))))

(declare-datatypes ((Unit!1781 0))(
  ( (Unit!1782) )
))
(declare-datatypes ((tuple2!2364 0))(
  ( (tuple2!2365 (_1!1267 Unit!1781) (_2!1267 BitStream!1062)) )
))
(declare-fun lt!29024 () tuple2!2364)

(assert (=> b!20324 (= res!17656 (validate_offset_bits!1 ((_ sign_extend 32) (size!614 (buf!923 (_2!1267 lt!29024)))) ((_ sign_extend 32) (currentByte!2212 thiss!1379)) ((_ sign_extend 32) (currentBit!2207 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29026 () Unit!1781)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1062 array!1447 (_ BitVec 64)) Unit!1781)

(assert (=> b!20324 (= lt!29026 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!923 (_2!1267 lt!29024)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2366 0))(
  ( (tuple2!2367 (_1!1268 BitStream!1062) (_2!1268 BitStream!1062)) )
))
(declare-fun lt!29027 () tuple2!2366)

(declare-fun reader!0 (BitStream!1062 BitStream!1062) tuple2!2366)

(assert (=> b!20324 (= lt!29027 (reader!0 thiss!1379 (_2!1267 lt!29024)))))

(declare-fun b!20325 () Bool)

(declare-fun e!13584 () Bool)

(assert (=> b!20325 (= e!13578 (not e!13584))))

(declare-fun res!17657 () Bool)

(assert (=> b!20325 (=> res!17657 e!13584)))

(assert (=> b!20325 (= res!17657 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1062 BitStream!1062) Bool)

(assert (=> b!20325 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29025 () Unit!1781)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1062) Unit!1781)

(assert (=> b!20325 (= lt!29025 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29029 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20325 (= lt!29029 (bitIndex!0 (size!614 (buf!923 thiss!1379)) (currentByte!2212 thiss!1379) (currentBit!2207 thiss!1379)))))

(declare-fun res!17659 () Bool)

(assert (=> start!5112 (=> (not res!17659) (not e!13578))))

(declare-fun srcBuffer!2 () array!1447)

(assert (=> start!5112 (= res!17659 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!614 srcBuffer!2))))))))

(assert (=> start!5112 e!13578))

(assert (=> start!5112 true))

(assert (=> start!5112 (array_inv!584 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1062) Bool)

(assert (=> start!5112 (and (inv!12 thiss!1379) e!13581)))

(declare-fun b!20326 () Bool)

(declare-datatypes ((List!232 0))(
  ( (Nil!229) (Cons!228 (h!347 Bool) (t!982 List!232)) )
))
(declare-fun head!69 (List!232) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1062 array!1447 (_ BitVec 64) (_ BitVec 64)) List!232)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1062 BitStream!1062 (_ BitVec 64)) List!232)

(assert (=> b!20326 (= e!13580 (= (head!69 (byteArrayBitContentToList!0 (_2!1267 lt!29024) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!69 (bitStreamReadBitsIntoList!0 (_2!1267 lt!29024) (_1!1268 lt!29027) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20327 () Bool)

(assert (=> b!20327 (= e!13584 e!13579)))

(declare-fun res!17660 () Bool)

(assert (=> b!20327 (=> res!17660 e!13579)))

(assert (=> b!20327 (= res!17660 (not (isPrefixOf!0 thiss!1379 (_2!1267 lt!29024))))))

(assert (=> b!20327 (validate_offset_bits!1 ((_ sign_extend 32) (size!614 (buf!923 (_2!1267 lt!29024)))) ((_ sign_extend 32) (currentByte!2212 (_2!1267 lt!29024))) ((_ sign_extend 32) (currentBit!2207 (_2!1267 lt!29024))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29028 () Unit!1781)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1062 BitStream!1062 (_ BitVec 64) (_ BitVec 64)) Unit!1781)

(assert (=> b!20327 (= lt!29028 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1267 lt!29024) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1062 (_ BitVec 8) (_ BitVec 32)) tuple2!2364)

(assert (=> b!20327 (= lt!29024 (appendBitFromByte!0 thiss!1379 (select (arr!1058 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5112 res!17659) b!20322))

(assert (= (and b!20322 res!17658) b!20325))

(assert (= (and b!20325 (not res!17657)) b!20327))

(assert (= (and b!20327 (not res!17660)) b!20324))

(assert (= (and b!20324 res!17656) b!20326))

(assert (= start!5112 b!20323))

(declare-fun m!27473 () Bool)

(assert (=> b!20325 m!27473))

(declare-fun m!27475 () Bool)

(assert (=> b!20325 m!27475))

(declare-fun m!27477 () Bool)

(assert (=> b!20325 m!27477))

(declare-fun m!27479 () Bool)

(assert (=> b!20324 m!27479))

(declare-fun m!27481 () Bool)

(assert (=> b!20324 m!27481))

(declare-fun m!27483 () Bool)

(assert (=> b!20324 m!27483))

(declare-fun m!27485 () Bool)

(assert (=> b!20327 m!27485))

(declare-fun m!27487 () Bool)

(assert (=> b!20327 m!27487))

(assert (=> b!20327 m!27487))

(declare-fun m!27489 () Bool)

(assert (=> b!20327 m!27489))

(declare-fun m!27491 () Bool)

(assert (=> b!20327 m!27491))

(declare-fun m!27493 () Bool)

(assert (=> b!20327 m!27493))

(declare-fun m!27495 () Bool)

(assert (=> start!5112 m!27495))

(declare-fun m!27497 () Bool)

(assert (=> start!5112 m!27497))

(declare-fun m!27499 () Bool)

(assert (=> b!20326 m!27499))

(assert (=> b!20326 m!27499))

(declare-fun m!27501 () Bool)

(assert (=> b!20326 m!27501))

(declare-fun m!27503 () Bool)

(assert (=> b!20326 m!27503))

(assert (=> b!20326 m!27503))

(declare-fun m!27505 () Bool)

(assert (=> b!20326 m!27505))

(declare-fun m!27507 () Bool)

(assert (=> b!20322 m!27507))

(declare-fun m!27509 () Bool)

(assert (=> b!20323 m!27509))

(check-sat (not b!20325) (not b!20326) (not b!20322) (not b!20327) (not b!20323) (not start!5112) (not b!20324))
