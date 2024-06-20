; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7622 () Bool)

(assert start!7622)

(declare-fun b!37111 () Bool)

(declare-fun e!24435 () Bool)

(declare-fun e!24430 () Bool)

(assert (=> b!37111 (= e!24435 e!24430)))

(declare-fun res!31577 () Bool)

(assert (=> b!37111 (=> res!31577 e!24430)))

(declare-fun lt!56056 () Bool)

(declare-datatypes ((array!1931 0))(
  ( (array!1932 (arr!1355 (Array (_ BitVec 32) (_ BitVec 8))) (size!865 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1492 0))(
  ( (BitStream!1493 (buf!1193 array!1931) (currentByte!2593 (_ BitVec 32)) (currentBit!2588 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3634 0))(
  ( (tuple2!3635 (_1!1904 BitStream!1492) (_2!1904 BitStream!1492)) )
))
(declare-fun lt!56051 () tuple2!3634)

(declare-fun lt!56047 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1931 (_ BitVec 64)) Bool)

(assert (=> b!37111 (= res!31577 (not (= lt!56056 (bitAt!0 (buf!1193 (_1!1904 lt!56051)) lt!56047))))))

(declare-fun lt!56045 () tuple2!3634)

(assert (=> b!37111 (= lt!56056 (bitAt!0 (buf!1193 (_1!1904 lt!56045)) lt!56047))))

(declare-fun b!37112 () Bool)

(declare-fun e!24440 () Bool)

(declare-fun e!24433 () Bool)

(assert (=> b!37112 (= e!24440 e!24433)))

(declare-fun res!31563 () Bool)

(assert (=> b!37112 (=> res!31563 e!24433)))

(declare-datatypes ((Unit!2705 0))(
  ( (Unit!2706) )
))
(declare-datatypes ((tuple2!3636 0))(
  ( (tuple2!3637 (_1!1905 Unit!2705) (_2!1905 BitStream!1492)) )
))
(declare-fun lt!56050 () tuple2!3636)

(declare-fun lt!56062 () tuple2!3636)

(assert (=> b!37112 (= res!31563 (not (= (size!865 (buf!1193 (_2!1905 lt!56050))) (size!865 (buf!1193 (_2!1905 lt!56062))))))))

(declare-fun lt!56053 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!56044 () (_ BitVec 64))

(assert (=> b!37112 (= lt!56044 (bvsub (bvsub (bvadd lt!56053 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!37112 (= lt!56053 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))))))

(declare-fun thiss!1379 () BitStream!1492)

(assert (=> b!37112 (= (size!865 (buf!1193 (_2!1905 lt!56062))) (size!865 (buf!1193 thiss!1379)))))

(declare-fun b!37113 () Bool)

(declare-fun e!24441 () Bool)

(declare-fun e!24442 () Bool)

(assert (=> b!37113 (= e!24441 e!24442)))

(declare-fun res!31565 () Bool)

(assert (=> b!37113 (=> res!31565 e!24442)))

(declare-fun isPrefixOf!0 (BitStream!1492 BitStream!1492) Bool)

(assert (=> b!37113 (= res!31565 (not (isPrefixOf!0 (_2!1905 lt!56050) (_2!1905 lt!56062))))))

(assert (=> b!37113 (isPrefixOf!0 thiss!1379 (_2!1905 lt!56062))))

(declare-fun lt!56067 () Unit!2705)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1492 BitStream!1492 BitStream!1492) Unit!2705)

(assert (=> b!37113 (= lt!56067 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1905 lt!56050) (_2!1905 lt!56062)))))

(declare-fun srcBuffer!2 () array!1931)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1492 array!1931 (_ BitVec 64) (_ BitVec 64)) tuple2!3636)

(assert (=> b!37113 (= lt!56062 (appendBitsMSBFirstLoop!0 (_2!1905 lt!56050) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!24434 () Bool)

(assert (=> b!37113 e!24434))

(declare-fun res!31578 () Bool)

(assert (=> b!37113 (=> (not res!31578) (not e!24434))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37113 (= res!31578 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56061 () Unit!2705)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1492 array!1931 (_ BitVec 64)) Unit!2705)

(assert (=> b!37113 (= lt!56061 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1193 (_2!1905 lt!56050)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56065 () tuple2!3634)

(declare-fun reader!0 (BitStream!1492 BitStream!1492) tuple2!3634)

(assert (=> b!37113 (= lt!56065 (reader!0 thiss!1379 (_2!1905 lt!56050)))))

(declare-fun b!37114 () Bool)

(assert (=> b!37114 (= e!24442 e!24440)))

(declare-fun res!31571 () Bool)

(assert (=> b!37114 (=> res!31571 e!24440)))

(assert (=> b!37114 (= res!31571 (not (= lt!56044 (bvsub (bvadd lt!56047 to!314) i!635))))))

(assert (=> b!37114 (= lt!56044 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56062))) (currentByte!2593 (_2!1905 lt!56062)) (currentBit!2588 (_2!1905 lt!56062))))))

(declare-fun b!37115 () Bool)

(declare-fun res!31568 () Bool)

(declare-fun e!24439 () Bool)

(assert (=> b!37115 (=> (not res!31568) (not e!24439))))

(assert (=> b!37115 (= res!31568 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 thiss!1379))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!37116 () Bool)

(declare-fun res!31570 () Bool)

(assert (=> b!37116 (=> res!31570 e!24440)))

(assert (=> b!37116 (= res!31570 (not (= (size!865 (buf!1193 thiss!1379)) (size!865 (buf!1193 (_2!1905 lt!56062))))))))

(declare-fun b!37117 () Bool)

(declare-fun e!24429 () Bool)

(assert (=> b!37117 (= e!24429 e!24435)))

(declare-fun res!31564 () Bool)

(assert (=> b!37117 (=> res!31564 e!24435)))

(declare-datatypes ((List!447 0))(
  ( (Nil!444) (Cons!443 (h!562 Bool) (t!1197 List!447)) )
))
(declare-fun lt!56055 () List!447)

(declare-fun lt!56052 () List!447)

(assert (=> b!37117 (= res!31564 (not (= lt!56055 lt!56052)))))

(assert (=> b!37117 (= lt!56052 lt!56055)))

(declare-fun lt!56049 () List!447)

(declare-fun tail!164 (List!447) List!447)

(assert (=> b!37117 (= lt!56055 (tail!164 lt!56049))))

(declare-fun lt!56046 () Unit!2705)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1492 BitStream!1492 BitStream!1492 BitStream!1492 (_ BitVec 64) List!447) Unit!2705)

(assert (=> b!37117 (= lt!56046 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1905 lt!56062) (_2!1905 lt!56062) (_1!1904 lt!56045) (_1!1904 lt!56051) (bvsub to!314 i!635) lt!56049))))

(declare-fun b!37118 () Bool)

(declare-fun res!31569 () Bool)

(assert (=> b!37118 (=> res!31569 e!24433)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!37118 (= res!31569 (not (invariant!0 (currentBit!2588 (_2!1905 lt!56050)) (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56050))))))))

(declare-fun b!37119 () Bool)

(assert (=> b!37119 (= e!24433 e!24429)))

(declare-fun res!31576 () Bool)

(assert (=> b!37119 (=> res!31576 e!24429)))

(assert (=> b!37119 (= res!31576 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!56064 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1492 BitStream!1492 (_ BitVec 64)) List!447)

(assert (=> b!37119 (= lt!56052 (bitStreamReadBitsIntoList!0 (_2!1905 lt!56062) (_1!1904 lt!56051) lt!56064))))

(assert (=> b!37119 (= lt!56049 (bitStreamReadBitsIntoList!0 (_2!1905 lt!56062) (_1!1904 lt!56045) (bvsub to!314 i!635)))))

(declare-fun lt!56059 () List!447)

(declare-fun byteArrayBitContentToList!0 (BitStream!1492 array!1931 (_ BitVec 64) (_ BitVec 64)) List!447)

(assert (=> b!37119 (= lt!56059 (byteArrayBitContentToList!0 (_2!1905 lt!56062) srcBuffer!2 i!635 (bvsub to!314 i!635)))))

(assert (=> b!37119 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56064)))

(declare-fun lt!56068 () Unit!2705)

(assert (=> b!37119 (= lt!56068 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1905 lt!56050) (buf!1193 (_2!1905 lt!56062)) lt!56064))))

(assert (=> b!37119 (= lt!56051 (reader!0 (_2!1905 lt!56050) (_2!1905 lt!56062)))))

(assert (=> b!37119 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!56057 () Unit!2705)

(assert (=> b!37119 (= lt!56057 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1193 (_2!1905 lt!56062)) (bvsub to!314 i!635)))))

(assert (=> b!37119 (= lt!56045 (reader!0 thiss!1379 (_2!1905 lt!56062)))))

(declare-fun b!37120 () Bool)

(declare-fun e!24431 () Bool)

(assert (=> b!37120 (= e!24430 e!24431)))

(declare-fun res!31561 () Bool)

(assert (=> b!37120 (=> res!31561 e!24431)))

(declare-fun lt!56058 () Bool)

(declare-fun head!284 (List!447) Bool)

(assert (=> b!37120 (= res!31561 (not (= (head!284 lt!56059) lt!56058)))))

(assert (=> b!37120 (= lt!56058 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!37121 () Bool)

(declare-fun e!24438 () Bool)

(declare-fun e!24428 () Bool)

(assert (=> b!37121 (= e!24438 e!24428)))

(declare-fun res!31566 () Bool)

(assert (=> b!37121 (=> res!31566 e!24428)))

(declare-fun lt!56066 () Bool)

(assert (=> b!37121 (= res!31566 (not (= lt!56066 lt!56058)))))

(declare-fun lt!56054 () Bool)

(assert (=> b!37121 (= lt!56054 lt!56066)))

(assert (=> b!37121 (= lt!56066 (bitAt!0 (buf!1193 (_2!1905 lt!56062)) lt!56047))))

(declare-fun lt!56048 () Unit!2705)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1931 array!1931 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2705)

(assert (=> b!37121 (= lt!56048 (arrayBitRangesEqImpliesEq!0 (buf!1193 (_2!1905 lt!56050)) (buf!1193 (_2!1905 lt!56062)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56047 lt!56053))))

(declare-fun res!31574 () Bool)

(assert (=> start!7622 (=> (not res!31574) (not e!24439))))

(assert (=> start!7622 (= res!31574 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!865 srcBuffer!2))))))))

(assert (=> start!7622 e!24439))

(assert (=> start!7622 true))

(declare-fun array_inv!799 (array!1931) Bool)

(assert (=> start!7622 (array_inv!799 srcBuffer!2)))

(declare-fun e!24432 () Bool)

(declare-fun inv!12 (BitStream!1492) Bool)

(assert (=> start!7622 (and (inv!12 thiss!1379) e!24432)))

(declare-fun b!37122 () Bool)

(assert (=> b!37122 (= e!24432 (array_inv!799 (buf!1193 thiss!1379)))))

(declare-fun b!37123 () Bool)

(declare-fun res!31559 () Bool)

(assert (=> b!37123 (=> res!31559 e!24429)))

(declare-fun length!173 (List!447) Int)

(assert (=> b!37123 (= res!31559 (<= (length!173 lt!56049) 0))))

(declare-fun b!37124 () Bool)

