; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11802 () Bool)

(assert start!11802)

(declare-fun b!58446 () Bool)

(declare-fun res!48550 () Bool)

(declare-fun e!38766 () Bool)

(assert (=> b!58446 (=> res!48550 e!38766)))

(declare-datatypes ((array!2659 0))(
  ( (array!2660 (arr!1769 (Array (_ BitVec 32) (_ BitVec 8))) (size!1205 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2098 0))(
  ( (BitStream!2099 (buf!1586 array!2659) (currentByte!3204 (_ BitVec 32)) (currentBit!3199 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4033 0))(
  ( (Unit!4034) )
))
(declare-datatypes ((tuple2!5318 0))(
  ( (tuple2!5319 (_1!2770 Unit!4033) (_2!2770 BitStream!2098)) )
))
(declare-fun lt!92350 () tuple2!5318)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58446 (= res!48550 (not (invariant!0 (currentBit!3199 (_2!2770 lt!92350)) (currentByte!3204 (_2!2770 lt!92350)) (size!1205 (buf!1586 (_2!2770 lt!92350))))))))

(declare-fun b!58447 () Bool)

(declare-fun e!38772 () Bool)

(declare-fun thiss!1379 () BitStream!2098)

(declare-fun array_inv!1108 (array!2659) Bool)

(assert (=> b!58447 (= e!38772 (array_inv!1108 (buf!1586 thiss!1379)))))

(declare-fun b!58448 () Bool)

(declare-fun e!38774 () Bool)

(declare-fun e!38773 () Bool)

(assert (=> b!58448 (= e!38774 e!38773)))

(declare-fun res!48553 () Bool)

(assert (=> b!58448 (=> res!48553 e!38773)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!92342 () (_ BitVec 64))

(declare-fun lt!92345 () (_ BitVec 64))

(assert (=> b!58448 (= res!48553 (not (= lt!92345 (bvsub (bvadd lt!92342 to!314) i!635))))))

(declare-fun lt!92348 () tuple2!5318)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58448 (= lt!92345 (bitIndex!0 (size!1205 (buf!1586 (_2!2770 lt!92348))) (currentByte!3204 (_2!2770 lt!92348)) (currentBit!3199 (_2!2770 lt!92348))))))

(declare-fun b!58449 () Bool)

(declare-fun res!48543 () Bool)

(assert (=> b!58449 (=> res!48543 e!38773)))

(assert (=> b!58449 (= res!48543 (not (invariant!0 (currentBit!3199 (_2!2770 lt!92348)) (currentByte!3204 (_2!2770 lt!92348)) (size!1205 (buf!1586 (_2!2770 lt!92348))))))))

(declare-fun b!58450 () Bool)

(declare-fun e!38765 () Bool)

(declare-fun e!38771 () Bool)

(assert (=> b!58450 (= e!38765 e!38771)))

(declare-fun res!48551 () Bool)

(assert (=> b!58450 (=> res!48551 e!38771)))

(declare-fun isPrefixOf!0 (BitStream!2098 BitStream!2098) Bool)

(assert (=> b!58450 (= res!48551 (not (isPrefixOf!0 thiss!1379 (_2!2770 lt!92350))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58450 (validate_offset_bits!1 ((_ sign_extend 32) (size!1205 (buf!1586 (_2!2770 lt!92350)))) ((_ sign_extend 32) (currentByte!3204 (_2!2770 lt!92350))) ((_ sign_extend 32) (currentBit!3199 (_2!2770 lt!92350))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92343 () Unit!4033)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2098 BitStream!2098 (_ BitVec 64) (_ BitVec 64)) Unit!4033)

(assert (=> b!58450 (= lt!92343 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2770 lt!92350) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2659)

(declare-fun appendBitFromByte!0 (BitStream!2098 (_ BitVec 8) (_ BitVec 32)) tuple2!5318)

(assert (=> b!58450 (= lt!92350 (appendBitFromByte!0 thiss!1379 (select (arr!1769 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58451 () Bool)

(declare-fun res!48549 () Bool)

(declare-fun e!38768 () Bool)

(assert (=> b!58451 (=> (not res!48549) (not e!38768))))

(assert (=> b!58451 (= res!48549 (validate_offset_bits!1 ((_ sign_extend 32) (size!1205 (buf!1586 thiss!1379))) ((_ sign_extend 32) (currentByte!3204 thiss!1379)) ((_ sign_extend 32) (currentBit!3199 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58453 () Bool)

(declare-fun res!48547 () Bool)

(assert (=> b!58453 (=> res!48547 e!38766)))

(assert (=> b!58453 (= res!48547 (not (invariant!0 (currentBit!3199 (_2!2770 lt!92350)) (currentByte!3204 (_2!2770 lt!92350)) (size!1205 (buf!1586 (_2!2770 lt!92348))))))))

(declare-fun b!58454 () Bool)

(declare-fun res!48552 () Bool)

(assert (=> b!58454 (=> res!48552 e!38773)))

(assert (=> b!58454 (= res!48552 (not (= (size!1205 (buf!1586 thiss!1379)) (size!1205 (buf!1586 (_2!2770 lt!92348))))))))

(declare-fun b!58455 () Bool)

(assert (=> b!58455 (= e!38771 e!38774)))

(declare-fun res!48546 () Bool)

(assert (=> b!58455 (=> res!48546 e!38774)))

(assert (=> b!58455 (= res!48546 (not (isPrefixOf!0 (_2!2770 lt!92350) (_2!2770 lt!92348))))))

(assert (=> b!58455 (isPrefixOf!0 thiss!1379 (_2!2770 lt!92348))))

(declare-fun lt!92344 () Unit!4033)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2098 BitStream!2098 BitStream!2098) Unit!4033)

(assert (=> b!58455 (= lt!92344 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2770 lt!92350) (_2!2770 lt!92348)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2098 array!2659 (_ BitVec 64) (_ BitVec 64)) tuple2!5318)

(assert (=> b!58455 (= lt!92348 (appendBitsMSBFirstLoop!0 (_2!2770 lt!92350) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38764 () Bool)

(assert (=> b!58455 e!38764))

(declare-fun res!48555 () Bool)

(assert (=> b!58455 (=> (not res!48555) (not e!38764))))

(assert (=> b!58455 (= res!48555 (validate_offset_bits!1 ((_ sign_extend 32) (size!1205 (buf!1586 (_2!2770 lt!92350)))) ((_ sign_extend 32) (currentByte!3204 thiss!1379)) ((_ sign_extend 32) (currentBit!3199 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92349 () Unit!4033)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2098 array!2659 (_ BitVec 64)) Unit!4033)

(assert (=> b!58455 (= lt!92349 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1586 (_2!2770 lt!92350)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5320 0))(
  ( (tuple2!5321 (_1!2771 BitStream!2098) (_2!2771 BitStream!2098)) )
))
(declare-fun lt!92341 () tuple2!5320)

(declare-fun reader!0 (BitStream!2098 BitStream!2098) tuple2!5320)

(assert (=> b!58455 (= lt!92341 (reader!0 thiss!1379 (_2!2770 lt!92350)))))

(declare-fun b!58456 () Bool)

(assert (=> b!58456 (= e!38766 true)))

(declare-fun lt!92347 () tuple2!5320)

(assert (=> b!58456 (= lt!92347 (reader!0 thiss!1379 (_2!2770 lt!92348)))))

(declare-fun b!58457 () Bool)

(declare-datatypes ((List!624 0))(
  ( (Nil!621) (Cons!620 (h!739 Bool) (t!1374 List!624)) )
))
(declare-fun head!443 (List!624) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2098 array!2659 (_ BitVec 64) (_ BitVec 64)) List!624)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2098 BitStream!2098 (_ BitVec 64)) List!624)

(assert (=> b!58457 (= e!38764 (= (head!443 (byteArrayBitContentToList!0 (_2!2770 lt!92350) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!443 (bitStreamReadBitsIntoList!0 (_2!2770 lt!92350) (_1!2771 lt!92341) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!48544 () Bool)

(assert (=> start!11802 (=> (not res!48544) (not e!38768))))

(assert (=> start!11802 (= res!48544 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1205 srcBuffer!2))))))))

(assert (=> start!11802 e!38768))

(assert (=> start!11802 true))

(assert (=> start!11802 (array_inv!1108 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2098) Bool)

(assert (=> start!11802 (and (inv!12 thiss!1379) e!38772)))

(declare-fun e!38769 () Bool)

(declare-fun b!58452 () Bool)

(assert (=> b!58452 (= e!38769 (= lt!92345 (bvsub (bvsub (bvadd (bitIndex!0 (size!1205 (buf!1586 (_2!2770 lt!92350))) (currentByte!3204 (_2!2770 lt!92350)) (currentBit!3199 (_2!2770 lt!92350))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58458 () Bool)

(assert (=> b!58458 (= e!38773 e!38766)))

(declare-fun res!48554 () Bool)

(assert (=> b!58458 (=> res!48554 e!38766)))

(assert (=> b!58458 (= res!48554 (not (= (size!1205 (buf!1586 (_2!2770 lt!92350))) (size!1205 (buf!1586 (_2!2770 lt!92348))))))))

(assert (=> b!58458 e!38769))

(declare-fun res!48548 () Bool)

(assert (=> b!58458 (=> (not res!48548) (not e!38769))))

(assert (=> b!58458 (= res!48548 (= (size!1205 (buf!1586 (_2!2770 lt!92348))) (size!1205 (buf!1586 thiss!1379))))))

(declare-fun b!58459 () Bool)

(assert (=> b!58459 (= e!38768 (not e!38765))))

(declare-fun res!48545 () Bool)

(assert (=> b!58459 (=> res!48545 e!38765)))

(assert (=> b!58459 (= res!48545 (bvsge i!635 to!314))))

(assert (=> b!58459 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92346 () Unit!4033)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2098) Unit!4033)

(assert (=> b!58459 (= lt!92346 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58459 (= lt!92342 (bitIndex!0 (size!1205 (buf!1586 thiss!1379)) (currentByte!3204 thiss!1379) (currentBit!3199 thiss!1379)))))

(assert (= (and start!11802 res!48544) b!58451))

(assert (= (and b!58451 res!48549) b!58459))

(assert (= (and b!58459 (not res!48545)) b!58450))

(assert (= (and b!58450 (not res!48551)) b!58455))

(assert (= (and b!58455 res!48555) b!58457))

(assert (= (and b!58455 (not res!48546)) b!58448))

(assert (= (and b!58448 (not res!48553)) b!58449))

(assert (= (and b!58449 (not res!48543)) b!58454))

(assert (= (and b!58454 (not res!48552)) b!58458))

(assert (= (and b!58458 res!48548) b!58452))

(assert (= (and b!58458 (not res!48554)) b!58446))

(assert (= (and b!58446 (not res!48550)) b!58453))

(assert (= (and b!58453 (not res!48547)) b!58456))

(assert (= start!11802 b!58447))

(declare-fun m!92083 () Bool)

(assert (=> b!58447 m!92083))

(declare-fun m!92085 () Bool)

(assert (=> b!58455 m!92085))

(declare-fun m!92087 () Bool)

(assert (=> b!58455 m!92087))

(declare-fun m!92089 () Bool)

(assert (=> b!58455 m!92089))

(declare-fun m!92091 () Bool)

(assert (=> b!58455 m!92091))

(declare-fun m!92093 () Bool)

(assert (=> b!58455 m!92093))

(declare-fun m!92095 () Bool)

(assert (=> b!58455 m!92095))

(declare-fun m!92097 () Bool)

(assert (=> b!58455 m!92097))

(declare-fun m!92099 () Bool)

(assert (=> b!58459 m!92099))

(declare-fun m!92101 () Bool)

(assert (=> b!58459 m!92101))

(declare-fun m!92103 () Bool)

(assert (=> b!58459 m!92103))

(declare-fun m!92105 () Bool)

(assert (=> b!58457 m!92105))

(assert (=> b!58457 m!92105))

(declare-fun m!92107 () Bool)

(assert (=> b!58457 m!92107))

(declare-fun m!92109 () Bool)

(assert (=> b!58457 m!92109))

(assert (=> b!58457 m!92109))

(declare-fun m!92111 () Bool)

(assert (=> b!58457 m!92111))

(declare-fun m!92113 () Bool)

(assert (=> b!58446 m!92113))

(declare-fun m!92115 () Bool)

(assert (=> b!58451 m!92115))

(declare-fun m!92117 () Bool)

(assert (=> start!11802 m!92117))

(declare-fun m!92119 () Bool)

(assert (=> start!11802 m!92119))

(declare-fun m!92121 () Bool)

(assert (=> b!58456 m!92121))

(declare-fun m!92123 () Bool)

(assert (=> b!58449 m!92123))

(declare-fun m!92125 () Bool)

(assert (=> b!58450 m!92125))

(declare-fun m!92127 () Bool)

(assert (=> b!58450 m!92127))

(declare-fun m!92129 () Bool)

(assert (=> b!58450 m!92129))

(declare-fun m!92131 () Bool)

(assert (=> b!58450 m!92131))

(assert (=> b!58450 m!92127))

(declare-fun m!92133 () Bool)

(assert (=> b!58450 m!92133))

(declare-fun m!92135 () Bool)

(assert (=> b!58448 m!92135))

(declare-fun m!92137 () Bool)

(assert (=> b!58452 m!92137))

(declare-fun m!92139 () Bool)

(assert (=> b!58453 m!92139))

(push 1)

(assert (not b!58447))

(assert (not b!58448))

(assert (not b!58450))

(assert (not b!58455))

(assert (not b!58453))

(assert (not b!58449))

(assert (not b!58459))

(assert (not b!58446))

(assert (not start!11802))

(assert (not b!58451))

(assert (not b!58452))

(assert (not b!58456))

(assert (not b!58457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

