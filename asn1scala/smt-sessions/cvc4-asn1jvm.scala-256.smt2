; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4958 () Bool)

(assert start!4958)

(declare-fun b!19740 () Bool)

(declare-fun res!17230 () Bool)

(declare-fun e!13193 () Bool)

(assert (=> b!19740 (=> (not res!17230) (not e!13193))))

(declare-datatypes ((array!1425 0))(
  ( (array!1426 (arr!1047 (Array (_ BitVec 32) (_ BitVec 8))) (size!606 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1046 0))(
  ( (BitStream!1047 (buf!909 array!1425) (currentByte!2192 (_ BitVec 32)) (currentBit!2187 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1046)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19740 (= res!17230 (validate_offset_bits!1 ((_ sign_extend 32) (size!606 (buf!909 thiss!1379))) ((_ sign_extend 32) (currentByte!2192 thiss!1379)) ((_ sign_extend 32) (currentBit!2187 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19741 () Bool)

(declare-fun e!13192 () Bool)

(declare-fun array_inv!576 (array!1425) Bool)

(assert (=> b!19741 (= e!13192 (array_inv!576 (buf!909 thiss!1379)))))

(declare-fun b!19743 () Bool)

(declare-fun e!13195 () Bool)

(assert (=> b!19743 (= e!13193 (not e!13195))))

(declare-fun res!17232 () Bool)

(assert (=> b!19743 (=> res!17232 e!13195)))

(assert (=> b!19743 (= res!17232 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1046 BitStream!1046) Bool)

(assert (=> b!19743 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1759 0))(
  ( (Unit!1760) )
))
(declare-fun lt!28083 () Unit!1759)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1046) Unit!1759)

(assert (=> b!19743 (= lt!28083 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28080 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19743 (= lt!28080 (bitIndex!0 (size!606 (buf!909 thiss!1379)) (currentByte!2192 thiss!1379) (currentBit!2187 thiss!1379)))))

(declare-fun b!19744 () Bool)

(declare-fun e!13191 () Bool)

(declare-fun lt!28077 () (_ BitVec 64))

(assert (=> b!19744 (= e!13191 (or (bvsge i!635 #b0111111111111111111111111111111111111111111111111111111111111110) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) lt!28077)))))

(declare-datatypes ((List!224 0))(
  ( (Nil!221) (Cons!220 (h!339 Bool) (t!974 List!224)) )
))
(declare-fun lt!28079 () List!224)

(declare-datatypes ((tuple2!2284 0))(
  ( (tuple2!2285 (_1!1227 Unit!1759) (_2!1227 BitStream!1046)) )
))
(declare-fun lt!28082 () tuple2!2284)

(declare-datatypes ((tuple2!2286 0))(
  ( (tuple2!2287 (_1!1228 BitStream!1046) (_2!1228 BitStream!1046)) )
))
(declare-fun lt!28078 () tuple2!2286)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1046 BitStream!1046 (_ BitVec 64)) List!224)

(assert (=> b!19744 (= lt!28079 (bitStreamReadBitsIntoList!0 (_2!1227 lt!28082) (_1!1228 lt!28078) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19744 (validate_offset_bits!1 ((_ sign_extend 32) (size!606 (buf!909 (_2!1227 lt!28082)))) ((_ sign_extend 32) (currentByte!2192 thiss!1379)) ((_ sign_extend 32) (currentBit!2187 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28084 () Unit!1759)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1046 array!1425 (_ BitVec 64)) Unit!1759)

(assert (=> b!19744 (= lt!28084 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!909 (_2!1227 lt!28082)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1046 BitStream!1046) tuple2!2286)

(assert (=> b!19744 (= lt!28078 (reader!0 thiss!1379 (_2!1227 lt!28082)))))

(declare-fun b!19745 () Bool)

(assert (=> b!19745 (= e!13195 e!13191)))

(declare-fun res!17234 () Bool)

(assert (=> b!19745 (=> res!17234 e!13191)))

(assert (=> b!19745 (= res!17234 (not (isPrefixOf!0 thiss!1379 (_2!1227 lt!28082))))))

(assert (=> b!19745 (validate_offset_bits!1 ((_ sign_extend 32) (size!606 (buf!909 (_2!1227 lt!28082)))) ((_ sign_extend 32) (currentByte!2192 (_2!1227 lt!28082))) ((_ sign_extend 32) (currentBit!2187 (_2!1227 lt!28082))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28081 () Unit!1759)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1046 BitStream!1046 (_ BitVec 64) (_ BitVec 64)) Unit!1759)

(assert (=> b!19745 (= lt!28081 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1227 lt!28082) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1425)

(declare-fun appendBitFromByte!0 (BitStream!1046 (_ BitVec 8) (_ BitVec 32)) tuple2!2284)

(assert (=> b!19745 (= lt!28082 (appendBitFromByte!0 thiss!1379 (select (arr!1047 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!17231 () Bool)

(declare-fun e!13196 () Bool)

(assert (=> start!4958 (=> (not res!17231) (not e!13196))))

(assert (=> start!4958 (= res!17231 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!4958 e!13196))

(assert (=> start!4958 true))

(declare-fun inv!12 (BitStream!1046) Bool)

(assert (=> start!4958 (and (inv!12 thiss!1379) e!13192)))

(assert (=> start!4958 (array_inv!576 srcBuffer!2)))

(declare-fun b!19742 () Bool)

(assert (=> b!19742 (= e!13196 e!13193)))

(declare-fun res!17233 () Bool)

(assert (=> b!19742 (=> (not res!17233) (not e!13193))))

(assert (=> b!19742 (= res!17233 (bvsle to!314 lt!28077))))

(assert (=> b!19742 (= lt!28077 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!606 srcBuffer!2))))))

(assert (= (and start!4958 res!17231) b!19742))

(assert (= (and b!19742 res!17233) b!19740))

(assert (= (and b!19740 res!17230) b!19743))

(assert (= (and b!19743 (not res!17232)) b!19745))

(assert (= (and b!19745 (not res!17234)) b!19744))

(assert (= start!4958 b!19741))

(declare-fun m!26707 () Bool)

(assert (=> b!19740 m!26707))

(declare-fun m!26709 () Bool)

(assert (=> b!19744 m!26709))

(declare-fun m!26711 () Bool)

(assert (=> b!19744 m!26711))

(declare-fun m!26713 () Bool)

(assert (=> b!19744 m!26713))

(declare-fun m!26715 () Bool)

(assert (=> b!19744 m!26715))

(declare-fun m!26717 () Bool)

(assert (=> start!4958 m!26717))

(declare-fun m!26719 () Bool)

(assert (=> start!4958 m!26719))

(declare-fun m!26721 () Bool)

(assert (=> b!19745 m!26721))

(declare-fun m!26723 () Bool)

(assert (=> b!19745 m!26723))

(declare-fun m!26725 () Bool)

(assert (=> b!19745 m!26725))

(assert (=> b!19745 m!26721))

(declare-fun m!26727 () Bool)

(assert (=> b!19745 m!26727))

(declare-fun m!26729 () Bool)

(assert (=> b!19745 m!26729))

(declare-fun m!26731 () Bool)

(assert (=> b!19741 m!26731))

(declare-fun m!26733 () Bool)

(assert (=> b!19743 m!26733))

(declare-fun m!26735 () Bool)

(assert (=> b!19743 m!26735))

(declare-fun m!26737 () Bool)

(assert (=> b!19743 m!26737))

(push 1)

(assert (not b!19741))

(assert (not b!19743))

(assert (not b!19745))

(assert (not start!4958))

(assert (not b!19740))

(assert (not b!19744))

(check-sat)

(pop 1)

(push 1)

(check-sat)