(assert (=> b!37124 (= e!24434 (= (head!284 (byteArrayBitContentToList!0 (_2!1905 lt!56050) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!284 (bitStreamReadBitsIntoList!0 (_2!1905 lt!56050) (_1!1904 lt!56065) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!37125 () Bool)

(declare-fun res!31573 () Bool)

(assert (=> b!37125 (=> res!31573 e!24440)))

(assert (=> b!37125 (= res!31573 (not (invariant!0 (currentBit!2588 (_2!1905 lt!56062)) (currentByte!2593 (_2!1905 lt!56062)) (size!865 (buf!1193 (_2!1905 lt!56062))))))))

(declare-fun b!37126 () Bool)

(declare-fun e!24436 () Bool)

(assert (=> b!37126 (= e!24436 e!24441)))

(declare-fun res!31572 () Bool)

(assert (=> b!37126 (=> res!31572 e!24441)))

(assert (=> b!37126 (= res!31572 (not (isPrefixOf!0 thiss!1379 (_2!1905 lt!56050))))))

(assert (=> b!37126 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56064)))

(assert (=> b!37126 (= lt!56064 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56063 () Unit!2705)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1492 BitStream!1492 (_ BitVec 64) (_ BitVec 64)) Unit!2705)

(assert (=> b!37126 (= lt!56063 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1905 lt!56050) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1492 (_ BitVec 8) (_ BitVec 32)) tuple2!3636)

(assert (=> b!37126 (= lt!56050 (appendBitFromByte!0 thiss!1379 (select (arr!1355 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!37127 () Bool)

(assert (=> b!37127 (= e!24428 (not (= lt!56059 Nil!444)))))

(declare-fun b!37128 () Bool)

(assert (=> b!37128 (= e!24431 e!24438)))

(declare-fun res!31562 () Bool)

(assert (=> b!37128 (=> res!31562 e!24438)))

(assert (=> b!37128 (= res!31562 (not (= lt!56054 lt!56058)))))

(assert (=> b!37128 (= lt!56054 (bitAt!0 (buf!1193 (_2!1905 lt!56050)) lt!56047))))

(declare-fun b!37129 () Bool)

(declare-fun res!31567 () Bool)

(assert (=> b!37129 (=> res!31567 e!24430)))

(assert (=> b!37129 (= res!31567 (not (= (head!284 lt!56049) lt!56056)))))

(declare-fun b!37130 () Bool)

(declare-fun res!31575 () Bool)

(assert (=> b!37130 (=> res!31575 e!24428)))

(declare-datatypes ((tuple2!3638 0))(
  ( (tuple2!3639 (_1!1906 BitStream!1492) (_2!1906 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1492) tuple2!3638)

(assert (=> b!37130 (= res!31575 (not (= (_2!1906 (readBitPure!0 (_1!1904 lt!56045))) lt!56058)))))

(declare-fun b!37131 () Bool)

(declare-fun res!31558 () Bool)

(assert (=> b!37131 (=> res!31558 e!24433)))

(assert (=> b!37131 (= res!31558 (not (invariant!0 (currentBit!2588 (_2!1905 lt!56050)) (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56062))))))))

(declare-fun b!37132 () Bool)

(assert (=> b!37132 (= e!24439 (not e!24436))))

(declare-fun res!31560 () Bool)

(assert (=> b!37132 (=> res!31560 e!24436)))

(assert (=> b!37132 (= res!31560 (bvsge i!635 to!314))))

(assert (=> b!37132 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!56060 () Unit!2705)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1492) Unit!2705)

(assert (=> b!37132 (= lt!56060 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!37132 (= lt!56047 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)))))

(assert (= (and start!7622 res!31574) b!37115))

(assert (= (and b!37115 res!31568) b!37132))

(assert (= (and b!37132 (not res!31560)) b!37126))

(assert (= (and b!37126 (not res!31572)) b!37113))

(assert (= (and b!37113 res!31578) b!37124))

(assert (= (and b!37113 (not res!31565)) b!37114))

(assert (= (and b!37114 (not res!31571)) b!37125))

(assert (= (and b!37125 (not res!31573)) b!37116))

(assert (= (and b!37116 (not res!31570)) b!37112))

(assert (= (and b!37112 (not res!31563)) b!37118))

(assert (= (and b!37118 (not res!31569)) b!37131))

(assert (= (and b!37131 (not res!31558)) b!37119))

(assert (= (and b!37119 (not res!31576)) b!37123))

(assert (= (and b!37123 (not res!31559)) b!37117))

(assert (= (and b!37117 (not res!31564)) b!37111))

(assert (= (and b!37111 (not res!31577)) b!37129))

(assert (= (and b!37129 (not res!31567)) b!37120))

(assert (= (and b!37120 (not res!31561)) b!37128))

(assert (= (and b!37128 (not res!31562)) b!37121))

(assert (= (and b!37121 (not res!31566)) b!37130))

(assert (= (and b!37130 (not res!31575)) b!37127))

(assert (= start!7622 b!37122))

(declare-fun m!56193 () Bool)

(assert (=> b!37124 m!56193))

(assert (=> b!37124 m!56193))

(declare-fun m!56195 () Bool)

(assert (=> b!37124 m!56195))

(declare-fun m!56197 () Bool)

(assert (=> b!37124 m!56197))

(assert (=> b!37124 m!56197))

(declare-fun m!56199 () Bool)

(assert (=> b!37124 m!56199))

(declare-fun m!56201 () Bool)

(assert (=> b!37129 m!56201))

(declare-fun m!56203 () Bool)

(assert (=> b!37121 m!56203))

(declare-fun m!56205 () Bool)

(assert (=> b!37121 m!56205))

(declare-fun m!56207 () Bool)

(assert (=> b!37119 m!56207))

(declare-fun m!56209 () Bool)

(assert (=> b!37119 m!56209))

(declare-fun m!56211 () Bool)

(assert (=> b!37119 m!56211))

(declare-fun m!56213 () Bool)

(assert (=> b!37119 m!56213))

(declare-fun m!56215 () Bool)

(assert (=> b!37119 m!56215))

(declare-fun m!56217 () Bool)

(assert (=> b!37119 m!56217))

(declare-fun m!56219 () Bool)

(assert (=> b!37119 m!56219))

(declare-fun m!56221 () Bool)

(assert (=> b!37119 m!56221))

(declare-fun m!56223 () Bool)

(assert (=> b!37119 m!56223))

(declare-fun m!56225 () Bool)

(assert (=> b!37118 m!56225))

(declare-fun m!56227 () Bool)

(assert (=> b!37111 m!56227))

(declare-fun m!56229 () Bool)

(assert (=> b!37111 m!56229))

(declare-fun m!56231 () Bool)

(assert (=> b!37122 m!56231))

(declare-fun m!56233 () Bool)

(assert (=> b!37115 m!56233))

(declare-fun m!56235 () Bool)

(assert (=> b!37131 m!56235))

(declare-fun m!56237 () Bool)

(assert (=> b!37126 m!56237))

(declare-fun m!56239 () Bool)

(assert (=> b!37126 m!56239))

(declare-fun m!56241 () Bool)

(assert (=> b!37126 m!56241))

(assert (=> b!37126 m!56237))

(declare-fun m!56243 () Bool)

(assert (=> b!37126 m!56243))

(declare-fun m!56245 () Bool)

(assert (=> b!37126 m!56245))

(declare-fun m!56247 () Bool)

(assert (=> b!37123 m!56247))

(declare-fun m!56249 () Bool)

(assert (=> start!7622 m!56249))

(declare-fun m!56251 () Bool)

(assert (=> start!7622 m!56251))

(declare-fun m!56253 () Bool)

(assert (=> b!37128 m!56253))

(declare-fun m!56255 () Bool)

(assert (=> b!37130 m!56255))

(declare-fun m!56257 () Bool)

(assert (=> b!37117 m!56257))

(declare-fun m!56259 () Bool)

(assert (=> b!37117 m!56259))

(declare-fun m!56261 () Bool)

(assert (=> b!37132 m!56261))

(declare-fun m!56263 () Bool)

(assert (=> b!37132 m!56263))

(declare-fun m!56265 () Bool)

(assert (=> b!37132 m!56265))

(declare-fun m!56267 () Bool)

(assert (=> b!37112 m!56267))

(declare-fun m!56269 () Bool)

(assert (=> b!37114 m!56269))

(declare-fun m!56271 () Bool)

(assert (=> b!37120 m!56271))

(declare-fun m!56273 () Bool)

(assert (=> b!37120 m!56273))

(declare-fun m!56275 () Bool)

(assert (=> b!37113 m!56275))

(declare-fun m!56277 () Bool)

(assert (=> b!37113 m!56277))

(declare-fun m!56279 () Bool)

(assert (=> b!37113 m!56279))

(declare-fun m!56281 () Bool)

(assert (=> b!37113 m!56281))

(declare-fun m!56283 () Bool)

(assert (=> b!37113 m!56283))

(declare-fun m!56285 () Bool)

(assert (=> b!37113 m!56285))

(declare-fun m!56287 () Bool)

(assert (=> b!37113 m!56287))

(declare-fun m!56289 () Bool)

(assert (=> b!37125 m!56289))

(push 1)

(assert (not b!37130))

(assert (not start!7622))

(assert (not b!37124))

(assert (not b!37121))

(assert (not b!37115))

(assert (not b!37128))

(assert (not b!37118))

(assert (not b!37129))

(assert (not b!37120))

(assert (not b!37112))

(assert (not b!37114))

(assert (not b!37131))

(assert (not b!37111))

(assert (not b!37119))

(assert (not b!37122))

(assert (not b!37126))

(assert (not b!37113))

(assert (not b!37132))

(assert (not b!37123))

(assert (not b!37125))

(assert (not b!37117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11044 () Bool)

(assert (=> d!11044 (= (head!284 lt!56049) (h!562 lt!56049))))

(assert (=> b!37129 d!11044))

(declare-fun d!11046 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11046 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2954 () Bool)

(assert (= bs!2954 d!11046))

(declare-fun m!56523 () Bool)

(assert (=> bs!2954 m!56523))

(assert (=> b!37119 d!11046))

(declare-fun d!11048 () Bool)

(declare-fun c!2559 () Bool)

(assert (=> d!11048 (= c!2559 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24555 () List!447)

(assert (=> d!11048 (= (byteArrayBitContentToList!0 (_2!1905 lt!56062) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!24555)))

(declare-fun b!37296 () Bool)

(assert (=> b!37296 (= e!24555 Nil!444)))

(declare-fun b!37297 () Bool)

(assert (=> b!37297 (= e!24555 (Cons!443 (not (= (bvand ((_ sign_extend 24) (select (arr!1355 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1905 lt!56062) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11048 c!2559) b!37296))

(assert (= (and d!11048 (not c!2559)) b!37297))

(assert (=> b!37297 m!56237))

(declare-fun m!56525 () Bool)

(assert (=> b!37297 m!56525))

(declare-fun m!56527 () Bool)

(assert (=> b!37297 m!56527))

(assert (=> b!37119 d!11048))

(declare-fun d!11050 () Bool)

(assert (=> d!11050 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56064)))

(declare-fun lt!56287 () Unit!2705)

(declare-fun choose!9 (BitStream!1492 array!1931 (_ BitVec 64) BitStream!1492) Unit!2705)

(assert (=> d!11050 (= lt!56287 (choose!9 (_2!1905 lt!56050) (buf!1193 (_2!1905 lt!56062)) lt!56064 (BitStream!1493 (buf!1193 (_2!1905 lt!56062)) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050)))))))

(assert (=> d!11050 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1905 lt!56050) (buf!1193 (_2!1905 lt!56062)) lt!56064) lt!56287)))

(declare-fun bs!2955 () Bool)

(assert (= bs!2955 d!11050))

(assert (=> bs!2955 m!56211))

(declare-fun m!56529 () Bool)

(assert (=> bs!2955 m!56529))

(assert (=> b!37119 d!11050))

(declare-fun d!11052 () Bool)

(assert (=> d!11052 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56064) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050)))) lt!56064))))

(declare-fun bs!2956 () Bool)

(assert (= bs!2956 d!11052))

(declare-fun m!56531 () Bool)

(assert (=> bs!2956 m!56531))

(assert (=> b!37119 d!11052))

(declare-fun b!37306 () Bool)

(declare-datatypes ((tuple2!3658 0))(
  ( (tuple2!3659 (_1!1916 List!447) (_2!1916 BitStream!1492)) )
))
(declare-fun e!24560 () tuple2!3658)

(assert (=> b!37306 (= e!24560 (tuple2!3659 Nil!444 (_1!1904 lt!56051)))))

(declare-fun b!37309 () Bool)

(declare-fun e!24561 () Bool)

(declare-fun lt!56294 () List!447)

(assert (=> b!37309 (= e!24561 (> (length!173 lt!56294) 0))))

(declare-fun b!37307 () Bool)

(declare-fun lt!56296 () (_ BitVec 64))

(declare-datatypes ((tuple2!3660 0))(
  ( (tuple2!3661 (_1!1917 Bool) (_2!1917 BitStream!1492)) )
))
(declare-fun lt!56295 () tuple2!3660)

(assert (=> b!37307 (= e!24560 (tuple2!3659 (Cons!443 (_1!1917 lt!56295) (bitStreamReadBitsIntoList!0 (_2!1905 lt!56062) (_2!1917 lt!56295) (bvsub lt!56064 lt!56296))) (_2!1917 lt!56295)))))

(declare-fun readBit!0 (BitStream!1492) tuple2!3660)

(assert (=> b!37307 (= lt!56295 (readBit!0 (_1!1904 lt!56051)))))

(assert (=> b!37307 (= lt!56296 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!37308 () Bool)

(declare-fun isEmpty!106 (List!447) Bool)

(assert (=> b!37308 (= e!24561 (isEmpty!106 lt!56294))))

(declare-fun d!11054 () Bool)

(assert (=> d!11054 e!24561))

(declare-fun c!2565 () Bool)

(assert (=> d!11054 (= c!2565 (= lt!56064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11054 (= lt!56294 (_1!1916 e!24560))))

(declare-fun c!2564 () Bool)

(assert (=> d!11054 (= c!2564 (= lt!56064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11054 (bvsge lt!56064 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11054 (= (bitStreamReadBitsIntoList!0 (_2!1905 lt!56062) (_1!1904 lt!56051) lt!56064) lt!56294)))

(assert (= (and d!11054 c!2564) b!37306))

(assert (= (and d!11054 (not c!2564)) b!37307))

(assert (= (and d!11054 c!2565) b!37308))

(assert (= (and d!11054 (not c!2565)) b!37309))

(declare-fun m!56533 () Bool)

(assert (=> b!37309 m!56533))

(declare-fun m!56535 () Bool)

(assert (=> b!37307 m!56535))

(declare-fun m!56537 () Bool)

(assert (=> b!37307 m!56537))

(declare-fun m!56539 () Bool)

(assert (=> b!37308 m!56539))

(assert (=> b!37119 d!11054))

(declare-fun b!37320 () Bool)

(declare-fun e!24567 () Unit!2705)

(declare-fun Unit!2721 () Unit!2705)

(assert (=> b!37320 (= e!24567 Unit!2721)))

(declare-fun d!11056 () Bool)

(declare-fun e!24566 () Bool)

(assert (=> d!11056 e!24566))

(declare-fun res!31733 () Bool)

(assert (=> d!11056 (=> (not res!31733) (not e!24566))))

(declare-fun lt!56348 () tuple2!3634)

(assert (=> d!11056 (= res!31733 (isPrefixOf!0 (_1!1904 lt!56348) (_2!1904 lt!56348)))))

(declare-fun lt!56351 () BitStream!1492)

(assert (=> d!11056 (= lt!56348 (tuple2!3635 lt!56351 (_2!1905 lt!56062)))))

(declare-fun lt!56347 () Unit!2705)

(declare-fun lt!56337 () Unit!2705)

(assert (=> d!11056 (= lt!56347 lt!56337)))

(assert (=> d!11056 (isPrefixOf!0 lt!56351 (_2!1905 lt!56062))))

(assert (=> d!11056 (= lt!56337 (lemmaIsPrefixTransitive!0 lt!56351 (_2!1905 lt!56062) (_2!1905 lt!56062)))))

(declare-fun lt!56344 () Unit!2705)

(declare-fun lt!56354 () Unit!2705)

(assert (=> d!11056 (= lt!56344 lt!56354)))

(assert (=> d!11056 (isPrefixOf!0 lt!56351 (_2!1905 lt!56062))))

(assert (=> d!11056 (= lt!56354 (lemmaIsPrefixTransitive!0 lt!56351 thiss!1379 (_2!1905 lt!56062)))))

(declare-fun lt!56350 () Unit!2705)

(assert (=> d!11056 (= lt!56350 e!24567)))

(declare-fun c!2568 () Bool)

(assert (=> d!11056 (= c!2568 (not (= (size!865 (buf!1193 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!56349 () Unit!2705)

(declare-fun lt!56346 () Unit!2705)

(assert (=> d!11056 (= lt!56349 lt!56346)))

(assert (=> d!11056 (isPrefixOf!0 (_2!1905 lt!56062) (_2!1905 lt!56062))))

(assert (=> d!11056 (= lt!56346 (lemmaIsPrefixRefl!0 (_2!1905 lt!56062)))))

(declare-fun lt!56342 () Unit!2705)

(declare-fun lt!56343 () Unit!2705)

(assert (=> d!11056 (= lt!56342 lt!56343)))

(assert (=> d!11056 (= lt!56343 (lemmaIsPrefixRefl!0 (_2!1905 lt!56062)))))

(declare-fun lt!56338 () Unit!2705)

(declare-fun lt!56345 () Unit!2705)

(assert (=> d!11056 (= lt!56338 lt!56345)))

(assert (=> d!11056 (isPrefixOf!0 lt!56351 lt!56351)))

(assert (=> d!11056 (= lt!56345 (lemmaIsPrefixRefl!0 lt!56351))))

(declare-fun lt!56352 () Unit!2705)

(declare-fun lt!56355 () Unit!2705)

(assert (=> d!11056 (= lt!56352 lt!56355)))

(assert (=> d!11056 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11056 (= lt!56355 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11056 (= lt!56351 (BitStream!1493 (buf!1193 (_2!1905 lt!56062)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)))))

(assert (=> d!11056 (isPrefixOf!0 thiss!1379 (_2!1905 lt!56062))))

(assert (=> d!11056 (= (reader!0 thiss!1379 (_2!1905 lt!56062)) lt!56348)))

(declare-fun b!37321 () Bool)

(declare-fun res!31734 () Bool)

(assert (=> b!37321 (=> (not res!31734) (not e!24566))))

(assert (=> b!37321 (= res!31734 (isPrefixOf!0 (_1!1904 lt!56348) thiss!1379))))

(declare-fun b!37322 () Bool)

(declare-fun lt!56339 () Unit!2705)

(assert (=> b!37322 (= e!24567 lt!56339)))

(declare-fun lt!56356 () (_ BitVec 64))

(assert (=> b!37322 (= lt!56356 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!56341 () (_ BitVec 64))

(assert (=> b!37322 (= lt!56341 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1931 array!1931 (_ BitVec 64) (_ BitVec 64)) Unit!2705)

(assert (=> b!37322 (= lt!56339 (arrayBitRangesEqSymmetric!0 (buf!1193 thiss!1379) (buf!1193 (_2!1905 lt!56062)) lt!56356 lt!56341))))

(declare-fun arrayBitRangesEq!0 (array!1931 array!1931 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37322 (arrayBitRangesEq!0 (buf!1193 (_2!1905 lt!56062)) (buf!1193 thiss!1379) lt!56356 lt!56341)))

(declare-fun b!37323 () Bool)

(declare-fun res!31732 () Bool)

(assert (=> b!37323 (=> (not res!31732) (not e!24566))))

(assert (=> b!37323 (= res!31732 (isPrefixOf!0 (_2!1904 lt!56348) (_2!1905 lt!56062)))))

(declare-fun b!37324 () Bool)

(declare-fun lt!56353 () (_ BitVec 64))

(declare-fun lt!56340 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1492 (_ BitVec 64)) BitStream!1492)

(assert (=> b!37324 (= e!24566 (= (_1!1904 lt!56348) (withMovedBitIndex!0 (_2!1904 lt!56348) (bvsub lt!56340 lt!56353))))))

(assert (=> b!37324 (or (= (bvand lt!56340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56353 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56340 lt!56353) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37324 (= lt!56353 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56062))) (currentByte!2593 (_2!1905 lt!56062)) (currentBit!2588 (_2!1905 lt!56062))))))

(assert (=> b!37324 (= lt!56340 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)))))

(assert (= (and d!11056 c!2568) b!37322))

(assert (= (and d!11056 (not c!2568)) b!37320))

(assert (= (and d!11056 res!31733) b!37321))

(assert (= (and b!37321 res!31734) b!37323))

(assert (= (and b!37323 res!31732) b!37324))

(declare-fun m!56541 () Bool)

(assert (=> d!11056 m!56541))

(declare-fun m!56543 () Bool)

(assert (=> d!11056 m!56543))

(declare-fun m!56545 () Bool)

(assert (=> d!11056 m!56545))

(declare-fun m!56547 () Bool)

(assert (=> d!11056 m!56547))

(assert (=> d!11056 m!56287))

(assert (=> d!11056 m!56263))

(declare-fun m!56549 () Bool)

(assert (=> d!11056 m!56549))

(declare-fun m!56551 () Bool)

(assert (=> d!11056 m!56551))

(declare-fun m!56553 () Bool)

(assert (=> d!11056 m!56553))

(declare-fun m!56555 () Bool)

(assert (=> d!11056 m!56555))

(assert (=> d!11056 m!56261))

(declare-fun m!56557 () Bool)

(assert (=> b!37321 m!56557))

(declare-fun m!56559 () Bool)

(assert (=> b!37323 m!56559))

(assert (=> b!37322 m!56265))

(declare-fun m!56561 () Bool)

(assert (=> b!37322 m!56561))

(declare-fun m!56563 () Bool)

(assert (=> b!37322 m!56563))

(declare-fun m!56565 () Bool)

(assert (=> b!37324 m!56565))

(assert (=> b!37324 m!56269))

(assert (=> b!37324 m!56265))

(assert (=> b!37119 d!11056))

(declare-fun b!37325 () Bool)

(declare-fun e!24568 () tuple2!3658)

(assert (=> b!37325 (= e!24568 (tuple2!3659 Nil!444 (_1!1904 lt!56045)))))

(declare-fun b!37328 () Bool)

(declare-fun e!24569 () Bool)

(declare-fun lt!56357 () List!447)

(assert (=> b!37328 (= e!24569 (> (length!173 lt!56357) 0))))

(declare-fun b!37326 () Bool)

(declare-fun lt!56359 () (_ BitVec 64))

(declare-fun lt!56358 () tuple2!3660)

(assert (=> b!37326 (= e!24568 (tuple2!3659 (Cons!443 (_1!1917 lt!56358) (bitStreamReadBitsIntoList!0 (_2!1905 lt!56062) (_2!1917 lt!56358) (bvsub (bvsub to!314 i!635) lt!56359))) (_2!1917 lt!56358)))))

(assert (=> b!37326 (= lt!56358 (readBit!0 (_1!1904 lt!56045)))))

(assert (=> b!37326 (= lt!56359 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!37327 () Bool)

(assert (=> b!37327 (= e!24569 (isEmpty!106 lt!56357))))

(declare-fun d!11058 () Bool)

(assert (=> d!11058 e!24569))

(declare-fun c!2570 () Bool)

(assert (=> d!11058 (= c!2570 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11058 (= lt!56357 (_1!1916 e!24568))))

(declare-fun c!2569 () Bool)

(assert (=> d!11058 (= c!2569 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11058 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11058 (= (bitStreamReadBitsIntoList!0 (_2!1905 lt!56062) (_1!1904 lt!56045) (bvsub to!314 i!635)) lt!56357)))

(assert (= (and d!11058 c!2569) b!37325))

(assert (= (and d!11058 (not c!2569)) b!37326))

(assert (= (and d!11058 c!2570) b!37327))

(assert (= (and d!11058 (not c!2570)) b!37328))

(declare-fun m!56567 () Bool)

(assert (=> b!37328 m!56567))

(declare-fun m!56569 () Bool)

(assert (=> b!37326 m!56569))

(declare-fun m!56571 () Bool)

(assert (=> b!37326 m!56571))

(declare-fun m!56573 () Bool)

(assert (=> b!37327 m!56573))

(assert (=> b!37119 d!11058))

(declare-fun d!11060 () Bool)

(assert (=> d!11060 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!56360 () Unit!2705)

(assert (=> d!11060 (= lt!56360 (choose!9 thiss!1379 (buf!1193 (_2!1905 lt!56062)) (bvsub to!314 i!635) (BitStream!1493 (buf!1193 (_2!1905 lt!56062)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379))))))

(assert (=> d!11060 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1193 (_2!1905 lt!56062)) (bvsub to!314 i!635)) lt!56360)))

(declare-fun bs!2957 () Bool)

(assert (= bs!2957 d!11060))

(assert (=> bs!2957 m!56219))

(declare-fun m!56575 () Bool)

(assert (=> bs!2957 m!56575))

(assert (=> b!37119 d!11060))

(declare-fun b!37329 () Bool)

(declare-fun e!24571 () Unit!2705)

(declare-fun Unit!2722 () Unit!2705)

(assert (=> b!37329 (= e!24571 Unit!2722)))

(declare-fun d!11062 () Bool)

(declare-fun e!24570 () Bool)

(assert (=> d!11062 e!24570))

(declare-fun res!31736 () Bool)

(assert (=> d!11062 (=> (not res!31736) (not e!24570))))

(declare-fun lt!56372 () tuple2!3634)

(assert (=> d!11062 (= res!31736 (isPrefixOf!0 (_1!1904 lt!56372) (_2!1904 lt!56372)))))

(declare-fun lt!56375 () BitStream!1492)

(assert (=> d!11062 (= lt!56372 (tuple2!3635 lt!56375 (_2!1905 lt!56062)))))

(declare-fun lt!56371 () Unit!2705)

(declare-fun lt!56361 () Unit!2705)

(assert (=> d!11062 (= lt!56371 lt!56361)))

(assert (=> d!11062 (isPrefixOf!0 lt!56375 (_2!1905 lt!56062))))

(assert (=> d!11062 (= lt!56361 (lemmaIsPrefixTransitive!0 lt!56375 (_2!1905 lt!56062) (_2!1905 lt!56062)))))

(declare-fun lt!56368 () Unit!2705)

(declare-fun lt!56378 () Unit!2705)

(assert (=> d!11062 (= lt!56368 lt!56378)))

(assert (=> d!11062 (isPrefixOf!0 lt!56375 (_2!1905 lt!56062))))

(assert (=> d!11062 (= lt!56378 (lemmaIsPrefixTransitive!0 lt!56375 (_2!1905 lt!56050) (_2!1905 lt!56062)))))

(declare-fun lt!56374 () Unit!2705)

(assert (=> d!11062 (= lt!56374 e!24571)))

(declare-fun c!2571 () Bool)

(assert (=> d!11062 (= c!2571 (not (= (size!865 (buf!1193 (_2!1905 lt!56050))) #b00000000000000000000000000000000)))))

(declare-fun lt!56373 () Unit!2705)

(declare-fun lt!56370 () Unit!2705)

(assert (=> d!11062 (= lt!56373 lt!56370)))

(assert (=> d!11062 (isPrefixOf!0 (_2!1905 lt!56062) (_2!1905 lt!56062))))

(assert (=> d!11062 (= lt!56370 (lemmaIsPrefixRefl!0 (_2!1905 lt!56062)))))

(declare-fun lt!56366 () Unit!2705)

(declare-fun lt!56367 () Unit!2705)

(assert (=> d!11062 (= lt!56366 lt!56367)))

(assert (=> d!11062 (= lt!56367 (lemmaIsPrefixRefl!0 (_2!1905 lt!56062)))))

(declare-fun lt!56362 () Unit!2705)

(declare-fun lt!56369 () Unit!2705)

(assert (=> d!11062 (= lt!56362 lt!56369)))

(assert (=> d!11062 (isPrefixOf!0 lt!56375 lt!56375)))

(assert (=> d!11062 (= lt!56369 (lemmaIsPrefixRefl!0 lt!56375))))

(declare-fun lt!56376 () Unit!2705)

(declare-fun lt!56379 () Unit!2705)

(assert (=> d!11062 (= lt!56376 lt!56379)))

(assert (=> d!11062 (isPrefixOf!0 (_2!1905 lt!56050) (_2!1905 lt!56050))))

(assert (=> d!11062 (= lt!56379 (lemmaIsPrefixRefl!0 (_2!1905 lt!56050)))))

(assert (=> d!11062 (= lt!56375 (BitStream!1493 (buf!1193 (_2!1905 lt!56062)) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))))))

(assert (=> d!11062 (isPrefixOf!0 (_2!1905 lt!56050) (_2!1905 lt!56062))))

(assert (=> d!11062 (= (reader!0 (_2!1905 lt!56050) (_2!1905 lt!56062)) lt!56372)))

(declare-fun b!37330 () Bool)

(declare-fun res!31737 () Bool)

(assert (=> b!37330 (=> (not res!31737) (not e!24570))))

(assert (=> b!37330 (= res!31737 (isPrefixOf!0 (_1!1904 lt!56372) (_2!1905 lt!56050)))))

(declare-fun b!37331 () Bool)

(declare-fun lt!56363 () Unit!2705)

(assert (=> b!37331 (= e!24571 lt!56363)))

(declare-fun lt!56380 () (_ BitVec 64))

(assert (=> b!37331 (= lt!56380 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!56365 () (_ BitVec 64))

(assert (=> b!37331 (= lt!56365 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))))))

(assert (=> b!37331 (= lt!56363 (arrayBitRangesEqSymmetric!0 (buf!1193 (_2!1905 lt!56050)) (buf!1193 (_2!1905 lt!56062)) lt!56380 lt!56365))))

(assert (=> b!37331 (arrayBitRangesEq!0 (buf!1193 (_2!1905 lt!56062)) (buf!1193 (_2!1905 lt!56050)) lt!56380 lt!56365)))

(declare-fun b!37332 () Bool)

(declare-fun res!31735 () Bool)

(assert (=> b!37332 (=> (not res!31735) (not e!24570))))

(assert (=> b!37332 (= res!31735 (isPrefixOf!0 (_2!1904 lt!56372) (_2!1905 lt!56062)))))

(declare-fun lt!56377 () (_ BitVec 64))

(declare-fun b!37333 () Bool)

(declare-fun lt!56364 () (_ BitVec 64))

(assert (=> b!37333 (= e!24570 (= (_1!1904 lt!56372) (withMovedBitIndex!0 (_2!1904 lt!56372) (bvsub lt!56364 lt!56377))))))

(assert (=> b!37333 (or (= (bvand lt!56364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56377 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56364 lt!56377) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37333 (= lt!56377 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56062))) (currentByte!2593 (_2!1905 lt!56062)) (currentBit!2588 (_2!1905 lt!56062))))))

(assert (=> b!37333 (= lt!56364 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))))))

(assert (= (and d!11062 c!2571) b!37331))

(assert (= (and d!11062 (not c!2571)) b!37329))

(assert (= (and d!11062 res!31736) b!37330))

(assert (= (and b!37330 res!31737) b!37332))

(assert (= (and b!37332 res!31735) b!37333))

(assert (=> d!11062 m!56541))

(assert (=> d!11062 m!56543))

(declare-fun m!56577 () Bool)

(assert (=> d!11062 m!56577))

(declare-fun m!56579 () Bool)

(assert (=> d!11062 m!56579))

(assert (=> d!11062 m!56277))

(declare-fun m!56581 () Bool)

(assert (=> d!11062 m!56581))

(declare-fun m!56583 () Bool)

(assert (=> d!11062 m!56583))

(declare-fun m!56585 () Bool)

(assert (=> d!11062 m!56585))

(declare-fun m!56587 () Bool)

(assert (=> d!11062 m!56587))

(declare-fun m!56589 () Bool)

(assert (=> d!11062 m!56589))

(declare-fun m!56591 () Bool)

(assert (=> d!11062 m!56591))

(declare-fun m!56593 () Bool)

(assert (=> b!37330 m!56593))

(declare-fun m!56595 () Bool)

(assert (=> b!37332 m!56595))

(assert (=> b!37331 m!56267))

(declare-fun m!56597 () Bool)

(assert (=> b!37331 m!56597))

(declare-fun m!56599 () Bool)

(assert (=> b!37331 m!56599))

(declare-fun m!56601 () Bool)

(assert (=> b!37333 m!56601))

(assert (=> b!37333 m!56269))

(assert (=> b!37333 m!56267))

(assert (=> b!37119 d!11062))

(declare-fun d!11064 () Bool)

(declare-fun lt!56383 () tuple2!3660)

(assert (=> d!11064 (= lt!56383 (readBit!0 (_1!1904 lt!56045)))))

(assert (=> d!11064 (= (readBitPure!0 (_1!1904 lt!56045)) (tuple2!3639 (_2!1917 lt!56383) (_1!1917 lt!56383)))))

(declare-fun bs!2958 () Bool)

(assert (= bs!2958 d!11064))

(assert (=> bs!2958 m!56571))

(assert (=> b!37130 d!11064))

(declare-fun d!11066 () Bool)

(assert (=> d!11066 (= (tail!164 lt!56049) (t!1197 lt!56049))))

(assert (=> b!37117 d!11066))

(declare-fun d!11068 () Bool)

(declare-fun e!24574 () Bool)

(assert (=> d!11068 e!24574))

(declare-fun res!31740 () Bool)

(assert (=> d!11068 (=> (not res!31740) (not e!24574))))

(declare-fun lt!56389 () (_ BitVec 64))

(assert (=> d!11068 (= res!31740 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56389 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!56389) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11068 (= lt!56389 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56388 () Unit!2705)

(declare-fun choose!42 (BitStream!1492 BitStream!1492 BitStream!1492 BitStream!1492 (_ BitVec 64) List!447) Unit!2705)

(assert (=> d!11068 (= lt!56388 (choose!42 (_2!1905 lt!56062) (_2!1905 lt!56062) (_1!1904 lt!56045) (_1!1904 lt!56051) (bvsub to!314 i!635) lt!56049))))

(assert (=> d!11068 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11068 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1905 lt!56062) (_2!1905 lt!56062) (_1!1904 lt!56045) (_1!1904 lt!56051) (bvsub to!314 i!635) lt!56049) lt!56388)))

(declare-fun b!37336 () Bool)

(assert (=> b!37336 (= e!24574 (= (bitStreamReadBitsIntoList!0 (_2!1905 lt!56062) (_1!1904 lt!56051) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!164 lt!56049)))))

(assert (= (and d!11068 res!31740) b!37336))

(declare-fun m!56603 () Bool)

(assert (=> d!11068 m!56603))

(declare-fun m!56605 () Bool)

(assert (=> b!37336 m!56605))

(assert (=> b!37336 m!56257))

(assert (=> b!37117 d!11068))

(declare-fun d!11070 () Bool)

(assert (=> d!11070 (= (bitAt!0 (buf!1193 (_2!1905 lt!56050)) lt!56047) (not (= (bvand ((_ sign_extend 24) (select (arr!1355 (buf!1193 (_2!1905 lt!56050))) ((_ extract 31 0) (bvsdiv lt!56047 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56047 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2959 () Bool)

(assert (= bs!2959 d!11070))

(declare-fun m!56607 () Bool)

(assert (=> bs!2959 m!56607))

(declare-fun m!56609 () Bool)

(assert (=> bs!2959 m!56609))

(assert (=> b!37128 d!11070))

(declare-fun d!11072 () Bool)

(assert (=> d!11072 (= (invariant!0 (currentBit!2588 (_2!1905 lt!56050)) (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56050)))) (and (bvsge (currentBit!2588 (_2!1905 lt!56050)) #b00000000000000000000000000000000) (bvslt (currentBit!2588 (_2!1905 lt!56050)) #b00000000000000000000000000001000) (bvsge (currentByte!2593 (_2!1905 lt!56050)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56050)))) (and (= (currentBit!2588 (_2!1905 lt!56050)) #b00000000000000000000000000000000) (= (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56050))))))))))

(assert (=> b!37118 d!11072))

(declare-fun d!11074 () Bool)

(assert (=> d!11074 (= (bitAt!0 (buf!1193 (_2!1905 lt!56062)) lt!56047) (not (= (bvand ((_ sign_extend 24) (select (arr!1355 (buf!1193 (_2!1905 lt!56062))) ((_ extract 31 0) (bvsdiv lt!56047 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56047 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2960 () Bool)

(assert (= bs!2960 d!11074))

(declare-fun m!56611 () Bool)

(assert (=> bs!2960 m!56611))

(assert (=> bs!2960 m!56609))

(assert (=> b!37121 d!11074))

(declare-fun d!11076 () Bool)

(assert (=> d!11076 (= (bitAt!0 (buf!1193 (_2!1905 lt!56050)) lt!56047) (bitAt!0 (buf!1193 (_2!1905 lt!56062)) lt!56047))))

(declare-fun lt!56392 () Unit!2705)

(declare-fun choose!31 (array!1931 array!1931 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2705)

(assert (=> d!11076 (= lt!56392 (choose!31 (buf!1193 (_2!1905 lt!56050)) (buf!1193 (_2!1905 lt!56062)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56047 lt!56053))))

(assert (=> d!11076 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56053))))

(assert (=> d!11076 (= (arrayBitRangesEqImpliesEq!0 (buf!1193 (_2!1905 lt!56050)) (buf!1193 (_2!1905 lt!56062)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56047 lt!56053) lt!56392)))

(declare-fun bs!2961 () Bool)

(assert (= bs!2961 d!11076))

(assert (=> bs!2961 m!56253))

(assert (=> bs!2961 m!56203))

(declare-fun m!56613 () Bool)

(assert (=> bs!2961 m!56613))

(assert (=> b!37121 d!11076))

(declare-fun d!11078 () Bool)

(declare-fun res!31749 () Bool)

(declare-fun e!24580 () Bool)

(assert (=> d!11078 (=> (not res!31749) (not e!24580))))

(assert (=> d!11078 (= res!31749 (= (size!865 (buf!1193 thiss!1379)) (size!865 (buf!1193 thiss!1379))))))

(assert (=> d!11078 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!24580)))

(declare-fun b!37343 () Bool)

(declare-fun res!31748 () Bool)

(assert (=> b!37343 (=> (not res!31748) (not e!24580))))

(assert (=> b!37343 (= res!31748 (bvsle (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)) (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379))))))

(declare-fun b!37344 () Bool)

(declare-fun e!24579 () Bool)

(assert (=> b!37344 (= e!24580 e!24579)))

(declare-fun res!31747 () Bool)

(assert (=> b!37344 (=> res!31747 e!24579)))

(assert (=> b!37344 (= res!31747 (= (size!865 (buf!1193 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!37345 () Bool)

(assert (=> b!37345 (= e!24579 (arrayBitRangesEq!0 (buf!1193 thiss!1379) (buf!1193 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379))))))

(assert (= (and d!11078 res!31749) b!37343))

(assert (= (and b!37343 res!31748) b!37344))

(assert (= (and b!37344 (not res!31747)) b!37345))

(assert (=> b!37343 m!56265))

(assert (=> b!37343 m!56265))

(assert (=> b!37345 m!56265))

(assert (=> b!37345 m!56265))

(declare-fun m!56615 () Bool)

(assert (=> b!37345 m!56615))

(assert (=> b!37132 d!11078))

(declare-fun d!11080 () Bool)

(assert (=> d!11080 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!56395 () Unit!2705)

(declare-fun choose!11 (BitStream!1492) Unit!2705)

(assert (=> d!11080 (= lt!56395 (choose!11 thiss!1379))))

(assert (=> d!11080 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!56395)))

(declare-fun bs!2963 () Bool)

(assert (= bs!2963 d!11080))

(assert (=> bs!2963 m!56261))

(declare-fun m!56617 () Bool)

(assert (=> bs!2963 m!56617))

(assert (=> b!37132 d!11080))

(declare-fun d!11082 () Bool)

(declare-fun e!24583 () Bool)

(assert (=> d!11082 e!24583))

(declare-fun res!31755 () Bool)

(assert (=> d!11082 (=> (not res!31755) (not e!24583))))

(declare-fun lt!56408 () (_ BitVec 64))

(declare-fun lt!56411 () (_ BitVec 64))

(declare-fun lt!56412 () (_ BitVec 64))

(assert (=> d!11082 (= res!31755 (= lt!56411 (bvsub lt!56412 lt!56408)))))

(assert (=> d!11082 (or (= (bvand lt!56412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56412 lt!56408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11082 (= lt!56408 (remainingBits!0 ((_ sign_extend 32) (size!865 (buf!1193 thiss!1379))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379))))))

(declare-fun lt!56409 () (_ BitVec 64))

(declare-fun lt!56410 () (_ BitVec 64))

(assert (=> d!11082 (= lt!56412 (bvmul lt!56409 lt!56410))))

(assert (=> d!11082 (or (= lt!56409 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!56410 (bvsdiv (bvmul lt!56409 lt!56410) lt!56409)))))

(assert (=> d!11082 (= lt!56410 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11082 (= lt!56409 ((_ sign_extend 32) (size!865 (buf!1193 thiss!1379))))))

(assert (=> d!11082 (= lt!56411 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2593 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2588 thiss!1379))))))

(assert (=> d!11082 (invariant!0 (currentBit!2588 thiss!1379) (currentByte!2593 thiss!1379) (size!865 (buf!1193 thiss!1379)))))

(assert (=> d!11082 (= (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)) lt!56411)))

(declare-fun b!37350 () Bool)

(declare-fun res!31754 () Bool)

(assert (=> b!37350 (=> (not res!31754) (not e!24583))))

(assert (=> b!37350 (= res!31754 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56411))))

(declare-fun b!37351 () Bool)

(declare-fun lt!56413 () (_ BitVec 64))

(assert (=> b!37351 (= e!24583 (bvsle lt!56411 (bvmul lt!56413 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!37351 (or (= lt!56413 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!56413 #b0000000000000000000000000000000000000000000000000000000000001000) lt!56413)))))

(assert (=> b!37351 (= lt!56413 ((_ sign_extend 32) (size!865 (buf!1193 thiss!1379))))))

(assert (= (and d!11082 res!31755) b!37350))

(assert (= (and b!37350 res!31754) b!37351))

(declare-fun m!56619 () Bool)

(assert (=> d!11082 m!56619))

(declare-fun m!56621 () Bool)

(assert (=> d!11082 m!56621))

(assert (=> b!37132 d!11082))

(declare-fun d!11086 () Bool)

(assert (=> d!11086 (= (bitAt!0 (buf!1193 (_1!1904 lt!56051)) lt!56047) (not (= (bvand ((_ sign_extend 24) (select (arr!1355 (buf!1193 (_1!1904 lt!56051))) ((_ extract 31 0) (bvsdiv lt!56047 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56047 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2964 () Bool)

(assert (= bs!2964 d!11086))

(declare-fun m!56623 () Bool)

(assert (=> bs!2964 m!56623))

(assert (=> bs!2964 m!56609))

(assert (=> b!37111 d!11086))

(declare-fun d!11088 () Bool)

(assert (=> d!11088 (= (bitAt!0 (buf!1193 (_1!1904 lt!56045)) lt!56047) (not (= (bvand ((_ sign_extend 24) (select (arr!1355 (buf!1193 (_1!1904 lt!56045))) ((_ extract 31 0) (bvsdiv lt!56047 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!56047 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2965 () Bool)

(assert (= bs!2965 d!11088))

(declare-fun m!56625 () Bool)

(assert (=> bs!2965 m!56625))

(assert (=> bs!2965 m!56609))

(assert (=> b!37111 d!11088))

(declare-fun d!11090 () Bool)

(assert (=> d!11090 (= (array_inv!799 (buf!1193 thiss!1379)) (bvsge (size!865 (buf!1193 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!37122 d!11090))

(declare-fun d!11094 () Bool)

(assert (=> d!11094 (= (head!284 lt!56059) (h!562 lt!56059))))

(assert (=> b!37120 d!11094))

(declare-fun d!11096 () Bool)

(assert (=> d!11096 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1355 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2966 () Bool)

(assert (= bs!2966 d!11096))

(assert (=> bs!2966 m!56237))

(assert (=> bs!2966 m!56525))

(assert (=> b!37120 d!11096))

(declare-fun d!11098 () Bool)

(assert (=> d!11098 (= (invariant!0 (currentBit!2588 (_2!1905 lt!56050)) (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56062)))) (and (bvsge (currentBit!2588 (_2!1905 lt!56050)) #b00000000000000000000000000000000) (bvslt (currentBit!2588 (_2!1905 lt!56050)) #b00000000000000000000000000001000) (bvsge (currentByte!2593 (_2!1905 lt!56050)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56062)))) (and (= (currentBit!2588 (_2!1905 lt!56050)) #b00000000000000000000000000000000) (= (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56062))))))))))

(assert (=> b!37131 d!11098))

(declare-fun d!11100 () Bool)

(assert (=> d!11100 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56414 () Unit!2705)

(assert (=> d!11100 (= lt!56414 (choose!9 thiss!1379 (buf!1193 (_2!1905 lt!56050)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1493 (buf!1193 (_2!1905 lt!56050)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379))))))

(assert (=> d!11100 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1193 (_2!1905 lt!56050)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!56414)))

(declare-fun bs!2967 () Bool)

(assert (= bs!2967 d!11100))

(assert (=> bs!2967 m!56279))

(declare-fun m!56627 () Bool)

(assert (=> bs!2967 m!56627))

(assert (=> b!37113 d!11100))

(declare-fun b!37352 () Bool)

(declare-fun e!24585 () Unit!2705)

(declare-fun Unit!2723 () Unit!2705)

(assert (=> b!37352 (= e!24585 Unit!2723)))

(declare-fun d!11102 () Bool)

(declare-fun e!24584 () Bool)

(assert (=> d!11102 e!24584))

(declare-fun res!31757 () Bool)

(assert (=> d!11102 (=> (not res!31757) (not e!24584))))

(declare-fun lt!56426 () tuple2!3634)

(assert (=> d!11102 (= res!31757 (isPrefixOf!0 (_1!1904 lt!56426) (_2!1904 lt!56426)))))

(declare-fun lt!56429 () BitStream!1492)

(assert (=> d!11102 (= lt!56426 (tuple2!3635 lt!56429 (_2!1905 lt!56050)))))

(declare-fun lt!56425 () Unit!2705)

(declare-fun lt!56415 () Unit!2705)

(assert (=> d!11102 (= lt!56425 lt!56415)))

(assert (=> d!11102 (isPrefixOf!0 lt!56429 (_2!1905 lt!56050))))

(assert (=> d!11102 (= lt!56415 (lemmaIsPrefixTransitive!0 lt!56429 (_2!1905 lt!56050) (_2!1905 lt!56050)))))

(declare-fun lt!56422 () Unit!2705)

(declare-fun lt!56432 () Unit!2705)

(assert (=> d!11102 (= lt!56422 lt!56432)))

(assert (=> d!11102 (isPrefixOf!0 lt!56429 (_2!1905 lt!56050))))

(assert (=> d!11102 (= lt!56432 (lemmaIsPrefixTransitive!0 lt!56429 thiss!1379 (_2!1905 lt!56050)))))

(declare-fun lt!56428 () Unit!2705)

(assert (=> d!11102 (= lt!56428 e!24585)))

(declare-fun c!2572 () Bool)

(assert (=> d!11102 (= c!2572 (not (= (size!865 (buf!1193 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!56427 () Unit!2705)

(declare-fun lt!56424 () Unit!2705)

(assert (=> d!11102 (= lt!56427 lt!56424)))

(assert (=> d!11102 (isPrefixOf!0 (_2!1905 lt!56050) (_2!1905 lt!56050))))

(assert (=> d!11102 (= lt!56424 (lemmaIsPrefixRefl!0 (_2!1905 lt!56050)))))

(declare-fun lt!56420 () Unit!2705)

(declare-fun lt!56421 () Unit!2705)

(assert (=> d!11102 (= lt!56420 lt!56421)))

(assert (=> d!11102 (= lt!56421 (lemmaIsPrefixRefl!0 (_2!1905 lt!56050)))))

(declare-fun lt!56416 () Unit!2705)

(declare-fun lt!56423 () Unit!2705)

(assert (=> d!11102 (= lt!56416 lt!56423)))

(assert (=> d!11102 (isPrefixOf!0 lt!56429 lt!56429)))

(assert (=> d!11102 (= lt!56423 (lemmaIsPrefixRefl!0 lt!56429))))

(declare-fun lt!56430 () Unit!2705)

(declare-fun lt!56433 () Unit!2705)

(assert (=> d!11102 (= lt!56430 lt!56433)))

(assert (=> d!11102 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11102 (= lt!56433 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11102 (= lt!56429 (BitStream!1493 (buf!1193 (_2!1905 lt!56050)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)))))

(assert (=> d!11102 (isPrefixOf!0 thiss!1379 (_2!1905 lt!56050))))

(assert (=> d!11102 (= (reader!0 thiss!1379 (_2!1905 lt!56050)) lt!56426)))

(declare-fun b!37353 () Bool)

(declare-fun res!31758 () Bool)

(assert (=> b!37353 (=> (not res!31758) (not e!24584))))

(assert (=> b!37353 (= res!31758 (isPrefixOf!0 (_1!1904 lt!56426) thiss!1379))))

(declare-fun b!37354 () Bool)

(declare-fun lt!56417 () Unit!2705)

(assert (=> b!37354 (= e!24585 lt!56417)))

(declare-fun lt!56434 () (_ BitVec 64))

(assert (=> b!37354 (= lt!56434 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!56419 () (_ BitVec 64))

(assert (=> b!37354 (= lt!56419 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)))))

(assert (=> b!37354 (= lt!56417 (arrayBitRangesEqSymmetric!0 (buf!1193 thiss!1379) (buf!1193 (_2!1905 lt!56050)) lt!56434 lt!56419))))

(assert (=> b!37354 (arrayBitRangesEq!0 (buf!1193 (_2!1905 lt!56050)) (buf!1193 thiss!1379) lt!56434 lt!56419)))

(declare-fun b!37355 () Bool)

(declare-fun res!31756 () Bool)

(assert (=> b!37355 (=> (not res!31756) (not e!24584))))

(assert (=> b!37355 (= res!31756 (isPrefixOf!0 (_2!1904 lt!56426) (_2!1905 lt!56050)))))

(declare-fun lt!56431 () (_ BitVec 64))

(declare-fun lt!56418 () (_ BitVec 64))

(declare-fun b!37356 () Bool)

(assert (=> b!37356 (= e!24584 (= (_1!1904 lt!56426) (withMovedBitIndex!0 (_2!1904 lt!56426) (bvsub lt!56418 lt!56431))))))

(assert (=> b!37356 (or (= (bvand lt!56418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56431 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56418 lt!56431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37356 (= lt!56431 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))))))

(assert (=> b!37356 (= lt!56418 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)))))

(assert (= (and d!11102 c!2572) b!37354))

(assert (= (and d!11102 (not c!2572)) b!37352))

(assert (= (and d!11102 res!31757) b!37353))

(assert (= (and b!37353 res!31758) b!37355))

(assert (= (and b!37355 res!31756) b!37356))

(assert (=> d!11102 m!56591))

(assert (=> d!11102 m!56581))

(declare-fun m!56629 () Bool)

(assert (=> d!11102 m!56629))

(declare-fun m!56631 () Bool)

(assert (=> d!11102 m!56631))

(assert (=> d!11102 m!56241))

(assert (=> d!11102 m!56263))

(declare-fun m!56633 () Bool)

(assert (=> d!11102 m!56633))

(declare-fun m!56635 () Bool)

(assert (=> d!11102 m!56635))

(declare-fun m!56637 () Bool)

(assert (=> d!11102 m!56637))

(declare-fun m!56639 () Bool)

(assert (=> d!11102 m!56639))

(assert (=> d!11102 m!56261))

(declare-fun m!56641 () Bool)

(assert (=> b!37353 m!56641))

(declare-fun m!56643 () Bool)

(assert (=> b!37355 m!56643))

(assert (=> b!37354 m!56265))

(declare-fun m!56645 () Bool)

(assert (=> b!37354 m!56645))

(declare-fun m!56647 () Bool)

(assert (=> b!37354 m!56647))

(declare-fun m!56649 () Bool)

(assert (=> b!37356 m!56649))

(assert (=> b!37356 m!56267))

(assert (=> b!37356 m!56265))

(assert (=> b!37113 d!11102))

(declare-fun d!11104 () Bool)

(declare-fun res!31761 () Bool)

(declare-fun e!24587 () Bool)

(assert (=> d!11104 (=> (not res!31761) (not e!24587))))

(assert (=> d!11104 (= res!31761 (= (size!865 (buf!1193 thiss!1379)) (size!865 (buf!1193 (_2!1905 lt!56062)))))))

(assert (=> d!11104 (= (isPrefixOf!0 thiss!1379 (_2!1905 lt!56062)) e!24587)))

(declare-fun b!37357 () Bool)

(declare-fun res!31760 () Bool)

(assert (=> b!37357 (=> (not res!31760) (not e!24587))))

(assert (=> b!37357 (= res!31760 (bvsle (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)) (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56062))) (currentByte!2593 (_2!1905 lt!56062)) (currentBit!2588 (_2!1905 lt!56062)))))))

(declare-fun b!37358 () Bool)

(declare-fun e!24586 () Bool)

(assert (=> b!37358 (= e!24587 e!24586)))

(declare-fun res!31759 () Bool)

(assert (=> b!37358 (=> res!31759 e!24586)))

(assert (=> b!37358 (= res!31759 (= (size!865 (buf!1193 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!37359 () Bool)

(assert (=> b!37359 (= e!24586 (arrayBitRangesEq!0 (buf!1193 thiss!1379) (buf!1193 (_2!1905 lt!56062)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379))))))

(assert (= (and d!11104 res!31761) b!37357))

(assert (= (and b!37357 res!31760) b!37358))

(assert (= (and b!37358 (not res!31759)) b!37359))

(assert (=> b!37357 m!56265))

(assert (=> b!37357 m!56269))

(assert (=> b!37359 m!56265))

(assert (=> b!37359 m!56265))

(declare-fun m!56651 () Bool)

(assert (=> b!37359 m!56651))

(assert (=> b!37113 d!11104))

(declare-fun lt!56945 () tuple2!3636)

(declare-fun bm!466 () Bool)

(declare-fun c!2606 () Bool)

(declare-fun call!469 () tuple2!3634)

(assert (=> bm!466 (= call!469 (reader!0 (_2!1905 lt!56050) (ite c!2606 (_2!1905 lt!56945) (_2!1905 lt!56050))))))

(declare-fun b!37541 () Bool)

(declare-fun res!31880 () Bool)

(declare-fun e!24678 () Bool)

(assert (=> b!37541 (=> (not res!31880) (not e!24678))))

(declare-fun lt!56932 () tuple2!3636)

(assert (=> b!37541 (= res!31880 (= (size!865 (buf!1193 (_2!1905 lt!56932))) (size!865 (buf!1193 (_2!1905 lt!56050)))))))

(declare-fun b!37542 () Bool)

(declare-fun res!31878 () Bool)

(assert (=> b!37542 (=> (not res!31878) (not e!24678))))

(assert (=> b!37542 (= res!31878 (invariant!0 (currentBit!2588 (_2!1905 lt!56932)) (currentByte!2593 (_2!1905 lt!56932)) (size!865 (buf!1193 (_2!1905 lt!56932)))))))

(declare-fun b!37543 () Bool)

(declare-fun lt!56938 () tuple2!3634)

(assert (=> b!37543 (= e!24678 (= (bitStreamReadBitsIntoList!0 (_2!1905 lt!56932) (_1!1904 lt!56938) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1905 lt!56932) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!37543 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37543 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!56905 () Unit!2705)

(declare-fun lt!56906 () Unit!2705)

(assert (=> b!37543 (= lt!56905 lt!56906)))

(declare-fun lt!56919 () (_ BitVec 64))

(assert (=> b!37543 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56932)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56919)))

(assert (=> b!37543 (= lt!56906 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1905 lt!56050) (buf!1193 (_2!1905 lt!56932)) lt!56919))))

(declare-fun e!24680 () Bool)

(assert (=> b!37543 e!24680))

(declare-fun res!31879 () Bool)

(assert (=> b!37543 (=> (not res!31879) (not e!24680))))

(assert (=> b!37543 (= res!31879 (and (= (size!865 (buf!1193 (_2!1905 lt!56050))) (size!865 (buf!1193 (_2!1905 lt!56932)))) (bvsge lt!56919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37543 (= lt!56919 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!37543 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37543 (= lt!56938 (reader!0 (_2!1905 lt!56050) (_2!1905 lt!56932)))))

(declare-fun d!11106 () Bool)

(assert (=> d!11106 e!24678))

(declare-fun res!31877 () Bool)

(assert (=> d!11106 (=> (not res!31877) (not e!24678))))

(declare-fun lt!56937 () (_ BitVec 64))

(assert (=> d!11106 (= res!31877 (= (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56932))) (currentByte!2593 (_2!1905 lt!56932)) (currentBit!2588 (_2!1905 lt!56932))) (bvsub lt!56937 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11106 (or (= (bvand lt!56937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56937 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!56929 () (_ BitVec 64))

(assert (=> d!11106 (= lt!56937 (bvadd lt!56929 to!314))))

(assert (=> d!11106 (or (not (= (bvand lt!56929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!56929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!56929 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11106 (= lt!56929 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))))))

(declare-fun e!24679 () tuple2!3636)

(assert (=> d!11106 (= lt!56932 e!24679)))

(assert (=> d!11106 (= c!2606 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!56920 () Unit!2705)

(declare-fun lt!56928 () Unit!2705)

(assert (=> d!11106 (= lt!56920 lt!56928)))

(assert (=> d!11106 (isPrefixOf!0 (_2!1905 lt!56050) (_2!1905 lt!56050))))

(assert (=> d!11106 (= lt!56928 (lemmaIsPrefixRefl!0 (_2!1905 lt!56050)))))

(declare-fun lt!56911 () (_ BitVec 64))

(assert (=> d!11106 (= lt!56911 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))))))

(assert (=> d!11106 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11106 (= (appendBitsMSBFirstLoop!0 (_2!1905 lt!56050) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!56932)))

(declare-fun b!37544 () Bool)

(declare-fun lt!56926 () tuple2!3636)

(declare-fun Unit!2724 () Unit!2705)

(assert (=> b!37544 (= e!24679 (tuple2!3637 Unit!2724 (_2!1905 lt!56926)))))

(assert (=> b!37544 (= lt!56945 (appendBitFromByte!0 (_2!1905 lt!56050) (select (arr!1355 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!56922 () (_ BitVec 64))

(assert (=> b!37544 (= lt!56922 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!56936 () (_ BitVec 64))

(assert (=> b!37544 (= lt!56936 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56930 () Unit!2705)

(assert (=> b!37544 (= lt!56930 (validateOffsetBitsIneqLemma!0 (_2!1905 lt!56050) (_2!1905 lt!56945) lt!56922 lt!56936))))

(assert (=> b!37544 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56945)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56945))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56945))) (bvsub lt!56922 lt!56936))))

(declare-fun lt!56925 () Unit!2705)

(assert (=> b!37544 (= lt!56925 lt!56930)))

(declare-fun lt!56942 () tuple2!3634)

(assert (=> b!37544 (= lt!56942 call!469)))

(declare-fun lt!56923 () (_ BitVec 64))

(assert (=> b!37544 (= lt!56923 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!56934 () Unit!2705)

(assert (=> b!37544 (= lt!56934 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1905 lt!56050) (buf!1193 (_2!1905 lt!56945)) lt!56923))))

(assert (=> b!37544 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56945)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56923)))

(declare-fun lt!56910 () Unit!2705)

(assert (=> b!37544 (= lt!56910 lt!56934)))

(assert (=> b!37544 (= (head!284 (byteArrayBitContentToList!0 (_2!1905 lt!56945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!284 (bitStreamReadBitsIntoList!0 (_2!1905 lt!56945) (_1!1904 lt!56942) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!56916 () Unit!2705)

(declare-fun Unit!2725 () Unit!2705)

(assert (=> b!37544 (= lt!56916 Unit!2725)))

(assert (=> b!37544 (= lt!56926 (appendBitsMSBFirstLoop!0 (_2!1905 lt!56945) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!56913 () Unit!2705)

(assert (=> b!37544 (= lt!56913 (lemmaIsPrefixTransitive!0 (_2!1905 lt!56050) (_2!1905 lt!56945) (_2!1905 lt!56926)))))

(assert (=> b!37544 (isPrefixOf!0 (_2!1905 lt!56050) (_2!1905 lt!56926))))

(declare-fun lt!56931 () Unit!2705)

(assert (=> b!37544 (= lt!56931 lt!56913)))

(assert (=> b!37544 (= (size!865 (buf!1193 (_2!1905 lt!56926))) (size!865 (buf!1193 (_2!1905 lt!56050))))))

(declare-fun lt!56940 () Unit!2705)

(declare-fun Unit!2726 () Unit!2705)

(assert (=> b!37544 (= lt!56940 Unit!2726)))

(assert (=> b!37544 (= (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56926))) (currentByte!2593 (_2!1905 lt!56926)) (currentBit!2588 (_2!1905 lt!56926))) (bvsub (bvadd (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!56917 () Unit!2705)

(declare-fun Unit!2727 () Unit!2705)

(assert (=> b!37544 (= lt!56917 Unit!2727)))

(assert (=> b!37544 (= (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56926))) (currentByte!2593 (_2!1905 lt!56926)) (currentBit!2588 (_2!1905 lt!56926))) (bvsub (bvsub (bvadd (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56945))) (currentByte!2593 (_2!1905 lt!56945)) (currentBit!2588 (_2!1905 lt!56945))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56915 () Unit!2705)

(declare-fun Unit!2728 () Unit!2705)

(assert (=> b!37544 (= lt!56915 Unit!2728)))

(declare-fun lt!56921 () tuple2!3634)

(assert (=> b!37544 (= lt!56921 (reader!0 (_2!1905 lt!56050) (_2!1905 lt!56926)))))

(declare-fun lt!56927 () (_ BitVec 64))

(assert (=> b!37544 (= lt!56927 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!56943 () Unit!2705)

(assert (=> b!37544 (= lt!56943 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1905 lt!56050) (buf!1193 (_2!1905 lt!56926)) lt!56927))))

(assert (=> b!37544 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56926)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56927)))

(declare-fun lt!56933 () Unit!2705)

(assert (=> b!37544 (= lt!56933 lt!56943)))

(declare-fun lt!56941 () tuple2!3634)

(assert (=> b!37544 (= lt!56941 (reader!0 (_2!1905 lt!56945) (_2!1905 lt!56926)))))

(declare-fun lt!56944 () (_ BitVec 64))

(assert (=> b!37544 (= lt!56944 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!56947 () Unit!2705)

(assert (=> b!37544 (= lt!56947 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1905 lt!56945) (buf!1193 (_2!1905 lt!56926)) lt!56944))))

(assert (=> b!37544 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56926)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56945))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56945))) lt!56944)))

(declare-fun lt!56907 () Unit!2705)

(assert (=> b!37544 (= lt!56907 lt!56947)))

(declare-fun lt!56908 () List!447)

(assert (=> b!37544 (= lt!56908 (byteArrayBitContentToList!0 (_2!1905 lt!56926) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!56935 () List!447)

(assert (=> b!37544 (= lt!56935 (byteArrayBitContentToList!0 (_2!1905 lt!56926) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!56946 () List!447)

(assert (=> b!37544 (= lt!56946 (bitStreamReadBitsIntoList!0 (_2!1905 lt!56926) (_1!1904 lt!56921) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!56918 () List!447)

(assert (=> b!37544 (= lt!56918 (bitStreamReadBitsIntoList!0 (_2!1905 lt!56926) (_1!1904 lt!56941) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!56909 () (_ BitVec 64))

(assert (=> b!37544 (= lt!56909 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!56914 () Unit!2705)

(assert (=> b!37544 (= lt!56914 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1905 lt!56926) (_2!1905 lt!56926) (_1!1904 lt!56921) (_1!1904 lt!56941) lt!56909 lt!56946))))

(assert (=> b!37544 (= (bitStreamReadBitsIntoList!0 (_2!1905 lt!56926) (_1!1904 lt!56941) (bvsub lt!56909 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!164 lt!56946))))

(declare-fun lt!56904 () Unit!2705)

(assert (=> b!37544 (= lt!56904 lt!56914)))

(declare-fun lt!56939 () Unit!2705)

(assert (=> b!37544 (= lt!56939 (arrayBitRangesEqImpliesEq!0 (buf!1193 (_2!1905 lt!56945)) (buf!1193 (_2!1905 lt!56926)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!56911 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56945))) (currentByte!2593 (_2!1905 lt!56945)) (currentBit!2588 (_2!1905 lt!56945)))))))

(assert (=> b!37544 (= (bitAt!0 (buf!1193 (_2!1905 lt!56945)) lt!56911) (bitAt!0 (buf!1193 (_2!1905 lt!56926)) lt!56911))))

(declare-fun lt!56912 () Unit!2705)

(assert (=> b!37544 (= lt!56912 lt!56939)))

(declare-fun b!37545 () Bool)

(declare-fun Unit!2729 () Unit!2705)

(assert (=> b!37545 (= e!24679 (tuple2!3637 Unit!2729 (_2!1905 lt!56050)))))

(assert (=> b!37545 (= (size!865 (buf!1193 (_2!1905 lt!56050))) (size!865 (buf!1193 (_2!1905 lt!56050))))))

(declare-fun lt!56924 () Unit!2705)

(declare-fun Unit!2730 () Unit!2705)

(assert (=> b!37545 (= lt!56924 Unit!2730)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1492 array!1931 array!1931 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3662 0))(
  ( (tuple2!3663 (_1!1918 array!1931) (_2!1918 BitStream!1492)) )
))
(declare-fun readBits!0 (BitStream!1492 (_ BitVec 64)) tuple2!3662)

(assert (=> b!37545 (checkByteArrayBitContent!0 (_2!1905 lt!56050) srcBuffer!2 (_1!1918 (readBits!0 (_1!1904 call!469) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!37546 () Bool)

(declare-fun res!31876 () Bool)

(assert (=> b!37546 (=> (not res!31876) (not e!24678))))

(assert (=> b!37546 (= res!31876 (isPrefixOf!0 (_2!1905 lt!56050) (_2!1905 lt!56932)))))

(declare-fun b!37547 () Bool)

(declare-fun res!31881 () Bool)

(assert (=> b!37547 (=> (not res!31881) (not e!24678))))

(assert (=> b!37547 (= res!31881 (= (size!865 (buf!1193 (_2!1905 lt!56050))) (size!865 (buf!1193 (_2!1905 lt!56932)))))))

(declare-fun b!37548 () Bool)

(assert (=> b!37548 (= e!24680 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56919))))

(assert (= (and d!11106 c!2606) b!37544))

(assert (= (and d!11106 (not c!2606)) b!37545))

(assert (= (or b!37544 b!37545) bm!466))

(assert (= (and d!11106 res!31877) b!37542))

(assert (= (and b!37542 res!31878) b!37547))

(assert (= (and b!37547 res!31881) b!37546))

(assert (= (and b!37546 res!31876) b!37541))

(assert (= (and b!37541 res!31880) b!37543))

(assert (= (and b!37543 res!31879) b!37548))

(declare-fun m!56959 () Bool)

(assert (=> b!37544 m!56959))

(declare-fun m!56961 () Bool)

(assert (=> b!37544 m!56961))

(declare-fun m!56963 () Bool)

(assert (=> b!37544 m!56963))

(declare-fun m!56965 () Bool)

(assert (=> b!37544 m!56965))

(declare-fun m!56967 () Bool)

(assert (=> b!37544 m!56967))

(declare-fun m!56969 () Bool)

(assert (=> b!37544 m!56969))

(declare-fun m!56971 () Bool)

(assert (=> b!37544 m!56971))

(declare-fun m!56973 () Bool)

(assert (=> b!37544 m!56973))

(declare-fun m!56975 () Bool)

(assert (=> b!37544 m!56975))

(declare-fun m!56977 () Bool)

(assert (=> b!37544 m!56977))

(declare-fun m!56979 () Bool)

(assert (=> b!37544 m!56979))

(declare-fun m!56981 () Bool)

(assert (=> b!37544 m!56981))

(declare-fun m!56983 () Bool)

(assert (=> b!37544 m!56983))

(declare-fun m!56985 () Bool)

(assert (=> b!37544 m!56985))

(declare-fun m!56987 () Bool)

(assert (=> b!37544 m!56987))

(declare-fun m!56989 () Bool)

(assert (=> b!37544 m!56989))

(declare-fun m!56991 () Bool)

(assert (=> b!37544 m!56991))

(assert (=> b!37544 m!56979))

(declare-fun m!56993 () Bool)

(assert (=> b!37544 m!56993))

(declare-fun m!56995 () Bool)

(assert (=> b!37544 m!56995))

(assert (=> b!37544 m!56267))

(declare-fun m!56997 () Bool)

(assert (=> b!37544 m!56997))

(declare-fun m!56999 () Bool)

(assert (=> b!37544 m!56999))

(assert (=> b!37544 m!56975))

(declare-fun m!57001 () Bool)

(assert (=> b!37544 m!57001))

(declare-fun m!57003 () Bool)

(assert (=> b!37544 m!57003))

(declare-fun m!57005 () Bool)

(assert (=> b!37544 m!57005))

(declare-fun m!57007 () Bool)

(assert (=> b!37544 m!57007))

(declare-fun m!57009 () Bool)

(assert (=> b!37544 m!57009))

(declare-fun m!57011 () Bool)

(assert (=> b!37544 m!57011))

(assert (=> b!37544 m!56961))

(declare-fun m!57013 () Bool)

(assert (=> b!37544 m!57013))

(assert (=> b!37544 m!56981))

(declare-fun m!57015 () Bool)

(assert (=> b!37544 m!57015))

(declare-fun m!57017 () Bool)

(assert (=> b!37544 m!57017))

(declare-fun m!57019 () Bool)

(assert (=> b!37544 m!57019))

(declare-fun m!57021 () Bool)

(assert (=> b!37548 m!57021))

(declare-fun m!57023 () Bool)

(assert (=> d!11106 m!57023))

(assert (=> d!11106 m!56267))

(assert (=> d!11106 m!56591))

(assert (=> d!11106 m!56581))

(declare-fun m!57025 () Bool)

(assert (=> b!37542 m!57025))

(declare-fun m!57027 () Bool)

(assert (=> b!37546 m!57027))

(declare-fun m!57029 () Bool)

(assert (=> bm!466 m!57029))

(declare-fun m!57031 () Bool)

(assert (=> b!37545 m!57031))

(declare-fun m!57033 () Bool)

(assert (=> b!37545 m!57033))

(declare-fun m!57035 () Bool)

(assert (=> b!37543 m!57035))

(declare-fun m!57037 () Bool)

(assert (=> b!37543 m!57037))

(declare-fun m!57039 () Bool)

(assert (=> b!37543 m!57039))

(declare-fun m!57041 () Bool)

(assert (=> b!37543 m!57041))

(declare-fun m!57043 () Bool)

(assert (=> b!37543 m!57043))

(assert (=> b!37113 d!11106))

(declare-fun d!11240 () Bool)

(assert (=> d!11240 (isPrefixOf!0 thiss!1379 (_2!1905 lt!56062))))

(declare-fun lt!56950 () Unit!2705)

(declare-fun choose!30 (BitStream!1492 BitStream!1492 BitStream!1492) Unit!2705)

(assert (=> d!11240 (= lt!56950 (choose!30 thiss!1379 (_2!1905 lt!56050) (_2!1905 lt!56062)))))

(assert (=> d!11240 (isPrefixOf!0 thiss!1379 (_2!1905 lt!56050))))

(assert (=> d!11240 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1905 lt!56050) (_2!1905 lt!56062)) lt!56950)))

(declare-fun bs!2997 () Bool)

(assert (= bs!2997 d!11240))

(assert (=> bs!2997 m!56287))

(declare-fun m!57045 () Bool)

(assert (=> bs!2997 m!57045))

(assert (=> bs!2997 m!56241))

(assert (=> b!37113 d!11240))

(declare-fun d!11242 () Bool)

(assert (=> d!11242 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2998 () Bool)

(assert (= bs!2998 d!11242))

(declare-fun m!57047 () Bool)

(assert (=> bs!2998 m!57047))

(assert (=> b!37113 d!11242))

(declare-fun d!11244 () Bool)

(declare-fun res!31884 () Bool)

(declare-fun e!24682 () Bool)

(assert (=> d!11244 (=> (not res!31884) (not e!24682))))

(assert (=> d!11244 (= res!31884 (= (size!865 (buf!1193 (_2!1905 lt!56050))) (size!865 (buf!1193 (_2!1905 lt!56062)))))))

(assert (=> d!11244 (= (isPrefixOf!0 (_2!1905 lt!56050) (_2!1905 lt!56062)) e!24682)))

(declare-fun b!37549 () Bool)

(declare-fun res!31883 () Bool)

(assert (=> b!37549 (=> (not res!31883) (not e!24682))))

(assert (=> b!37549 (= res!31883 (bvsle (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))) (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56062))) (currentByte!2593 (_2!1905 lt!56062)) (currentBit!2588 (_2!1905 lt!56062)))))))

(declare-fun b!37550 () Bool)

(declare-fun e!24681 () Bool)

(assert (=> b!37550 (= e!24682 e!24681)))

(declare-fun res!31882 () Bool)

(assert (=> b!37550 (=> res!31882 e!24681)))

(assert (=> b!37550 (= res!31882 (= (size!865 (buf!1193 (_2!1905 lt!56050))) #b00000000000000000000000000000000))))

(declare-fun b!37551 () Bool)

(assert (=> b!37551 (= e!24681 (arrayBitRangesEq!0 (buf!1193 (_2!1905 lt!56050)) (buf!1193 (_2!1905 lt!56062)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050)))))))

(assert (= (and d!11244 res!31884) b!37549))

(assert (= (and b!37549 res!31883) b!37550))

(assert (= (and b!37550 (not res!31882)) b!37551))

(assert (=> b!37549 m!56267))

(assert (=> b!37549 m!56269))

(assert (=> b!37551 m!56267))

(assert (=> b!37551 m!56267))

(declare-fun m!57049 () Bool)

(assert (=> b!37551 m!57049))

(assert (=> b!37113 d!11244))

(declare-fun d!11246 () Bool)

(assert (=> d!11246 (= (head!284 (byteArrayBitContentToList!0 (_2!1905 lt!56050) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!562 (byteArrayBitContentToList!0 (_2!1905 lt!56050) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37124 d!11246))

(declare-fun d!11248 () Bool)

(declare-fun c!2607 () Bool)

(assert (=> d!11248 (= c!2607 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24683 () List!447)

(assert (=> d!11248 (= (byteArrayBitContentToList!0 (_2!1905 lt!56050) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!24683)))

(declare-fun b!37552 () Bool)

(assert (=> b!37552 (= e!24683 Nil!444)))

(declare-fun b!37553 () Bool)

(assert (=> b!37553 (= e!24683 (Cons!443 (not (= (bvand ((_ sign_extend 24) (select (arr!1355 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1905 lt!56050) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11248 c!2607) b!37552))

(assert (= (and d!11248 (not c!2607)) b!37553))

(assert (=> b!37553 m!56237))

(assert (=> b!37553 m!56525))

(declare-fun m!57051 () Bool)

(assert (=> b!37553 m!57051))

(assert (=> b!37124 d!11248))

(declare-fun d!11250 () Bool)

(assert (=> d!11250 (= (head!284 (bitStreamReadBitsIntoList!0 (_2!1905 lt!56050) (_1!1904 lt!56065) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!562 (bitStreamReadBitsIntoList!0 (_2!1905 lt!56050) (_1!1904 lt!56065) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!37124 d!11250))

(declare-fun b!37554 () Bool)

(declare-fun e!24684 () tuple2!3658)

(assert (=> b!37554 (= e!24684 (tuple2!3659 Nil!444 (_1!1904 lt!56065)))))

(declare-fun b!37557 () Bool)

(declare-fun e!24685 () Bool)

(declare-fun lt!56951 () List!447)

(assert (=> b!37557 (= e!24685 (> (length!173 lt!56951) 0))))

(declare-fun b!37555 () Bool)

(declare-fun lt!56953 () (_ BitVec 64))

(declare-fun lt!56952 () tuple2!3660)

(assert (=> b!37555 (= e!24684 (tuple2!3659 (Cons!443 (_1!1917 lt!56952) (bitStreamReadBitsIntoList!0 (_2!1905 lt!56050) (_2!1917 lt!56952) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!56953))) (_2!1917 lt!56952)))))

(assert (=> b!37555 (= lt!56952 (readBit!0 (_1!1904 lt!56065)))))

(assert (=> b!37555 (= lt!56953 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!37556 () Bool)

(assert (=> b!37556 (= e!24685 (isEmpty!106 lt!56951))))

(declare-fun d!11252 () Bool)

(assert (=> d!11252 e!24685))

(declare-fun c!2609 () Bool)

(assert (=> d!11252 (= c!2609 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11252 (= lt!56951 (_1!1916 e!24684))))

(declare-fun c!2608 () Bool)

(assert (=> d!11252 (= c!2608 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11252 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11252 (= (bitStreamReadBitsIntoList!0 (_2!1905 lt!56050) (_1!1904 lt!56065) #b0000000000000000000000000000000000000000000000000000000000000001) lt!56951)))

(assert (= (and d!11252 c!2608) b!37554))

(assert (= (and d!11252 (not c!2608)) b!37555))

(assert (= (and d!11252 c!2609) b!37556))

(assert (= (and d!11252 (not c!2609)) b!37557))

(declare-fun m!57053 () Bool)

(assert (=> b!37557 m!57053))

(declare-fun m!57055 () Bool)

(assert (=> b!37555 m!57055))

(declare-fun m!57057 () Bool)

(assert (=> b!37555 m!57057))

(declare-fun m!57059 () Bool)

(assert (=> b!37556 m!57059))

(assert (=> b!37124 d!11252))

(declare-fun d!11254 () Bool)

(declare-fun e!24686 () Bool)

(assert (=> d!11254 e!24686))

(declare-fun res!31886 () Bool)

(assert (=> d!11254 (=> (not res!31886) (not e!24686))))

(declare-fun lt!56957 () (_ BitVec 64))

(declare-fun lt!56958 () (_ BitVec 64))

(declare-fun lt!56954 () (_ BitVec 64))

(assert (=> d!11254 (= res!31886 (= lt!56957 (bvsub lt!56958 lt!56954)))))

(assert (=> d!11254 (or (= (bvand lt!56958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56954 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56958 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56958 lt!56954) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11254 (= lt!56954 (remainingBits!0 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56062))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56062)))))))

(declare-fun lt!56955 () (_ BitVec 64))

(declare-fun lt!56956 () (_ BitVec 64))

(assert (=> d!11254 (= lt!56958 (bvmul lt!56955 lt!56956))))

(assert (=> d!11254 (or (= lt!56955 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!56956 (bvsdiv (bvmul lt!56955 lt!56956) lt!56955)))))

(assert (=> d!11254 (= lt!56956 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11254 (= lt!56955 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))))))

(assert (=> d!11254 (= lt!56957 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56062))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56062)))))))

(assert (=> d!11254 (invariant!0 (currentBit!2588 (_2!1905 lt!56062)) (currentByte!2593 (_2!1905 lt!56062)) (size!865 (buf!1193 (_2!1905 lt!56062))))))

(assert (=> d!11254 (= (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56062))) (currentByte!2593 (_2!1905 lt!56062)) (currentBit!2588 (_2!1905 lt!56062))) lt!56957)))

(declare-fun b!37558 () Bool)

(declare-fun res!31885 () Bool)

(assert (=> b!37558 (=> (not res!31885) (not e!24686))))

(assert (=> b!37558 (= res!31885 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56957))))

(declare-fun b!37559 () Bool)

(declare-fun lt!56959 () (_ BitVec 64))

(assert (=> b!37559 (= e!24686 (bvsle lt!56957 (bvmul lt!56959 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!37559 (or (= lt!56959 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!56959 #b0000000000000000000000000000000000000000000000000000000000001000) lt!56959)))))

(assert (=> b!37559 (= lt!56959 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56062)))))))

(assert (= (and d!11254 res!31886) b!37558))

(assert (= (and b!37558 res!31885) b!37559))

(declare-fun m!57061 () Bool)

(assert (=> d!11254 m!57061))

(assert (=> d!11254 m!56289))

(assert (=> b!37114 d!11254))

(declare-fun d!11256 () Bool)

(declare-fun e!24687 () Bool)

(assert (=> d!11256 e!24687))

(declare-fun res!31888 () Bool)

(assert (=> d!11256 (=> (not res!31888) (not e!24687))))

(declare-fun lt!56963 () (_ BitVec 64))

(declare-fun lt!56964 () (_ BitVec 64))

(declare-fun lt!56960 () (_ BitVec 64))

(assert (=> d!11256 (= res!31888 (= lt!56963 (bvsub lt!56964 lt!56960)))))

(assert (=> d!11256 (or (= (bvand lt!56964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!56960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!56964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!56964 lt!56960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11256 (= lt!56960 (remainingBits!0 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050)))))))

(declare-fun lt!56961 () (_ BitVec 64))

(declare-fun lt!56962 () (_ BitVec 64))

(assert (=> d!11256 (= lt!56964 (bvmul lt!56961 lt!56962))))

(assert (=> d!11256 (or (= lt!56961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!56962 (bvsdiv (bvmul lt!56961 lt!56962) lt!56961)))))

(assert (=> d!11256 (= lt!56962 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11256 (= lt!56961 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))))))

(assert (=> d!11256 (= lt!56963 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050)))))))

(assert (=> d!11256 (invariant!0 (currentBit!2588 (_2!1905 lt!56050)) (currentByte!2593 (_2!1905 lt!56050)) (size!865 (buf!1193 (_2!1905 lt!56050))))))

(assert (=> d!11256 (= (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050))) lt!56963)))

(declare-fun b!37560 () Bool)

(declare-fun res!31887 () Bool)

(assert (=> b!37560 (=> (not res!31887) (not e!24687))))

(assert (=> b!37560 (= res!31887 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!56963))))

(declare-fun b!37561 () Bool)

(declare-fun lt!56965 () (_ BitVec 64))

(assert (=> b!37561 (= e!24687 (bvsle lt!56963 (bvmul lt!56965 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!37561 (or (= lt!56965 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!56965 #b0000000000000000000000000000000000000000000000000000000000001000) lt!56965)))))

(assert (=> b!37561 (= lt!56965 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))))))

(assert (= (and d!11256 res!31888) b!37560))

(assert (= (and b!37560 res!31887) b!37561))

(declare-fun m!57063 () Bool)

(assert (=> d!11256 m!57063))

(assert (=> d!11256 m!56225))

(assert (=> b!37112 d!11256))

(declare-fun d!11258 () Bool)

(declare-fun size!870 (List!447) Int)

(assert (=> d!11258 (= (length!173 lt!56049) (size!870 lt!56049))))

(declare-fun bs!2999 () Bool)

(assert (= bs!2999 d!11258))

(declare-fun m!57065 () Bool)

(assert (=> bs!2999 m!57065))

(assert (=> b!37123 d!11258))

(declare-fun d!11260 () Bool)

(assert (=> d!11260 (= (invariant!0 (currentBit!2588 (_2!1905 lt!56062)) (currentByte!2593 (_2!1905 lt!56062)) (size!865 (buf!1193 (_2!1905 lt!56062)))) (and (bvsge (currentBit!2588 (_2!1905 lt!56062)) #b00000000000000000000000000000000) (bvslt (currentBit!2588 (_2!1905 lt!56062)) #b00000000000000000000000000001000) (bvsge (currentByte!2593 (_2!1905 lt!56062)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2593 (_2!1905 lt!56062)) (size!865 (buf!1193 (_2!1905 lt!56062)))) (and (= (currentBit!2588 (_2!1905 lt!56062)) #b00000000000000000000000000000000) (= (currentByte!2593 (_2!1905 lt!56062)) (size!865 (buf!1193 (_2!1905 lt!56062))))))))))

(assert (=> b!37125 d!11260))

(declare-fun d!11262 () Bool)

(assert (=> d!11262 (= (array_inv!799 srcBuffer!2) (bvsge (size!865 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7622 d!11262))

(declare-fun d!11264 () Bool)

(assert (=> d!11264 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2588 thiss!1379) (currentByte!2593 thiss!1379) (size!865 (buf!1193 thiss!1379))))))

(declare-fun bs!3000 () Bool)

(assert (= bs!3000 d!11264))

(assert (=> bs!3000 m!56621))

(assert (=> start!7622 d!11264))

(declare-fun d!11266 () Bool)

(assert (=> d!11266 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 thiss!1379))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!865 (buf!1193 thiss!1379))) ((_ sign_extend 32) (currentByte!2593 thiss!1379)) ((_ sign_extend 32) (currentBit!2588 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3001 () Bool)

(assert (= bs!3001 d!11266))

(assert (=> bs!3001 m!56619))

(assert (=> b!37115 d!11266))

(declare-fun d!11268 () Bool)

(declare-fun res!31891 () Bool)

(declare-fun e!24689 () Bool)

(assert (=> d!11268 (=> (not res!31891) (not e!24689))))

(assert (=> d!11268 (= res!31891 (= (size!865 (buf!1193 thiss!1379)) (size!865 (buf!1193 (_2!1905 lt!56050)))))))

(assert (=> d!11268 (= (isPrefixOf!0 thiss!1379 (_2!1905 lt!56050)) e!24689)))

(declare-fun b!37562 () Bool)

(declare-fun res!31890 () Bool)

(assert (=> b!37562 (=> (not res!31890) (not e!24689))))

(assert (=> b!37562 (= res!31890 (bvsle (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)) (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!56050))) (currentByte!2593 (_2!1905 lt!56050)) (currentBit!2588 (_2!1905 lt!56050)))))))

(declare-fun b!37563 () Bool)

(declare-fun e!24688 () Bool)

(assert (=> b!37563 (= e!24689 e!24688)))

(declare-fun res!31889 () Bool)

(assert (=> b!37563 (=> res!31889 e!24688)))

(assert (=> b!37563 (= res!31889 (= (size!865 (buf!1193 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!37564 () Bool)

(assert (=> b!37564 (= e!24688 (arrayBitRangesEq!0 (buf!1193 thiss!1379) (buf!1193 (_2!1905 lt!56050)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379))))))

(assert (= (and d!11268 res!31891) b!37562))

(assert (= (and b!37562 res!31890) b!37563))

(assert (= (and b!37563 (not res!31889)) b!37564))

(assert (=> b!37562 m!56265))

(assert (=> b!37562 m!56267))

(assert (=> b!37564 m!56265))

(assert (=> b!37564 m!56265))

(declare-fun m!57067 () Bool)

(assert (=> b!37564 m!57067))

(assert (=> b!37126 d!11268))

(declare-fun d!11270 () Bool)

(assert (=> d!11270 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) lt!56064) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050)))) lt!56064))))

(declare-fun bs!3002 () Bool)

(assert (= bs!3002 d!11270))

(assert (=> bs!3002 m!57063))

(assert (=> b!37126 d!11270))

(declare-fun d!11272 () Bool)

(declare-fun e!24692 () Bool)

(assert (=> d!11272 e!24692))

(declare-fun res!31894 () Bool)

(assert (=> d!11272 (=> (not res!31894) (not e!24692))))

(assert (=> d!11272 (= res!31894 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!56968 () Unit!2705)

(declare-fun choose!27 (BitStream!1492 BitStream!1492 (_ BitVec 64) (_ BitVec 64)) Unit!2705)

(assert (=> d!11272 (= lt!56968 (choose!27 thiss!1379 (_2!1905 lt!56050) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!11272 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!11272 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1905 lt!56050) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!56968)))

(declare-fun b!37567 () Bool)

(assert (=> b!37567 (= e!24692 (validate_offset_bits!1 ((_ sign_extend 32) (size!865 (buf!1193 (_2!1905 lt!56050)))) ((_ sign_extend 32) (currentByte!2593 (_2!1905 lt!56050))) ((_ sign_extend 32) (currentBit!2588 (_2!1905 lt!56050))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11272 res!31894) b!37567))

(declare-fun m!57069 () Bool)

(assert (=> d!11272 m!57069))

(declare-fun m!57071 () Bool)

(assert (=> b!37567 m!57071))

(assert (=> b!37126 d!11272))

(declare-fun b!37601 () Bool)

(declare-fun e!24707 () Bool)

(declare-fun lt!57087 () tuple2!3638)

(declare-fun lt!57082 () tuple2!3636)

(assert (=> b!37601 (= e!24707 (= (bitIndex!0 (size!865 (buf!1193 (_1!1906 lt!57087))) (currentByte!2593 (_1!1906 lt!57087)) (currentBit!2588 (_1!1906 lt!57087))) (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!57082))) (currentByte!2593 (_2!1905 lt!57082)) (currentBit!2588 (_2!1905 lt!57082)))))))

(declare-fun b!37602 () Bool)

(declare-fun e!24709 () Bool)

(assert (=> b!37602 (= e!24709 e!24707)))

(declare-fun res!31924 () Bool)

(assert (=> b!37602 (=> (not res!31924) (not e!24707))))

(declare-fun lt!57091 () Bool)

(assert (=> b!37602 (= res!31924 (and (= (_2!1906 lt!57087) lt!57091) (= (_1!1906 lt!57087) (_2!1905 lt!57082))))))

(declare-fun readerFrom!0 (BitStream!1492 (_ BitVec 32) (_ BitVec 32)) BitStream!1492)

(assert (=> b!37602 (= lt!57087 (readBitPure!0 (readerFrom!0 (_2!1905 lt!57082) (currentBit!2588 thiss!1379) (currentByte!2593 thiss!1379))))))

(declare-fun b!37603 () Bool)

(declare-fun res!31929 () Bool)

(assert (=> b!37603 (=> (not res!31929) (not e!24709))))

(assert (=> b!37603 (= res!31929 (isPrefixOf!0 thiss!1379 (_2!1905 lt!57082)))))

(declare-fun d!11274 () Bool)

(declare-fun e!24710 () Bool)

(assert (=> d!11274 e!24710))

(declare-fun res!31926 () Bool)

(assert (=> d!11274 (=> (not res!31926) (not e!24710))))

(declare-fun lt!57092 () tuple2!3636)

(assert (=> d!11274 (= res!31926 (= (size!865 (buf!1193 (_2!1905 lt!57092))) (size!865 (buf!1193 thiss!1379))))))

(declare-fun lt!57084 () (_ BitVec 8))

(declare-fun lt!57085 () array!1931)

(assert (=> d!11274 (= lt!57084 (select (arr!1355 lt!57085) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!11274 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!865 lt!57085)))))

(assert (=> d!11274 (= lt!57085 (array!1932 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!57088 () tuple2!3636)

(assert (=> d!11274 (= lt!57092 (tuple2!3637 (_1!1905 lt!57088) (_2!1905 lt!57088)))))

(assert (=> d!11274 (= lt!57088 lt!57082)))

(assert (=> d!11274 e!24709))

(declare-fun res!31928 () Bool)

(assert (=> d!11274 (=> (not res!31928) (not e!24709))))

(assert (=> d!11274 (= res!31928 (= (size!865 (buf!1193 thiss!1379)) (size!865 (buf!1193 (_2!1905 lt!57082)))))))

(declare-fun appendBit!0 (BitStream!1492 Bool) tuple2!3636)

(assert (=> d!11274 (= lt!57082 (appendBit!0 thiss!1379 lt!57091))))

(assert (=> d!11274 (= lt!57091 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1355 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!11274 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!11274 (= (appendBitFromByte!0 thiss!1379 (select (arr!1355 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!57092)))

(declare-fun b!37604 () Bool)

(declare-fun e!24708 () Bool)

(declare-fun lt!57081 () tuple2!3638)

(assert (=> b!37604 (= e!24708 (= (bitIndex!0 (size!865 (buf!1193 (_1!1906 lt!57081))) (currentByte!2593 (_1!1906 lt!57081)) (currentBit!2588 (_1!1906 lt!57081))) (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!57092))) (currentByte!2593 (_2!1905 lt!57092)) (currentBit!2588 (_2!1905 lt!57092)))))))

(declare-fun b!37605 () Bool)

(declare-fun res!31930 () Bool)

(assert (=> b!37605 (=> (not res!31930) (not e!24710))))

(assert (=> b!37605 (= res!31930 (isPrefixOf!0 thiss!1379 (_2!1905 lt!57092)))))

(declare-fun b!37606 () Bool)

(assert (=> b!37606 (= e!24710 e!24708)))

(declare-fun res!31923 () Bool)

(assert (=> b!37606 (=> (not res!31923) (not e!24708))))

(assert (=> b!37606 (= res!31923 (and (= (_2!1906 lt!57081) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1355 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!57084)) #b00000000000000000000000000000000))) (= (_1!1906 lt!57081) (_2!1905 lt!57092))))))

(declare-fun lt!57089 () tuple2!3662)

(declare-fun lt!57083 () BitStream!1492)

(assert (=> b!37606 (= lt!57089 (readBits!0 lt!57083 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!37606 (= lt!57081 (readBitPure!0 lt!57083))))

(assert (=> b!37606 (= lt!57083 (readerFrom!0 (_2!1905 lt!57092) (currentBit!2588 thiss!1379) (currentByte!2593 thiss!1379)))))

(declare-fun b!37607 () Bool)

(declare-fun res!31927 () Bool)

(assert (=> b!37607 (=> (not res!31927) (not e!24710))))

(declare-fun lt!57086 () (_ BitVec 64))

(declare-fun lt!57090 () (_ BitVec 64))

(assert (=> b!37607 (= res!31927 (= (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!57092))) (currentByte!2593 (_2!1905 lt!57092)) (currentBit!2588 (_2!1905 lt!57092))) (bvadd lt!57090 lt!57086)))))

(assert (=> b!37607 (or (not (= (bvand lt!57090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!57086 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!57090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!57090 lt!57086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!37607 (= lt!57086 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!37607 (= lt!57090 (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)))))

(declare-fun b!37608 () Bool)

(declare-fun res!31925 () Bool)

(assert (=> b!37608 (=> (not res!31925) (not e!24709))))

(assert (=> b!37608 (= res!31925 (= (bitIndex!0 (size!865 (buf!1193 (_2!1905 lt!57082))) (currentByte!2593 (_2!1905 lt!57082)) (currentBit!2588 (_2!1905 lt!57082))) (bvadd (bitIndex!0 (size!865 (buf!1193 thiss!1379)) (currentByte!2593 thiss!1379) (currentBit!2588 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11274 res!31928) b!37608))

(assert (= (and b!37608 res!31925) b!37603))

(assert (= (and b!37603 res!31929) b!37602))

(assert (= (and b!37602 res!31924) b!37601))

(assert (= (and d!11274 res!31926) b!37607))

(assert (= (and b!37607 res!31927) b!37605))

(assert (= (and b!37605 res!31930) b!37606))

(assert (= (and b!37606 res!31923) b!37604))

(declare-fun m!57073 () Bool)

(assert (=> b!37601 m!57073))

(declare-fun m!57075 () Bool)

(assert (=> b!37601 m!57075))

(declare-fun m!57077 () Bool)

(assert (=> b!37605 m!57077))

(declare-fun m!57079 () Bool)

(assert (=> d!11274 m!57079))

(declare-fun m!57081 () Bool)

(assert (=> d!11274 m!57081))

(assert (=> d!11274 m!56525))

(declare-fun m!57083 () Bool)

(assert (=> b!37607 m!57083))

(assert (=> b!37607 m!56265))

(declare-fun m!57085 () Bool)

(assert (=> b!37606 m!57085))

(declare-fun m!57087 () Bool)

(assert (=> b!37606 m!57087))

(declare-fun m!57089 () Bool)

(assert (=> b!37606 m!57089))

(assert (=> b!37608 m!57075))

(assert (=> b!37608 m!56265))

(declare-fun m!57091 () Bool)

(assert (=> b!37602 m!57091))

(assert (=> b!37602 m!57091))

(declare-fun m!57093 () Bool)

(assert (=> b!37602 m!57093))

(declare-fun m!57095 () Bool)

(assert (=> b!37604 m!57095))

(assert (=> b!37604 m!57083))

(declare-fun m!57097 () Bool)

(assert (=> b!37603 m!57097))

(assert (=> b!37126 d!11274))

(push 1)

(assert (not bm!466))

(assert (not b!37343))

(assert (not d!11256))

(assert (not b!37327))

(assert (not b!37607))

(assert (not b!37549))

(assert (not b!37355))

(assert (not b!37543))

(assert (not b!37345))

(assert (not d!11056))

(assert (not d!11264))

(assert (not b!37354))

(assert (not b!37322))

(assert (not b!37542))

(assert (not b!37359))

(assert (not b!37353))

(assert (not b!37544))

(assert (not b!37551))

(assert (not b!37357))

(assert (not b!37328))

(assert (not d!11062))

(assert (not b!37606))

(assert (not b!37330))

(assert (not d!11068))

(assert (not b!37556))

(assert (not b!37297))

(assert (not b!37324))

(assert (not b!37562))

(assert (not d!11240))

(assert (not d!11266))

(assert (not d!11274))

(assert (not b!37308))

(assert (not b!37567))

(assert (not d!11258))

(assert (not b!37332))

(assert (not d!11272))

(assert (not b!37553))

(assert (not b!37602))

(assert (not b!37331))

(assert (not d!11082))

(assert (not d!11102))

(assert (not d!11050))

(assert (not b!37548))

(assert (not d!11270))

(assert (not d!11080))

(assert (not b!37555))

(assert (not b!37608))

(assert (not b!37309))

(assert (not b!37321))

(assert (not b!37546))

(assert (not b!37323))

(assert (not b!37557))

(assert (not b!37604))

(assert (not b!37603))

(assert (not b!37333))

(assert (not d!11242))

(assert (not b!37564))

(assert (not b!37605))

(assert (not b!37307))

(assert (not b!37326))

(assert (not d!11106))

(assert (not d!11100))

(assert (not d!11046))

(assert (not b!37601))

(assert (not d!11254))

(assert (not b!37545))

(assert (not d!11060))

(assert (not b!37336))

(assert (not d!11052))

(assert (not b!37356))

(assert (not d!11064))

(assert (not d!11076))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

