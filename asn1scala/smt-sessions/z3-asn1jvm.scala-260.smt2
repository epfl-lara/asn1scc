; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5118 () Bool)

(assert start!5118)

(declare-fun res!17702 () Bool)

(declare-fun e!13645 () Bool)

(assert (=> start!5118 (=> (not res!17702) (not e!13645))))

(declare-datatypes ((array!1453 0))(
  ( (array!1454 (arr!1061 (Array (_ BitVec 32) (_ BitVec 8))) (size!617 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1453)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5118 (= res!17702 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!617 srcBuffer!2))))))))

(assert (=> start!5118 e!13645))

(assert (=> start!5118 true))

(declare-fun array_inv!587 (array!1453) Bool)

(assert (=> start!5118 (array_inv!587 srcBuffer!2)))

(declare-datatypes ((BitStream!1068 0))(
  ( (BitStream!1069 (buf!926 array!1453) (currentByte!2215 (_ BitVec 32)) (currentBit!2210 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1068)

(declare-fun e!13642 () Bool)

(declare-fun inv!12 (BitStream!1068) Bool)

(assert (=> start!5118 (and (inv!12 thiss!1379) e!13642)))

(declare-fun b!20376 () Bool)

(declare-fun e!13643 () Bool)

(declare-fun e!13647 () Bool)

(assert (=> b!20376 (= e!13643 e!13647)))

(declare-fun res!17701 () Bool)

(assert (=> b!20376 (=> res!17701 e!13647)))

(declare-datatypes ((Unit!1787 0))(
  ( (Unit!1788) )
))
(declare-datatypes ((tuple2!2376 0))(
  ( (tuple2!2377 (_1!1273 Unit!1787) (_2!1273 BitStream!1068)) )
))
(declare-fun lt!29082 () tuple2!2376)

(declare-fun isPrefixOf!0 (BitStream!1068 BitStream!1068) Bool)

(assert (=> b!20376 (= res!17701 (not (isPrefixOf!0 thiss!1379 (_2!1273 lt!29082))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20376 (validate_offset_bits!1 ((_ sign_extend 32) (size!617 (buf!926 (_2!1273 lt!29082)))) ((_ sign_extend 32) (currentByte!2215 (_2!1273 lt!29082))) ((_ sign_extend 32) (currentBit!2210 (_2!1273 lt!29082))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29080 () Unit!1787)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1068 BitStream!1068 (_ BitVec 64) (_ BitVec 64)) Unit!1787)

(assert (=> b!20376 (= lt!29080 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1273 lt!29082) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1068 (_ BitVec 8) (_ BitVec 32)) tuple2!2376)

(assert (=> b!20376 (= lt!29082 (appendBitFromByte!0 thiss!1379 (select (arr!1061 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20377 () Bool)

(assert (=> b!20377 (= e!13645 (not e!13643))))

(declare-fun res!17703 () Bool)

(assert (=> b!20377 (=> res!17703 e!13643)))

(assert (=> b!20377 (= res!17703 (bvsge i!635 to!314))))

(assert (=> b!20377 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29078 () Unit!1787)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1068) Unit!1787)

(assert (=> b!20377 (= lt!29078 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29079 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20377 (= lt!29079 (bitIndex!0 (size!617 (buf!926 thiss!1379)) (currentByte!2215 thiss!1379) (currentBit!2210 thiss!1379)))))

(declare-fun b!20378 () Bool)

(assert (=> b!20378 (= e!13647 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13641 () Bool)

(assert (=> b!20378 e!13641))

(declare-fun res!17705 () Bool)

(assert (=> b!20378 (=> (not res!17705) (not e!13641))))

(assert (=> b!20378 (= res!17705 (validate_offset_bits!1 ((_ sign_extend 32) (size!617 (buf!926 (_2!1273 lt!29082)))) ((_ sign_extend 32) (currentByte!2215 thiss!1379)) ((_ sign_extend 32) (currentBit!2210 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29083 () Unit!1787)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1068 array!1453 (_ BitVec 64)) Unit!1787)

(assert (=> b!20378 (= lt!29083 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!926 (_2!1273 lt!29082)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2378 0))(
  ( (tuple2!2379 (_1!1274 BitStream!1068) (_2!1274 BitStream!1068)) )
))
(declare-fun lt!29081 () tuple2!2378)

(declare-fun reader!0 (BitStream!1068 BitStream!1068) tuple2!2378)

(assert (=> b!20378 (= lt!29081 (reader!0 thiss!1379 (_2!1273 lt!29082)))))

(declare-fun b!20379 () Bool)

(assert (=> b!20379 (= e!13642 (array_inv!587 (buf!926 thiss!1379)))))

(declare-fun b!20380 () Bool)

(declare-datatypes ((List!235 0))(
  ( (Nil!232) (Cons!231 (h!350 Bool) (t!985 List!235)) )
))
(declare-fun head!72 (List!235) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1068 array!1453 (_ BitVec 64) (_ BitVec 64)) List!235)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1068 BitStream!1068 (_ BitVec 64)) List!235)

(assert (=> b!20380 (= e!13641 (= (head!72 (byteArrayBitContentToList!0 (_2!1273 lt!29082) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!72 (bitStreamReadBitsIntoList!0 (_2!1273 lt!29082) (_1!1274 lt!29081) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20381 () Bool)

(declare-fun res!17704 () Bool)

(assert (=> b!20381 (=> (not res!17704) (not e!13645))))

(assert (=> b!20381 (= res!17704 (validate_offset_bits!1 ((_ sign_extend 32) (size!617 (buf!926 thiss!1379))) ((_ sign_extend 32) (currentByte!2215 thiss!1379)) ((_ sign_extend 32) (currentBit!2210 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5118 res!17702) b!20381))

(assert (= (and b!20381 res!17704) b!20377))

(assert (= (and b!20377 (not res!17703)) b!20376))

(assert (= (and b!20376 (not res!17701)) b!20378))

(assert (= (and b!20378 res!17705) b!20380))

(assert (= start!5118 b!20379))

(declare-fun m!27587 () Bool)

(assert (=> b!20379 m!27587))

(declare-fun m!27589 () Bool)

(assert (=> b!20381 m!27589))

(declare-fun m!27591 () Bool)

(assert (=> b!20380 m!27591))

(assert (=> b!20380 m!27591))

(declare-fun m!27593 () Bool)

(assert (=> b!20380 m!27593))

(declare-fun m!27595 () Bool)

(assert (=> b!20380 m!27595))

(assert (=> b!20380 m!27595))

(declare-fun m!27597 () Bool)

(assert (=> b!20380 m!27597))

(declare-fun m!27599 () Bool)

(assert (=> b!20376 m!27599))

(declare-fun m!27601 () Bool)

(assert (=> b!20376 m!27601))

(declare-fun m!27603 () Bool)

(assert (=> b!20376 m!27603))

(declare-fun m!27605 () Bool)

(assert (=> b!20376 m!27605))

(assert (=> b!20376 m!27603))

(declare-fun m!27607 () Bool)

(assert (=> b!20376 m!27607))

(declare-fun m!27609 () Bool)

(assert (=> b!20378 m!27609))

(declare-fun m!27611 () Bool)

(assert (=> b!20378 m!27611))

(declare-fun m!27613 () Bool)

(assert (=> b!20378 m!27613))

(declare-fun m!27615 () Bool)

(assert (=> start!5118 m!27615))

(declare-fun m!27617 () Bool)

(assert (=> start!5118 m!27617))

(declare-fun m!27619 () Bool)

(assert (=> b!20377 m!27619))

(declare-fun m!27621 () Bool)

(assert (=> b!20377 m!27621))

(declare-fun m!27623 () Bool)

(assert (=> b!20377 m!27623))

(check-sat (not b!20377) (not b!20378) (not b!20379) (not b!20376) (not start!5118) (not b!20381) (not b!20380))
(check-sat)
