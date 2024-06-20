; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11800 () Bool)

(assert start!11800)

(declare-fun b!58404 () Bool)

(declare-fun res!48508 () Bool)

(declare-fun e!38739 () Bool)

(assert (=> b!58404 (=> res!48508 e!38739)))

(declare-datatypes ((array!2657 0))(
  ( (array!2658 (arr!1768 (Array (_ BitVec 32) (_ BitVec 8))) (size!1204 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2096 0))(
  ( (BitStream!2097 (buf!1585 array!2657) (currentByte!3203 (_ BitVec 32)) (currentBit!3198 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4031 0))(
  ( (Unit!4032) )
))
(declare-datatypes ((tuple2!5314 0))(
  ( (tuple2!5315 (_1!2768 Unit!4031) (_2!2768 BitStream!2096)) )
))
(declare-fun lt!92319 () tuple2!5314)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58404 (= res!48508 (not (invariant!0 (currentBit!3198 (_2!2768 lt!92319)) (currentByte!3203 (_2!2768 lt!92319)) (size!1204 (buf!1585 (_2!2768 lt!92319))))))))

(declare-fun b!58406 () Bool)

(declare-fun e!38735 () Bool)

(declare-fun e!38734 () Bool)

(assert (=> b!58406 (= e!38735 (not e!38734))))

(declare-fun res!48513 () Bool)

(assert (=> b!58406 (=> res!48513 e!38734)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!58406 (= res!48513 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2096)

(declare-fun isPrefixOf!0 (BitStream!2096 BitStream!2096) Bool)

(assert (=> b!58406 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92312 () Unit!4031)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2096) Unit!4031)

(assert (=> b!58406 (= lt!92312 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92317 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58406 (= lt!92317 (bitIndex!0 (size!1204 (buf!1585 thiss!1379)) (currentByte!3203 thiss!1379) (currentBit!3198 thiss!1379)))))

(declare-fun b!58407 () Bool)

(declare-fun e!38740 () Bool)

(assert (=> b!58407 (= e!38740 true)))

(declare-datatypes ((tuple2!5316 0))(
  ( (tuple2!5317 (_1!2769 BitStream!2096) (_2!2769 BitStream!2096)) )
))
(declare-fun lt!92313 () tuple2!5316)

(declare-fun reader!0 (BitStream!2096 BitStream!2096) tuple2!5316)

(assert (=> b!58407 (= lt!92313 (reader!0 thiss!1379 (_2!2768 lt!92319)))))

(declare-fun b!58408 () Bool)

(declare-fun res!48507 () Bool)

(assert (=> b!58408 (=> res!48507 e!38740)))

(declare-fun lt!92311 () tuple2!5314)

(assert (=> b!58408 (= res!48507 (not (invariant!0 (currentBit!3198 (_2!2768 lt!92311)) (currentByte!3203 (_2!2768 lt!92311)) (size!1204 (buf!1585 (_2!2768 lt!92319))))))))

(declare-fun b!58409 () Bool)

(declare-fun e!38741 () Bool)

(declare-fun e!38732 () Bool)

(assert (=> b!58409 (= e!38741 e!38732)))

(declare-fun res!48510 () Bool)

(assert (=> b!58409 (=> res!48510 e!38732)))

(assert (=> b!58409 (= res!48510 (not (isPrefixOf!0 (_2!2768 lt!92311) (_2!2768 lt!92319))))))

(assert (=> b!58409 (isPrefixOf!0 thiss!1379 (_2!2768 lt!92319))))

(declare-fun lt!92316 () Unit!4031)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2096 BitStream!2096 BitStream!2096) Unit!4031)

(assert (=> b!58409 (= lt!92316 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2768 lt!92311) (_2!2768 lt!92319)))))

(declare-fun srcBuffer!2 () array!2657)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2096 array!2657 (_ BitVec 64) (_ BitVec 64)) tuple2!5314)

