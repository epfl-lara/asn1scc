; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4822 () Bool)

(assert start!4822)

(declare-fun b!18988 () Bool)

(declare-fun e!12417 () Bool)

(declare-fun e!12416 () Bool)

(assert (=> b!18988 (= e!12417 e!12416)))

(declare-fun res!16613 () Bool)

(assert (=> b!18988 (=> res!16613 e!12416)))

(declare-datatypes ((array!1346 0))(
  ( (array!1347 (arr!1009 (Array (_ BitVec 32) (_ BitVec 8))) (size!568 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!970 0))(
  ( (BitStream!971 (buf!868 array!1346) (currentByte!2148 (_ BitVec 32)) (currentBit!2143 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!970)

(declare-datatypes ((Unit!1680 0))(
  ( (Unit!1681) )
))
(declare-datatypes ((tuple2!2144 0))(
  ( (tuple2!2145 (_1!1157 Unit!1680) (_2!1157 BitStream!970)) )
))
(declare-fun lt!27068 () tuple2!2144)

(assert (=> b!18988 (= res!16613 (not (= (size!568 (buf!868 thiss!1379)) (size!568 (buf!868 (_2!1157 lt!27068))))))))

(declare-fun srcBuffer!2 () array!1346)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun appendBitFromByte!0 (BitStream!970 (_ BitVec 8) (_ BitVec 32)) tuple2!2144)

(assert (=> b!18988 (= lt!27068 (appendBitFromByte!0 thiss!1379 (select (arr!1009 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!16615 () Bool)

(declare-fun e!12413 () Bool)

(assert (=> start!4822 (=> (not res!16615) (not e!12413))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4822 (= res!16615 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!568 srcBuffer!2))))))))

(assert (=> start!4822 e!12413))

(assert (=> start!4822 true))

(declare-fun array_inv!538 (array!1346) Bool)

(assert (=> start!4822 (array_inv!538 srcBuffer!2)))

(declare-fun e!12414 () Bool)

(declare-fun inv!12 (BitStream!970) Bool)

(assert (=> start!4822 (and (inv!12 thiss!1379) e!12414)))

(declare-fun b!18989 () Bool)

(assert (=> b!18989 (= e!12416 true)))

(declare-fun lt!27070 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18989 (= lt!27070 (bitIndex!0 (size!568 (buf!868 (_2!1157 lt!27068))) (currentByte!2148 (_2!1157 lt!27068)) (currentBit!2143 (_2!1157 lt!27068))))))

(declare-fun b!18990 () Bool)

(assert (=> b!18990 (= e!12414 (array_inv!538 (buf!868 thiss!1379)))))

(declare-fun b!18991 () Bool)

(assert (=> b!18991 (= e!12413 (not e!12417))))

(declare-fun res!16616 () Bool)

(assert (=> b!18991 (=> res!16616 e!12417)))

(assert (=> b!18991 (= res!16616 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!970 BitStream!970) Bool)

(assert (=> b!18991 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27069 () Unit!1680)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!970) Unit!1680)

(assert (=> b!18991 (= lt!27069 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27067 () (_ BitVec 64))

(assert (=> b!18991 (= lt!27067 (bitIndex!0 (size!568 (buf!868 thiss!1379)) (currentByte!2148 thiss!1379) (currentBit!2143 thiss!1379)))))

(declare-fun b!18992 () Bool)

(declare-fun res!16614 () Bool)

(assert (=> b!18992 (=> (not res!16614) (not e!12413))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18992 (= res!16614 (validate_offset_bits!1 ((_ sign_extend 32) (size!568 (buf!868 thiss!1379))) ((_ sign_extend 32) (currentByte!2148 thiss!1379)) ((_ sign_extend 32) (currentBit!2143 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!4822 res!16615) b!18992))

(assert (= (and b!18992 res!16614) b!18991))

(assert (= (and b!18991 (not res!16616)) b!18988))

(assert (= (and b!18988 (not res!16613)) b!18989))

(assert (= start!4822 b!18990))

(declare-fun m!25455 () Bool)

(assert (=> b!18988 m!25455))

(assert (=> b!18988 m!25455))

(declare-fun m!25457 () Bool)

(assert (=> b!18988 m!25457))

(declare-fun m!25459 () Bool)

(assert (=> b!18992 m!25459))

(declare-fun m!25461 () Bool)

(assert (=> b!18989 m!25461))

(declare-fun m!25463 () Bool)

(assert (=> b!18991 m!25463))

(declare-fun m!25465 () Bool)

(assert (=> b!18991 m!25465))

(declare-fun m!25467 () Bool)

(assert (=> b!18991 m!25467))

(declare-fun m!25469 () Bool)

(assert (=> start!4822 m!25469))

(declare-fun m!25471 () Bool)

(assert (=> start!4822 m!25471))

(declare-fun m!25473 () Bool)

(assert (=> b!18990 m!25473))

(push 1)

(assert (not start!4822))

(assert (not b!18992))

(assert (not b!18988))

(assert (not b!18989))

(assert (not b!18991))

(assert (not b!18990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

