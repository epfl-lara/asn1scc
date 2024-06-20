; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5482 () Bool)

(assert start!5482)

(declare-fun b!22154 () Bool)

(declare-fun res!19091 () Bool)

(declare-fun e!14982 () Bool)

(assert (=> b!22154 (=> res!19091 e!14982)))

(declare-datatypes ((array!1538 0))(
  ( (array!1539 (arr!1108 (Array (_ BitVec 32) (_ BitVec 8))) (size!655 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1144 0))(
  ( (BitStream!1145 (buf!973 array!1538) (currentByte!2280 (_ BitVec 32)) (currentBit!2275 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1920 0))(
  ( (Unit!1921) )
))
(declare-datatypes ((tuple2!2582 0))(
  ( (tuple2!2583 (_1!1376 Unit!1920) (_2!1376 BitStream!1144)) )
))
(declare-fun lt!32282 () tuple2!2582)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22154 (= res!19091 (not (invariant!0 (currentBit!2275 (_2!1376 lt!32282)) (currentByte!2280 (_2!1376 lt!32282)) (size!655 (buf!973 (_2!1376 lt!32282))))))))

(declare-fun b!22155 () Bool)

(declare-fun res!19089 () Bool)

(declare-fun e!14979 () Bool)

(assert (=> b!22155 (=> (not res!19089) (not e!14979))))

(declare-fun thiss!1379 () BitStream!1144)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22155 (= res!19089 (validate_offset_bits!1 ((_ sign_extend 32) (size!655 (buf!973 thiss!1379))) ((_ sign_extend 32) (currentByte!2280 thiss!1379)) ((_ sign_extend 32) (currentBit!2275 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!19088 () Bool)

(assert (=> start!5482 (=> (not res!19088) (not e!14979))))

(declare-fun srcBuffer!2 () array!1538)

(assert (=> start!5482 (= res!19088 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!655 srcBuffer!2))))))))

(assert (=> start!5482 e!14979))

(assert (=> start!5482 true))

(declare-fun array_inv!625 (array!1538) Bool)

(assert (=> start!5482 (array_inv!625 srcBuffer!2)))

(declare-fun e!14975 () Bool)

(declare-fun inv!12 (BitStream!1144) Bool)

(assert (=> start!5482 (and (inv!12 thiss!1379) e!14975)))

(declare-fun b!22156 () Bool)

(declare-fun e!14980 () Bool)

(declare-fun lt!32277 () tuple2!2582)

(declare-datatypes ((tuple2!2584 0))(
  ( (tuple2!2585 (_1!1377 BitStream!1144) (_2!1377 BitStream!1144)) )
))
(declare-fun lt!32280 () tuple2!2584)

(declare-datatypes ((List!273 0))(
  ( (Nil!270) (Cons!269 (h!388 Bool) (t!1023 List!273)) )
))
(declare-fun head!110 (List!273) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1144 array!1538 (_ BitVec 64) (_ BitVec 64)) List!273)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1144 BitStream!1144 (_ BitVec 64)) List!273)

