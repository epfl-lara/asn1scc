; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7206 () Bool)

(assert start!7206)

(declare-fun b!35058 () Bool)

(declare-fun e!23194 () Bool)

(declare-fun e!23196 () Bool)

(assert (=> b!35058 (= e!23194 e!23196)))

(declare-fun res!29961 () Bool)

(assert (=> b!35058 (=> res!29961 e!23196)))

(declare-datatypes ((array!1896 0))(
  ( (array!1897 (arr!1324 (Array (_ BitVec 32) (_ BitVec 8))) (size!843 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1466 0))(
  ( (BitStream!1467 (buf!1171 array!1896) (currentByte!2550 (_ BitVec 32)) (currentBit!2545 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1466)

(declare-datatypes ((Unit!2589 0))(
  ( (Unit!2590) )
))
(declare-datatypes ((tuple2!3510 0))(
  ( (tuple2!3511 (_1!1842 Unit!2589) (_2!1842 BitStream!1466)) )
))
(declare-fun lt!52065 () tuple2!3510)

(declare-fun isPrefixOf!0 (BitStream!1466 BitStream!1466) Bool)

(assert (=> b!35058 (= res!29961 (not (isPrefixOf!0 thiss!1379 (_2!1842 lt!52065))))))

(declare-fun lt!52079 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35058 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52079)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!35058 (= lt!52079 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52070 () Unit!2589)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1466 BitStream!1466 (_ BitVec 64) (_ BitVec 64)) Unit!2589)

(assert (=> b!35058 (= lt!52070 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1842 lt!52065) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1896)

(declare-fun appendBitFromByte!0 (BitStream!1466 (_ BitVec 8) (_ BitVec 32)) tuple2!3510)

(assert (=> b!35058 (= lt!52065 (appendBitFromByte!0 thiss!1379 (select (arr!1324 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!35059 () Bool)

(declare-fun e!23201 () Bool)

(assert (=> b!35059 (= e!23201 (not e!23194))))

(declare-fun res!29960 () Bool)

(assert (=> b!35059 (=> res!29960 e!23194)))

(assert (=> b!35059 (= res!29960 (bvsge i!635 to!314))))

(assert (=> b!35059 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!52080 () Unit!2589)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1466) Unit!2589)

(assert (=> b!35059 (= lt!52080 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!52071 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!35059 (= lt!52071 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)))))

(declare-fun res!29955 () Bool)

(assert (=> start!7206 (=> (not res!29955) (not e!23201))))

(assert (=> start!7206 (= res!29955 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!843 srcBuffer!2))))))))

(assert (=> start!7206 e!23201))

(assert (=> start!7206 true))

(declare-fun array_inv!786 (array!1896) Bool)

(assert (=> start!7206 (array_inv!786 srcBuffer!2)))

(declare-fun e!23204 () Bool)

(declare-fun inv!12 (BitStream!1466) Bool)

(assert (=> start!7206 (and (inv!12 thiss!1379) e!23204)))

(declare-fun b!35060 () Bool)

(declare-fun res!29962 () Bool)

(declare-fun e!23203 () Bool)

(assert (=> b!35060 (=> res!29962 e!23203)))

(declare-fun lt!52082 () tuple2!3510)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!35060 (= res!29962 (not (invariant!0 (currentBit!2545 (_2!1842 lt!52082)) (currentByte!2550 (_2!1842 lt!52082)) (size!843 (buf!1171 (_2!1842 lt!52082))))))))

(declare-fun b!35061 () Bool)

(declare-fun e!23198 () Bool)

(declare-fun e!23206 () Bool)

(assert (=> b!35061 (= e!23198 e!23206)))

(declare-fun res!29967 () Bool)

(assert (=> b!35061 (=> res!29967 e!23206)))

(declare-fun lt!52068 () Bool)

(declare-fun lt!52075 () Bool)

(assert (=> b!35061 (= res!29967 (not (= lt!52068 lt!52075)))))

(declare-fun bitAt!0 (array!1896 (_ BitVec 64)) Bool)

(assert (=> b!35061 (= lt!52068 (bitAt!0 (buf!1171 (_2!1842 lt!52065)) lt!52071))))

(declare-fun b!35062 () Bool)

(declare-fun res!29965 () Bool)

(declare-fun e!23197 () Bool)

(assert (=> b!35062 (=> res!29965 e!23197)))

(declare-datatypes ((List!434 0))(
  ( (Nil!431) (Cons!430 (h!549 Bool) (t!1184 List!434)) )
))
(declare-fun lt!52077 () List!434)

(declare-fun lt!52087 () Bool)

(declare-fun head!271 (List!434) Bool)

(assert (=> b!35062 (= res!29965 (not (= (head!271 lt!52077) lt!52087)))))

(declare-fun b!35063 () Bool)

(assert (=> b!35063 (= e!23204 (array_inv!786 (buf!1171 thiss!1379)))))

(declare-fun b!35064 () Bool)

(declare-fun res!29958 () Bool)

(declare-fun e!23195 () Bool)

(assert (=> b!35064 (=> res!29958 e!23195)))

(assert (=> b!35064 (= res!29958 (not (invariant!0 (currentBit!2545 (_2!1842 lt!52065)) (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52065))))))))

(declare-fun b!35065 () Bool)

(declare-fun e!23192 () Bool)

(declare-fun e!23205 () Bool)

(assert (=> b!35065 (= e!23192 e!23205)))

(declare-fun res!29953 () Bool)

(assert (=> b!35065 (=> res!29953 e!23205)))

(declare-fun lt!52073 () List!434)

(declare-fun lt!52067 () List!434)

(assert (=> b!35065 (= res!29953 (not (= lt!52073 lt!52067)))))

(assert (=> b!35065 (= lt!52067 lt!52073)))

(declare-fun tail!151 (List!434) List!434)

(assert (=> b!35065 (= lt!52073 (tail!151 lt!52077))))

(declare-datatypes ((tuple2!3512 0))(
  ( (tuple2!3513 (_1!1843 BitStream!1466) (_2!1843 BitStream!1466)) )
))
(declare-fun lt!52084 () tuple2!3512)

(declare-fun lt!52076 () Unit!2589)

(declare-fun lt!52081 () tuple2!3512)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1466 BitStream!1466 BitStream!1466 BitStream!1466 (_ BitVec 64) List!434) Unit!2589)

(assert (=> b!35065 (= lt!52076 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1842 lt!52082) (_2!1842 lt!52082) (_1!1843 lt!52084) (_1!1843 lt!52081) (bvsub to!314 i!635) lt!52077))))

(declare-fun b!35066 () Bool)

(declare-fun res!29949 () Bool)

(assert (=> b!35066 (=> res!29949 e!23192)))

(declare-fun length!160 (List!434) Int)

(assert (=> b!35066 (= res!29949 (<= (length!160 lt!52077) 0))))

(declare-fun b!35067 () Bool)

(assert (=> b!35067 (= e!23205 e!23197)))

(declare-fun res!29954 () Bool)

(assert (=> b!35067 (=> res!29954 e!23197)))

(assert (=> b!35067 (= res!29954 (not (= lt!52087 (bitAt!0 (buf!1171 (_1!1843 lt!52081)) lt!52071))))))

(assert (=> b!35067 (= lt!52087 (bitAt!0 (buf!1171 (_1!1843 lt!52084)) lt!52071))))

(declare-fun b!35068 () Bool)

(declare-fun e!23200 () Bool)

(assert (=> b!35068 (= e!23196 e!23200)))

(declare-fun res!29966 () Bool)

(assert (=> b!35068 (=> res!29966 e!23200)))

(assert (=> b!35068 (= res!29966 (not (isPrefixOf!0 (_2!1842 lt!52065) (_2!1842 lt!52082))))))

(assert (=> b!35068 (isPrefixOf!0 thiss!1379 (_2!1842 lt!52082))))

(declare-fun lt!52069 () Unit!2589)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1466 BitStream!1466 BitStream!1466) Unit!2589)

(assert (=> b!35068 (= lt!52069 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1842 lt!52065) (_2!1842 lt!52082)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1466 array!1896 (_ BitVec 64) (_ BitVec 64)) tuple2!3510)

(assert (=> b!35068 (= lt!52082 (appendBitsMSBFirstLoop!0 (_2!1842 lt!52065) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!23199 () Bool)

(assert (=> b!35068 e!23199))

(declare-fun res!29963 () Bool)

(assert (=> b!35068 (=> (not res!29963) (not e!23199))))

(assert (=> b!35068 (= res!29963 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52072 () Unit!2589)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1466 array!1896 (_ BitVec 64)) Unit!2589)

(assert (=> b!35068 (= lt!52072 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1171 (_2!1842 lt!52065)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52066 () tuple2!3512)

(declare-fun reader!0 (BitStream!1466 BitStream!1466) tuple2!3512)

(assert (=> b!35068 (= lt!52066 (reader!0 thiss!1379 (_2!1842 lt!52065)))))

(declare-fun b!35069 () Bool)

(declare-fun res!29951 () Bool)

(assert (=> b!35069 (=> res!29951 e!23195)))

(assert (=> b!35069 (= res!29951 (not (invariant!0 (currentBit!2545 (_2!1842 lt!52065)) (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52082))))))))

(declare-fun b!35070 () Bool)

(declare-fun res!29952 () Bool)

(assert (=> b!35070 (=> res!29952 e!23203)))

(assert (=> b!35070 (= res!29952 (not (= (size!843 (buf!1171 thiss!1379)) (size!843 (buf!1171 (_2!1842 lt!52082))))))))

(declare-fun b!35071 () Bool)

(declare-fun res!29956 () Bool)

(assert (=> b!35071 (=> (not res!29956) (not e!23201))))

(assert (=> b!35071 (= res!29956 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 thiss!1379))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!35072 () Bool)

(assert (=> b!35072 (= e!23197 e!23198)))

(declare-fun res!29964 () Bool)

(assert (=> b!35072 (=> res!29964 e!23198)))

(declare-fun byteArrayBitContentToList!0 (BitStream!1466 array!1896 (_ BitVec 64) (_ BitVec 64)) List!434)

(assert (=> b!35072 (= res!29964 (not (= (head!271 (byteArrayBitContentToList!0 (_2!1842 lt!52082) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!52075)))))

(assert (=> b!35072 (= lt!52075 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!35073 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1466 BitStream!1466 (_ BitVec 64)) List!434)

(assert (=> b!35073 (= e!23199 (= (head!271 (byteArrayBitContentToList!0 (_2!1842 lt!52065) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!271 (bitStreamReadBitsIntoList!0 (_2!1842 lt!52065) (_1!1843 lt!52066) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!35074 () Bool)

(assert (=> b!35074 (= e!23195 e!23192)))

(declare-fun res!29957 () Bool)

(assert (=> b!35074 (=> res!29957 e!23192)))

(assert (=> b!35074 (= res!29957 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!35074 (= lt!52067 (bitStreamReadBitsIntoList!0 (_2!1842 lt!52082) (_1!1843 lt!52081) lt!52079))))

(assert (=> b!35074 (= lt!52077 (bitStreamReadBitsIntoList!0 (_2!1842 lt!52082) (_1!1843 lt!52084) (bvsub to!314 i!635)))))

(assert (=> b!35074 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52079)))

(declare-fun lt!52078 () Unit!2589)

(assert (=> b!35074 (= lt!52078 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1842 lt!52065) (buf!1171 (_2!1842 lt!52082)) lt!52079))))

(assert (=> b!35074 (= lt!52081 (reader!0 (_2!1842 lt!52065) (_2!1842 lt!52082)))))

(assert (=> b!35074 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!52086 () Unit!2589)

(assert (=> b!35074 (= lt!52086 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1171 (_2!1842 lt!52082)) (bvsub to!314 i!635)))))

(assert (=> b!35074 (= lt!52084 (reader!0 thiss!1379 (_2!1842 lt!52082)))))

(declare-fun b!35075 () Bool)

(assert (=> b!35075 (= e!23203 e!23195)))

(declare-fun res!29950 () Bool)

(assert (=> b!35075 (=> res!29950 e!23195)))

(assert (=> b!35075 (= res!29950 (not (= (size!843 (buf!1171 (_2!1842 lt!52065))) (size!843 (buf!1171 (_2!1842 lt!52082))))))))

(declare-fun lt!52083 () (_ BitVec 64))

(declare-fun lt!52085 () (_ BitVec 64))

(assert (=> b!35075 (= lt!52085 (bvsub (bvsub (bvadd lt!52083 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!35075 (= lt!52083 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))))))

(assert (=> b!35075 (= (size!843 (buf!1171 (_2!1842 lt!52082))) (size!843 (buf!1171 thiss!1379)))))

(declare-fun b!35076 () Bool)

(assert (=> b!35076 (= e!23206 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52071) (bvslt lt!52071 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082))))))))))

(assert (=> b!35076 (= lt!52068 (bitAt!0 (buf!1171 (_2!1842 lt!52082)) lt!52071))))

(declare-fun lt!52074 () Unit!2589)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1896 array!1896 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2589)

(assert (=> b!35076 (= lt!52074 (arrayBitRangesEqImpliesEq!0 (buf!1171 (_2!1842 lt!52065)) (buf!1171 (_2!1842 lt!52082)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52071 lt!52083))))

(declare-fun b!35077 () Bool)

(assert (=> b!35077 (= e!23200 e!23203)))

(declare-fun res!29959 () Bool)

(assert (=> b!35077 (=> res!29959 e!23203)))

(assert (=> b!35077 (= res!29959 (not (= lt!52085 (bvsub (bvadd lt!52071 to!314) i!635))))))

(assert (=> b!35077 (= lt!52085 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52082))) (currentByte!2550 (_2!1842 lt!52082)) (currentBit!2545 (_2!1842 lt!52082))))))

