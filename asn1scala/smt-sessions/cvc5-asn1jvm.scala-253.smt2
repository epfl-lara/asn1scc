; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4936 () Bool)

(assert start!4936)

(declare-fun b!19567 () Bool)

(declare-fun e!12988 () Bool)

(declare-fun e!12986 () Bool)

(assert (=> b!19567 (= e!12988 (not e!12986))))

(declare-fun res!17093 () Bool)

(assert (=> b!19567 (=> res!17093 e!12986)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!19567 (= res!17093 (bvsge i!635 to!314))))

(declare-datatypes ((array!1403 0))(
  ( (array!1404 (arr!1036 (Array (_ BitVec 32) (_ BitVec 8))) (size!595 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1024 0))(
  ( (BitStream!1025 (buf!898 array!1403) (currentByte!2181 (_ BitVec 32)) (currentBit!2176 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1024)

(declare-fun isPrefixOf!0 (BitStream!1024 BitStream!1024) Bool)

(assert (=> b!19567 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1737 0))(
  ( (Unit!1738) )
))
(declare-fun lt!27844 () Unit!1737)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1024) Unit!1737)

(assert (=> b!19567 (= lt!27844 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27843 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19567 (= lt!27843 (bitIndex!0 (size!595 (buf!898 thiss!1379)) (currentByte!2181 thiss!1379) (currentBit!2176 thiss!1379)))))

(declare-fun b!19569 () Bool)

(declare-fun e!12990 () Bool)

(declare-fun array_inv!565 (array!1403) Bool)

(assert (=> b!19569 (= e!12990 (array_inv!565 (buf!898 thiss!1379)))))

(declare-fun b!19570 () Bool)

(declare-fun e!12987 () Bool)

(assert (=> b!19570 (= e!12987 true)))

(declare-datatypes ((List!213 0))(
  ( (Nil!210) (Cons!209 (h!328 Bool) (t!963 List!213)) )
))
(declare-fun lt!27838 () List!213)

(declare-datatypes ((tuple2!2240 0))(
  ( (tuple2!2241 (_1!1205 Unit!1737) (_2!1205 BitStream!1024)) )
))
(declare-fun lt!27839 () tuple2!2240)

(declare-datatypes ((tuple2!2242 0))(
  ( (tuple2!2243 (_1!1206 BitStream!1024) (_2!1206 BitStream!1024)) )
))
(declare-fun lt!27840 () tuple2!2242)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1024 BitStream!1024 (_ BitVec 64)) List!213)

(assert (=> b!19570 (= lt!27838 (bitStreamReadBitsIntoList!0 (_2!1205 lt!27839) (_1!1206 lt!27840) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19570 (validate_offset_bits!1 ((_ sign_extend 32) (size!595 (buf!898 (_2!1205 lt!27839)))) ((_ sign_extend 32) (currentByte!2181 thiss!1379)) ((_ sign_extend 32) (currentBit!2176 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27841 () Unit!1737)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1024 array!1403 (_ BitVec 64)) Unit!1737)

(assert (=> b!19570 (= lt!27841 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!898 (_2!1205 lt!27839)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1024 BitStream!1024) tuple2!2242)

(assert (=> b!19570 (= lt!27840 (reader!0 thiss!1379 (_2!1205 lt!27839)))))

(declare-fun b!19571 () Bool)

(assert (=> b!19571 (= e!12986 e!12987)))

(declare-fun res!17090 () Bool)

(assert (=> b!19571 (=> res!17090 e!12987)))

(assert (=> b!19571 (= res!17090 (not (isPrefixOf!0 thiss!1379 (_2!1205 lt!27839))))))

(assert (=> b!19571 (validate_offset_bits!1 ((_ sign_extend 32) (size!595 (buf!898 (_2!1205 lt!27839)))) ((_ sign_extend 32) (currentByte!2181 (_2!1205 lt!27839))) ((_ sign_extend 32) (currentBit!2176 (_2!1205 lt!27839))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27842 () Unit!1737)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1024 BitStream!1024 (_ BitVec 64) (_ BitVec 64)) Unit!1737)

(assert (=> b!19571 (= lt!27842 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1205 lt!27839) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1403)

(declare-fun appendBitFromByte!0 (BitStream!1024 (_ BitVec 8) (_ BitVec 32)) tuple2!2240)

(assert (=> b!19571 (= lt!27839 (appendBitFromByte!0 thiss!1379 (select (arr!1036 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!17092 () Bool)

(assert (=> start!4936 (=> (not res!17092) (not e!12988))))

(assert (=> start!4936 (= res!17092 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!595 srcBuffer!2))))))))

(assert (=> start!4936 e!12988))

(assert (=> start!4936 true))

(assert (=> start!4936 (array_inv!565 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1024) Bool)

(assert (=> start!4936 (and (inv!12 thiss!1379) e!12990)))

(declare-fun b!19568 () Bool)

(declare-fun res!17091 () Bool)

(assert (=> b!19568 (=> (not res!17091) (not e!12988))))

(assert (=> b!19568 (= res!17091 (validate_offset_bits!1 ((_ sign_extend 32) (size!595 (buf!898 thiss!1379))) ((_ sign_extend 32) (currentByte!2181 thiss!1379)) ((_ sign_extend 32) (currentBit!2176 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!4936 res!17092) b!19568))

(assert (= (and b!19568 res!17091) b!19567))

(assert (= (and b!19567 (not res!17093)) b!19571))

(assert (= (and b!19571 (not res!17090)) b!19570))

(assert (= start!4936 b!19569))

(declare-fun m!26355 () Bool)

(assert (=> b!19568 m!26355))

(declare-fun m!26357 () Bool)

(assert (=> b!19569 m!26357))

(declare-fun m!26359 () Bool)

(assert (=> start!4936 m!26359))

(declare-fun m!26361 () Bool)

(assert (=> start!4936 m!26361))

(declare-fun m!26363 () Bool)

(assert (=> b!19571 m!26363))

(declare-fun m!26365 () Bool)

(assert (=> b!19571 m!26365))

(assert (=> b!19571 m!26365))

(declare-fun m!26367 () Bool)

(assert (=> b!19571 m!26367))

(declare-fun m!26369 () Bool)

(assert (=> b!19571 m!26369))

(declare-fun m!26371 () Bool)

(assert (=> b!19571 m!26371))

(declare-fun m!26373 () Bool)

(assert (=> b!19570 m!26373))

(declare-fun m!26375 () Bool)

(assert (=> b!19570 m!26375))

(declare-fun m!26377 () Bool)

(assert (=> b!19570 m!26377))

(declare-fun m!26379 () Bool)

(assert (=> b!19570 m!26379))

(declare-fun m!26381 () Bool)

(assert (=> b!19567 m!26381))

(declare-fun m!26383 () Bool)

(assert (=> b!19567 m!26383))

(declare-fun m!26385 () Bool)

(assert (=> b!19567 m!26385))

(push 1)

(assert (not b!19567))

(assert (not b!19568))

(assert (not b!19569))

(assert (not b!19571))

(assert (not b!19570))

(assert (not start!4936))

(check-sat)

(pop 1)