(assert (=> b!58409 (= lt!92319 (appendBitsMSBFirstLoop!0 (_2!2768 lt!92311) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38736 () Bool)

(assert (=> b!58409 e!38736))

(declare-fun res!48514 () Bool)

(assert (=> b!58409 (=> (not res!48514) (not e!38736))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58409 (= res!48514 (validate_offset_bits!1 ((_ sign_extend 32) (size!1204 (buf!1585 (_2!2768 lt!92311)))) ((_ sign_extend 32) (currentByte!3203 thiss!1379)) ((_ sign_extend 32) (currentBit!3198 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92320 () Unit!4031)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2096 array!2657 (_ BitVec 64)) Unit!4031)

(assert (=> b!58409 (= lt!92320 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1585 (_2!2768 lt!92311)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92315 () tuple2!5316)

(assert (=> b!58409 (= lt!92315 (reader!0 thiss!1379 (_2!2768 lt!92311)))))

(declare-fun b!58410 () Bool)

(assert (=> b!58410 (= e!38739 e!38740)))

(declare-fun res!48512 () Bool)

(assert (=> b!58410 (=> res!48512 e!38740)))

(assert (=> b!58410 (= res!48512 (not (= (size!1204 (buf!1585 (_2!2768 lt!92311))) (size!1204 (buf!1585 (_2!2768 lt!92319))))))))

(declare-fun e!38731 () Bool)

(assert (=> b!58410 e!38731))

(declare-fun res!48515 () Bool)

(assert (=> b!58410 (=> (not res!48515) (not e!38731))))

(assert (=> b!58410 (= res!48515 (= (size!1204 (buf!1585 (_2!2768 lt!92319))) (size!1204 (buf!1585 thiss!1379))))))

(declare-fun b!58411 () Bool)

(declare-fun res!48516 () Bool)

(assert (=> b!58411 (=> (not res!48516) (not e!38735))))

(assert (=> b!58411 (= res!48516 (validate_offset_bits!1 ((_ sign_extend 32) (size!1204 (buf!1585 thiss!1379))) ((_ sign_extend 32) (currentByte!3203 thiss!1379)) ((_ sign_extend 32) (currentBit!3198 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!48506 () Bool)

(assert (=> start!11800 (=> (not res!48506) (not e!38735))))

(assert (=> start!11800 (= res!48506 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1204 srcBuffer!2))))))))

(assert (=> start!11800 e!38735))

(assert (=> start!11800 true))

(declare-fun array_inv!1107 (array!2657) Bool)

(assert (=> start!11800 (array_inv!1107 srcBuffer!2)))

(declare-fun e!38733 () Bool)

(declare-fun inv!12 (BitStream!2096) Bool)

(assert (=> start!11800 (and (inv!12 thiss!1379) e!38733)))

(declare-fun b!58405 () Bool)

(declare-fun res!48505 () Bool)

(assert (=> b!58405 (=> res!48505 e!38740)))

(assert (=> b!58405 (= res!48505 (not (invariant!0 (currentBit!3198 (_2!2768 lt!92311)) (currentByte!3203 (_2!2768 lt!92311)) (size!1204 (buf!1585 (_2!2768 lt!92311))))))))

(declare-fun b!58412 () Bool)

(assert (=> b!58412 (= e!38733 (array_inv!1107 (buf!1585 thiss!1379)))))

(declare-fun b!58413 () Bool)

(declare-datatypes ((List!623 0))(
  ( (Nil!620) (Cons!619 (h!738 Bool) (t!1373 List!623)) )
))
(declare-fun head!442 (List!623) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2096 array!2657 (_ BitVec 64) (_ BitVec 64)) List!623)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2096 BitStream!2096 (_ BitVec 64)) List!623)

(assert (=> b!58413 (= e!38736 (= (head!442 (byteArrayBitContentToList!0 (_2!2768 lt!92311) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!442 (bitStreamReadBitsIntoList!0 (_2!2768 lt!92311) (_1!2769 lt!92315) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58414 () Bool)

(declare-fun res!48504 () Bool)

(assert (=> b!58414 (=> res!48504 e!38739)))

(assert (=> b!58414 (= res!48504 (not (= (size!1204 (buf!1585 thiss!1379)) (size!1204 (buf!1585 (_2!2768 lt!92319))))))))

(declare-fun lt!92318 () (_ BitVec 64))

(declare-fun b!58415 () Bool)

(assert (=> b!58415 (= e!38731 (= lt!92318 (bvsub (bvsub (bvadd (bitIndex!0 (size!1204 (buf!1585 (_2!2768 lt!92311))) (currentByte!3203 (_2!2768 lt!92311)) (currentBit!3198 (_2!2768 lt!92311))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58416 () Bool)

(assert (=> b!58416 (= e!38732 e!38739)))

(declare-fun res!48511 () Bool)

(assert (=> b!58416 (=> res!48511 e!38739)))

(assert (=> b!58416 (= res!48511 (not (= lt!92318 (bvsub (bvadd lt!92317 to!314) i!635))))))

(assert (=> b!58416 (= lt!92318 (bitIndex!0 (size!1204 (buf!1585 (_2!2768 lt!92319))) (currentByte!3203 (_2!2768 lt!92319)) (currentBit!3198 (_2!2768 lt!92319))))))

(declare-fun b!58417 () Bool)

(assert (=> b!58417 (= e!38734 e!38741)))

(declare-fun res!48509 () Bool)

(assert (=> b!58417 (=> res!48509 e!38741)))

(assert (=> b!58417 (= res!48509 (not (isPrefixOf!0 thiss!1379 (_2!2768 lt!92311))))))

(assert (=> b!58417 (validate_offset_bits!1 ((_ sign_extend 32) (size!1204 (buf!1585 (_2!2768 lt!92311)))) ((_ sign_extend 32) (currentByte!3203 (_2!2768 lt!92311))) ((_ sign_extend 32) (currentBit!3198 (_2!2768 lt!92311))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92314 () Unit!4031)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2096 BitStream!2096 (_ BitVec 64) (_ BitVec 64)) Unit!4031)

(assert (=> b!58417 (= lt!92314 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2768 lt!92311) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2096 (_ BitVec 8) (_ BitVec 32)) tuple2!5314)

(assert (=> b!58417 (= lt!92311 (appendBitFromByte!0 thiss!1379 (select (arr!1768 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!11800 res!48506) b!58411))

(assert (= (and b!58411 res!48516) b!58406))

(assert (= (and b!58406 (not res!48513)) b!58417))

(assert (= (and b!58417 (not res!48509)) b!58409))

(assert (= (and b!58409 res!48514) b!58413))

(assert (= (and b!58409 (not res!48510)) b!58416))

(assert (= (and b!58416 (not res!48511)) b!58404))

(assert (= (and b!58404 (not res!48508)) b!58414))

(assert (= (and b!58414 (not res!48504)) b!58410))

(assert (= (and b!58410 res!48515) b!58415))

(assert (= (and b!58410 (not res!48512)) b!58405))

(assert (= (and b!58405 (not res!48505)) b!58408))

(assert (= (and b!58408 (not res!48507)) b!58407))

(assert (= start!11800 b!58412))

(declare-fun m!92025 () Bool)

(assert (=> start!11800 m!92025))

(declare-fun m!92027 () Bool)

(assert (=> start!11800 m!92027))

(declare-fun m!92029 () Bool)

(assert (=> b!58407 m!92029))

(declare-fun m!92031 () Bool)

(assert (=> b!58411 m!92031))

(declare-fun m!92033 () Bool)

(assert (=> b!58406 m!92033))

(declare-fun m!92035 () Bool)

(assert (=> b!58406 m!92035))

(declare-fun m!92037 () Bool)

(assert (=> b!58406 m!92037))

(declare-fun m!92039 () Bool)

(assert (=> b!58408 m!92039))

(declare-fun m!92041 () Bool)

(assert (=> b!58416 m!92041))

(declare-fun m!92043 () Bool)

(assert (=> b!58415 m!92043))

(declare-fun m!92045 () Bool)

(assert (=> b!58409 m!92045))

(declare-fun m!92047 () Bool)

(assert (=> b!58409 m!92047))

(declare-fun m!92049 () Bool)

(assert (=> b!58409 m!92049))

(declare-fun m!92051 () Bool)

(assert (=> b!58409 m!92051))

(declare-fun m!92053 () Bool)

(assert (=> b!58409 m!92053))

(declare-fun m!92055 () Bool)

(assert (=> b!58409 m!92055))

(declare-fun m!92057 () Bool)

(assert (=> b!58409 m!92057))

(declare-fun m!92059 () Bool)

(assert (=> b!58413 m!92059))

(assert (=> b!58413 m!92059))

(declare-fun m!92061 () Bool)

(assert (=> b!58413 m!92061))

(declare-fun m!92063 () Bool)

(assert (=> b!58413 m!92063))

(assert (=> b!58413 m!92063))

(declare-fun m!92065 () Bool)

(assert (=> b!58413 m!92065))

(declare-fun m!92067 () Bool)

(assert (=> b!58417 m!92067))

(declare-fun m!92069 () Bool)

(assert (=> b!58417 m!92069))

(declare-fun m!92071 () Bool)

(assert (=> b!58417 m!92071))

(assert (=> b!58417 m!92067))

(declare-fun m!92073 () Bool)

(assert (=> b!58417 m!92073))

(declare-fun m!92075 () Bool)

(assert (=> b!58417 m!92075))

(declare-fun m!92077 () Bool)

(assert (=> b!58412 m!92077))

(declare-fun m!92079 () Bool)

(assert (=> b!58405 m!92079))

(declare-fun m!92081 () Bool)

(assert (=> b!58404 m!92081))

(push 1)

(assert (not b!58406))

(assert (not b!58404))

(assert (not b!58415))

(assert (not b!58408))

(assert (not b!58416))

(assert (not b!58409))

(assert (not b!58413))

(assert (not b!58411))

(assert (not b!58405))

(assert (not b!58412))

(assert (not start!11800))

(assert (not b!58407))

(assert (not b!58417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