(assert (= (and start!7206 res!29955) b!35071))

(assert (= (and b!35071 res!29956) b!35059))

(assert (= (and b!35059 (not res!29960)) b!35058))

(assert (= (and b!35058 (not res!29961)) b!35068))

(assert (= (and b!35068 res!29963) b!35073))

(assert (= (and b!35068 (not res!29966)) b!35077))

(assert (= (and b!35077 (not res!29959)) b!35060))

(assert (= (and b!35060 (not res!29962)) b!35070))

(assert (= (and b!35070 (not res!29952)) b!35075))

(assert (= (and b!35075 (not res!29950)) b!35064))

(assert (= (and b!35064 (not res!29958)) b!35069))

(assert (= (and b!35069 (not res!29951)) b!35074))

(assert (= (and b!35074 (not res!29957)) b!35066))

(assert (= (and b!35066 (not res!29949)) b!35065))

(assert (= (and b!35065 (not res!29953)) b!35067))

(assert (= (and b!35067 (not res!29954)) b!35062))

(assert (= (and b!35062 (not res!29965)) b!35072))

(assert (= (and b!35072 (not res!29964)) b!35061))

(assert (= (and b!35061 (not res!29967)) b!35076))

(assert (= start!7206 b!35063))

(declare-fun m!52497 () Bool)

(assert (=> b!35074 m!52497))

(declare-fun m!52499 () Bool)

(assert (=> b!35074 m!52499))

(declare-fun m!52501 () Bool)

(assert (=> b!35074 m!52501))

(declare-fun m!52503 () Bool)

(assert (=> b!35074 m!52503))

(declare-fun m!52505 () Bool)

(assert (=> b!35074 m!52505))

(declare-fun m!52507 () Bool)

(assert (=> b!35074 m!52507))

(declare-fun m!52509 () Bool)

(assert (=> b!35074 m!52509))

(declare-fun m!52511 () Bool)

(assert (=> b!35074 m!52511))

(declare-fun m!52513 () Bool)

(assert (=> b!35073 m!52513))

(assert (=> b!35073 m!52513))

(declare-fun m!52515 () Bool)

(assert (=> b!35073 m!52515))

(declare-fun m!52517 () Bool)

(assert (=> b!35073 m!52517))

(assert (=> b!35073 m!52517))

(declare-fun m!52519 () Bool)

(assert (=> b!35073 m!52519))

(declare-fun m!52521 () Bool)

(assert (=> b!35077 m!52521))

(declare-fun m!52523 () Bool)

(assert (=> b!35067 m!52523))

(declare-fun m!52525 () Bool)

(assert (=> b!35067 m!52525))

(declare-fun m!52527 () Bool)

(assert (=> b!35068 m!52527))

(declare-fun m!52529 () Bool)

(assert (=> b!35068 m!52529))

(declare-fun m!52531 () Bool)

(assert (=> b!35068 m!52531))

(declare-fun m!52533 () Bool)

(assert (=> b!35068 m!52533))

(declare-fun m!52535 () Bool)

(assert (=> b!35068 m!52535))

(declare-fun m!52537 () Bool)

(assert (=> b!35068 m!52537))

(declare-fun m!52539 () Bool)

(assert (=> b!35068 m!52539))

(declare-fun m!52541 () Bool)

(assert (=> b!35061 m!52541))

(declare-fun m!52543 () Bool)

(assert (=> b!35063 m!52543))

(declare-fun m!52545 () Bool)

(assert (=> b!35075 m!52545))

(declare-fun m!52547 () Bool)

(assert (=> b!35069 m!52547))

(declare-fun m!52549 () Bool)

(assert (=> b!35058 m!52549))

(declare-fun m!52551 () Bool)

(assert (=> b!35058 m!52551))

(declare-fun m!52553 () Bool)

(assert (=> b!35058 m!52553))

(declare-fun m!52555 () Bool)

(assert (=> b!35058 m!52555))

(assert (=> b!35058 m!52553))

(declare-fun m!52557 () Bool)

(assert (=> b!35058 m!52557))

(declare-fun m!52559 () Bool)

(assert (=> b!35072 m!52559))

(assert (=> b!35072 m!52559))

(declare-fun m!52561 () Bool)

(assert (=> b!35072 m!52561))

(declare-fun m!52563 () Bool)

(assert (=> b!35072 m!52563))

(declare-fun m!52565 () Bool)

(assert (=> start!7206 m!52565))

(declare-fun m!52567 () Bool)

(assert (=> start!7206 m!52567))

(declare-fun m!52569 () Bool)

(assert (=> b!35059 m!52569))

(declare-fun m!52571 () Bool)

(assert (=> b!35059 m!52571))

(declare-fun m!52573 () Bool)

(assert (=> b!35059 m!52573))

(declare-fun m!52575 () Bool)

(assert (=> b!35066 m!52575))

(declare-fun m!52577 () Bool)

(assert (=> b!35062 m!52577))

(declare-fun m!52579 () Bool)

(assert (=> b!35071 m!52579))

(declare-fun m!52581 () Bool)

(assert (=> b!35060 m!52581))

(declare-fun m!52583 () Bool)

(assert (=> b!35065 m!52583))

(declare-fun m!52585 () Bool)

(assert (=> b!35065 m!52585))

(declare-fun m!52587 () Bool)

(assert (=> b!35064 m!52587))

(declare-fun m!52589 () Bool)

(assert (=> b!35076 m!52589))

(declare-fun m!52591 () Bool)

(assert (=> b!35076 m!52591))

(push 1)

(assert (not b!35069))

(assert (not b!35065))

(assert (not b!35063))

(assert (not b!35073))

(assert (not b!35076))

(assert (not b!35066))

(assert (not b!35062))

(assert (not b!35067))

(assert (not b!35059))

(assert (not b!35075))

(assert (not b!35068))

(assert (not b!35058))

(assert (not b!35072))

(assert (not b!35061))

(assert (not b!35064))

(assert (not b!35077))

(assert (not b!35060))

(assert (not b!35074))

(assert (not start!7206))

(assert (not b!35071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!10172 () Bool)

(declare-fun res!29988 () Bool)

(declare-fun e!23220 () Bool)

(assert (=> d!10172 (=> (not res!29988) (not e!23220))))

(assert (=> d!10172 (= res!29988 (= (size!843 (buf!1171 thiss!1379)) (size!843 (buf!1171 thiss!1379))))))

(assert (=> d!10172 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!23220)))

(declare-fun b!35096 () Bool)

(declare-fun res!29987 () Bool)

(assert (=> b!35096 (=> (not res!29987) (not e!23220))))

(assert (=> b!35096 (= res!29987 (bvsle (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)) (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379))))))

(declare-fun b!35097 () Bool)

(declare-fun e!23221 () Bool)

(assert (=> b!35097 (= e!23220 e!23221)))

(declare-fun res!29986 () Bool)

(assert (=> b!35097 (=> res!29986 e!23221)))

(assert (=> b!35097 (= res!29986 (= (size!843 (buf!1171 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35098 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1896 array!1896 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35098 (= e!23221 (arrayBitRangesEq!0 (buf!1171 thiss!1379) (buf!1171 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379))))))

(assert (= (and d!10172 res!29988) b!35096))

(assert (= (and b!35096 res!29987) b!35097))

(assert (= (and b!35097 (not res!29986)) b!35098))

(assert (=> b!35096 m!52573))

(assert (=> b!35096 m!52573))

(assert (=> b!35098 m!52573))

(assert (=> b!35098 m!52573))

(declare-fun m!52605 () Bool)

(assert (=> b!35098 m!52605))

(assert (=> b!35059 d!10172))

(declare-fun d!10174 () Bool)

(assert (=> d!10174 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!52093 () Unit!2589)

(declare-fun choose!11 (BitStream!1466) Unit!2589)

(assert (=> d!10174 (= lt!52093 (choose!11 thiss!1379))))

(assert (=> d!10174 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!52093)))

(declare-fun bs!2762 () Bool)

(assert (= bs!2762 d!10174))

(assert (=> bs!2762 m!52569))

(declare-fun m!52607 () Bool)

(assert (=> bs!2762 m!52607))

(assert (=> b!35059 d!10174))

(declare-fun d!10176 () Bool)

(declare-fun e!23224 () Bool)

(assert (=> d!10176 e!23224))

(declare-fun res!29994 () Bool)

(assert (=> d!10176 (=> (not res!29994) (not e!23224))))

(declare-fun lt!52111 () (_ BitVec 64))

(declare-fun lt!52107 () (_ BitVec 64))

(declare-fun lt!52108 () (_ BitVec 64))

(assert (=> d!10176 (= res!29994 (= lt!52108 (bvsub lt!52107 lt!52111)))))

(assert (=> d!10176 (or (= (bvand lt!52107 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52107 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52107 lt!52111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10176 (= lt!52111 (remainingBits!0 ((_ sign_extend 32) (size!843 (buf!1171 thiss!1379))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379))))))

(declare-fun lt!52110 () (_ BitVec 64))

(declare-fun lt!52109 () (_ BitVec 64))

(assert (=> d!10176 (= lt!52107 (bvmul lt!52110 lt!52109))))

(assert (=> d!10176 (or (= lt!52110 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!52109 (bvsdiv (bvmul lt!52110 lt!52109) lt!52110)))))

(assert (=> d!10176 (= lt!52109 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10176 (= lt!52110 ((_ sign_extend 32) (size!843 (buf!1171 thiss!1379))))))

(assert (=> d!10176 (= lt!52108 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2550 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2545 thiss!1379))))))

(assert (=> d!10176 (invariant!0 (currentBit!2545 thiss!1379) (currentByte!2550 thiss!1379) (size!843 (buf!1171 thiss!1379)))))

(assert (=> d!10176 (= (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)) lt!52108)))

(declare-fun b!35103 () Bool)

(declare-fun res!29993 () Bool)

(assert (=> b!35103 (=> (not res!29993) (not e!23224))))

(assert (=> b!35103 (= res!29993 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52108))))

(declare-fun b!35104 () Bool)

(declare-fun lt!52106 () (_ BitVec 64))

(assert (=> b!35104 (= e!23224 (bvsle lt!52108 (bvmul lt!52106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35104 (or (= lt!52106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!52106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!52106)))))

(assert (=> b!35104 (= lt!52106 ((_ sign_extend 32) (size!843 (buf!1171 thiss!1379))))))

(assert (= (and d!10176 res!29994) b!35103))

(assert (= (and b!35103 res!29993) b!35104))

(declare-fun m!52609 () Bool)

(assert (=> d!10176 m!52609))

(declare-fun m!52611 () Bool)

(assert (=> d!10176 m!52611))

(assert (=> b!35059 d!10176))

(declare-fun d!10178 () Bool)

(assert (=> d!10178 (= (invariant!0 (currentBit!2545 (_2!1842 lt!52065)) (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52082)))) (and (bvsge (currentBit!2545 (_2!1842 lt!52065)) #b00000000000000000000000000000000) (bvslt (currentBit!2545 (_2!1842 lt!52065)) #b00000000000000000000000000001000) (bvsge (currentByte!2550 (_2!1842 lt!52065)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52082)))) (and (= (currentBit!2545 (_2!1842 lt!52065)) #b00000000000000000000000000000000) (= (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52082))))))))))

(assert (=> b!35069 d!10178))

(declare-fun d!10180 () Bool)

(declare-fun res!29997 () Bool)

(declare-fun e!23225 () Bool)

(assert (=> d!10180 (=> (not res!29997) (not e!23225))))

(assert (=> d!10180 (= res!29997 (= (size!843 (buf!1171 thiss!1379)) (size!843 (buf!1171 (_2!1842 lt!52065)))))))

(assert (=> d!10180 (= (isPrefixOf!0 thiss!1379 (_2!1842 lt!52065)) e!23225)))

(declare-fun b!35105 () Bool)

(declare-fun res!29996 () Bool)

(assert (=> b!35105 (=> (not res!29996) (not e!23225))))

(assert (=> b!35105 (= res!29996 (bvsle (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)) (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065)))))))

(declare-fun b!35106 () Bool)

(declare-fun e!23226 () Bool)

(assert (=> b!35106 (= e!23225 e!23226)))

(declare-fun res!29995 () Bool)

(assert (=> b!35106 (=> res!29995 e!23226)))

(assert (=> b!35106 (= res!29995 (= (size!843 (buf!1171 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35107 () Bool)

(assert (=> b!35107 (= e!23226 (arrayBitRangesEq!0 (buf!1171 thiss!1379) (buf!1171 (_2!1842 lt!52065)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379))))))

(assert (= (and d!10180 res!29997) b!35105))

(assert (= (and b!35105 res!29996) b!35106))

(assert (= (and b!35106 (not res!29995)) b!35107))

(assert (=> b!35105 m!52573))

(assert (=> b!35105 m!52545))

(assert (=> b!35107 m!52573))

(assert (=> b!35107 m!52573))

(declare-fun m!52613 () Bool)

(assert (=> b!35107 m!52613))

(assert (=> b!35058 d!10180))

(declare-fun d!10182 () Bool)

(assert (=> d!10182 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52079) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065)))) lt!52079))))

(declare-fun bs!2763 () Bool)

(assert (= bs!2763 d!10182))

(declare-fun m!52615 () Bool)

(assert (=> bs!2763 m!52615))

(assert (=> b!35058 d!10182))

(declare-fun d!10184 () Bool)

(declare-fun e!23229 () Bool)

(assert (=> d!10184 e!23229))

(declare-fun res!30000 () Bool)

(assert (=> d!10184 (=> (not res!30000) (not e!23229))))

