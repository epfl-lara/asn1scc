; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11374 () Bool)

(assert start!11374)

(declare-datatypes ((array!2603 0))(
  ( (array!2604 (arr!1735 (Array (_ BitVec 32) (_ BitVec 8))) (size!1183 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2603)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!2054 0))(
  ( (BitStream!2055 (buf!1552 array!2603) (currentByte!3146 (_ BitVec 32)) (currentBit!3141 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3893 0))(
  ( (Unit!3894) )
))
(declare-datatypes ((tuple2!5134 0))(
  ( (tuple2!5135 (_1!2678 Unit!3893) (_2!2678 BitStream!2054)) )
))
(declare-fun lt!88347 () tuple2!5134)

(declare-fun b!56314 () Bool)

(declare-datatypes ((tuple2!5136 0))(
  ( (tuple2!5137 (_1!2679 BitStream!2054) (_2!2679 BitStream!2054)) )
))
(declare-fun lt!88351 () tuple2!5136)

(declare-fun e!37474 () Bool)

(declare-datatypes ((List!602 0))(
  ( (Nil!599) (Cons!598 (h!717 Bool) (t!1352 List!602)) )
))
(declare-fun head!421 (List!602) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2054 array!2603 (_ BitVec 64) (_ BitVec 64)) List!602)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2054 BitStream!2054 (_ BitVec 64)) List!602)

