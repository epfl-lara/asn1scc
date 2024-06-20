; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11848 () Bool)

(assert start!11848)

(declare-fun b!59412 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2705 0))(
  ( (array!2706 (arr!1792 (Array (_ BitVec 32) (_ BitVec 8))) (size!1228 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2144 0))(
  ( (BitStream!2145 (buf!1609 array!2705) (currentByte!3227 (_ BitVec 32)) (currentBit!3222 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4079 0))(
  ( (Unit!4080) )
))
(declare-datatypes ((tuple2!5410 0))(
  ( (tuple2!5411 (_1!2816 Unit!4079) (_2!2816 BitStream!2144)) )
))
(declare-fun lt!93207 () tuple2!5410)

(declare-fun e!39527 () Bool)

(declare-fun lt!93216 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!59412 (= e!39527 (= lt!93216 (bvsub (bvsub (bvadd (bitIndex!0 (size!1228 (buf!1609 (_2!2816 lt!93207))) (currentByte!3227 (_2!2816 lt!93207)) (currentBit!3222 (_2!2816 lt!93207))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!59413 () Bool)

(declare-fun e!39533 () Bool)

(declare-fun e!39529 () Bool)

(assert (=> b!59413 (= e!39533 e!39529)))

(declare-fun res!49444 () Bool)

(assert (=> b!59413 (=> res!49444 e!39529)))

(declare-fun lt!93215 () tuple2!5410)

(declare-fun isPrefixOf!0 (BitStream!2144 BitStream!2144) Bool)

(assert (=> b!59413 (= res!49444 (not (isPrefixOf!0 (_2!2816 lt!93207) (_2!2816 lt!93215))))))

(declare-fun thiss!1379 () BitStream!2144)

(assert (=> b!59413 (isPrefixOf!0 thiss!1379 (_2!2816 lt!93215))))

(declare-fun lt!93219 () Unit!4079)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2144 BitStream!2144 BitStream!2144) Unit!4079)

(assert (=> b!59413 (= lt!93219 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2816 lt!93207) (_2!2816 lt!93215)))))

(declare-fun srcBuffer!2 () array!2705)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2144 array!2705 (_ BitVec 64) (_ BitVec 64)) tuple2!5410)

(assert (=> b!59413 (= lt!93215 (appendBitsMSBFirstLoop!0 (_2!2816 lt!93207) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!39531 () Bool)

(assert (=> b!59413 e!39531))

(declare-fun res!49445 () Bool)

(assert (=> b!59413 (=> (not res!49445) (not e!39531))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!59413 (= res!49445 (validate_offset_bits!1 ((_ sign_extend 32) (size!1228 (buf!1609 (_2!2816 lt!93207)))) ((_ sign_extend 32) (currentByte!3227 thiss!1379)) ((_ sign_extend 32) (currentBit!3222 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93208 () Unit!4079)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2144 array!2705 (_ BitVec 64)) Unit!4079)

(assert (=> b!59413 (= lt!93208 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1609 (_2!2816 lt!93207)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5412 0))(
  ( (tuple2!5413 (_1!2817 BitStream!2144) (_2!2817 BitStream!2144)) )
))
(declare-fun lt!93213 () tuple2!5412)

(declare-fun reader!0 (BitStream!2144 BitStream!2144) tuple2!5412)

(assert (=> b!59413 (= lt!93213 (reader!0 thiss!1379 (_2!2816 lt!93207)))))

(declare-fun res!49441 () Bool)

(declare-fun e!39532 () Bool)

(assert (=> start!11848 (=> (not res!49441) (not e!39532))))

(assert (=> start!11848 (= res!49441 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1228 srcBuffer!2))))))))

(assert (=> start!11848 e!39532))

(assert (=> start!11848 true))

(declare-fun array_inv!1131 (array!2705) Bool)

(assert (=> start!11848 (array_inv!1131 srcBuffer!2)))

(declare-fun e!39525 () Bool)

(declare-fun inv!12 (BitStream!2144) Bool)

(assert (=> start!11848 (and (inv!12 thiss!1379) e!39525)))

(declare-fun b!59414 () Bool)

(declare-fun res!49449 () Bool)

(declare-fun e!39526 () Bool)

(assert (=> b!59414 (=> res!49449 e!39526)))

(assert (=> b!59414 (= res!49449 (not (= (size!1228 (buf!1609 thiss!1379)) (size!1228 (buf!1609 (_2!2816 lt!93215))))))))

(declare-fun b!59415 () Bool)

(declare-fun e!39523 () Bool)

(assert (=> b!59415 (= e!39523 (or (not (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93217 () (_ BitVec 64))

(assert (=> b!59415 (validate_offset_bits!1 ((_ sign_extend 32) (size!1228 (buf!1609 (_2!2816 lt!93215)))) ((_ sign_extend 32) (currentByte!3227 (_2!2816 lt!93207))) ((_ sign_extend 32) (currentBit!3222 (_2!2816 lt!93207))) lt!93217)))

(declare-fun lt!93209 () Unit!4079)

(assert (=> b!59415 (= lt!93209 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2816 lt!93207) (buf!1609 (_2!2816 lt!93215)) lt!93217))))

(declare-fun lt!93210 () tuple2!5412)

(assert (=> b!59415 (= lt!93210 (reader!0 (_2!2816 lt!93207) (_2!2816 lt!93215)))))

(assert (=> b!59415 (validate_offset_bits!1 ((_ sign_extend 32) (size!1228 (buf!1609 (_2!2816 lt!93215)))) ((_ sign_extend 32) (currentByte!3227 thiss!1379)) ((_ sign_extend 32) (currentBit!3222 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93218 () Unit!4079)

(assert (=> b!59415 (= lt!93218 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1609 (_2!2816 lt!93215)) (bvsub to!314 i!635)))))

(declare-fun lt!93212 () tuple2!5412)

(assert (=> b!59415 (= lt!93212 (reader!0 thiss!1379 (_2!2816 lt!93215)))))

(declare-fun b!59416 () Bool)

(declare-fun res!49448 () Bool)

(assert (=> b!59416 (=> (not res!49448) (not e!39532))))

(assert (=> b!59416 (= res!49448 (validate_offset_bits!1 ((_ sign_extend 32) (size!1228 (buf!1609 thiss!1379))) ((_ sign_extend 32) (currentByte!3227 thiss!1379)) ((_ sign_extend 32) (currentBit!3222 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!59417 () Bool)

(declare-fun res!49442 () Bool)

(assert (=> b!59417 (=> res!49442 e!39523)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!59417 (= res!49442 (not (invariant!0 (currentBit!3222 (_2!2816 lt!93207)) (currentByte!3227 (_2!2816 lt!93207)) (size!1228 (buf!1609 (_2!2816 lt!93215))))))))

(declare-fun b!59418 () Bool)

(assert (=> b!59418 (= e!39529 e!39526)))

(declare-fun res!49451 () Bool)

(assert (=> b!59418 (=> res!49451 e!39526)))

(declare-fun lt!93220 () (_ BitVec 64))

(assert (=> b!59418 (= res!49451 (not (= lt!93216 (bvsub (bvadd lt!93220 to!314) i!635))))))

(assert (=> b!59418 (= lt!93216 (bitIndex!0 (size!1228 (buf!1609 (_2!2816 lt!93215))) (currentByte!3227 (_2!2816 lt!93215)) (currentBit!3222 (_2!2816 lt!93215))))))

(declare-fun b!59419 () Bool)

(assert (=> b!59419 (= e!39526 e!39523)))

(declare-fun res!49446 () Bool)

(assert (=> b!59419 (=> res!49446 e!39523)))

(assert (=> b!59419 (= res!49446 (not (= (size!1228 (buf!1609 (_2!2816 lt!93207))) (size!1228 (buf!1609 (_2!2816 lt!93215))))))))

(assert (=> b!59419 e!39527))

(declare-fun res!49440 () Bool)

(assert (=> b!59419 (=> (not res!49440) (not e!39527))))

(assert (=> b!59419 (= res!49440 (= (size!1228 (buf!1609 (_2!2816 lt!93215))) (size!1228 (buf!1609 thiss!1379))))))

(declare-fun b!59420 () Bool)

(declare-fun res!49447 () Bool)

(assert (=> b!59420 (=> res!49447 e!39526)))

(assert (=> b!59420 (= res!49447 (not (invariant!0 (currentBit!3222 (_2!2816 lt!93215)) (currentByte!3227 (_2!2816 lt!93215)) (size!1228 (buf!1609 (_2!2816 lt!93215))))))))

(declare-fun b!59421 () Bool)

(declare-fun e!39528 () Bool)

(assert (=> b!59421 (= e!39528 e!39533)))

(declare-fun res!49443 () Bool)

(assert (=> b!59421 (=> res!49443 e!39533)))

(assert (=> b!59421 (= res!49443 (not (isPrefixOf!0 thiss!1379 (_2!2816 lt!93207))))))

(assert (=> b!59421 (validate_offset_bits!1 ((_ sign_extend 32) (size!1228 (buf!1609 (_2!2816 lt!93207)))) ((_ sign_extend 32) (currentByte!3227 (_2!2816 lt!93207))) ((_ sign_extend 32) (currentBit!3222 (_2!2816 lt!93207))) lt!93217)))

(assert (=> b!59421 (= lt!93217 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93211 () Unit!4079)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2144 BitStream!2144 (_ BitVec 64) (_ BitVec 64)) Unit!4079)

(assert (=> b!59421 (= lt!93211 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2816 lt!93207) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2144 (_ BitVec 8) (_ BitVec 32)) tuple2!5410)

(assert (=> b!59421 (= lt!93207 (appendBitFromByte!0 thiss!1379 (select (arr!1792 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!59422 () Bool)

(assert (=> b!59422 (= e!39525 (array_inv!1131 (buf!1609 thiss!1379)))))

(declare-fun b!59423 () Bool)

(assert (=> b!59423 (= e!39532 (not e!39528))))

(declare-fun res!49452 () Bool)

(assert (=> b!59423 (=> res!49452 e!39528)))

(assert (=> b!59423 (= res!49452 (bvsge i!635 to!314))))

(assert (=> b!59423 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!93214 () Unit!4079)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2144) Unit!4079)

(assert (=> b!59423 (= lt!93214 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!59423 (= lt!93220 (bitIndex!0 (size!1228 (buf!1609 thiss!1379)) (currentByte!3227 thiss!1379) (currentBit!3222 thiss!1379)))))

(declare-fun b!59424 () Bool)

(declare-datatypes ((List!647 0))(
  ( (Nil!644) (Cons!643 (h!762 Bool) (t!1397 List!647)) )
))
(declare-fun head!466 (List!647) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2144 array!2705 (_ BitVec 64) (_ BitVec 64)) List!647)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2144 BitStream!2144 (_ BitVec 64)) List!647)

(assert (=> b!59424 (= e!39531 (= (head!466 (byteArrayBitContentToList!0 (_2!2816 lt!93207) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!466 (bitStreamReadBitsIntoList!0 (_2!2816 lt!93207) (_1!2817 lt!93213) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!59425 () Bool)

(declare-fun res!49450 () Bool)

(assert (=> b!59425 (=> res!49450 e!39523)))

(assert (=> b!59425 (= res!49450 (not (invariant!0 (currentBit!3222 (_2!2816 lt!93207)) (currentByte!3227 (_2!2816 lt!93207)) (size!1228 (buf!1609 (_2!2816 lt!93207))))))))

(assert (= (and start!11848 res!49441) b!59416))

(assert (= (and b!59416 res!49448) b!59423))

(assert (= (and b!59423 (not res!49452)) b!59421))

(assert (= (and b!59421 (not res!49443)) b!59413))

(assert (= (and b!59413 res!49445) b!59424))

(assert (= (and b!59413 (not res!49444)) b!59418))

(assert (= (and b!59418 (not res!49451)) b!59420))

(assert (= (and b!59420 (not res!49447)) b!59414))

(assert (= (and b!59414 (not res!49449)) b!59419))

(assert (= (and b!59419 res!49440) b!59412))

(assert (= (and b!59419 (not res!49446)) b!59425))

(assert (= (and b!59425 (not res!49450)) b!59417))

(assert (= (and b!59417 (not res!49442)) b!59415))

(assert (= start!11848 b!59422))

(declare-fun m!93557 () Bool)

(assert (=> b!59422 m!93557))

(declare-fun m!93559 () Bool)

(assert (=> b!59421 m!93559))

(declare-fun m!93561 () Bool)

(assert (=> b!59421 m!93561))

(declare-fun m!93563 () Bool)

(assert (=> b!59421 m!93563))

(declare-fun m!93565 () Bool)

(assert (=> b!59421 m!93565))

(assert (=> b!59421 m!93559))

(declare-fun m!93567 () Bool)

(assert (=> b!59421 m!93567))

(declare-fun m!93569 () Bool)

(assert (=> b!59417 m!93569))

(declare-fun m!93571 () Bool)

(assert (=> b!59413 m!93571))

(declare-fun m!93573 () Bool)

(assert (=> b!59413 m!93573))

(declare-fun m!93575 () Bool)

(assert (=> b!59413 m!93575))

(declare-fun m!93577 () Bool)

(assert (=> b!59413 m!93577))

(declare-fun m!93579 () Bool)

(assert (=> b!59413 m!93579))

(declare-fun m!93581 () Bool)

(assert (=> b!59413 m!93581))

(declare-fun m!93583 () Bool)

(assert (=> b!59413 m!93583))

(declare-fun m!93585 () Bool)

(assert (=> b!59416 m!93585))

(declare-fun m!93587 () Bool)

(assert (=> b!59418 m!93587))

(declare-fun m!93589 () Bool)

(assert (=> b!59424 m!93589))

(assert (=> b!59424 m!93589))

(declare-fun m!93591 () Bool)

(assert (=> b!59424 m!93591))

(declare-fun m!93593 () Bool)

(assert (=> b!59424 m!93593))

(assert (=> b!59424 m!93593))

(declare-fun m!93595 () Bool)

(assert (=> b!59424 m!93595))

(declare-fun m!93597 () Bool)

(assert (=> b!59415 m!93597))

(declare-fun m!93599 () Bool)

(assert (=> b!59415 m!93599))

(declare-fun m!93601 () Bool)

(assert (=> b!59415 m!93601))

(declare-fun m!93603 () Bool)

(assert (=> b!59415 m!93603))

(declare-fun m!93605 () Bool)

(assert (=> b!59415 m!93605))

(declare-fun m!93607 () Bool)

(assert (=> b!59415 m!93607))

(declare-fun m!93609 () Bool)

(assert (=> b!59412 m!93609))

(declare-fun m!93611 () Bool)

(assert (=> b!59425 m!93611))

(declare-fun m!93613 () Bool)

(assert (=> b!59423 m!93613))

(declare-fun m!93615 () Bool)

(assert (=> b!59423 m!93615))

(declare-fun m!93617 () Bool)

(assert (=> b!59423 m!93617))

(declare-fun m!93619 () Bool)

(assert (=> start!11848 m!93619))

(declare-fun m!93621 () Bool)

(assert (=> start!11848 m!93621))

(declare-fun m!93623 () Bool)

(assert (=> b!59420 m!93623))

(push 1)

(assert (not b!59425))

(assert (not b!59412))

(assert (not b!59423))

(assert (not b!59421))

(assert (not b!59418))

(assert (not b!59424))

(assert (not b!59422))

(assert (not b!59413))

(assert (not b!59417))

(assert (not b!59415))

(assert (not b!59420))

(assert (not b!59416))

(assert (not start!11848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

