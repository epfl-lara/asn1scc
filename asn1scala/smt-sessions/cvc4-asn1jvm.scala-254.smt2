; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4946 () Bool)

(assert start!4946)

(declare-fun b!19643 () Bool)

(declare-fun res!17153 () Bool)

(declare-fun e!13079 () Bool)

(assert (=> b!19643 (=> (not res!17153) (not e!13079))))

(declare-datatypes ((array!1413 0))(
  ( (array!1414 (arr!1041 (Array (_ BitVec 32) (_ BitVec 8))) (size!600 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1034 0))(
  ( (BitStream!1035 (buf!903 array!1413) (currentByte!2186 (_ BitVec 32)) (currentBit!2181 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1034)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19643 (= res!17153 (validate_offset_bits!1 ((_ sign_extend 32) (size!600 (buf!903 thiss!1379))) ((_ sign_extend 32) (currentByte!2186 thiss!1379)) ((_ sign_extend 32) (currentBit!2181 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19644 () Bool)

(declare-fun e!13078 () Bool)

(declare-fun array_inv!570 (array!1413) Bool)

(assert (=> b!19644 (= e!13078 (array_inv!570 (buf!903 thiss!1379)))))

(declare-fun b!19645 () Bool)

(declare-fun e!13077 () Bool)

(assert (=> b!19645 (= e!13079 (not e!13077))))

(declare-fun res!17151 () Bool)

(assert (=> b!19645 (=> res!17151 e!13077)))

(assert (=> b!19645 (= res!17151 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1034 BitStream!1034) Bool)

(assert (=> b!19645 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1747 0))(
  ( (Unit!1748) )
))
(declare-fun lt!27949 () Unit!1747)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1034) Unit!1747)

(assert (=> b!19645 (= lt!27949 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27946 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19645 (= lt!27946 (bitIndex!0 (size!600 (buf!903 thiss!1379)) (currentByte!2186 thiss!1379) (currentBit!2181 thiss!1379)))))

(declare-fun b!19646 () Bool)

(declare-fun e!13076 () Bool)

(assert (=> b!19646 (= e!13077 e!13076)))

(declare-fun res!17150 () Bool)

(assert (=> b!19646 (=> res!17150 e!13076)))

(declare-datatypes ((tuple2!2260 0))(
  ( (tuple2!2261 (_1!1215 Unit!1747) (_2!1215 BitStream!1034)) )
))
(declare-fun lt!27948 () tuple2!2260)

(assert (=> b!19646 (= res!17150 (not (isPrefixOf!0 thiss!1379 (_2!1215 lt!27948))))))

(assert (=> b!19646 (validate_offset_bits!1 ((_ sign_extend 32) (size!600 (buf!903 (_2!1215 lt!27948)))) ((_ sign_extend 32) (currentByte!2186 (_2!1215 lt!27948))) ((_ sign_extend 32) (currentBit!2181 (_2!1215 lt!27948))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27944 () Unit!1747)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1034 BitStream!1034 (_ BitVec 64) (_ BitVec 64)) Unit!1747)

(assert (=> b!19646 (= lt!27944 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1215 lt!27948) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1413)

(declare-fun appendBitFromByte!0 (BitStream!1034 (_ BitVec 8) (_ BitVec 32)) tuple2!2260)

(assert (=> b!19646 (= lt!27948 (appendBitFromByte!0 thiss!1379 (select (arr!1041 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!17152 () Bool)

(assert (=> start!4946 (=> (not res!17152) (not e!13079))))

(assert (=> start!4946 (= res!17152 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!600 srcBuffer!2))))))))

(assert (=> start!4946 e!13079))

(assert (=> start!4946 true))

(assert (=> start!4946 (array_inv!570 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1034) Bool)

(assert (=> start!4946 (and (inv!12 thiss!1379) e!13078)))

(declare-fun b!19642 () Bool)

(assert (=> b!19642 (= e!13076 true)))

(declare-datatypes ((List!218 0))(
  ( (Nil!215) (Cons!214 (h!333 Bool) (t!968 List!218)) )
))
(declare-fun lt!27947 () List!218)

(declare-datatypes ((tuple2!2262 0))(
  ( (tuple2!2263 (_1!1216 BitStream!1034) (_2!1216 BitStream!1034)) )
))
(declare-fun lt!27943 () tuple2!2262)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1034 BitStream!1034 (_ BitVec 64)) List!218)

(assert (=> b!19642 (= lt!27947 (bitStreamReadBitsIntoList!0 (_2!1215 lt!27948) (_1!1216 lt!27943) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19642 (validate_offset_bits!1 ((_ sign_extend 32) (size!600 (buf!903 (_2!1215 lt!27948)))) ((_ sign_extend 32) (currentByte!2186 thiss!1379)) ((_ sign_extend 32) (currentBit!2181 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27945 () Unit!1747)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1034 array!1413 (_ BitVec 64)) Unit!1747)

(assert (=> b!19642 (= lt!27945 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!903 (_2!1215 lt!27948)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1034 BitStream!1034) tuple2!2262)

(assert (=> b!19642 (= lt!27943 (reader!0 thiss!1379 (_2!1215 lt!27948)))))

(assert (= (and start!4946 res!17152) b!19643))

(assert (= (and b!19643 res!17153) b!19645))

(assert (= (and b!19645 (not res!17151)) b!19646))

(assert (= (and b!19646 (not res!17150)) b!19642))

(assert (= start!4946 b!19644))

(declare-fun m!26515 () Bool)

(assert (=> b!19644 m!26515))

(declare-fun m!26517 () Bool)

(assert (=> b!19646 m!26517))

(declare-fun m!26519 () Bool)

(assert (=> b!19646 m!26519))

(declare-fun m!26521 () Bool)

(assert (=> b!19646 m!26521))

(assert (=> b!19646 m!26517))

(declare-fun m!26523 () Bool)

(assert (=> b!19646 m!26523))

(declare-fun m!26525 () Bool)

(assert (=> b!19646 m!26525))

(declare-fun m!26527 () Bool)

(assert (=> b!19643 m!26527))

(declare-fun m!26529 () Bool)

(assert (=> b!19642 m!26529))

(declare-fun m!26531 () Bool)

(assert (=> b!19642 m!26531))

(declare-fun m!26533 () Bool)

(assert (=> b!19642 m!26533))

(declare-fun m!26535 () Bool)

(assert (=> b!19642 m!26535))

(declare-fun m!26537 () Bool)

(assert (=> start!4946 m!26537))

(declare-fun m!26539 () Bool)

(assert (=> start!4946 m!26539))

(declare-fun m!26541 () Bool)

(assert (=> b!19645 m!26541))

(declare-fun m!26543 () Bool)

(assert (=> b!19645 m!26543))

(declare-fun m!26545 () Bool)

(assert (=> b!19645 m!26545))

(push 1)

(assert (not b!19644))

(assert (not b!19643))

(assert (not start!4946))

(assert (not b!19646))

(assert (not b!19645))

(assert (not b!19642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