(assert (=> d!10184 (= res!30000 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!52114 () Unit!2589)

(declare-fun choose!27 (BitStream!1466 BitStream!1466 (_ BitVec 64) (_ BitVec 64)) Unit!2589)

(assert (=> d!10184 (= lt!52114 (choose!27 thiss!1379 (_2!1842 lt!52065) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10184 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10184 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1842 lt!52065) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!52114)))

(declare-fun b!35110 () Bool)

(assert (=> b!35110 (= e!23229 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10184 res!30000) b!35110))

(declare-fun m!52617 () Bool)

(assert (=> d!10184 m!52617))

(declare-fun m!52619 () Bool)

(assert (=> b!35110 m!52619))

(assert (=> b!35058 d!10184))

(declare-fun b!35154 () Bool)

(declare-fun e!23252 () Bool)

(declare-fun e!23250 () Bool)

(assert (=> b!35154 (= e!23252 e!23250)))

(declare-fun res!30046 () Bool)

(assert (=> b!35154 (=> (not res!30046) (not e!23250))))

(declare-fun lt!52181 () (_ BitVec 8))

(declare-datatypes ((tuple2!3518 0))(
  ( (tuple2!3519 (_1!1846 BitStream!1466) (_2!1846 Bool)) )
))
(declare-fun lt!52177 () tuple2!3518)

(declare-fun lt!52176 () tuple2!3510)

(assert (=> b!35154 (= res!30046 (and (= (_2!1846 lt!52177) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1324 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!52181)) #b00000000000000000000000000000000))) (= (_1!1846 lt!52177) (_2!1842 lt!52176))))))

(declare-datatypes ((tuple2!3520 0))(
  ( (tuple2!3521 (_1!1847 array!1896) (_2!1847 BitStream!1466)) )
))
(declare-fun lt!52180 () tuple2!3520)

(declare-fun lt!52185 () BitStream!1466)

(declare-fun readBits!0 (BitStream!1466 (_ BitVec 64)) tuple2!3520)

(assert (=> b!35154 (= lt!52180 (readBits!0 lt!52185 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1466) tuple2!3518)

(assert (=> b!35154 (= lt!52177 (readBitPure!0 lt!52185))))

(declare-fun readerFrom!0 (BitStream!1466 (_ BitVec 32) (_ BitVec 32)) BitStream!1466)

(assert (=> b!35154 (= lt!52185 (readerFrom!0 (_2!1842 lt!52176) (currentBit!2545 thiss!1379) (currentByte!2550 thiss!1379)))))

(declare-fun b!35155 () Bool)

(assert (=> b!35155 (= e!23250 (= (bitIndex!0 (size!843 (buf!1171 (_1!1846 lt!52177))) (currentByte!2550 (_1!1846 lt!52177)) (currentBit!2545 (_1!1846 lt!52177))) (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52176))) (currentByte!2550 (_2!1842 lt!52176)) (currentBit!2545 (_2!1842 lt!52176)))))))

(declare-fun b!35156 () Bool)

(declare-fun res!30045 () Bool)

(assert (=> b!35156 (=> (not res!30045) (not e!23252))))

(declare-fun lt!52186 () (_ BitVec 64))

(declare-fun lt!52179 () (_ BitVec 64))

(assert (=> b!35156 (= res!30045 (= (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52176))) (currentByte!2550 (_2!1842 lt!52176)) (currentBit!2545 (_2!1842 lt!52176))) (bvadd lt!52179 lt!52186)))))

(assert (=> b!35156 (or (not (= (bvand lt!52179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52186 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!52179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!52179 lt!52186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35156 (= lt!52186 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!35156 (= lt!52179 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)))))

(declare-fun b!35157 () Bool)

(declare-fun res!30048 () Bool)

(declare-fun e!23253 () Bool)

(assert (=> b!35157 (=> (not res!30048) (not e!23253))))

(declare-fun lt!52183 () tuple2!3510)

(assert (=> b!35157 (= res!30048 (isPrefixOf!0 thiss!1379 (_2!1842 lt!52183)))))

(declare-fun b!35158 () Bool)

(declare-fun res!30042 () Bool)

(assert (=> b!35158 (=> (not res!30042) (not e!23253))))

(assert (=> b!35158 (= res!30042 (= (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52183))) (currentByte!2550 (_2!1842 lt!52183)) (currentBit!2545 (_2!1842 lt!52183))) (bvadd (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!10186 () Bool)

(assert (=> d!10186 e!23252))

(declare-fun res!30041 () Bool)

(assert (=> d!10186 (=> (not res!30041) (not e!23252))))

(assert (=> d!10186 (= res!30041 (= (size!843 (buf!1171 (_2!1842 lt!52176))) (size!843 (buf!1171 thiss!1379))))))

(declare-fun lt!52178 () array!1896)

(assert (=> d!10186 (= lt!52181 (select (arr!1324 lt!52178) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10186 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!843 lt!52178)))))

(assert (=> d!10186 (= lt!52178 (array!1897 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!52184 () tuple2!3510)

(assert (=> d!10186 (= lt!52176 (tuple2!3511 (_1!1842 lt!52184) (_2!1842 lt!52184)))))

(assert (=> d!10186 (= lt!52184 lt!52183)))

(assert (=> d!10186 e!23253))

(declare-fun res!30047 () Bool)

(assert (=> d!10186 (=> (not res!30047) (not e!23253))))

(assert (=> d!10186 (= res!30047 (= (size!843 (buf!1171 thiss!1379)) (size!843 (buf!1171 (_2!1842 lt!52183)))))))

(declare-fun lt!52182 () Bool)

(declare-fun appendBit!0 (BitStream!1466 Bool) tuple2!3510)

(assert (=> d!10186 (= lt!52183 (appendBit!0 thiss!1379 lt!52182))))

(assert (=> d!10186 (= lt!52182 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1324 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10186 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10186 (= (appendBitFromByte!0 thiss!1379 (select (arr!1324 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!52176)))

(declare-fun b!35153 () Bool)

(declare-fun e!23251 () Bool)

(assert (=> b!35153 (= e!23253 e!23251)))

(declare-fun res!30043 () Bool)

(assert (=> b!35153 (=> (not res!30043) (not e!23251))))

(declare-fun lt!52175 () tuple2!3518)

(assert (=> b!35153 (= res!30043 (and (= (_2!1846 lt!52175) lt!52182) (= (_1!1846 lt!52175) (_2!1842 lt!52183))))))

(assert (=> b!35153 (= lt!52175 (readBitPure!0 (readerFrom!0 (_2!1842 lt!52183) (currentBit!2545 thiss!1379) (currentByte!2550 thiss!1379))))))

(declare-fun b!35159 () Bool)

(declare-fun res!30044 () Bool)

(assert (=> b!35159 (=> (not res!30044) (not e!23252))))

(assert (=> b!35159 (= res!30044 (isPrefixOf!0 thiss!1379 (_2!1842 lt!52176)))))

(declare-fun b!35160 () Bool)

(assert (=> b!35160 (= e!23251 (= (bitIndex!0 (size!843 (buf!1171 (_1!1846 lt!52175))) (currentByte!2550 (_1!1846 lt!52175)) (currentBit!2545 (_1!1846 lt!52175))) (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52183))) (currentByte!2550 (_2!1842 lt!52183)) (currentBit!2545 (_2!1842 lt!52183)))))))

(assert (= (and d!10186 res!30047) b!35158))

(assert (= (and b!35158 res!30042) b!35157))

(assert (= (and b!35157 res!30048) b!35153))

(assert (= (and b!35153 res!30043) b!35160))

(assert (= (and d!10186 res!30041) b!35156))

(assert (= (and b!35156 res!30045) b!35159))

(assert (= (and b!35159 res!30044) b!35154))

(assert (= (and b!35154 res!30046) b!35155))

(declare-fun m!52657 () Bool)

(assert (=> d!10186 m!52657))

(declare-fun m!52659 () Bool)

(assert (=> d!10186 m!52659))

(declare-fun m!52661 () Bool)

(assert (=> d!10186 m!52661))

(declare-fun m!52663 () Bool)

(assert (=> b!35157 m!52663))

(declare-fun m!52665 () Bool)

(assert (=> b!35155 m!52665))

(declare-fun m!52667 () Bool)

(assert (=> b!35155 m!52667))

(declare-fun m!52669 () Bool)

(assert (=> b!35159 m!52669))

(declare-fun m!52671 () Bool)

(assert (=> b!35153 m!52671))

(assert (=> b!35153 m!52671))

(declare-fun m!52673 () Bool)

(assert (=> b!35153 m!52673))

(declare-fun m!52675 () Bool)

(assert (=> b!35154 m!52675))

(declare-fun m!52677 () Bool)

(assert (=> b!35154 m!52677))

(declare-fun m!52679 () Bool)

(assert (=> b!35154 m!52679))

(declare-fun m!52681 () Bool)

(assert (=> b!35160 m!52681))

(declare-fun m!52683 () Bool)

(assert (=> b!35160 m!52683))

(assert (=> b!35156 m!52667))

(assert (=> b!35156 m!52573))

(assert (=> b!35158 m!52683))

(assert (=> b!35158 m!52573))

(assert (=> b!35058 d!10186))

(declare-fun d!10204 () Bool)

(assert (=> d!10204 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 thiss!1379))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!843 (buf!1171 thiss!1379))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2768 () Bool)

(assert (= bs!2768 d!10204))

(assert (=> bs!2768 m!52609))

(assert (=> b!35071 d!10204))

(declare-fun d!10206 () Bool)

(assert (=> d!10206 (= (invariant!0 (currentBit!2545 (_2!1842 lt!52082)) (currentByte!2550 (_2!1842 lt!52082)) (size!843 (buf!1171 (_2!1842 lt!52082)))) (and (bvsge (currentBit!2545 (_2!1842 lt!52082)) #b00000000000000000000000000000000) (bvslt (currentBit!2545 (_2!1842 lt!52082)) #b00000000000000000000000000001000) (bvsge (currentByte!2550 (_2!1842 lt!52082)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2550 (_2!1842 lt!52082)) (size!843 (buf!1171 (_2!1842 lt!52082)))) (and (= (currentBit!2545 (_2!1842 lt!52082)) #b00000000000000000000000000000000) (= (currentByte!2550 (_2!1842 lt!52082)) (size!843 (buf!1171 (_2!1842 lt!52082))))))))))

(assert (=> b!35060 d!10206))

(declare-fun d!10208 () Bool)

(assert (=> d!10208 (= (array_inv!786 srcBuffer!2) (bvsge (size!843 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7206 d!10208))

(declare-fun d!10210 () Bool)

(assert (=> d!10210 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2545 thiss!1379) (currentByte!2550 thiss!1379) (size!843 (buf!1171 thiss!1379))))))

(declare-fun bs!2769 () Bool)

(assert (= bs!2769 d!10210))

(assert (=> bs!2769 m!52611))

(assert (=> start!7206 d!10210))

(declare-fun d!10212 () Bool)

(assert (=> d!10212 (= (head!271 (byteArrayBitContentToList!0 (_2!1842 lt!52082) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!549 (byteArrayBitContentToList!0 (_2!1842 lt!52082) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!35072 d!10212))

(declare-fun d!10214 () Bool)

(declare-fun c!2358 () Bool)

(assert (=> d!10214 (= c!2358 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23256 () List!434)

(assert (=> d!10214 (= (byteArrayBitContentToList!0 (_2!1842 lt!52082) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!23256)))

(declare-fun b!35165 () Bool)

(assert (=> b!35165 (= e!23256 Nil!431)))

(declare-fun b!35166 () Bool)

(assert (=> b!35166 (= e!23256 (Cons!430 (not (= (bvand ((_ sign_extend 24) (select (arr!1324 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1842 lt!52082) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10214 c!2358) b!35165))

(assert (= (and d!10214 (not c!2358)) b!35166))

(assert (=> b!35166 m!52553))

(assert (=> b!35166 m!52661))

(declare-fun m!52685 () Bool)

(assert (=> b!35166 m!52685))

(assert (=> b!35072 d!10214))

(declare-fun d!10216 () Bool)

(assert (=> d!10216 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1324 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2770 () Bool)

(assert (= bs!2770 d!10216))

(assert (=> bs!2770 m!52553))

(assert (=> bs!2770 m!52661))

(assert (=> b!35072 d!10216))

(declare-fun d!10218 () Bool)

(assert (=> d!10218 (= (bitAt!0 (buf!1171 (_2!1842 lt!52065)) lt!52071) (not (= (bvand ((_ sign_extend 24) (select (arr!1324 (buf!1171 (_2!1842 lt!52065))) ((_ extract 31 0) (bvsdiv lt!52071 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!52071 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2771 () Bool)

(assert (= bs!2771 d!10218))

(declare-fun m!52687 () Bool)

(assert (=> bs!2771 m!52687))

(declare-fun m!52689 () Bool)

(assert (=> bs!2771 m!52689))

(assert (=> b!35061 d!10218))

(declare-fun d!10220 () Bool)

(assert (=> d!10220 (= (array_inv!786 (buf!1171 thiss!1379)) (bvsge (size!843 (buf!1171 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!35063 d!10220))

(declare-fun d!10222 () Bool)

(assert (=> d!10222 (= (head!271 (byteArrayBitContentToList!0 (_2!1842 lt!52065) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!549 (byteArrayBitContentToList!0 (_2!1842 lt!52065) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35073 d!10222))

(declare-fun d!10224 () Bool)

(declare-fun c!2359 () Bool)

(assert (=> d!10224 (= c!2359 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23257 () List!434)

(assert (=> d!10224 (= (byteArrayBitContentToList!0 (_2!1842 lt!52065) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!23257)))

(declare-fun b!35167 () Bool)

(assert (=> b!35167 (= e!23257 Nil!431)))

(declare-fun b!35168 () Bool)

(assert (=> b!35168 (= e!23257 (Cons!430 (not (= (bvand ((_ sign_extend 24) (select (arr!1324 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1842 lt!52065) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10224 c!2359) b!35167))

(assert (= (and d!10224 (not c!2359)) b!35168))

(assert (=> b!35168 m!52553))

(assert (=> b!35168 m!52661))

(declare-fun m!52691 () Bool)

(assert (=> b!35168 m!52691))

(assert (=> b!35073 d!10224))

(declare-fun d!10226 () Bool)

(assert (=> d!10226 (= (head!271 (bitStreamReadBitsIntoList!0 (_2!1842 lt!52065) (_1!1843 lt!52066) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!549 (bitStreamReadBitsIntoList!0 (_2!1842 lt!52065) (_1!1843 lt!52066) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35073 d!10226))

(declare-fun b!35177 () Bool)

(declare-datatypes ((tuple2!3522 0))(
  ( (tuple2!3523 (_1!1848 List!434) (_2!1848 BitStream!1466)) )
))
(declare-fun e!23263 () tuple2!3522)

(assert (=> b!35177 (= e!23263 (tuple2!3523 Nil!431 (_1!1843 lt!52066)))))

(declare-fun b!35178 () Bool)

(declare-datatypes ((tuple2!3524 0))(
  ( (tuple2!3525 (_1!1849 Bool) (_2!1849 BitStream!1466)) )
))
(declare-fun lt!52193 () tuple2!3524)

(declare-fun lt!52195 () (_ BitVec 64))

(assert (=> b!35178 (= e!23263 (tuple2!3523 (Cons!430 (_1!1849 lt!52193) (bitStreamReadBitsIntoList!0 (_2!1842 lt!52065) (_2!1849 lt!52193) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!52195))) (_2!1849 lt!52193)))))

(declare-fun readBit!0 (BitStream!1466) tuple2!3524)

(assert (=> b!35178 (= lt!52193 (readBit!0 (_1!1843 lt!52066)))))

(assert (=> b!35178 (= lt!52195 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10228 () Bool)

(declare-fun e!23262 () Bool)

(assert (=> d!10228 e!23262))

(declare-fun c!2364 () Bool)

(assert (=> d!10228 (= c!2364 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!52194 () List!434)

(assert (=> d!10228 (= lt!52194 (_1!1848 e!23263))))

(declare-fun c!2365 () Bool)

(assert (=> d!10228 (= c!2365 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10228 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10228 (= (bitStreamReadBitsIntoList!0 (_2!1842 lt!52065) (_1!1843 lt!52066) #b0000000000000000000000000000000000000000000000000000000000000001) lt!52194)))

(declare-fun b!35180 () Bool)

(assert (=> b!35180 (= e!23262 (> (length!160 lt!52194) 0))))

(declare-fun b!35179 () Bool)

(declare-fun isEmpty!96 (List!434) Bool)

(assert (=> b!35179 (= e!23262 (isEmpty!96 lt!52194))))

(assert (= (and d!10228 c!2365) b!35177))

(assert (= (and d!10228 (not c!2365)) b!35178))

(assert (= (and d!10228 c!2364) b!35179))

(assert (= (and d!10228 (not c!2364)) b!35180))

(declare-fun m!52693 () Bool)

(assert (=> b!35178 m!52693))

(declare-fun m!52695 () Bool)

(assert (=> b!35178 m!52695))

(declare-fun m!52697 () Bool)

(assert (=> b!35180 m!52697))

(declare-fun m!52699 () Bool)

(assert (=> b!35179 m!52699))

(assert (=> b!35073 d!10228))

(declare-fun d!10230 () Bool)

(assert (=> d!10230 (= (head!271 lt!52077) (h!549 lt!52077))))

(assert (=> b!35062 d!10230))

(declare-fun d!10232 () Bool)

(declare-fun e!23264 () Bool)

(assert (=> d!10232 e!23264))

(declare-fun res!30050 () Bool)

(assert (=> d!10232 (=> (not res!30050) (not e!23264))))

(declare-fun lt!52201 () (_ BitVec 64))

(declare-fun lt!52198 () (_ BitVec 64))

(declare-fun lt!52197 () (_ BitVec 64))

(assert (=> d!10232 (= res!30050 (= lt!52198 (bvsub lt!52197 lt!52201)))))

(assert (=> d!10232 (or (= (bvand lt!52197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52197 lt!52201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10232 (= lt!52201 (remainingBits!0 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065)))))))

(declare-fun lt!52200 () (_ BitVec 64))

(declare-fun lt!52199 () (_ BitVec 64))

(assert (=> d!10232 (= lt!52197 (bvmul lt!52200 lt!52199))))

(assert (=> d!10232 (or (= lt!52200 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!52199 (bvsdiv (bvmul lt!52200 lt!52199) lt!52200)))))

(assert (=> d!10232 (= lt!52199 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10232 (= lt!52200 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))))))

(assert (=> d!10232 (= lt!52198 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065)))))))

(assert (=> d!10232 (invariant!0 (currentBit!2545 (_2!1842 lt!52065)) (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52065))))))

(assert (=> d!10232 (= (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))) lt!52198)))

(declare-fun b!35181 () Bool)

(declare-fun res!30049 () Bool)

(assert (=> b!35181 (=> (not res!30049) (not e!23264))))

(assert (=> b!35181 (= res!30049 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52198))))

(declare-fun b!35182 () Bool)

(declare-fun lt!52196 () (_ BitVec 64))

(assert (=> b!35182 (= e!23264 (bvsle lt!52198 (bvmul lt!52196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35182 (or (= lt!52196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!52196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!52196)))))

(assert (=> b!35182 (= lt!52196 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))))))

(assert (= (and d!10232 res!30050) b!35181))

(assert (= (and b!35181 res!30049) b!35182))

(assert (=> d!10232 m!52615))

(assert (=> d!10232 m!52587))

(assert (=> b!35075 d!10232))

(declare-fun d!10234 () Bool)

(assert (=> d!10234 (= (invariant!0 (currentBit!2545 (_2!1842 lt!52065)) (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52065)))) (and (bvsge (currentBit!2545 (_2!1842 lt!52065)) #b00000000000000000000000000000000) (bvslt (currentBit!2545 (_2!1842 lt!52065)) #b00000000000000000000000000001000) (bvsge (currentByte!2550 (_2!1842 lt!52065)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52065)))) (and (= (currentBit!2545 (_2!1842 lt!52065)) #b00000000000000000000000000000000) (= (currentByte!2550 (_2!1842 lt!52065)) (size!843 (buf!1171 (_2!1842 lt!52065))))))))))

(assert (=> b!35064 d!10234))

(declare-fun d!10236 () Bool)

(assert (=> d!10236 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52079)))

(declare-fun lt!52204 () Unit!2589)

(declare-fun choose!9 (BitStream!1466 array!1896 (_ BitVec 64) BitStream!1466) Unit!2589)

(assert (=> d!10236 (= lt!52204 (choose!9 (_2!1842 lt!52065) (buf!1171 (_2!1842 lt!52082)) lt!52079 (BitStream!1467 (buf!1171 (_2!1842 lt!52082)) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065)))))))

(assert (=> d!10236 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1842 lt!52065) (buf!1171 (_2!1842 lt!52082)) lt!52079) lt!52204)))

(declare-fun bs!2772 () Bool)

(assert (= bs!2772 d!10236))

(assert (=> bs!2772 m!52507))

(declare-fun m!52701 () Bool)

(assert (=> bs!2772 m!52701))

(assert (=> b!35074 d!10236))

(declare-fun b!35193 () Bool)

(declare-fun e!23269 () Unit!2589)

(declare-fun lt!52257 () Unit!2589)

(assert (=> b!35193 (= e!23269 lt!52257)))

(declare-fun lt!52253 () (_ BitVec 64))

(assert (=> b!35193 (= lt!52253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52255 () (_ BitVec 64))

(assert (=> b!35193 (= lt!52255 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1896 array!1896 (_ BitVec 64) (_ BitVec 64)) Unit!2589)

(assert (=> b!35193 (= lt!52257 (arrayBitRangesEqSymmetric!0 (buf!1171 (_2!1842 lt!52065)) (buf!1171 (_2!1842 lt!52082)) lt!52253 lt!52255))))

(assert (=> b!35193 (arrayBitRangesEq!0 (buf!1171 (_2!1842 lt!52082)) (buf!1171 (_2!1842 lt!52065)) lt!52253 lt!52255)))

(declare-fun b!35194 () Bool)

(declare-fun res!30058 () Bool)

(declare-fun e!23270 () Bool)

(assert (=> b!35194 (=> (not res!30058) (not e!23270))))

(declare-fun lt!52254 () tuple2!3512)

(assert (=> b!35194 (= res!30058 (isPrefixOf!0 (_2!1843 lt!52254) (_2!1842 lt!52082)))))

(declare-fun lt!52250 () (_ BitVec 64))

(declare-fun b!35195 () Bool)

(declare-fun lt!52251 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1466 (_ BitVec 64)) BitStream!1466)

(assert (=> b!35195 (= e!23270 (= (_1!1843 lt!52254) (withMovedBitIndex!0 (_2!1843 lt!52254) (bvsub lt!52250 lt!52251))))))

(assert (=> b!35195 (or (= (bvand lt!52250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52251 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52250 lt!52251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35195 (= lt!52251 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52082))) (currentByte!2550 (_2!1842 lt!52082)) (currentBit!2545 (_2!1842 lt!52082))))))

(assert (=> b!35195 (= lt!52250 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))))))

(declare-fun d!10238 () Bool)

(assert (=> d!10238 e!23270))

(declare-fun res!30059 () Bool)

(assert (=> d!10238 (=> (not res!30059) (not e!23270))))

(assert (=> d!10238 (= res!30059 (isPrefixOf!0 (_1!1843 lt!52254) (_2!1843 lt!52254)))))

(declare-fun lt!52264 () BitStream!1466)

(assert (=> d!10238 (= lt!52254 (tuple2!3513 lt!52264 (_2!1842 lt!52082)))))

(declare-fun lt!52262 () Unit!2589)

(declare-fun lt!52248 () Unit!2589)

(assert (=> d!10238 (= lt!52262 lt!52248)))

(assert (=> d!10238 (isPrefixOf!0 lt!52264 (_2!1842 lt!52082))))

(assert (=> d!10238 (= lt!52248 (lemmaIsPrefixTransitive!0 lt!52264 (_2!1842 lt!52082) (_2!1842 lt!52082)))))

(declare-fun lt!52256 () Unit!2589)

(declare-fun lt!52245 () Unit!2589)

(assert (=> d!10238 (= lt!52256 lt!52245)))

(assert (=> d!10238 (isPrefixOf!0 lt!52264 (_2!1842 lt!52082))))

(assert (=> d!10238 (= lt!52245 (lemmaIsPrefixTransitive!0 lt!52264 (_2!1842 lt!52065) (_2!1842 lt!52082)))))

(declare-fun lt!52261 () Unit!2589)

(assert (=> d!10238 (= lt!52261 e!23269)))

(declare-fun c!2368 () Bool)

(assert (=> d!10238 (= c!2368 (not (= (size!843 (buf!1171 (_2!1842 lt!52065))) #b00000000000000000000000000000000)))))

(declare-fun lt!52252 () Unit!2589)

(declare-fun lt!52249 () Unit!2589)

(assert (=> d!10238 (= lt!52252 lt!52249)))

(assert (=> d!10238 (isPrefixOf!0 (_2!1842 lt!52082) (_2!1842 lt!52082))))

(assert (=> d!10238 (= lt!52249 (lemmaIsPrefixRefl!0 (_2!1842 lt!52082)))))

(declare-fun lt!52246 () Unit!2589)

(declare-fun lt!52259 () Unit!2589)

(assert (=> d!10238 (= lt!52246 lt!52259)))

(assert (=> d!10238 (= lt!52259 (lemmaIsPrefixRefl!0 (_2!1842 lt!52082)))))

(declare-fun lt!52263 () Unit!2589)

(declare-fun lt!52258 () Unit!2589)

(assert (=> d!10238 (= lt!52263 lt!52258)))

(assert (=> d!10238 (isPrefixOf!0 lt!52264 lt!52264)))

(assert (=> d!10238 (= lt!52258 (lemmaIsPrefixRefl!0 lt!52264))))

(declare-fun lt!52260 () Unit!2589)

(declare-fun lt!52247 () Unit!2589)

(assert (=> d!10238 (= lt!52260 lt!52247)))

(assert (=> d!10238 (isPrefixOf!0 (_2!1842 lt!52065) (_2!1842 lt!52065))))

(assert (=> d!10238 (= lt!52247 (lemmaIsPrefixRefl!0 (_2!1842 lt!52065)))))

(assert (=> d!10238 (= lt!52264 (BitStream!1467 (buf!1171 (_2!1842 lt!52082)) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))))))

(assert (=> d!10238 (isPrefixOf!0 (_2!1842 lt!52065) (_2!1842 lt!52082))))

(assert (=> d!10238 (= (reader!0 (_2!1842 lt!52065) (_2!1842 lt!52082)) lt!52254)))

(declare-fun b!35196 () Bool)

(declare-fun Unit!2601 () Unit!2589)

(assert (=> b!35196 (= e!23269 Unit!2601)))

(declare-fun b!35197 () Bool)

(declare-fun res!30057 () Bool)

(assert (=> b!35197 (=> (not res!30057) (not e!23270))))

(assert (=> b!35197 (= res!30057 (isPrefixOf!0 (_1!1843 lt!52254) (_2!1842 lt!52065)))))

(assert (= (and d!10238 c!2368) b!35193))

(assert (= (and d!10238 (not c!2368)) b!35196))

(assert (= (and d!10238 res!30059) b!35197))

(assert (= (and b!35197 res!30057) b!35194))

(assert (= (and b!35194 res!30058) b!35195))

(assert (=> d!10238 m!52529))

(declare-fun m!52703 () Bool)

(assert (=> d!10238 m!52703))

(declare-fun m!52705 () Bool)

(assert (=> d!10238 m!52705))

(declare-fun m!52707 () Bool)

(assert (=> d!10238 m!52707))

(declare-fun m!52709 () Bool)

(assert (=> d!10238 m!52709))

(declare-fun m!52711 () Bool)

(assert (=> d!10238 m!52711))

(declare-fun m!52713 () Bool)

(assert (=> d!10238 m!52713))

(declare-fun m!52715 () Bool)

(assert (=> d!10238 m!52715))

(declare-fun m!52717 () Bool)

(assert (=> d!10238 m!52717))

(declare-fun m!52719 () Bool)

(assert (=> d!10238 m!52719))

(declare-fun m!52721 () Bool)

(assert (=> d!10238 m!52721))

(declare-fun m!52723 () Bool)

(assert (=> b!35195 m!52723))

(assert (=> b!35195 m!52521))

(assert (=> b!35195 m!52545))

(assert (=> b!35193 m!52545))

(declare-fun m!52725 () Bool)

(assert (=> b!35193 m!52725))

(declare-fun m!52727 () Bool)

(assert (=> b!35193 m!52727))

(declare-fun m!52729 () Bool)

(assert (=> b!35197 m!52729))

(declare-fun m!52731 () Bool)

(assert (=> b!35194 m!52731))

(assert (=> b!35074 d!10238))

(declare-fun d!10240 () Bool)

(assert (=> d!10240 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52079) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065)))) lt!52079))))

(declare-fun bs!2773 () Bool)

(assert (= bs!2773 d!10240))

(declare-fun m!52733 () Bool)

(assert (=> bs!2773 m!52733))

(assert (=> b!35074 d!10240))

(declare-fun b!35198 () Bool)

(declare-fun e!23271 () Unit!2589)

(declare-fun lt!52277 () Unit!2589)

(assert (=> b!35198 (= e!23271 lt!52277)))

(declare-fun lt!52273 () (_ BitVec 64))

(assert (=> b!35198 (= lt!52273 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52275 () (_ BitVec 64))

(assert (=> b!35198 (= lt!52275 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)))))

(assert (=> b!35198 (= lt!52277 (arrayBitRangesEqSymmetric!0 (buf!1171 thiss!1379) (buf!1171 (_2!1842 lt!52082)) lt!52273 lt!52275))))

(assert (=> b!35198 (arrayBitRangesEq!0 (buf!1171 (_2!1842 lt!52082)) (buf!1171 thiss!1379) lt!52273 lt!52275)))

(declare-fun b!35199 () Bool)

(declare-fun res!30061 () Bool)

(declare-fun e!23272 () Bool)

(assert (=> b!35199 (=> (not res!30061) (not e!23272))))

(declare-fun lt!52274 () tuple2!3512)

(assert (=> b!35199 (= res!30061 (isPrefixOf!0 (_2!1843 lt!52274) (_2!1842 lt!52082)))))

(declare-fun b!35200 () Bool)

(declare-fun lt!52270 () (_ BitVec 64))

(declare-fun lt!52271 () (_ BitVec 64))

(assert (=> b!35200 (= e!23272 (= (_1!1843 lt!52274) (withMovedBitIndex!0 (_2!1843 lt!52274) (bvsub lt!52270 lt!52271))))))

(assert (=> b!35200 (or (= (bvand lt!52270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52271 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52270 lt!52271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35200 (= lt!52271 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52082))) (currentByte!2550 (_2!1842 lt!52082)) (currentBit!2545 (_2!1842 lt!52082))))))

(assert (=> b!35200 (= lt!52270 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)))))

(declare-fun d!10242 () Bool)

(assert (=> d!10242 e!23272))

(declare-fun res!30062 () Bool)

(assert (=> d!10242 (=> (not res!30062) (not e!23272))))

(assert (=> d!10242 (= res!30062 (isPrefixOf!0 (_1!1843 lt!52274) (_2!1843 lt!52274)))))

(declare-fun lt!52284 () BitStream!1466)

(assert (=> d!10242 (= lt!52274 (tuple2!3513 lt!52284 (_2!1842 lt!52082)))))

(declare-fun lt!52282 () Unit!2589)

(declare-fun lt!52268 () Unit!2589)

(assert (=> d!10242 (= lt!52282 lt!52268)))

(assert (=> d!10242 (isPrefixOf!0 lt!52284 (_2!1842 lt!52082))))

(assert (=> d!10242 (= lt!52268 (lemmaIsPrefixTransitive!0 lt!52284 (_2!1842 lt!52082) (_2!1842 lt!52082)))))

(declare-fun lt!52276 () Unit!2589)

(declare-fun lt!52265 () Unit!2589)

(assert (=> d!10242 (= lt!52276 lt!52265)))

(assert (=> d!10242 (isPrefixOf!0 lt!52284 (_2!1842 lt!52082))))

(assert (=> d!10242 (= lt!52265 (lemmaIsPrefixTransitive!0 lt!52284 thiss!1379 (_2!1842 lt!52082)))))

(declare-fun lt!52281 () Unit!2589)

(assert (=> d!10242 (= lt!52281 e!23271)))

(declare-fun c!2369 () Bool)

(assert (=> d!10242 (= c!2369 (not (= (size!843 (buf!1171 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!52272 () Unit!2589)

(declare-fun lt!52269 () Unit!2589)

(assert (=> d!10242 (= lt!52272 lt!52269)))

(assert (=> d!10242 (isPrefixOf!0 (_2!1842 lt!52082) (_2!1842 lt!52082))))

(assert (=> d!10242 (= lt!52269 (lemmaIsPrefixRefl!0 (_2!1842 lt!52082)))))

(declare-fun lt!52266 () Unit!2589)

(declare-fun lt!52279 () Unit!2589)

(assert (=> d!10242 (= lt!52266 lt!52279)))

(assert (=> d!10242 (= lt!52279 (lemmaIsPrefixRefl!0 (_2!1842 lt!52082)))))

(declare-fun lt!52283 () Unit!2589)

(declare-fun lt!52278 () Unit!2589)

(assert (=> d!10242 (= lt!52283 lt!52278)))

(assert (=> d!10242 (isPrefixOf!0 lt!52284 lt!52284)))

(assert (=> d!10242 (= lt!52278 (lemmaIsPrefixRefl!0 lt!52284))))

(declare-fun lt!52280 () Unit!2589)

(declare-fun lt!52267 () Unit!2589)

(assert (=> d!10242 (= lt!52280 lt!52267)))

(assert (=> d!10242 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10242 (= lt!52267 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10242 (= lt!52284 (BitStream!1467 (buf!1171 (_2!1842 lt!52082)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)))))

(assert (=> d!10242 (isPrefixOf!0 thiss!1379 (_2!1842 lt!52082))))

(assert (=> d!10242 (= (reader!0 thiss!1379 (_2!1842 lt!52082)) lt!52274)))

(declare-fun b!35201 () Bool)

(declare-fun Unit!2602 () Unit!2589)

(assert (=> b!35201 (= e!23271 Unit!2602)))

(declare-fun b!35202 () Bool)

(declare-fun res!30060 () Bool)

(assert (=> b!35202 (=> (not res!30060) (not e!23272))))

(assert (=> b!35202 (= res!30060 (isPrefixOf!0 (_1!1843 lt!52274) thiss!1379))))

(assert (= (and d!10242 c!2369) b!35198))

(assert (= (and d!10242 (not c!2369)) b!35201))

(assert (= (and d!10242 res!30062) b!35202))

(assert (= (and b!35202 res!30060) b!35199))

(assert (= (and b!35199 res!30061) b!35200))

(assert (=> d!10242 m!52527))

(declare-fun m!52735 () Bool)

(assert (=> d!10242 m!52735))

(declare-fun m!52737 () Bool)

(assert (=> d!10242 m!52737))

(assert (=> d!10242 m!52707))

(declare-fun m!52739 () Bool)

(assert (=> d!10242 m!52739))

(declare-fun m!52741 () Bool)

(assert (=> d!10242 m!52741))

(assert (=> d!10242 m!52571))

(declare-fun m!52743 () Bool)

(assert (=> d!10242 m!52743))

(declare-fun m!52745 () Bool)

(assert (=> d!10242 m!52745))

(assert (=> d!10242 m!52569))

(assert (=> d!10242 m!52721))

(declare-fun m!52747 () Bool)

(assert (=> b!35200 m!52747))

(assert (=> b!35200 m!52521))

(assert (=> b!35200 m!52573))

(assert (=> b!35198 m!52573))

(declare-fun m!52749 () Bool)

(assert (=> b!35198 m!52749))

(declare-fun m!52751 () Bool)

(assert (=> b!35198 m!52751))

(declare-fun m!52753 () Bool)

(assert (=> b!35202 m!52753))

(declare-fun m!52755 () Bool)

(assert (=> b!35199 m!52755))

(assert (=> b!35074 d!10242))

(declare-fun b!35203 () Bool)

(declare-fun e!23274 () tuple2!3522)

(assert (=> b!35203 (= e!23274 (tuple2!3523 Nil!431 (_1!1843 lt!52081)))))

(declare-fun lt!52287 () (_ BitVec 64))

(declare-fun b!35204 () Bool)

(declare-fun lt!52285 () tuple2!3524)

(assert (=> b!35204 (= e!23274 (tuple2!3523 (Cons!430 (_1!1849 lt!52285) (bitStreamReadBitsIntoList!0 (_2!1842 lt!52082) (_2!1849 lt!52285) (bvsub lt!52079 lt!52287))) (_2!1849 lt!52285)))))

(assert (=> b!35204 (= lt!52285 (readBit!0 (_1!1843 lt!52081)))))

(assert (=> b!35204 (= lt!52287 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10244 () Bool)

(declare-fun e!23273 () Bool)

(assert (=> d!10244 e!23273))

(declare-fun c!2370 () Bool)

(assert (=> d!10244 (= c!2370 (= lt!52079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!52286 () List!434)

(assert (=> d!10244 (= lt!52286 (_1!1848 e!23274))))

(declare-fun c!2371 () Bool)

(assert (=> d!10244 (= c!2371 (= lt!52079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10244 (bvsge lt!52079 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10244 (= (bitStreamReadBitsIntoList!0 (_2!1842 lt!52082) (_1!1843 lt!52081) lt!52079) lt!52286)))

(declare-fun b!35206 () Bool)

(assert (=> b!35206 (= e!23273 (> (length!160 lt!52286) 0))))

(declare-fun b!35205 () Bool)

(assert (=> b!35205 (= e!23273 (isEmpty!96 lt!52286))))

(assert (= (and d!10244 c!2371) b!35203))

(assert (= (and d!10244 (not c!2371)) b!35204))

(assert (= (and d!10244 c!2370) b!35205))

(assert (= (and d!10244 (not c!2370)) b!35206))

(declare-fun m!52757 () Bool)

(assert (=> b!35204 m!52757))

(declare-fun m!52759 () Bool)

(assert (=> b!35204 m!52759))

(declare-fun m!52761 () Bool)

(assert (=> b!35206 m!52761))

(declare-fun m!52763 () Bool)

(assert (=> b!35205 m!52763))

(assert (=> b!35074 d!10244))

(declare-fun b!35207 () Bool)

(declare-fun e!23276 () tuple2!3522)

(assert (=> b!35207 (= e!23276 (tuple2!3523 Nil!431 (_1!1843 lt!52084)))))

(declare-fun lt!52290 () (_ BitVec 64))

(declare-fun b!35208 () Bool)

(declare-fun lt!52288 () tuple2!3524)

(assert (=> b!35208 (= e!23276 (tuple2!3523 (Cons!430 (_1!1849 lt!52288) (bitStreamReadBitsIntoList!0 (_2!1842 lt!52082) (_2!1849 lt!52288) (bvsub (bvsub to!314 i!635) lt!52290))) (_2!1849 lt!52288)))))

(assert (=> b!35208 (= lt!52288 (readBit!0 (_1!1843 lt!52084)))))

(assert (=> b!35208 (= lt!52290 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10246 () Bool)

(declare-fun e!23275 () Bool)

(assert (=> d!10246 e!23275))

(declare-fun c!2372 () Bool)

(assert (=> d!10246 (= c!2372 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!52289 () List!434)

(assert (=> d!10246 (= lt!52289 (_1!1848 e!23276))))

(declare-fun c!2373 () Bool)

(assert (=> d!10246 (= c!2373 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10246 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10246 (= (bitStreamReadBitsIntoList!0 (_2!1842 lt!52082) (_1!1843 lt!52084) (bvsub to!314 i!635)) lt!52289)))

(declare-fun b!35210 () Bool)

(assert (=> b!35210 (= e!23275 (> (length!160 lt!52289) 0))))

(declare-fun b!35209 () Bool)

(assert (=> b!35209 (= e!23275 (isEmpty!96 lt!52289))))

(assert (= (and d!10246 c!2373) b!35207))

(assert (= (and d!10246 (not c!2373)) b!35208))

(assert (= (and d!10246 c!2372) b!35209))

(assert (= (and d!10246 (not c!2372)) b!35210))

(declare-fun m!52765 () Bool)

(assert (=> b!35208 m!52765))

(declare-fun m!52767 () Bool)

(assert (=> b!35208 m!52767))

(declare-fun m!52769 () Bool)

(assert (=> b!35210 m!52769))

(declare-fun m!52771 () Bool)

(assert (=> b!35209 m!52771))

(assert (=> b!35074 d!10246))

(declare-fun d!10248 () Bool)

(assert (=> d!10248 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!52291 () Unit!2589)

(assert (=> d!10248 (= lt!52291 (choose!9 thiss!1379 (buf!1171 (_2!1842 lt!52082)) (bvsub to!314 i!635) (BitStream!1467 (buf!1171 (_2!1842 lt!52082)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379))))))

(assert (=> d!10248 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1171 (_2!1842 lt!52082)) (bvsub to!314 i!635)) lt!52291)))

(declare-fun bs!2774 () Bool)

(assert (= bs!2774 d!10248))

(assert (=> bs!2774 m!52501))

(declare-fun m!52773 () Bool)

(assert (=> bs!2774 m!52773))

(assert (=> b!35074 d!10248))

(declare-fun d!10250 () Bool)

(assert (=> d!10250 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2775 () Bool)

(assert (= bs!2775 d!10250))

(declare-fun m!52775 () Bool)

(assert (=> bs!2775 m!52775))

(assert (=> b!35074 d!10250))

(declare-fun d!10252 () Bool)

(assert (=> d!10252 (= (bitAt!0 (buf!1171 (_2!1842 lt!52082)) lt!52071) (not (= (bvand ((_ sign_extend 24) (select (arr!1324 (buf!1171 (_2!1842 lt!52082))) ((_ extract 31 0) (bvsdiv lt!52071 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!52071 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2776 () Bool)

(assert (= bs!2776 d!10252))

(declare-fun m!52777 () Bool)

(assert (=> bs!2776 m!52777))

(assert (=> bs!2776 m!52689))

(assert (=> b!35076 d!10252))

(declare-fun d!10254 () Bool)

(assert (=> d!10254 (= (bitAt!0 (buf!1171 (_2!1842 lt!52065)) lt!52071) (bitAt!0 (buf!1171 (_2!1842 lt!52082)) lt!52071))))

(declare-fun lt!52294 () Unit!2589)

(declare-fun choose!31 (array!1896 array!1896 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2589)

(assert (=> d!10254 (= lt!52294 (choose!31 (buf!1171 (_2!1842 lt!52065)) (buf!1171 (_2!1842 lt!52082)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52071 lt!52083))))

(assert (=> d!10254 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52083))))

(assert (=> d!10254 (= (arrayBitRangesEqImpliesEq!0 (buf!1171 (_2!1842 lt!52065)) (buf!1171 (_2!1842 lt!52082)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52071 lt!52083) lt!52294)))

(declare-fun bs!2777 () Bool)

(assert (= bs!2777 d!10254))

(assert (=> bs!2777 m!52541))

(assert (=> bs!2777 m!52589))

(declare-fun m!52779 () Bool)

(assert (=> bs!2777 m!52779))

(assert (=> b!35076 d!10254))

(declare-fun d!10256 () Bool)

(assert (=> d!10256 (= (tail!151 lt!52077) (t!1184 lt!52077))))

(assert (=> b!35065 d!10256))

(declare-fun d!10258 () Bool)

(declare-fun e!23279 () Bool)

(assert (=> d!10258 e!23279))

(declare-fun res!30065 () Bool)

(assert (=> d!10258 (=> (not res!30065) (not e!23279))))

(declare-fun lt!52300 () (_ BitVec 64))

(assert (=> d!10258 (= res!30065 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!52300) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10258 (= lt!52300 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52299 () Unit!2589)

(declare-fun choose!42 (BitStream!1466 BitStream!1466 BitStream!1466 BitStream!1466 (_ BitVec 64) List!434) Unit!2589)

(assert (=> d!10258 (= lt!52299 (choose!42 (_2!1842 lt!52082) (_2!1842 lt!52082) (_1!1843 lt!52084) (_1!1843 lt!52081) (bvsub to!314 i!635) lt!52077))))

(assert (=> d!10258 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10258 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1842 lt!52082) (_2!1842 lt!52082) (_1!1843 lt!52084) (_1!1843 lt!52081) (bvsub to!314 i!635) lt!52077) lt!52299)))

(declare-fun b!35213 () Bool)

(assert (=> b!35213 (= e!23279 (= (bitStreamReadBitsIntoList!0 (_2!1842 lt!52082) (_1!1843 lt!52081) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!151 lt!52077)))))

(assert (= (and d!10258 res!30065) b!35213))

(declare-fun m!52781 () Bool)

(assert (=> d!10258 m!52781))

(declare-fun m!52783 () Bool)

(assert (=> b!35213 m!52783))

(assert (=> b!35213 m!52583))

(assert (=> b!35065 d!10258))

(declare-fun d!10260 () Bool)

(assert (=> d!10260 (= (bitAt!0 (buf!1171 (_1!1843 lt!52081)) lt!52071) (not (= (bvand ((_ sign_extend 24) (select (arr!1324 (buf!1171 (_1!1843 lt!52081))) ((_ extract 31 0) (bvsdiv lt!52071 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!52071 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2778 () Bool)

(assert (= bs!2778 d!10260))

(declare-fun m!52785 () Bool)

(assert (=> bs!2778 m!52785))

(assert (=> bs!2778 m!52689))

(assert (=> b!35067 d!10260))

(declare-fun d!10262 () Bool)

(assert (=> d!10262 (= (bitAt!0 (buf!1171 (_1!1843 lt!52084)) lt!52071) (not (= (bvand ((_ sign_extend 24) (select (arr!1324 (buf!1171 (_1!1843 lt!52084))) ((_ extract 31 0) (bvsdiv lt!52071 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!52071 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2779 () Bool)

(assert (= bs!2779 d!10262))

(declare-fun m!52787 () Bool)

(assert (=> bs!2779 m!52787))

(assert (=> bs!2779 m!52689))

(assert (=> b!35067 d!10262))

(declare-fun d!10264 () Bool)

(declare-fun e!23280 () Bool)

(assert (=> d!10264 e!23280))

(declare-fun res!30067 () Bool)

(assert (=> d!10264 (=> (not res!30067) (not e!23280))))

(declare-fun lt!52302 () (_ BitVec 64))

(declare-fun lt!52306 () (_ BitVec 64))

(declare-fun lt!52303 () (_ BitVec 64))

(assert (=> d!10264 (= res!30067 (= lt!52303 (bvsub lt!52302 lt!52306)))))

(assert (=> d!10264 (or (= (bvand lt!52302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52306 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52302 lt!52306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10264 (= lt!52306 (remainingBits!0 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52082))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52082)))))))

(declare-fun lt!52305 () (_ BitVec 64))

(declare-fun lt!52304 () (_ BitVec 64))

(assert (=> d!10264 (= lt!52302 (bvmul lt!52305 lt!52304))))

(assert (=> d!10264 (or (= lt!52305 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!52304 (bvsdiv (bvmul lt!52305 lt!52304) lt!52305)))))

(assert (=> d!10264 (= lt!52304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10264 (= lt!52305 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))))))

(assert (=> d!10264 (= lt!52303 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52082))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52082)))))))

(assert (=> d!10264 (invariant!0 (currentBit!2545 (_2!1842 lt!52082)) (currentByte!2550 (_2!1842 lt!52082)) (size!843 (buf!1171 (_2!1842 lt!52082))))))

(assert (=> d!10264 (= (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52082))) (currentByte!2550 (_2!1842 lt!52082)) (currentBit!2545 (_2!1842 lt!52082))) lt!52303)))

(declare-fun b!35214 () Bool)

(declare-fun res!30066 () Bool)

(assert (=> b!35214 (=> (not res!30066) (not e!23280))))

(assert (=> b!35214 (= res!30066 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!52303))))

(declare-fun b!35215 () Bool)

(declare-fun lt!52301 () (_ BitVec 64))

(assert (=> b!35215 (= e!23280 (bvsle lt!52303 (bvmul lt!52301 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35215 (or (= lt!52301 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!52301 #b0000000000000000000000000000000000000000000000000000000000001000) lt!52301)))))

(assert (=> b!35215 (= lt!52301 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52082)))))))

(assert (= (and d!10264 res!30067) b!35214))

(assert (= (and b!35214 res!30066) b!35215))

(declare-fun m!52789 () Bool)

(assert (=> d!10264 m!52789))

(assert (=> d!10264 m!52581))

(assert (=> b!35077 d!10264))

(declare-fun d!10266 () Bool)

(declare-fun size!845 (List!434) Int)

(assert (=> d!10266 (= (length!160 lt!52077) (size!845 lt!52077))))

(declare-fun bs!2780 () Bool)

(assert (= bs!2780 d!10266))

(declare-fun m!52791 () Bool)

(assert (=> bs!2780 m!52791))

(assert (=> b!35066 d!10266))

(declare-fun b!35216 () Bool)

(declare-fun e!23281 () Unit!2589)

(declare-fun lt!52319 () Unit!2589)

(assert (=> b!35216 (= e!23281 lt!52319)))

(declare-fun lt!52315 () (_ BitVec 64))

(assert (=> b!35216 (= lt!52315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!52317 () (_ BitVec 64))

(assert (=> b!35216 (= lt!52317 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)))))

(assert (=> b!35216 (= lt!52319 (arrayBitRangesEqSymmetric!0 (buf!1171 thiss!1379) (buf!1171 (_2!1842 lt!52065)) lt!52315 lt!52317))))

(assert (=> b!35216 (arrayBitRangesEq!0 (buf!1171 (_2!1842 lt!52065)) (buf!1171 thiss!1379) lt!52315 lt!52317)))

(declare-fun b!35217 () Bool)

(declare-fun res!30069 () Bool)

(declare-fun e!23282 () Bool)

(assert (=> b!35217 (=> (not res!30069) (not e!23282))))

(declare-fun lt!52316 () tuple2!3512)

(assert (=> b!35217 (= res!30069 (isPrefixOf!0 (_2!1843 lt!52316) (_2!1842 lt!52065)))))

(declare-fun lt!52312 () (_ BitVec 64))

(declare-fun b!35218 () Bool)

(declare-fun lt!52313 () (_ BitVec 64))

(assert (=> b!35218 (= e!23282 (= (_1!1843 lt!52316) (withMovedBitIndex!0 (_2!1843 lt!52316) (bvsub lt!52312 lt!52313))))))

(assert (=> b!35218 (or (= (bvand lt!52312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!52313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52312 lt!52313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35218 (= lt!52313 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))))))

(assert (=> b!35218 (= lt!52312 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)))))

(declare-fun d!10268 () Bool)

(assert (=> d!10268 e!23282))

(declare-fun res!30070 () Bool)

(assert (=> d!10268 (=> (not res!30070) (not e!23282))))

(assert (=> d!10268 (= res!30070 (isPrefixOf!0 (_1!1843 lt!52316) (_2!1843 lt!52316)))))

(declare-fun lt!52326 () BitStream!1466)

(assert (=> d!10268 (= lt!52316 (tuple2!3513 lt!52326 (_2!1842 lt!52065)))))

(declare-fun lt!52324 () Unit!2589)

(declare-fun lt!52310 () Unit!2589)

(assert (=> d!10268 (= lt!52324 lt!52310)))

(assert (=> d!10268 (isPrefixOf!0 lt!52326 (_2!1842 lt!52065))))

(assert (=> d!10268 (= lt!52310 (lemmaIsPrefixTransitive!0 lt!52326 (_2!1842 lt!52065) (_2!1842 lt!52065)))))

(declare-fun lt!52318 () Unit!2589)

(declare-fun lt!52307 () Unit!2589)

(assert (=> d!10268 (= lt!52318 lt!52307)))

(assert (=> d!10268 (isPrefixOf!0 lt!52326 (_2!1842 lt!52065))))

(assert (=> d!10268 (= lt!52307 (lemmaIsPrefixTransitive!0 lt!52326 thiss!1379 (_2!1842 lt!52065)))))

(declare-fun lt!52323 () Unit!2589)

(assert (=> d!10268 (= lt!52323 e!23281)))

(declare-fun c!2374 () Bool)

(assert (=> d!10268 (= c!2374 (not (= (size!843 (buf!1171 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!52314 () Unit!2589)

(declare-fun lt!52311 () Unit!2589)

(assert (=> d!10268 (= lt!52314 lt!52311)))

(assert (=> d!10268 (isPrefixOf!0 (_2!1842 lt!52065) (_2!1842 lt!52065))))

(assert (=> d!10268 (= lt!52311 (lemmaIsPrefixRefl!0 (_2!1842 lt!52065)))))

(declare-fun lt!52308 () Unit!2589)

(declare-fun lt!52321 () Unit!2589)

(assert (=> d!10268 (= lt!52308 lt!52321)))

(assert (=> d!10268 (= lt!52321 (lemmaIsPrefixRefl!0 (_2!1842 lt!52065)))))

(declare-fun lt!52325 () Unit!2589)

(declare-fun lt!52320 () Unit!2589)

(assert (=> d!10268 (= lt!52325 lt!52320)))

(assert (=> d!10268 (isPrefixOf!0 lt!52326 lt!52326)))

(assert (=> d!10268 (= lt!52320 (lemmaIsPrefixRefl!0 lt!52326))))

(declare-fun lt!52322 () Unit!2589)

(declare-fun lt!52309 () Unit!2589)

(assert (=> d!10268 (= lt!52322 lt!52309)))

(assert (=> d!10268 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10268 (= lt!52309 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10268 (= lt!52326 (BitStream!1467 (buf!1171 (_2!1842 lt!52065)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)))))

(assert (=> d!10268 (isPrefixOf!0 thiss!1379 (_2!1842 lt!52065))))

(assert (=> d!10268 (= (reader!0 thiss!1379 (_2!1842 lt!52065)) lt!52316)))

(declare-fun b!35219 () Bool)

(declare-fun Unit!2603 () Unit!2589)

(assert (=> b!35219 (= e!23281 Unit!2603)))

(declare-fun b!35220 () Bool)

(declare-fun res!30068 () Bool)

(assert (=> b!35220 (=> (not res!30068) (not e!23282))))

(assert (=> b!35220 (= res!30068 (isPrefixOf!0 (_1!1843 lt!52316) thiss!1379))))

(assert (= (and d!10268 c!2374) b!35216))

(assert (= (and d!10268 (not c!2374)) b!35219))

(assert (= (and d!10268 res!30070) b!35220))

(assert (= (and b!35220 res!30068) b!35217))

(assert (= (and b!35217 res!30069) b!35218))

(assert (=> d!10268 m!52551))

(declare-fun m!52793 () Bool)

(assert (=> d!10268 m!52793))

(declare-fun m!52795 () Bool)

(assert (=> d!10268 m!52795))

(assert (=> d!10268 m!52713))

(declare-fun m!52797 () Bool)

(assert (=> d!10268 m!52797))

(declare-fun m!52799 () Bool)

(assert (=> d!10268 m!52799))

(assert (=> d!10268 m!52571))

(declare-fun m!52801 () Bool)

(assert (=> d!10268 m!52801))

(declare-fun m!52803 () Bool)

(assert (=> d!10268 m!52803))

(assert (=> d!10268 m!52569))

(assert (=> d!10268 m!52719))

(declare-fun m!52805 () Bool)

(assert (=> b!35218 m!52805))

(assert (=> b!35218 m!52545))

(assert (=> b!35218 m!52573))

(assert (=> b!35216 m!52573))

(declare-fun m!52807 () Bool)

(assert (=> b!35216 m!52807))

(declare-fun m!52809 () Bool)

(assert (=> b!35216 m!52809))

(declare-fun m!52811 () Bool)

(assert (=> b!35220 m!52811))

(declare-fun m!52813 () Bool)

(assert (=> b!35217 m!52813))

(assert (=> b!35068 d!10268))

(declare-fun d!10270 () Bool)

(declare-fun res!30073 () Bool)

(declare-fun e!23283 () Bool)

(assert (=> d!10270 (=> (not res!30073) (not e!23283))))

(assert (=> d!10270 (= res!30073 (= (size!843 (buf!1171 thiss!1379)) (size!843 (buf!1171 (_2!1842 lt!52082)))))))

(assert (=> d!10270 (= (isPrefixOf!0 thiss!1379 (_2!1842 lt!52082)) e!23283)))

(declare-fun b!35221 () Bool)

(declare-fun res!30072 () Bool)

(assert (=> b!35221 (=> (not res!30072) (not e!23283))))

(assert (=> b!35221 (= res!30072 (bvsle (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379)) (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52082))) (currentByte!2550 (_2!1842 lt!52082)) (currentBit!2545 (_2!1842 lt!52082)))))))

(declare-fun b!35222 () Bool)

(declare-fun e!23284 () Bool)

(assert (=> b!35222 (= e!23283 e!23284)))

(declare-fun res!30071 () Bool)

(assert (=> b!35222 (=> res!30071 e!23284)))

(assert (=> b!35222 (= res!30071 (= (size!843 (buf!1171 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35223 () Bool)

(assert (=> b!35223 (= e!23284 (arrayBitRangesEq!0 (buf!1171 thiss!1379) (buf!1171 (_2!1842 lt!52082)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!843 (buf!1171 thiss!1379)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379))))))

(assert (= (and d!10270 res!30073) b!35221))

(assert (= (and b!35221 res!30072) b!35222))

(assert (= (and b!35222 (not res!30071)) b!35223))

(assert (=> b!35221 m!52573))

(assert (=> b!35221 m!52521))

(assert (=> b!35223 m!52573))

(assert (=> b!35223 m!52573))

(declare-fun m!52815 () Bool)

(assert (=> b!35223 m!52815))

(assert (=> b!35068 d!10270))

(declare-fun d!10272 () Bool)

(declare-fun res!30076 () Bool)

(declare-fun e!23285 () Bool)

(assert (=> d!10272 (=> (not res!30076) (not e!23285))))

(assert (=> d!10272 (= res!30076 (= (size!843 (buf!1171 (_2!1842 lt!52065))) (size!843 (buf!1171 (_2!1842 lt!52082)))))))

(assert (=> d!10272 (= (isPrefixOf!0 (_2!1842 lt!52065) (_2!1842 lt!52082)) e!23285)))

(declare-fun b!35224 () Bool)

(declare-fun res!30075 () Bool)

(assert (=> b!35224 (=> (not res!30075) (not e!23285))))

(assert (=> b!35224 (= res!30075 (bvsle (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))) (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52082))) (currentByte!2550 (_2!1842 lt!52082)) (currentBit!2545 (_2!1842 lt!52082)))))))

(declare-fun b!35225 () Bool)

(declare-fun e!23286 () Bool)

(assert (=> b!35225 (= e!23285 e!23286)))

(declare-fun res!30074 () Bool)

(assert (=> b!35225 (=> res!30074 e!23286)))

(assert (=> b!35225 (= res!30074 (= (size!843 (buf!1171 (_2!1842 lt!52065))) #b00000000000000000000000000000000))))

(declare-fun b!35226 () Bool)

(assert (=> b!35226 (= e!23286 (arrayBitRangesEq!0 (buf!1171 (_2!1842 lt!52065)) (buf!1171 (_2!1842 lt!52082)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065)))))))

(assert (= (and d!10272 res!30076) b!35224))

(assert (= (and b!35224 res!30075) b!35225))

(assert (= (and b!35225 (not res!30074)) b!35226))

(assert (=> b!35224 m!52545))

(assert (=> b!35224 m!52521))

(assert (=> b!35226 m!52545))

(assert (=> b!35226 m!52545))

(declare-fun m!52817 () Bool)

(assert (=> b!35226 m!52817))

(assert (=> b!35068 d!10272))

(declare-fun d!10274 () Bool)

(assert (=> d!10274 (isPrefixOf!0 thiss!1379 (_2!1842 lt!52082))))

(declare-fun lt!52329 () Unit!2589)

(declare-fun choose!30 (BitStream!1466 BitStream!1466 BitStream!1466) Unit!2589)

(assert (=> d!10274 (= lt!52329 (choose!30 thiss!1379 (_2!1842 lt!52065) (_2!1842 lt!52082)))))

(assert (=> d!10274 (isPrefixOf!0 thiss!1379 (_2!1842 lt!52065))))

(assert (=> d!10274 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1842 lt!52065) (_2!1842 lt!52082)) lt!52329)))

(declare-fun bs!2781 () Bool)

(assert (= bs!2781 d!10274))

(assert (=> bs!2781 m!52527))

(declare-fun m!52819 () Bool)

(assert (=> bs!2781 m!52819))

(assert (=> bs!2781 m!52551))

(assert (=> b!35068 d!10274))

(declare-fun b!35375 () Bool)

(declare-fun res!30173 () Bool)

(declare-fun e!23360 () Bool)

(assert (=> b!35375 (=> (not res!30173) (not e!23360))))

(declare-fun lt!52843 () tuple2!3510)

(assert (=> b!35375 (= res!30173 (isPrefixOf!0 (_2!1842 lt!52065) (_2!1842 lt!52843)))))

(declare-fun b!35376 () Bool)

(declare-fun res!30175 () Bool)

(assert (=> b!35376 (=> (not res!30175) (not e!23360))))

(assert (=> b!35376 (= res!30175 (= (size!843 (buf!1171 (_2!1842 lt!52065))) (size!843 (buf!1171 (_2!1842 lt!52843)))))))

(declare-fun b!35377 () Bool)

(declare-fun e!23358 () Bool)

(declare-fun lt!52847 () (_ BitVec 64))

(assert (=> b!35377 (= e!23358 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52847))))

(declare-fun b!35378 () Bool)

(declare-fun e!23359 () tuple2!3510)

(declare-fun Unit!2604 () Unit!2589)

(assert (=> b!35378 (= e!23359 (tuple2!3511 Unit!2604 (_2!1842 lt!52065)))))

(assert (=> b!35378 (= (size!843 (buf!1171 (_2!1842 lt!52065))) (size!843 (buf!1171 (_2!1842 lt!52065))))))

(declare-fun lt!52830 () Unit!2589)

(declare-fun Unit!2605 () Unit!2589)

(assert (=> b!35378 (= lt!52830 Unit!2605)))

(declare-fun call!442 () tuple2!3512)

(declare-fun checkByteArrayBitContent!0 (BitStream!1466 array!1896 array!1896 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35378 (checkByteArrayBitContent!0 (_2!1842 lt!52065) srcBuffer!2 (_1!1847 (readBits!0 (_1!1843 call!442) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!35379 () Bool)

(declare-fun lt!52839 () tuple2!3512)

(assert (=> b!35379 (= e!23360 (= (bitStreamReadBitsIntoList!0 (_2!1842 lt!52843) (_1!1843 lt!52839) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1842 lt!52843) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!35379 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35379 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!52845 () Unit!2589)

(declare-fun lt!52834 () Unit!2589)

(assert (=> b!35379 (= lt!52845 lt!52834)))

(assert (=> b!35379 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52843)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52847)))

(assert (=> b!35379 (= lt!52834 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1842 lt!52065) (buf!1171 (_2!1842 lt!52843)) lt!52847))))

(assert (=> b!35379 e!23358))

(declare-fun res!30176 () Bool)

(assert (=> b!35379 (=> (not res!30176) (not e!23358))))

(assert (=> b!35379 (= res!30176 (and (= (size!843 (buf!1171 (_2!1842 lt!52065))) (size!843 (buf!1171 (_2!1842 lt!52843)))) (bvsge lt!52847 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35379 (= lt!52847 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!35379 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35379 (= lt!52839 (reader!0 (_2!1842 lt!52065) (_2!1842 lt!52843)))))

(declare-fun c!2402 () Bool)

(declare-fun lt!52837 () tuple2!3510)

(declare-fun bm!439 () Bool)

(declare-fun lt!52822 () tuple2!3510)

(assert (=> bm!439 (= call!442 (reader!0 (ite c!2402 (_2!1842 lt!52837) (_2!1842 lt!52065)) (ite c!2402 (_2!1842 lt!52822) (_2!1842 lt!52065))))))

(declare-fun b!35380 () Bool)

(declare-fun res!30174 () Bool)

(assert (=> b!35380 (=> (not res!30174) (not e!23360))))

(assert (=> b!35380 (= res!30174 (invariant!0 (currentBit!2545 (_2!1842 lt!52843)) (currentByte!2550 (_2!1842 lt!52843)) (size!843 (buf!1171 (_2!1842 lt!52843)))))))

(declare-fun d!10276 () Bool)

(assert (=> d!10276 e!23360))

(declare-fun res!30172 () Bool)

(assert (=> d!10276 (=> (not res!30172) (not e!23360))))

(declare-fun lt!52819 () (_ BitVec 64))

(assert (=> d!10276 (= res!30172 (= (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52843))) (currentByte!2550 (_2!1842 lt!52843)) (currentBit!2545 (_2!1842 lt!52843))) (bvsub lt!52819 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10276 (or (= (bvand lt!52819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!52819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!52819 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!52816 () (_ BitVec 64))

(assert (=> d!10276 (= lt!52819 (bvadd lt!52816 to!314))))

(assert (=> d!10276 (or (not (= (bvand lt!52816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!52816 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!52816 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10276 (= lt!52816 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))))))

(assert (=> d!10276 (= lt!52843 e!23359)))

(assert (=> d!10276 (= c!2402 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!52812 () Unit!2589)

(declare-fun lt!52807 () Unit!2589)

(assert (=> d!10276 (= lt!52812 lt!52807)))

(assert (=> d!10276 (isPrefixOf!0 (_2!1842 lt!52065) (_2!1842 lt!52065))))

(assert (=> d!10276 (= lt!52807 (lemmaIsPrefixRefl!0 (_2!1842 lt!52065)))))

(declare-fun lt!52818 () (_ BitVec 64))

(assert (=> d!10276 (= lt!52818 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))))))

(assert (=> d!10276 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10276 (= (appendBitsMSBFirstLoop!0 (_2!1842 lt!52065) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!52843)))

(declare-fun b!35381 () Bool)

(declare-fun res!30171 () Bool)

(assert (=> b!35381 (=> (not res!30171) (not e!23360))))

(assert (=> b!35381 (= res!30171 (= (size!843 (buf!1171 (_2!1842 lt!52843))) (size!843 (buf!1171 (_2!1842 lt!52065)))))))

(declare-fun b!35382 () Bool)

(declare-fun Unit!2606 () Unit!2589)

(assert (=> b!35382 (= e!23359 (tuple2!3511 Unit!2606 (_2!1842 lt!52822)))))

(assert (=> b!35382 (= lt!52837 (appendBitFromByte!0 (_2!1842 lt!52065) (select (arr!1324 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!52813 () (_ BitVec 64))

(assert (=> b!35382 (= lt!52813 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52841 () (_ BitVec 64))

(assert (=> b!35382 (= lt!52841 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52823 () Unit!2589)

(assert (=> b!35382 (= lt!52823 (validateOffsetBitsIneqLemma!0 (_2!1842 lt!52065) (_2!1842 lt!52837) lt!52813 lt!52841))))

(assert (=> b!35382 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52837)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52837))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52837))) (bvsub lt!52813 lt!52841))))

(declare-fun lt!52808 () Unit!2589)

(assert (=> b!35382 (= lt!52808 lt!52823)))

(declare-fun lt!52842 () tuple2!3512)

(assert (=> b!35382 (= lt!52842 (reader!0 (_2!1842 lt!52065) (_2!1842 lt!52837)))))

(declare-fun lt!52833 () (_ BitVec 64))

(assert (=> b!35382 (= lt!52833 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52838 () Unit!2589)

(assert (=> b!35382 (= lt!52838 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1842 lt!52065) (buf!1171 (_2!1842 lt!52837)) lt!52833))))

(assert (=> b!35382 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52837)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52833)))

(declare-fun lt!52815 () Unit!2589)

(assert (=> b!35382 (= lt!52815 lt!52838)))

(assert (=> b!35382 (= (head!271 (byteArrayBitContentToList!0 (_2!1842 lt!52837) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!271 (bitStreamReadBitsIntoList!0 (_2!1842 lt!52837) (_1!1843 lt!52842) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52831 () Unit!2589)

(declare-fun Unit!2607 () Unit!2589)

(assert (=> b!35382 (= lt!52831 Unit!2607)))

(assert (=> b!35382 (= lt!52822 (appendBitsMSBFirstLoop!0 (_2!1842 lt!52837) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!52805 () Unit!2589)

(assert (=> b!35382 (= lt!52805 (lemmaIsPrefixTransitive!0 (_2!1842 lt!52065) (_2!1842 lt!52837) (_2!1842 lt!52822)))))

(assert (=> b!35382 (isPrefixOf!0 (_2!1842 lt!52065) (_2!1842 lt!52822))))

(declare-fun lt!52814 () Unit!2589)

(assert (=> b!35382 (= lt!52814 lt!52805)))

(assert (=> b!35382 (= (size!843 (buf!1171 (_2!1842 lt!52822))) (size!843 (buf!1171 (_2!1842 lt!52065))))))

(declare-fun lt!52828 () Unit!2589)

(declare-fun Unit!2608 () Unit!2589)

(assert (=> b!35382 (= lt!52828 Unit!2608)))

(assert (=> b!35382 (= (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52822))) (currentByte!2550 (_2!1842 lt!52822)) (currentBit!2545 (_2!1842 lt!52822))) (bvsub (bvadd (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52065))) (currentByte!2550 (_2!1842 lt!52065)) (currentBit!2545 (_2!1842 lt!52065))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52811 () Unit!2589)

(declare-fun Unit!2609 () Unit!2589)

(assert (=> b!35382 (= lt!52811 Unit!2609)))

(assert (=> b!35382 (= (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52822))) (currentByte!2550 (_2!1842 lt!52822)) (currentBit!2545 (_2!1842 lt!52822))) (bvsub (bvsub (bvadd (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52837))) (currentByte!2550 (_2!1842 lt!52837)) (currentBit!2545 (_2!1842 lt!52837))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52826 () Unit!2589)

(declare-fun Unit!2610 () Unit!2589)

(assert (=> b!35382 (= lt!52826 Unit!2610)))

(declare-fun lt!52827 () tuple2!3512)

(assert (=> b!35382 (= lt!52827 (reader!0 (_2!1842 lt!52065) (_2!1842 lt!52822)))))

(declare-fun lt!52848 () (_ BitVec 64))

(assert (=> b!35382 (= lt!52848 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52825 () Unit!2589)

(assert (=> b!35382 (= lt!52825 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1842 lt!52065) (buf!1171 (_2!1842 lt!52822)) lt!52848))))

(assert (=> b!35382 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52822)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52065))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52065))) lt!52848)))

(declare-fun lt!52824 () Unit!2589)

(assert (=> b!35382 (= lt!52824 lt!52825)))

(declare-fun lt!52820 () tuple2!3512)

(assert (=> b!35382 (= lt!52820 call!442)))

(declare-fun lt!52806 () (_ BitVec 64))

(assert (=> b!35382 (= lt!52806 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!52809 () Unit!2589)

(assert (=> b!35382 (= lt!52809 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1842 lt!52837) (buf!1171 (_2!1842 lt!52822)) lt!52806))))

(assert (=> b!35382 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52822)))) ((_ sign_extend 32) (currentByte!2550 (_2!1842 lt!52837))) ((_ sign_extend 32) (currentBit!2545 (_2!1842 lt!52837))) lt!52806)))

(declare-fun lt!52810 () Unit!2589)

(assert (=> b!35382 (= lt!52810 lt!52809)))

(declare-fun lt!52840 () List!434)

(assert (=> b!35382 (= lt!52840 (byteArrayBitContentToList!0 (_2!1842 lt!52822) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!52832 () List!434)

(assert (=> b!35382 (= lt!52832 (byteArrayBitContentToList!0 (_2!1842 lt!52822) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52846 () List!434)

(assert (=> b!35382 (= lt!52846 (bitStreamReadBitsIntoList!0 (_2!1842 lt!52822) (_1!1843 lt!52827) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!52829 () List!434)

(assert (=> b!35382 (= lt!52829 (bitStreamReadBitsIntoList!0 (_2!1842 lt!52822) (_1!1843 lt!52820) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!52835 () (_ BitVec 64))

(assert (=> b!35382 (= lt!52835 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!52844 () Unit!2589)

(assert (=> b!35382 (= lt!52844 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1842 lt!52822) (_2!1842 lt!52822) (_1!1843 lt!52827) (_1!1843 lt!52820) lt!52835 lt!52846))))

(assert (=> b!35382 (= (bitStreamReadBitsIntoList!0 (_2!1842 lt!52822) (_1!1843 lt!52820) (bvsub lt!52835 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!151 lt!52846))))

(declare-fun lt!52817 () Unit!2589)

(assert (=> b!35382 (= lt!52817 lt!52844)))

(declare-fun lt!52821 () Unit!2589)

(assert (=> b!35382 (= lt!52821 (arrayBitRangesEqImpliesEq!0 (buf!1171 (_2!1842 lt!52837)) (buf!1171 (_2!1842 lt!52822)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!52818 (bitIndex!0 (size!843 (buf!1171 (_2!1842 lt!52837))) (currentByte!2550 (_2!1842 lt!52837)) (currentBit!2545 (_2!1842 lt!52837)))))))

(assert (=> b!35382 (= (bitAt!0 (buf!1171 (_2!1842 lt!52837)) lt!52818) (bitAt!0 (buf!1171 (_2!1842 lt!52822)) lt!52818))))

(declare-fun lt!52836 () Unit!2589)

(assert (=> b!35382 (= lt!52836 lt!52821)))

(assert (= (and d!10276 c!2402) b!35382))

(assert (= (and d!10276 (not c!2402)) b!35378))

(assert (= (or b!35382 b!35378) bm!439))

(assert (= (and d!10276 res!30172) b!35380))

(assert (= (and b!35380 res!30174) b!35376))

(assert (= (and b!35376 res!30175) b!35375))

(assert (= (and b!35375 res!30173) b!35381))

(assert (= (and b!35381 res!30171) b!35379))

(assert (= (and b!35379 res!30176) b!35377))

(declare-fun m!53081 () Bool)

(assert (=> bm!439 m!53081))

(declare-fun m!53083 () Bool)

(assert (=> b!35377 m!53083))

(declare-fun m!53085 () Bool)

(assert (=> b!35378 m!53085))

(declare-fun m!53087 () Bool)

(assert (=> b!35378 m!53087))

(declare-fun m!53089 () Bool)

(assert (=> b!35380 m!53089))

(assert (=> b!35382 m!52545))

(declare-fun m!53091 () Bool)

(assert (=> b!35382 m!53091))

(declare-fun m!53093 () Bool)

(assert (=> b!35382 m!53093))

(declare-fun m!53095 () Bool)

(assert (=> b!35382 m!53095))

(declare-fun m!53097 () Bool)

(assert (=> b!35382 m!53097))

(declare-fun m!53099 () Bool)

(assert (=> b!35382 m!53099))

(declare-fun m!53101 () Bool)

(assert (=> b!35382 m!53101))

(declare-fun m!53103 () Bool)

(assert (=> b!35382 m!53103))

(declare-fun m!53105 () Bool)

(assert (=> b!35382 m!53105))

(declare-fun m!53107 () Bool)

(assert (=> b!35382 m!53107))

(declare-fun m!53109 () Bool)

(assert (=> b!35382 m!53109))

(declare-fun m!53111 () Bool)

(assert (=> b!35382 m!53111))

(declare-fun m!53113 () Bool)

(assert (=> b!35382 m!53113))

(declare-fun m!53115 () Bool)

(assert (=> b!35382 m!53115))

(assert (=> b!35382 m!53095))

(declare-fun m!53117 () Bool)

(assert (=> b!35382 m!53117))

(declare-fun m!53119 () Bool)

(assert (=> b!35382 m!53119))

(declare-fun m!53121 () Bool)

(assert (=> b!35382 m!53121))

(declare-fun m!53123 () Bool)

(assert (=> b!35382 m!53123))

(declare-fun m!53125 () Bool)

(assert (=> b!35382 m!53125))

(declare-fun m!53127 () Bool)

(assert (=> b!35382 m!53127))

(declare-fun m!53129 () Bool)

(assert (=> b!35382 m!53129))

(declare-fun m!53131 () Bool)

(assert (=> b!35382 m!53131))

(declare-fun m!53133 () Bool)

(assert (=> b!35382 m!53133))

(declare-fun m!53135 () Bool)

(assert (=> b!35382 m!53135))

(assert (=> b!35382 m!53119))

(assert (=> b!35382 m!53107))

(declare-fun m!53137 () Bool)

(assert (=> b!35382 m!53137))

(declare-fun m!53139 () Bool)

(assert (=> b!35382 m!53139))

(declare-fun m!53141 () Bool)

(assert (=> b!35382 m!53141))

(declare-fun m!53143 () Bool)

(assert (=> b!35382 m!53143))

(declare-fun m!53145 () Bool)

(assert (=> b!35382 m!53145))

(declare-fun m!53147 () Bool)

(assert (=> b!35382 m!53147))

(declare-fun m!53149 () Bool)

(assert (=> b!35382 m!53149))

(assert (=> b!35382 m!53129))

(declare-fun m!53151 () Bool)

(assert (=> b!35382 m!53151))

(declare-fun m!53153 () Bool)

(assert (=> b!35375 m!53153))

(declare-fun m!53155 () Bool)

(assert (=> b!35379 m!53155))

(declare-fun m!53157 () Bool)

(assert (=> b!35379 m!53157))

(declare-fun m!53159 () Bool)

(assert (=> b!35379 m!53159))

(declare-fun m!53161 () Bool)

(assert (=> b!35379 m!53161))

(declare-fun m!53163 () Bool)

(assert (=> b!35379 m!53163))

(declare-fun m!53165 () Bool)

(assert (=> d!10276 m!53165))

(assert (=> d!10276 m!52545))

(assert (=> d!10276 m!52719))

(assert (=> d!10276 m!52713))

(assert (=> b!35068 d!10276))

(declare-fun d!10362 () Bool)

(assert (=> d!10362 (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!52849 () Unit!2589)

(assert (=> d!10362 (= lt!52849 (choose!9 thiss!1379 (buf!1171 (_2!1842 lt!52065)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1467 (buf!1171 (_2!1842 lt!52065)) (currentByte!2550 thiss!1379) (currentBit!2545 thiss!1379))))))

(assert (=> d!10362 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1171 (_2!1842 lt!52065)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!52849)))

(declare-fun bs!2797 () Bool)

(assert (= bs!2797 d!10362))

(assert (=> bs!2797 m!52533))

(declare-fun m!53167 () Bool)

(assert (=> bs!2797 m!53167))

(assert (=> b!35068 d!10362))

(declare-fun d!10364 () Bool)

(assert (=> d!10364 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!843 (buf!1171 (_2!1842 lt!52065)))) ((_ sign_extend 32) (currentByte!2550 thiss!1379)) ((_ sign_extend 32) (currentBit!2545 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2798 () Bool)

(assert (= bs!2798 d!10364))

(declare-fun m!53169 () Bool)

(assert (=> bs!2798 m!53169))

(assert (=> b!35068 d!10364))

(push 1)

(assert (not d!10232))

(assert (not b!35218))

(assert (not b!35210))

(assert (not d!10184))

(assert (not b!35379))

(assert (not d!10204))

(assert (not b!35220))

(assert (not b!35166))

(assert (not d!10264))

(assert (not d!10182))

(assert (not b!35155))

(assert (not d!10236))

(assert (not b!35105))

(assert (not d!10250))

(assert (not b!35224))

(assert (not b!35213))

(assert (not b!35205))

(assert (not d!10240))

(assert (not b!35154))

(assert (not d!10274))

(assert (not d!10266))

(assert (not d!10362))

(assert (not b!35223))

(assert (not b!35216))

(assert (not b!35156))

(assert (not b!35110))

(assert (not b!35195))

(assert (not b!35206))

(assert (not b!35159))

(assert (not d!10268))

(assert (not d!10242))

(assert (not bm!439))

(assert (not d!10276))

(assert (not d!10364))

(assert (not b!35217))

(assert (not b!35194))

(assert (not b!35209))

(assert (not b!35202))

(assert (not b!35204))

(assert (not b!35098))

(assert (not b!35382))

(assert (not b!35199))

(assert (not d!10176))

(assert (not b!35226))

(assert (not d!10258))

(assert (not b!35158))

(assert (not d!10174))

(assert (not b!35198))

(assert (not d!10238))

(assert (not d!10248))

(assert (not b!35378))

(assert (not b!35107))

(assert (not b!35197))

(assert (not b!35377))

(assert (not d!10210))

(assert (not b!35208))

(assert (not b!35193))

(assert (not b!35160))

(assert (not b!35180))

(assert (not b!35380))

(assert (not b!35375))

(assert (not b!35200))

(assert (not d!10254))

(assert (not b!35157))

(assert (not d!10186))

(assert (not b!35096))

(assert (not b!35153))

(assert (not b!35179))

(assert (not b!35221))

(assert (not b!35178))

(assert (not b!35168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

