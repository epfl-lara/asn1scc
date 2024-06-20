; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64646 () Bool)

(assert start!64646)

(declare-fun res!239825 () Bool)

(declare-fun e!206745 () Bool)

(assert (=> start!64646 (=> (not res!239825) (not e!206745))))

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((array!17235 0))(
  ( (array!17236 (arr!8463 (Array (_ BitVec 32) (_ BitVec 8))) (size!7461 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17235)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64646 (= res!239825 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7461 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64646 e!206745))

(declare-datatypes ((BitStream!12932 0))(
  ( (BitStream!12933 (buf!7527 array!17235) (currentByte!13934 (_ BitVec 32)) (currentBit!13929 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12932)

(declare-fun e!206746 () Bool)

(declare-fun inv!12 (BitStream!12932) Bool)

(assert (=> start!64646 (and (inv!12 thiss!1728) e!206746)))

(assert (=> start!64646 true))

(declare-fun array_inv!7073 (array!17235) Bool)

(assert (=> start!64646 (array_inv!7073 arr!273)))

(declare-fun b!290288 () Bool)

(declare-fun res!239824 () Bool)

(assert (=> b!290288 (=> (not res!239824) (not e!206745))))

(assert (=> b!290288 (= res!239824 (bvslt from!505 to!474))))

(declare-fun b!290289 () Bool)

(declare-fun res!239823 () Bool)

(assert (=> b!290289 (=> (not res!239823) (not e!206745))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290289 (= res!239823 (validate_offset_bits!1 ((_ sign_extend 32) (size!7461 (buf!7527 thiss!1728))) ((_ sign_extend 32) (currentByte!13934 thiss!1728)) ((_ sign_extend 32) (currentBit!13929 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290290 () Bool)

(declare-datatypes ((Unit!20163 0))(
  ( (Unit!20164) )
))
(declare-datatypes ((tuple3!1666 0))(
  ( (tuple3!1667 (_1!12645 Unit!20163) (_2!12645 BitStream!12932) (_3!1247 array!17235)) )
))
(declare-fun lt!421063 () tuple3!1666)

(assert (=> b!290290 (= e!206745 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7461 (_3!1247 lt!421063)))))))))

(declare-fun lt!421065 () array!17235)

(declare-fun bitAt!0 (array!17235 (_ BitVec 64)) Bool)

(assert (=> b!290290 (= (bitAt!0 lt!421065 from!505) (bitAt!0 (_3!1247 lt!421063) from!505))))

(declare-fun lt!421068 () Unit!20163)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17235 array!17235 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20163)

(assert (=> b!290290 (= lt!421068 (arrayBitRangesEqImpliesEq!0 lt!421065 (_3!1247 lt!421063) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17235 array!17235 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290290 (arrayBitRangesEq!0 arr!273 (_3!1247 lt!421063) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421069 () Unit!20163)

(declare-fun arrayBitRangesEqTransitive!0 (array!17235 array!17235 array!17235 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20163)

(assert (=> b!290290 (= lt!421069 (arrayBitRangesEqTransitive!0 arr!273 lt!421065 (_3!1247 lt!421063) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290290 (arrayBitRangesEq!0 arr!273 lt!421065 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!421064 () Unit!20163)

(declare-datatypes ((tuple2!22796 0))(
  ( (tuple2!22797 (_1!12646 Bool) (_2!12646 BitStream!12932)) )
))
(declare-fun lt!421071 () tuple2!22796)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17235 (_ BitVec 64) Bool) Unit!20163)

(assert (=> b!290290 (= lt!421064 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12646 lt!421071)))))

(declare-fun e!206744 () Bool)

(assert (=> b!290290 e!206744))

(declare-fun res!239822 () Bool)

(assert (=> b!290290 (=> (not res!239822) (not e!206744))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290290 (= res!239822 (= (bvsub (bvadd (bitIndex!0 (size!7461 (buf!7527 thiss!1728)) (currentByte!13934 thiss!1728) (currentBit!13929 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7461 (buf!7527 (_2!12645 lt!421063))) (currentByte!13934 (_2!12645 lt!421063)) (currentBit!13929 (_2!12645 lt!421063)))))))

(declare-fun readBitsLoop!0 (BitStream!12932 (_ BitVec 64) array!17235 (_ BitVec 64) (_ BitVec 64)) tuple3!1666)

(assert (=> b!290290 (= lt!421063 (readBitsLoop!0 (_2!12646 lt!421071) nBits!523 lt!421065 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290290 (validate_offset_bits!1 ((_ sign_extend 32) (size!7461 (buf!7527 (_2!12646 lt!421071)))) ((_ sign_extend 32) (currentByte!13934 (_2!12646 lt!421071))) ((_ sign_extend 32) (currentBit!13929 (_2!12646 lt!421071))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421067 () Unit!20163)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12932 BitStream!12932 (_ BitVec 64) (_ BitVec 64)) Unit!20163)

(assert (=> b!290290 (= lt!421067 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12646 lt!421071) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!421070 () (_ BitVec 32))

(declare-fun lt!421066 () (_ BitVec 32))

(assert (=> b!290290 (= lt!421065 (array!17236 (store (arr!8463 arr!273) lt!421070 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8463 arr!273) lt!421070)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421066)))) ((_ sign_extend 24) (ite (_1!12646 lt!421071) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!421066) #b00000000))))) (size!7461 arr!273)))))

(assert (=> b!290290 (= lt!421066 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290290 (= lt!421070 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12932) tuple2!22796)

(assert (=> b!290290 (= lt!421071 (readBit!0 thiss!1728))))

(declare-fun b!290291 () Bool)

(assert (=> b!290291 (= e!206744 (and (= (buf!7527 thiss!1728) (buf!7527 (_2!12645 lt!421063))) (= (size!7461 arr!273) (size!7461 (_3!1247 lt!421063)))))))

(declare-fun b!290292 () Bool)

(assert (=> b!290292 (= e!206746 (array_inv!7073 (buf!7527 thiss!1728)))))

(assert (= (and start!64646 res!239825) b!290289))

(assert (= (and b!290289 res!239823) b!290288))

(assert (= (and b!290288 res!239824) b!290290))

(assert (= (and b!290290 res!239822) b!290291))

(assert (= start!64646 b!290292))

(declare-fun m!424215 () Bool)

(assert (=> start!64646 m!424215))

(declare-fun m!424217 () Bool)

(assert (=> start!64646 m!424217))

(declare-fun m!424219 () Bool)

(assert (=> b!290289 m!424219))

(declare-fun m!424221 () Bool)

(assert (=> b!290290 m!424221))

(declare-fun m!424223 () Bool)

(assert (=> b!290290 m!424223))

(declare-fun m!424225 () Bool)

(assert (=> b!290290 m!424225))

(declare-fun m!424227 () Bool)

(assert (=> b!290290 m!424227))

(declare-fun m!424229 () Bool)

(assert (=> b!290290 m!424229))

(declare-fun m!424231 () Bool)

(assert (=> b!290290 m!424231))

(declare-fun m!424233 () Bool)

(assert (=> b!290290 m!424233))

(declare-fun m!424235 () Bool)

(assert (=> b!290290 m!424235))

(declare-fun m!424237 () Bool)

(assert (=> b!290290 m!424237))

(declare-fun m!424239 () Bool)

(assert (=> b!290290 m!424239))

(declare-fun m!424241 () Bool)

(assert (=> b!290290 m!424241))

(declare-fun m!424243 () Bool)

(assert (=> b!290290 m!424243))

(declare-fun m!424245 () Bool)

(assert (=> b!290290 m!424245))

(declare-fun m!424247 () Bool)

(assert (=> b!290290 m!424247))

(declare-fun m!424249 () Bool)

(assert (=> b!290290 m!424249))

(declare-fun m!424251 () Bool)

(assert (=> b!290290 m!424251))

(declare-fun m!424253 () Bool)

(assert (=> b!290292 m!424253))

(push 1)

(assert (not b!290289))

(assert (not b!290290))

(assert (not b!290292))

(assert (not start!64646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

