; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4942 () Bool)

(assert start!4942)

(declare-fun b!19612 () Bool)

(declare-fun e!13039 () Bool)

(declare-fun e!13041 () Bool)

(assert (=> b!19612 (= e!13039 (not e!13041))))

(declare-fun res!17127 () Bool)

(assert (=> b!19612 (=> res!17127 e!13041)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19612 (= res!17127 (bvsge i!635 to!314))))

(declare-datatypes ((array!1409 0))(
  ( (array!1410 (arr!1039 (Array (_ BitVec 32) (_ BitVec 8))) (size!598 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1030 0))(
  ( (BitStream!1031 (buf!901 array!1409) (currentByte!2184 (_ BitVec 32)) (currentBit!2179 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1030)

(declare-fun isPrefixOf!0 (BitStream!1030 BitStream!1030) Bool)

(assert (=> b!19612 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1743 0))(
  ( (Unit!1744) )
))
(declare-fun lt!27904 () Unit!1743)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1030) Unit!1743)

(assert (=> b!19612 (= lt!27904 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27906 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19612 (= lt!27906 (bitIndex!0 (size!598 (buf!901 thiss!1379)) (currentByte!2184 thiss!1379) (currentBit!2179 thiss!1379)))))

(declare-fun b!19613 () Bool)

(declare-fun e!13040 () Bool)

(assert (=> b!19613 (= e!13040 true)))

(declare-datatypes ((List!216 0))(
  ( (Nil!213) (Cons!212 (h!331 Bool) (t!966 List!216)) )
))
(declare-fun lt!27902 () List!216)

(declare-datatypes ((tuple2!2252 0))(
  ( (tuple2!2253 (_1!1211 Unit!1743) (_2!1211 BitStream!1030)) )
))
(declare-fun lt!27905 () tuple2!2252)

(declare-datatypes ((tuple2!2254 0))(
  ( (tuple2!2255 (_1!1212 BitStream!1030) (_2!1212 BitStream!1030)) )
))
(declare-fun lt!27907 () tuple2!2254)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1030 BitStream!1030 (_ BitVec 64)) List!216)

(assert (=> b!19613 (= lt!27902 (bitStreamReadBitsIntoList!0 (_2!1211 lt!27905) (_1!1212 lt!27907) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19613 (validate_offset_bits!1 ((_ sign_extend 32) (size!598 (buf!901 (_2!1211 lt!27905)))) ((_ sign_extend 32) (currentByte!2184 thiss!1379)) ((_ sign_extend 32) (currentBit!2179 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27903 () Unit!1743)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1030 array!1409 (_ BitVec 64)) Unit!1743)

(assert (=> b!19613 (= lt!27903 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!901 (_2!1211 lt!27905)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1030 BitStream!1030) tuple2!2254)

(assert (=> b!19613 (= lt!27907 (reader!0 thiss!1379 (_2!1211 lt!27905)))))

(declare-fun b!19614 () Bool)

(declare-fun res!17129 () Bool)

(assert (=> b!19614 (=> (not res!17129) (not e!13039))))

(assert (=> b!19614 (= res!17129 (validate_offset_bits!1 ((_ sign_extend 32) (size!598 (buf!901 thiss!1379))) ((_ sign_extend 32) (currentByte!2184 thiss!1379)) ((_ sign_extend 32) (currentBit!2179 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!17126 () Bool)

(assert (=> start!4942 (=> (not res!17126) (not e!13039))))

(declare-fun srcBuffer!2 () array!1409)

(assert (=> start!4942 (= res!17126 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!598 srcBuffer!2))))))))

(assert (=> start!4942 e!13039))

(assert (=> start!4942 true))

(declare-fun array_inv!568 (array!1409) Bool)

(assert (=> start!4942 (array_inv!568 srcBuffer!2)))

(declare-fun e!13042 () Bool)

(declare-fun inv!12 (BitStream!1030) Bool)

(assert (=> start!4942 (and (inv!12 thiss!1379) e!13042)))

(declare-fun b!19615 () Bool)

(assert (=> b!19615 (= e!13041 e!13040)))

(declare-fun res!17128 () Bool)

(assert (=> b!19615 (=> res!17128 e!13040)))

(assert (=> b!19615 (= res!17128 (not (isPrefixOf!0 thiss!1379 (_2!1211 lt!27905))))))

(assert (=> b!19615 (validate_offset_bits!1 ((_ sign_extend 32) (size!598 (buf!901 (_2!1211 lt!27905)))) ((_ sign_extend 32) (currentByte!2184 (_2!1211 lt!27905))) ((_ sign_extend 32) (currentBit!2179 (_2!1211 lt!27905))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27901 () Unit!1743)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1030 BitStream!1030 (_ BitVec 64) (_ BitVec 64)) Unit!1743)

(assert (=> b!19615 (= lt!27901 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1211 lt!27905) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1030 (_ BitVec 8) (_ BitVec 32)) tuple2!2252)

(assert (=> b!19615 (= lt!27905 (appendBitFromByte!0 thiss!1379 (select (arr!1039 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19616 () Bool)

(assert (=> b!19616 (= e!13042 (array_inv!568 (buf!901 thiss!1379)))))

(assert (= (and start!4942 res!17126) b!19614))

(assert (= (and b!19614 res!17129) b!19612))

(assert (= (and b!19612 (not res!17127)) b!19615))

(assert (= (and b!19615 (not res!17128)) b!19613))

(assert (= start!4942 b!19616))

(declare-fun m!26451 () Bool)

(assert (=> start!4942 m!26451))

(declare-fun m!26453 () Bool)

(assert (=> start!4942 m!26453))

(declare-fun m!26455 () Bool)

(assert (=> b!19616 m!26455))

(declare-fun m!26457 () Bool)

(assert (=> b!19613 m!26457))

(declare-fun m!26459 () Bool)

(assert (=> b!19613 m!26459))

(declare-fun m!26461 () Bool)

(assert (=> b!19613 m!26461))

(declare-fun m!26463 () Bool)

(assert (=> b!19613 m!26463))

(declare-fun m!26465 () Bool)

(assert (=> b!19612 m!26465))

(declare-fun m!26467 () Bool)

(assert (=> b!19612 m!26467))

(declare-fun m!26469 () Bool)

(assert (=> b!19612 m!26469))

(declare-fun m!26471 () Bool)

(assert (=> b!19614 m!26471))

(declare-fun m!26473 () Bool)

(assert (=> b!19615 m!26473))

(declare-fun m!26475 () Bool)

(assert (=> b!19615 m!26475))

(declare-fun m!26477 () Bool)

(assert (=> b!19615 m!26477))

(assert (=> b!19615 m!26473))

(declare-fun m!26479 () Bool)

(assert (=> b!19615 m!26479))

(declare-fun m!26481 () Bool)

(assert (=> b!19615 m!26481))

(push 1)

