; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4820 () Bool)

(assert start!4820)

(declare-fun b!18973 () Bool)

(declare-fun e!12397 () Bool)

(declare-fun e!12395 () Bool)

(assert (=> b!18973 (= e!12397 (not e!12395))))

(declare-fun res!16604 () Bool)

(assert (=> b!18973 (=> res!16604 e!12395)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!18973 (= res!16604 (bvsge i!635 to!314))))

(declare-datatypes ((array!1344 0))(
  ( (array!1345 (arr!1008 (Array (_ BitVec 32) (_ BitVec 8))) (size!567 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!968 0))(
  ( (BitStream!969 (buf!867 array!1344) (currentByte!2147 (_ BitVec 32)) (currentBit!2142 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!968)

(declare-fun isPrefixOf!0 (BitStream!968 BitStream!968) Bool)

(assert (=> b!18973 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1678 0))(
  ( (Unit!1679) )
))
(declare-fun lt!27055 () Unit!1678)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!968) Unit!1678)

(assert (=> b!18973 (= lt!27055 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27058 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18973 (= lt!27058 (bitIndex!0 (size!567 (buf!867 thiss!1379)) (currentByte!2147 thiss!1379) (currentBit!2142 thiss!1379)))))

(declare-fun b!18975 () Bool)

(declare-fun e!12394 () Bool)

(declare-fun array_inv!537 (array!1344) Bool)

(assert (=> b!18975 (= e!12394 (array_inv!537 (buf!867 thiss!1379)))))

(declare-fun b!18976 () Bool)

(declare-fun res!16602 () Bool)

(assert (=> b!18976 (=> (not res!16602) (not e!12397))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18976 (= res!16602 (validate_offset_bits!1 ((_ sign_extend 32) (size!567 (buf!867 thiss!1379))) ((_ sign_extend 32) (currentByte!2147 thiss!1379)) ((_ sign_extend 32) (currentBit!2142 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!18977 () Bool)

(declare-fun e!12399 () Bool)

(assert (=> b!18977 (= e!12399 true)))

(declare-fun lt!27057 () (_ BitVec 64))

(declare-datatypes ((tuple2!2142 0))(
  ( (tuple2!2143 (_1!1156 Unit!1678) (_2!1156 BitStream!968)) )
))
(declare-fun lt!27056 () tuple2!2142)

(assert (=> b!18977 (= lt!27057 (bitIndex!0 (size!567 (buf!867 (_2!1156 lt!27056))) (currentByte!2147 (_2!1156 lt!27056)) (currentBit!2142 (_2!1156 lt!27056))))))

(declare-fun b!18974 () Bool)

(assert (=> b!18974 (= e!12395 e!12399)))

(declare-fun res!16603 () Bool)

(assert (=> b!18974 (=> res!16603 e!12399)))

(assert (=> b!18974 (= res!16603 (not (= (size!567 (buf!867 thiss!1379)) (size!567 (buf!867 (_2!1156 lt!27056))))))))

(declare-fun srcBuffer!2 () array!1344)

(declare-fun appendBitFromByte!0 (BitStream!968 (_ BitVec 8) (_ BitVec 32)) tuple2!2142)

(assert (=> b!18974 (= lt!27056 (appendBitFromByte!0 thiss!1379 (select (arr!1008 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!16601 () Bool)

(assert (=> start!4820 (=> (not res!16601) (not e!12397))))

(assert (=> start!4820 (= res!16601 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!567 srcBuffer!2))))))))

(assert (=> start!4820 e!12397))

(assert (=> start!4820 true))

(assert (=> start!4820 (array_inv!537 srcBuffer!2)))

(declare-fun inv!12 (BitStream!968) Bool)

(assert (=> start!4820 (and (inv!12 thiss!1379) e!12394)))

(assert (= (and start!4820 res!16601) b!18976))

(assert (= (and b!18976 res!16602) b!18973))

(assert (= (and b!18973 (not res!16604)) b!18974))

(assert (= (and b!18974 (not res!16603)) b!18977))

(assert (= start!4820 b!18975))

(declare-fun m!25435 () Bool)

(assert (=> start!4820 m!25435))

(declare-fun m!25437 () Bool)

(assert (=> start!4820 m!25437))

(declare-fun m!25439 () Bool)

(assert (=> b!18976 m!25439))

(declare-fun m!25441 () Bool)

(assert (=> b!18974 m!25441))

(assert (=> b!18974 m!25441))

(declare-fun m!25443 () Bool)

(assert (=> b!18974 m!25443))

(declare-fun m!25445 () Bool)

(assert (=> b!18977 m!25445))

(declare-fun m!25447 () Bool)

(assert (=> b!18973 m!25447))

(declare-fun m!25449 () Bool)

(assert (=> b!18973 m!25449))

(declare-fun m!25451 () Bool)

(assert (=> b!18973 m!25451))

(declare-fun m!25453 () Bool)

(assert (=> b!18975 m!25453))

(push 1)

(assert (not b!18976))

(assert (not b!18973))

(assert (not start!4820))

(assert (not b!18974))

(assert (not b!18975))

(assert (not b!18977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