(assert (=> b!56314 (= e!37474 (= (head!421 (byteArrayBitContentToList!0 (_2!2678 lt!88347) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!421 (bitStreamReadBitsIntoList!0 (_2!2678 lt!88347) (_1!2679 lt!88351) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!56315 () Bool)

(declare-fun res!46857 () Bool)

(declare-fun e!37471 () Bool)

(assert (=> b!56315 (=> res!46857 e!37471)))

(declare-fun thiss!1379 () BitStream!2054)

(declare-fun lt!88350 () tuple2!5134)

(assert (=> b!56315 (= res!46857 (not (= (size!1183 (buf!1552 thiss!1379)) (size!1183 (buf!1552 (_2!2678 lt!88350))))))))

(declare-fun b!56316 () Bool)

(assert (=> b!56316 (= e!37471 true)))

(assert (=> b!56316 (= (size!1183 (buf!1552 (_2!2678 lt!88350))) (size!1183 (buf!1552 thiss!1379)))))

(declare-fun b!56317 () Bool)

(declare-fun e!37475 () Bool)

(declare-fun array_inv!1086 (array!2603) Bool)

(assert (=> b!56317 (= e!37475 (array_inv!1086 (buf!1552 thiss!1379)))))

(declare-fun b!56319 () Bool)

(declare-fun e!37473 () Bool)

(declare-fun e!37468 () Bool)

(assert (=> b!56319 (= e!37473 (not e!37468))))

(declare-fun res!46853 () Bool)

(assert (=> b!56319 (=> res!46853 e!37468)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!56319 (= res!46853 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2054 BitStream!2054) Bool)

(assert (=> b!56319 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!88345 () Unit!3893)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2054) Unit!3893)

(assert (=> b!56319 (= lt!88345 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!88344 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56319 (= lt!88344 (bitIndex!0 (size!1183 (buf!1552 thiss!1379)) (currentByte!3146 thiss!1379) (currentBit!3141 thiss!1379)))))

(declare-fun b!56320 () Bool)

(declare-fun res!46854 () Bool)

(assert (=> b!56320 (=> res!46854 e!37471)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56320 (= res!46854 (not (invariant!0 (currentBit!3141 (_2!2678 lt!88350)) (currentByte!3146 (_2!2678 lt!88350)) (size!1183 (buf!1552 (_2!2678 lt!88350))))))))

(declare-fun b!56321 () Bool)

(declare-fun res!46850 () Bool)

(assert (=> b!56321 (=> res!46850 e!37471)))

(assert (=> b!56321 (= res!46850 (not (= (bitIndex!0 (size!1183 (buf!1552 (_2!2678 lt!88350))) (currentByte!3146 (_2!2678 lt!88350)) (currentBit!3141 (_2!2678 lt!88350))) (bvsub (bvadd lt!88344 to!314) i!635))))))

(declare-fun b!56322 () Bool)

(declare-fun res!46851 () Bool)

(assert (=> b!56322 (=> (not res!46851) (not e!37473))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56322 (= res!46851 (validate_offset_bits!1 ((_ sign_extend 32) (size!1183 (buf!1552 thiss!1379))) ((_ sign_extend 32) (currentByte!3146 thiss!1379)) ((_ sign_extend 32) (currentBit!3141 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!56323 () Bool)

(declare-fun e!37469 () Bool)

(assert (=> b!56323 (= e!37469 e!37471)))

(declare-fun res!46855 () Bool)

(assert (=> b!56323 (=> res!46855 e!37471)))

(assert (=> b!56323 (= res!46855 (not (isPrefixOf!0 (_2!2678 lt!88347) (_2!2678 lt!88350))))))

(assert (=> b!56323 (isPrefixOf!0 thiss!1379 (_2!2678 lt!88350))))

(declare-fun lt!88346 () Unit!3893)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2054 BitStream!2054 BitStream!2054) Unit!3893)

(assert (=> b!56323 (= lt!88346 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2678 lt!88347) (_2!2678 lt!88350)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2054 array!2603 (_ BitVec 64) (_ BitVec 64)) tuple2!5134)

(assert (=> b!56323 (= lt!88350 (appendBitsMSBFirstLoop!0 (_2!2678 lt!88347) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!56323 e!37474))

(declare-fun res!46856 () Bool)

(assert (=> b!56323 (=> (not res!46856) (not e!37474))))

(assert (=> b!56323 (= res!46856 (validate_offset_bits!1 ((_ sign_extend 32) (size!1183 (buf!1552 (_2!2678 lt!88347)))) ((_ sign_extend 32) (currentByte!3146 thiss!1379)) ((_ sign_extend 32) (currentBit!3141 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88348 () Unit!3893)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2054 array!2603 (_ BitVec 64)) Unit!3893)

(assert (=> b!56323 (= lt!88348 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1552 (_2!2678 lt!88347)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2054 BitStream!2054) tuple2!5136)

(assert (=> b!56323 (= lt!88351 (reader!0 thiss!1379 (_2!2678 lt!88347)))))

(declare-fun b!56318 () Bool)

(assert (=> b!56318 (= e!37468 e!37469)))

(declare-fun res!46849 () Bool)

(assert (=> b!56318 (=> res!46849 e!37469)))

(assert (=> b!56318 (= res!46849 (not (isPrefixOf!0 thiss!1379 (_2!2678 lt!88347))))))

(assert (=> b!56318 (validate_offset_bits!1 ((_ sign_extend 32) (size!1183 (buf!1552 (_2!2678 lt!88347)))) ((_ sign_extend 32) (currentByte!3146 (_2!2678 lt!88347))) ((_ sign_extend 32) (currentBit!3141 (_2!2678 lt!88347))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88349 () Unit!3893)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2054 BitStream!2054 (_ BitVec 64) (_ BitVec 64)) Unit!3893)

(assert (=> b!56318 (= lt!88349 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2678 lt!88347) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2054 (_ BitVec 8) (_ BitVec 32)) tuple2!5134)

(assert (=> b!56318 (= lt!88347 (appendBitFromByte!0 thiss!1379 (select (arr!1735 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!46852 () Bool)

(assert (=> start!11374 (=> (not res!46852) (not e!37473))))

(assert (=> start!11374 (= res!46852 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1183 srcBuffer!2))))))))

(assert (=> start!11374 e!37473))

(assert (=> start!11374 true))

(assert (=> start!11374 (array_inv!1086 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2054) Bool)

(assert (=> start!11374 (and (inv!12 thiss!1379) e!37475)))

(assert (= (and start!11374 res!46852) b!56322))

(assert (= (and b!56322 res!46851) b!56319))

(assert (= (and b!56319 (not res!46853)) b!56318))

(assert (= (and b!56318 (not res!46849)) b!56323))

(assert (= (and b!56323 res!46856) b!56314))

(assert (= (and b!56323 (not res!46855)) b!56321))

(assert (= (and b!56321 (not res!46850)) b!56320))

(assert (= (and b!56320 (not res!46854)) b!56315))

(assert (= (and b!56315 (not res!46857)) b!56316))

(assert (= start!11374 b!56317))

(declare-fun m!88751 () Bool)

(assert (=> b!56317 m!88751))

(declare-fun m!88753 () Bool)

(assert (=> start!11374 m!88753))

(declare-fun m!88755 () Bool)

(assert (=> start!11374 m!88755))

(declare-fun m!88757 () Bool)

(assert (=> b!56322 m!88757))

(declare-fun m!88759 () Bool)

(assert (=> b!56314 m!88759))

(assert (=> b!56314 m!88759))

(declare-fun m!88761 () Bool)

(assert (=> b!56314 m!88761))

(declare-fun m!88763 () Bool)

(assert (=> b!56314 m!88763))

(assert (=> b!56314 m!88763))

(declare-fun m!88765 () Bool)

(assert (=> b!56314 m!88765))

(declare-fun m!88767 () Bool)

(assert (=> b!56319 m!88767))

(declare-fun m!88769 () Bool)

(assert (=> b!56319 m!88769))

(declare-fun m!88771 () Bool)

(assert (=> b!56319 m!88771))

(declare-fun m!88773 () Bool)

(assert (=> b!56321 m!88773))

(declare-fun m!88775 () Bool)

(assert (=> b!56323 m!88775))

(declare-fun m!88777 () Bool)

(assert (=> b!56323 m!88777))

(declare-fun m!88779 () Bool)

(assert (=> b!56323 m!88779))

(declare-fun m!88781 () Bool)

(assert (=> b!56323 m!88781))

(declare-fun m!88783 () Bool)

(assert (=> b!56323 m!88783))

(declare-fun m!88785 () Bool)

(assert (=> b!56323 m!88785))

(declare-fun m!88787 () Bool)

(assert (=> b!56323 m!88787))

(declare-fun m!88789 () Bool)

(assert (=> b!56318 m!88789))

(declare-fun m!88791 () Bool)

(assert (=> b!56318 m!88791))

(declare-fun m!88793 () Bool)

(assert (=> b!56318 m!88793))

(assert (=> b!56318 m!88789))

(declare-fun m!88795 () Bool)

(assert (=> b!56318 m!88795))

(declare-fun m!88797 () Bool)

(assert (=> b!56318 m!88797))

(declare-fun m!88799 () Bool)

(assert (=> b!56320 m!88799))

(push 1)

