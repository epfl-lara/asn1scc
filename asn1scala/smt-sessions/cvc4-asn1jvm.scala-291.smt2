; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5730 () Bool)

(assert start!5730)

(declare-fun b!24966 () Bool)

(declare-fun e!17075 () Bool)

(declare-fun e!17073 () Bool)

(assert (=> b!24966 (= e!17075 e!17073)))

(declare-fun res!21585 () Bool)

(assert (=> b!24966 (=> res!21585 e!17073)))

(declare-datatypes ((array!1653 0))(
  ( (array!1654 (arr!1168 (Array (_ BitVec 32) (_ BitVec 8))) (size!712 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1256 0))(
  ( (BitStream!1257 (buf!1033 array!1653) (currentByte!2346 (_ BitVec 32)) (currentBit!2341 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2067 0))(
  ( (Unit!2068) )
))
(declare-datatypes ((tuple2!2830 0))(
  ( (tuple2!2831 (_1!1502 Unit!2067) (_2!1502 BitStream!1256)) )
))
(declare-fun lt!35454 () tuple2!2830)

(declare-fun lt!35445 () tuple2!2830)

(assert (=> b!24966 (= res!21585 (not (= (size!712 (buf!1033 (_2!1502 lt!35454))) (size!712 (buf!1033 (_2!1502 lt!35445))))))))

(declare-fun e!17076 () Bool)

(assert (=> b!24966 e!17076))

(declare-fun res!21587 () Bool)

(assert (=> b!24966 (=> (not res!21587) (not e!17076))))

(declare-fun thiss!1379 () BitStream!1256)

(assert (=> b!24966 (= res!21587 (= (size!712 (buf!1033 (_2!1502 lt!35445))) (size!712 (buf!1033 thiss!1379))))))

(declare-fun b!24967 () Bool)

(declare-fun res!21591 () Bool)

(assert (=> b!24967 (=> res!21591 e!17075)))

(assert (=> b!24967 (= res!21591 (not (= (size!712 (buf!1033 thiss!1379)) (size!712 (buf!1033 (_2!1502 lt!35445))))))))

(declare-fun b!24969 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!35444 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24969 (= e!17076 (= lt!35444 (bvsub (bvsub (bvadd (bitIndex!0 (size!712 (buf!1033 (_2!1502 lt!35454))) (currentByte!2346 (_2!1502 lt!35454)) (currentBit!2341 (_2!1502 lt!35454))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun srcBuffer!2 () array!1653)

(declare-fun e!17067 () Bool)

(declare-fun b!24970 () Bool)

(declare-datatypes ((tuple2!2832 0))(
  ( (tuple2!2833 (_1!1503 BitStream!1256) (_2!1503 BitStream!1256)) )
))
(declare-fun lt!35452 () tuple2!2832)

(declare-datatypes ((List!329 0))(
  ( (Nil!326) (Cons!325 (h!444 Bool) (t!1079 List!329)) )
))
(declare-fun head!166 (List!329) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1256 array!1653 (_ BitVec 64) (_ BitVec 64)) List!329)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1256 BitStream!1256 (_ BitVec 64)) List!329)

(assert (=> b!24970 (= e!17067 (= (head!166 (byteArrayBitContentToList!0 (_2!1502 lt!35454) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!166 (bitStreamReadBitsIntoList!0 (_2!1502 lt!35454) (_1!1503 lt!35452) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24971 () Bool)

(declare-fun e!17071 () Bool)

(declare-fun e!17068 () Bool)

(assert (=> b!24971 (= e!17071 e!17068)))

(declare-fun res!21583 () Bool)

(assert (=> b!24971 (=> res!21583 e!17068)))

(declare-fun isPrefixOf!0 (BitStream!1256 BitStream!1256) Bool)

(assert (=> b!24971 (= res!21583 (not (isPrefixOf!0 thiss!1379 (_2!1502 lt!35454))))))

(declare-fun lt!35449 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24971 (validate_offset_bits!1 ((_ sign_extend 32) (size!712 (buf!1033 (_2!1502 lt!35454)))) ((_ sign_extend 32) (currentByte!2346 (_2!1502 lt!35454))) ((_ sign_extend 32) (currentBit!2341 (_2!1502 lt!35454))) lt!35449)))

(assert (=> b!24971 (= lt!35449 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35455 () Unit!2067)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1256 BitStream!1256 (_ BitVec 64) (_ BitVec 64)) Unit!2067)

(assert (=> b!24971 (= lt!35455 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1502 lt!35454) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1256 (_ BitVec 8) (_ BitVec 32)) tuple2!2830)

(assert (=> b!24971 (= lt!35454 (appendBitFromByte!0 thiss!1379 (select (arr!1168 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24972 () Bool)

(declare-fun e!17070 () Bool)

(assert (=> b!24972 (= e!17070 e!17075)))

(declare-fun res!21590 () Bool)

(assert (=> b!24972 (=> res!21590 e!17075)))

(declare-fun lt!35451 () (_ BitVec 64))

(assert (=> b!24972 (= res!21590 (not (= lt!35444 (bvsub (bvadd lt!35451 to!314) i!635))))))

(assert (=> b!24972 (= lt!35444 (bitIndex!0 (size!712 (buf!1033 (_2!1502 lt!35445))) (currentByte!2346 (_2!1502 lt!35445)) (currentBit!2341 (_2!1502 lt!35445))))))

(declare-fun b!24973 () Bool)

(declare-fun res!21582 () Bool)

(declare-fun e!17069 () Bool)

(assert (=> b!24973 (=> (not res!21582) (not e!17069))))

(assert (=> b!24973 (= res!21582 (validate_offset_bits!1 ((_ sign_extend 32) (size!712 (buf!1033 thiss!1379))) ((_ sign_extend 32) (currentByte!2346 thiss!1379)) ((_ sign_extend 32) (currentBit!2341 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24974 () Bool)

(assert (=> b!24974 (= e!17068 e!17070)))

(declare-fun res!21579 () Bool)

(assert (=> b!24974 (=> res!21579 e!17070)))

(assert (=> b!24974 (= res!21579 (not (isPrefixOf!0 (_2!1502 lt!35454) (_2!1502 lt!35445))))))

(assert (=> b!24974 (isPrefixOf!0 thiss!1379 (_2!1502 lt!35445))))

(declare-fun lt!35448 () Unit!2067)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1256 BitStream!1256 BitStream!1256) Unit!2067)

(assert (=> b!24974 (= lt!35448 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1502 lt!35454) (_2!1502 lt!35445)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1256 array!1653 (_ BitVec 64) (_ BitVec 64)) tuple2!2830)

(assert (=> b!24974 (= lt!35445 (appendBitsMSBFirstLoop!0 (_2!1502 lt!35454) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24974 e!17067))

(declare-fun res!21581 () Bool)

(assert (=> b!24974 (=> (not res!21581) (not e!17067))))

(assert (=> b!24974 (= res!21581 (validate_offset_bits!1 ((_ sign_extend 32) (size!712 (buf!1033 (_2!1502 lt!35454)))) ((_ sign_extend 32) (currentByte!2346 thiss!1379)) ((_ sign_extend 32) (currentBit!2341 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35453 () Unit!2067)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1256 array!1653 (_ BitVec 64)) Unit!2067)

(assert (=> b!24974 (= lt!35453 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1033 (_2!1502 lt!35454)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1256 BitStream!1256) tuple2!2832)

(assert (=> b!24974 (= lt!35452 (reader!0 thiss!1379 (_2!1502 lt!35454)))))

(declare-fun b!24975 () Bool)

(assert (=> b!24975 (= e!17069 (not e!17071))))

(declare-fun res!21580 () Bool)

(assert (=> b!24975 (=> res!21580 e!17071)))

(assert (=> b!24975 (= res!21580 (bvsge i!635 to!314))))

(assert (=> b!24975 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35450 () Unit!2067)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1256) Unit!2067)

(assert (=> b!24975 (= lt!35450 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24975 (= lt!35451 (bitIndex!0 (size!712 (buf!1033 thiss!1379)) (currentByte!2346 thiss!1379) (currentBit!2341 thiss!1379)))))

(declare-fun b!24976 () Bool)

(declare-fun res!21589 () Bool)

(assert (=> b!24976 (=> res!21589 e!17075)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24976 (= res!21589 (not (invariant!0 (currentBit!2341 (_2!1502 lt!35445)) (currentByte!2346 (_2!1502 lt!35445)) (size!712 (buf!1033 (_2!1502 lt!35445))))))))

(declare-fun b!24977 () Bool)

(assert (=> b!24977 (= e!17073 true)))

(assert (=> b!24977 (validate_offset_bits!1 ((_ sign_extend 32) (size!712 (buf!1033 (_2!1502 lt!35445)))) ((_ sign_extend 32) (currentByte!2346 (_2!1502 lt!35454))) ((_ sign_extend 32) (currentBit!2341 (_2!1502 lt!35454))) lt!35449)))

(declare-fun lt!35446 () Unit!2067)

(assert (=> b!24977 (= lt!35446 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1502 lt!35454) (buf!1033 (_2!1502 lt!35445)) lt!35449))))

(declare-fun lt!35443 () tuple2!2832)

(assert (=> b!24977 (= lt!35443 (reader!0 (_2!1502 lt!35454) (_2!1502 lt!35445)))))

(assert (=> b!24977 (validate_offset_bits!1 ((_ sign_extend 32) (size!712 (buf!1033 (_2!1502 lt!35445)))) ((_ sign_extend 32) (currentByte!2346 thiss!1379)) ((_ sign_extend 32) (currentBit!2341 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35442 () Unit!2067)

(assert (=> b!24977 (= lt!35442 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1033 (_2!1502 lt!35445)) (bvsub to!314 i!635)))))

(declare-fun lt!35447 () tuple2!2832)

(assert (=> b!24977 (= lt!35447 (reader!0 thiss!1379 (_2!1502 lt!35445)))))

(declare-fun res!21588 () Bool)

(assert (=> start!5730 (=> (not res!21588) (not e!17069))))

(assert (=> start!5730 (= res!21588 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!712 srcBuffer!2))))))))

(assert (=> start!5730 e!17069))

(assert (=> start!5730 true))

(declare-fun array_inv!681 (array!1653) Bool)

(assert (=> start!5730 (array_inv!681 srcBuffer!2)))

(declare-fun e!17077 () Bool)

(declare-fun inv!12 (BitStream!1256) Bool)

(assert (=> start!5730 (and (inv!12 thiss!1379) e!17077)))

(declare-fun b!24968 () Bool)

(declare-fun res!21584 () Bool)

(assert (=> b!24968 (=> res!21584 e!17073)))

(assert (=> b!24968 (= res!21584 (not (invariant!0 (currentBit!2341 (_2!1502 lt!35454)) (currentByte!2346 (_2!1502 lt!35454)) (size!712 (buf!1033 (_2!1502 lt!35454))))))))

(declare-fun b!24978 () Bool)

(declare-fun res!21586 () Bool)

(assert (=> b!24978 (=> res!21586 e!17073)))

(assert (=> b!24978 (= res!21586 (not (invariant!0 (currentBit!2341 (_2!1502 lt!35454)) (currentByte!2346 (_2!1502 lt!35454)) (size!712 (buf!1033 (_2!1502 lt!35445))))))))

(declare-fun b!24979 () Bool)

(assert (=> b!24979 (= e!17077 (array_inv!681 (buf!1033 thiss!1379)))))

(assert (= (and start!5730 res!21588) b!24973))

(assert (= (and b!24973 res!21582) b!24975))

(assert (= (and b!24975 (not res!21580)) b!24971))

(assert (= (and b!24971 (not res!21583)) b!24974))

(assert (= (and b!24974 res!21581) b!24970))

(assert (= (and b!24974 (not res!21579)) b!24972))

(assert (= (and b!24972 (not res!21590)) b!24976))

(assert (= (and b!24976 (not res!21589)) b!24967))

(assert (= (and b!24967 (not res!21591)) b!24966))

(assert (= (and b!24966 res!21587) b!24969))

(assert (= (and b!24966 (not res!21585)) b!24968))

(assert (= (and b!24968 (not res!21584)) b!24978))

(assert (= (and b!24978 (not res!21586)) b!24977))

(assert (= start!5730 b!24979))

(declare-fun m!35365 () Bool)

(assert (=> b!24969 m!35365))

(declare-fun m!35367 () Bool)

(assert (=> b!24978 m!35367))

(declare-fun m!35369 () Bool)

(assert (=> b!24979 m!35369))

(declare-fun m!35371 () Bool)

(assert (=> b!24975 m!35371))

(declare-fun m!35373 () Bool)

(assert (=> b!24975 m!35373))

(declare-fun m!35375 () Bool)

(assert (=> b!24975 m!35375))

(declare-fun m!35377 () Bool)

(assert (=> b!24971 m!35377))

(declare-fun m!35379 () Bool)

(assert (=> b!24971 m!35379))

(declare-fun m!35381 () Bool)

(assert (=> b!24971 m!35381))

(assert (=> b!24971 m!35377))

(declare-fun m!35383 () Bool)

(assert (=> b!24971 m!35383))

(declare-fun m!35385 () Bool)

(assert (=> b!24971 m!35385))

(declare-fun m!35387 () Bool)

(assert (=> b!24973 m!35387))

(declare-fun m!35389 () Bool)

(assert (=> b!24970 m!35389))

(assert (=> b!24970 m!35389))

(declare-fun m!35391 () Bool)

(assert (=> b!24970 m!35391))

(declare-fun m!35393 () Bool)

(assert (=> b!24970 m!35393))

(assert (=> b!24970 m!35393))

(declare-fun m!35395 () Bool)

(assert (=> b!24970 m!35395))

(declare-fun m!35397 () Bool)

(assert (=> b!24974 m!35397))

(declare-fun m!35399 () Bool)

(assert (=> b!24974 m!35399))

(declare-fun m!35401 () Bool)

(assert (=> b!24974 m!35401))

(declare-fun m!35403 () Bool)

(assert (=> b!24974 m!35403))

(declare-fun m!35405 () Bool)

(assert (=> b!24974 m!35405))

(declare-fun m!35407 () Bool)

(assert (=> b!24974 m!35407))

(declare-fun m!35409 () Bool)

(assert (=> b!24974 m!35409))

(declare-fun m!35411 () Bool)

(assert (=> b!24976 m!35411))

(declare-fun m!35413 () Bool)

(assert (=> b!24977 m!35413))

(declare-fun m!35415 () Bool)

(assert (=> b!24977 m!35415))

(declare-fun m!35417 () Bool)

(assert (=> b!24977 m!35417))

(declare-fun m!35419 () Bool)

(assert (=> b!24977 m!35419))

(declare-fun m!35421 () Bool)

(assert (=> b!24977 m!35421))

(declare-fun m!35423 () Bool)

(assert (=> b!24977 m!35423))

(declare-fun m!35425 () Bool)

(assert (=> start!5730 m!35425))

(declare-fun m!35427 () Bool)

(assert (=> start!5730 m!35427))

(declare-fun m!35429 () Bool)

(assert (=> b!24968 m!35429))

(declare-fun m!35431 () Bool)

(assert (=> b!24972 m!35431))

(push 1)

(assert (not b!24978))

(assert (not b!24971))

(assert (not b!24975))

(assert (not b!24968))

(assert (not b!24977))

(assert (not b!24972))

(assert (not start!5730))

(assert (not b!24970))

(assert (not b!24979))

(assert (not b!24973))

(assert (not b!24976))

(assert (not b!24969))

(assert (not b!24974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