(assert (=> b!22156 (= e!14980 (= (head!110 (byteArrayBitContentToList!0 (_2!1376 lt!32277) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!110 (bitStreamReadBitsIntoList!0 (_2!1376 lt!32277) (_1!1377 lt!32280) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!22157 () Bool)

(declare-fun res!19086 () Bool)

(assert (=> b!22157 (=> res!19086 e!14982)))

(assert (=> b!22157 (= res!19086 (not (= (size!655 (buf!973 thiss!1379)) (size!655 (buf!973 (_2!1376 lt!32282))))))))

(declare-fun b!22158 () Bool)

(declare-fun e!14981 () Bool)

(declare-fun e!14976 () Bool)

(assert (=> b!22158 (= e!14981 e!14976)))

(declare-fun res!19090 () Bool)

(assert (=> b!22158 (=> res!19090 e!14976)))

(declare-fun isPrefixOf!0 (BitStream!1144 BitStream!1144) Bool)

(assert (=> b!22158 (= res!19090 (not (isPrefixOf!0 thiss!1379 (_2!1376 lt!32277))))))

(assert (=> b!22158 (validate_offset_bits!1 ((_ sign_extend 32) (size!655 (buf!973 (_2!1376 lt!32277)))) ((_ sign_extend 32) (currentByte!2280 (_2!1376 lt!32277))) ((_ sign_extend 32) (currentBit!2275 (_2!1376 lt!32277))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32278 () Unit!1920)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1144 BitStream!1144 (_ BitVec 64) (_ BitVec 64)) Unit!1920)

(assert (=> b!22158 (= lt!32278 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1376 lt!32277) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1144 (_ BitVec 8) (_ BitVec 32)) tuple2!2582)

(assert (=> b!22158 (= lt!32277 (appendBitFromByte!0 thiss!1379 (select (arr!1108 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!22159 () Bool)

(assert (=> b!22159 (= e!14976 e!14982)))

(declare-fun res!19087 () Bool)

(assert (=> b!22159 (=> res!19087 e!14982)))

(assert (=> b!22159 (= res!19087 (not (isPrefixOf!0 (_2!1376 lt!32277) (_2!1376 lt!32282))))))

(assert (=> b!22159 (isPrefixOf!0 thiss!1379 (_2!1376 lt!32282))))

(declare-fun lt!32283 () Unit!1920)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1144 BitStream!1144 BitStream!1144) Unit!1920)

(assert (=> b!22159 (= lt!32283 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1376 lt!32277) (_2!1376 lt!32282)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1144 array!1538 (_ BitVec 64) (_ BitVec 64)) tuple2!2582)

(assert (=> b!22159 (= lt!32282 (appendBitsMSBFirstLoop!0 (_2!1376 lt!32277) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!22159 e!14980))

(declare-fun res!19093 () Bool)

(assert (=> b!22159 (=> (not res!19093) (not e!14980))))

(assert (=> b!22159 (= res!19093 (validate_offset_bits!1 ((_ sign_extend 32) (size!655 (buf!973 (_2!1376 lt!32277)))) ((_ sign_extend 32) (currentByte!2280 thiss!1379)) ((_ sign_extend 32) (currentBit!2275 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32279 () Unit!1920)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1144 array!1538 (_ BitVec 64)) Unit!1920)

(assert (=> b!22159 (= lt!32279 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!973 (_2!1376 lt!32277)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1144 BitStream!1144) tuple2!2584)

(assert (=> b!22159 (= lt!32280 (reader!0 thiss!1379 (_2!1376 lt!32277)))))

(declare-fun b!22160 () Bool)

(assert (=> b!22160 (= e!14975 (array_inv!625 (buf!973 thiss!1379)))))

(declare-fun b!22161 () Bool)

(declare-fun res!19092 () Bool)

(assert (=> b!22161 (=> res!19092 e!14982)))

(declare-fun lt!32284 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22161 (= res!19092 (not (= (bitIndex!0 (size!655 (buf!973 (_2!1376 lt!32282))) (currentByte!2280 (_2!1376 lt!32282)) (currentBit!2275 (_2!1376 lt!32282))) (bvsub (bvadd lt!32284 to!314) i!635))))))

(declare-fun b!22162 () Bool)

(assert (=> b!22162 (= e!14979 (not e!14981))))

(declare-fun res!19094 () Bool)

(assert (=> b!22162 (=> res!19094 e!14981)))

(assert (=> b!22162 (= res!19094 (bvsge i!635 to!314))))

(assert (=> b!22162 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!32281 () Unit!1920)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1144) Unit!1920)

(assert (=> b!22162 (= lt!32281 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!22162 (= lt!32284 (bitIndex!0 (size!655 (buf!973 thiss!1379)) (currentByte!2280 thiss!1379) (currentBit!2275 thiss!1379)))))

(declare-fun b!22163 () Bool)

(assert (=> b!22163 (= e!14982 true)))

(assert (=> b!22163 (= (size!655 (buf!973 (_2!1376 lt!32282))) (size!655 (buf!973 thiss!1379)))))

(assert (= (and start!5482 res!19088) b!22155))

(assert (= (and b!22155 res!19089) b!22162))

(assert (= (and b!22162 (not res!19094)) b!22158))

(assert (= (and b!22158 (not res!19090)) b!22159))

(assert (= (and b!22159 res!19093) b!22156))

(assert (= (and b!22159 (not res!19087)) b!22161))

(assert (= (and b!22161 (not res!19092)) b!22154))

(assert (= (and b!22154 (not res!19091)) b!22157))

(assert (= (and b!22157 (not res!19086)) b!22163))

(assert (= start!5482 b!22160))

(declare-fun m!30789 () Bool)

(assert (=> start!5482 m!30789))

(declare-fun m!30791 () Bool)

(assert (=> start!5482 m!30791))

(declare-fun m!30793 () Bool)

(assert (=> b!22155 m!30793))

(declare-fun m!30795 () Bool)

(assert (=> b!22160 m!30795))

(declare-fun m!30797 () Bool)

(assert (=> b!22162 m!30797))

(declare-fun m!30799 () Bool)

(assert (=> b!22162 m!30799))

(declare-fun m!30801 () Bool)

(assert (=> b!22162 m!30801))

(declare-fun m!30803 () Bool)

(assert (=> b!22158 m!30803))

(declare-fun m!30805 () Bool)

(assert (=> b!22158 m!30805))

(declare-fun m!30807 () Bool)

(assert (=> b!22158 m!30807))

(declare-fun m!30809 () Bool)

(assert (=> b!22158 m!30809))

(assert (=> b!22158 m!30807))

(declare-fun m!30811 () Bool)

(assert (=> b!22158 m!30811))

(declare-fun m!30813 () Bool)

(assert (=> b!22159 m!30813))

(declare-fun m!30815 () Bool)

(assert (=> b!22159 m!30815))

(declare-fun m!30817 () Bool)

(assert (=> b!22159 m!30817))

(declare-fun m!30819 () Bool)

(assert (=> b!22159 m!30819))

(declare-fun m!30821 () Bool)

(assert (=> b!22159 m!30821))

(declare-fun m!30823 () Bool)

(assert (=> b!22159 m!30823))

(declare-fun m!30825 () Bool)

(assert (=> b!22159 m!30825))

(declare-fun m!30827 () Bool)

(assert (=> b!22154 m!30827))

(declare-fun m!30829 () Bool)

(assert (=> b!22161 m!30829))

(declare-fun m!30831 () Bool)

(assert (=> b!22156 m!30831))

(assert (=> b!22156 m!30831))

(declare-fun m!30833 () Bool)

(assert (=> b!22156 m!30833))

(declare-fun m!30835 () Bool)

(assert (=> b!22156 m!30835))

(assert (=> b!22156 m!30835))

(declare-fun m!30837 () Bool)

(assert (=> b!22156 m!30837))

(push 1)

