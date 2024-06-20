; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8636 () Bool)

(assert start!8636)

(declare-fun b!43016 () Bool)

(declare-fun res!36551 () Bool)

(declare-fun e!28715 () Bool)

(assert (=> b!43016 (=> (not res!36551) (not e!28715))))

(declare-datatypes ((array!2200 0))(
  ( (array!2201 (arr!1496 (Array (_ BitVec 32) (_ BitVec 8))) (size!994 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1732 0))(
  ( (BitStream!1733 (buf!1328 array!2200) (currentByte!2794 (_ BitVec 32)) (currentBit!2789 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1732)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43016 (= res!36551 (validate_offset_bits!1 ((_ sign_extend 32) (size!994 (buf!1328 thiss!1379))) ((_ sign_extend 32) (currentByte!2794 thiss!1379)) ((_ sign_extend 32) (currentBit!2789 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43018 () Bool)

(declare-fun e!28717 () Bool)

(assert (=> b!43018 (= e!28717 true)))

(declare-fun lt!64903 () Bool)

(declare-datatypes ((Unit!3058 0))(
  ( (Unit!3059) )
))
(declare-datatypes ((tuple2!4214 0))(
  ( (tuple2!4215 (_1!2200 Unit!3058) (_2!2200 BitStream!1732)) )
))
(declare-fun lt!64906 () tuple2!4214)

(declare-fun lt!64909 () tuple2!4214)

(declare-fun isPrefixOf!0 (BitStream!1732 BitStream!1732) Bool)

(assert (=> b!43018 (= lt!64903 (isPrefixOf!0 (_2!2200 lt!64906) (_2!2200 lt!64909)))))

(assert (=> b!43018 (isPrefixOf!0 thiss!1379 (_2!2200 lt!64909))))

(declare-fun lt!64902 () Unit!3058)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1732 BitStream!1732 BitStream!1732) Unit!3058)

(assert (=> b!43018 (= lt!64902 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2200 lt!64906) (_2!2200 lt!64909)))))

(declare-fun srcBuffer!2 () array!2200)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1732 array!2200 (_ BitVec 64) (_ BitVec 64)) tuple2!4214)

(assert (=> b!43018 (= lt!64909 (appendBitsMSBFirstLoop!0 (_2!2200 lt!64906) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!28716 () Bool)

(assert (=> b!43018 e!28716))

(declare-fun res!36550 () Bool)

(assert (=> b!43018 (=> (not res!36550) (not e!28716))))

(assert (=> b!43018 (= res!36550 (validate_offset_bits!1 ((_ sign_extend 32) (size!994 (buf!1328 (_2!2200 lt!64906)))) ((_ sign_extend 32) (currentByte!2794 thiss!1379)) ((_ sign_extend 32) (currentBit!2789 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64908 () Unit!3058)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1732 array!2200 (_ BitVec 64)) Unit!3058)

(assert (=> b!43018 (= lt!64908 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1328 (_2!2200 lt!64906)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4216 0))(
  ( (tuple2!4217 (_1!2201 BitStream!1732) (_2!2201 BitStream!1732)) )
))
(declare-fun lt!64907 () tuple2!4216)

(declare-fun reader!0 (BitStream!1732 BitStream!1732) tuple2!4216)

(assert (=> b!43018 (= lt!64907 (reader!0 thiss!1379 (_2!2200 lt!64906)))))

(declare-fun b!43019 () Bool)

(declare-datatypes ((List!507 0))(
  ( (Nil!504) (Cons!503 (h!622 Bool) (t!1257 List!507)) )
))
(declare-fun head!326 (List!507) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1732 array!2200 (_ BitVec 64) (_ BitVec 64)) List!507)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1732 BitStream!1732 (_ BitVec 64)) List!507)

(assert (=> b!43019 (= e!28716 (= (head!326 (byteArrayBitContentToList!0 (_2!2200 lt!64906) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!326 (bitStreamReadBitsIntoList!0 (_2!2200 lt!64906) (_1!2201 lt!64907) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43020 () Bool)

(declare-fun e!28714 () Bool)

(assert (=> b!43020 (= e!28715 (not e!28714))))

(declare-fun res!36548 () Bool)

(assert (=> b!43020 (=> res!36548 e!28714)))

(assert (=> b!43020 (= res!36548 (bvsge i!635 to!314))))

(assert (=> b!43020 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!64905 () Unit!3058)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1732) Unit!3058)

(assert (=> b!43020 (= lt!64905 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!64901 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43020 (= lt!64901 (bitIndex!0 (size!994 (buf!1328 thiss!1379)) (currentByte!2794 thiss!1379) (currentBit!2789 thiss!1379)))))

(declare-fun b!43021 () Bool)

(assert (=> b!43021 (= e!28714 e!28717)))

(declare-fun res!36552 () Bool)

(assert (=> b!43021 (=> res!36552 e!28717)))

(assert (=> b!43021 (= res!36552 (not (isPrefixOf!0 thiss!1379 (_2!2200 lt!64906))))))

(assert (=> b!43021 (validate_offset_bits!1 ((_ sign_extend 32) (size!994 (buf!1328 (_2!2200 lt!64906)))) ((_ sign_extend 32) (currentByte!2794 (_2!2200 lt!64906))) ((_ sign_extend 32) (currentBit!2789 (_2!2200 lt!64906))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!64904 () Unit!3058)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1732 BitStream!1732 (_ BitVec 64) (_ BitVec 64)) Unit!3058)

(assert (=> b!43021 (= lt!64904 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2200 lt!64906) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1732 (_ BitVec 8) (_ BitVec 32)) tuple2!4214)

(assert (=> b!43021 (= lt!64906 (appendBitFromByte!0 thiss!1379 (select (arr!1496 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!36549 () Bool)

(assert (=> start!8636 (=> (not res!36549) (not e!28715))))

(assert (=> start!8636 (= res!36549 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!994 srcBuffer!2))))))))

(assert (=> start!8636 e!28715))

(assert (=> start!8636 true))

(declare-fun array_inv!919 (array!2200) Bool)

(assert (=> start!8636 (array_inv!919 srcBuffer!2)))

(declare-fun e!28713 () Bool)

(declare-fun inv!12 (BitStream!1732) Bool)

(assert (=> start!8636 (and (inv!12 thiss!1379) e!28713)))

(declare-fun b!43017 () Bool)

(assert (=> b!43017 (= e!28713 (array_inv!919 (buf!1328 thiss!1379)))))

(assert (= (and start!8636 res!36549) b!43016))

(assert (= (and b!43016 res!36551) b!43020))

(assert (= (and b!43020 (not res!36548)) b!43021))

(assert (= (and b!43021 (not res!36552)) b!43018))

(assert (= (and b!43018 res!36550) b!43019))

(assert (= start!8636 b!43017))

(declare-fun m!65317 () Bool)

(assert (=> b!43020 m!65317))

(declare-fun m!65319 () Bool)

(assert (=> b!43020 m!65319))

(declare-fun m!65321 () Bool)

(assert (=> b!43020 m!65321))

(declare-fun m!65323 () Bool)

(assert (=> b!43021 m!65323))

(declare-fun m!65325 () Bool)

(assert (=> b!43021 m!65325))

(declare-fun m!65327 () Bool)

(assert (=> b!43021 m!65327))

(declare-fun m!65329 () Bool)

(assert (=> b!43021 m!65329))

(assert (=> b!43021 m!65323))

(declare-fun m!65331 () Bool)

(assert (=> b!43021 m!65331))

(declare-fun m!65333 () Bool)

(assert (=> start!8636 m!65333))

(declare-fun m!65335 () Bool)

(assert (=> start!8636 m!65335))

(declare-fun m!65337 () Bool)

(assert (=> b!43019 m!65337))

(assert (=> b!43019 m!65337))

(declare-fun m!65339 () Bool)

(assert (=> b!43019 m!65339))

(declare-fun m!65341 () Bool)

(assert (=> b!43019 m!65341))

(assert (=> b!43019 m!65341))

(declare-fun m!65343 () Bool)

(assert (=> b!43019 m!65343))

(declare-fun m!65345 () Bool)

(assert (=> b!43017 m!65345))

(declare-fun m!65347 () Bool)

(assert (=> b!43018 m!65347))

(declare-fun m!65349 () Bool)

(assert (=> b!43018 m!65349))

(declare-fun m!65351 () Bool)

(assert (=> b!43018 m!65351))

(declare-fun m!65353 () Bool)

(assert (=> b!43018 m!65353))

(declare-fun m!65355 () Bool)

(assert (=> b!43018 m!65355))

(declare-fun m!65357 () Bool)

(assert (=> b!43018 m!65357))

(declare-fun m!65359 () Bool)

(assert (=> b!43018 m!65359))

(declare-fun m!65361 () Bool)

(assert (=> b!43016 m!65361))

(push 1)

(assert (not b!43016))

