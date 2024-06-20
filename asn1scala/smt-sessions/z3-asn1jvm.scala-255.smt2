; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4950 () Bool)

(assert start!4950)

(declare-fun b!19672 () Bool)

(declare-fun e!13113 () Bool)

(declare-datatypes ((array!1417 0))(
  ( (array!1418 (arr!1043 (Array (_ BitVec 32) (_ BitVec 8))) (size!602 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1038 0))(
  ( (BitStream!1039 (buf!905 array!1417) (currentByte!2188 (_ BitVec 32)) (currentBit!2183 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1038)

(declare-fun array_inv!572 (array!1417) Bool)

(assert (=> b!19672 (= e!13113 (array_inv!572 (buf!905 thiss!1379)))))

(declare-fun b!19673 () Bool)

(declare-fun e!13111 () Bool)

(declare-fun e!13114 () Bool)

(assert (=> b!19673 (= e!13111 (not e!13114))))

(declare-fun res!17177 () Bool)

(assert (=> b!19673 (=> res!17177 e!13114)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19673 (= res!17177 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1038 BitStream!1038) Bool)

(assert (=> b!19673 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1751 0))(
  ( (Unit!1752) )
))
(declare-fun lt!27985 () Unit!1751)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1038) Unit!1751)

(assert (=> b!19673 (= lt!27985 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27991 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19673 (= lt!27991 (bitIndex!0 (size!602 (buf!905 thiss!1379)) (currentByte!2188 thiss!1379) (currentBit!2183 thiss!1379)))))

(declare-fun res!17175 () Bool)

(assert (=> start!4950 (=> (not res!17175) (not e!13111))))

(declare-fun srcBuffer!2 () array!1417)

(assert (=> start!4950 (= res!17175 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!602 srcBuffer!2))))))))

(assert (=> start!4950 e!13111))

(assert (=> start!4950 true))

(assert (=> start!4950 (array_inv!572 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1038) Bool)

(assert (=> start!4950 (and (inv!12 thiss!1379) e!13113)))

(declare-fun b!19674 () Bool)

(declare-fun e!13115 () Bool)

(assert (=> b!19674 (= e!13115 (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111110))))

(declare-datatypes ((List!220 0))(
  ( (Nil!217) (Cons!216 (h!335 Bool) (t!970 List!220)) )
))
(declare-fun lt!27986 () List!220)

(declare-datatypes ((tuple2!2268 0))(
  ( (tuple2!2269 (_1!1219 Unit!1751) (_2!1219 BitStream!1038)) )
))
(declare-fun lt!27988 () tuple2!2268)

(declare-datatypes ((tuple2!2270 0))(
  ( (tuple2!2271 (_1!1220 BitStream!1038) (_2!1220 BitStream!1038)) )
))
(declare-fun lt!27990 () tuple2!2270)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1038 BitStream!1038 (_ BitVec 64)) List!220)

(assert (=> b!19674 (= lt!27986 (bitStreamReadBitsIntoList!0 (_2!1219 lt!27988) (_1!1220 lt!27990) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19674 (validate_offset_bits!1 ((_ sign_extend 32) (size!602 (buf!905 (_2!1219 lt!27988)))) ((_ sign_extend 32) (currentByte!2188 thiss!1379)) ((_ sign_extend 32) (currentBit!2183 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27987 () Unit!1751)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1038 array!1417 (_ BitVec 64)) Unit!1751)

(assert (=> b!19674 (= lt!27987 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!905 (_2!1219 lt!27988)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1038 BitStream!1038) tuple2!2270)

(assert (=> b!19674 (= lt!27990 (reader!0 thiss!1379 (_2!1219 lt!27988)))))

(declare-fun b!19675 () Bool)

(declare-fun res!17174 () Bool)

(assert (=> b!19675 (=> (not res!17174) (not e!13111))))

(assert (=> b!19675 (= res!17174 (validate_offset_bits!1 ((_ sign_extend 32) (size!602 (buf!905 thiss!1379))) ((_ sign_extend 32) (currentByte!2188 thiss!1379)) ((_ sign_extend 32) (currentBit!2183 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19676 () Bool)

(assert (=> b!19676 (= e!13114 e!13115)))

(declare-fun res!17176 () Bool)

(assert (=> b!19676 (=> res!17176 e!13115)))

(assert (=> b!19676 (= res!17176 (not (isPrefixOf!0 thiss!1379 (_2!1219 lt!27988))))))

(assert (=> b!19676 (validate_offset_bits!1 ((_ sign_extend 32) (size!602 (buf!905 (_2!1219 lt!27988)))) ((_ sign_extend 32) (currentByte!2188 (_2!1219 lt!27988))) ((_ sign_extend 32) (currentBit!2183 (_2!1219 lt!27988))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27989 () Unit!1751)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1038 BitStream!1038 (_ BitVec 64) (_ BitVec 64)) Unit!1751)

(assert (=> b!19676 (= lt!27989 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1219 lt!27988) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1038 (_ BitVec 8) (_ BitVec 32)) tuple2!2268)

(assert (=> b!19676 (= lt!27988 (appendBitFromByte!0 thiss!1379 (select (arr!1043 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!4950 res!17175) b!19675))

(assert (= (and b!19675 res!17174) b!19673))

(assert (= (and b!19673 (not res!17177)) b!19676))

(assert (= (and b!19676 (not res!17176)) b!19674))

(assert (= start!4950 b!19672))

(declare-fun m!26579 () Bool)

(assert (=> start!4950 m!26579))

(declare-fun m!26581 () Bool)

(assert (=> start!4950 m!26581))

(declare-fun m!26583 () Bool)

(assert (=> b!19675 m!26583))

(declare-fun m!26585 () Bool)

(assert (=> b!19674 m!26585))

(declare-fun m!26587 () Bool)

(assert (=> b!19674 m!26587))

(declare-fun m!26589 () Bool)

(assert (=> b!19674 m!26589))

(declare-fun m!26591 () Bool)

(assert (=> b!19674 m!26591))

(declare-fun m!26593 () Bool)

(assert (=> b!19676 m!26593))

(declare-fun m!26595 () Bool)

(assert (=> b!19676 m!26595))

(declare-fun m!26597 () Bool)

(assert (=> b!19676 m!26597))

(assert (=> b!19676 m!26593))

(declare-fun m!26599 () Bool)

(assert (=> b!19676 m!26599))

(declare-fun m!26601 () Bool)

(assert (=> b!19676 m!26601))

(declare-fun m!26603 () Bool)

(assert (=> b!19673 m!26603))

(declare-fun m!26605 () Bool)

(assert (=> b!19673 m!26605))

(declare-fun m!26607 () Bool)

(assert (=> b!19673 m!26607))

(declare-fun m!26609 () Bool)

(assert (=> b!19672 m!26609))

(check-sat (not b!19672) (not start!4950) (not b!19676) (not b!19675) (not b!19673) (not b!19674))
(check-sat)
