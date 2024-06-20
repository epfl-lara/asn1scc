; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66064 () Bool)

(assert start!66064)

(declare-fun b!296260 () Bool)

(declare-fun e!211958 () Bool)

(assert (=> b!296260 (= e!211958 (not true))))

(declare-fun e!211962 () Bool)

(assert (=> b!296260 e!211962))

(declare-fun res!244598 () Bool)

(assert (=> b!296260 (=> (not res!244598) (not e!211962))))

(declare-datatypes ((array!17732 0))(
  ( (array!17733 (arr!8743 (Array (_ BitVec 32) (_ BitVec 8))) (size!7684 (_ BitVec 32))) )
))
(declare-fun lt!431481 () array!17732)

(declare-fun lt!431483 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun bitAt!0 (array!17732 (_ BitVec 64)) Bool)

(assert (=> b!296260 (= res!244598 (= (bitAt!0 lt!431481 from!505) lt!431483))))

(declare-datatypes ((BitStream!13372 0))(
  ( (BitStream!13373 (buf!7747 array!17732) (currentByte!14268 (_ BitVec 32)) (currentBit!14263 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20653 0))(
  ( (Unit!20654) )
))
(declare-datatypes ((tuple3!1884 0))(
  ( (tuple3!1885 (_1!13049 Unit!20653) (_2!13049 BitStream!13372) (_3!1392 array!17732)) )
))
(declare-fun lt!431479 () tuple3!1884)

(assert (=> b!296260 (= lt!431483 (bitAt!0 (_3!1392 lt!431479) from!505))))

(declare-fun lt!431486 () Unit!20653)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17732 array!17732 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20653)

(assert (=> b!296260 (= lt!431486 (arrayBitRangesEqImpliesEq!0 lt!431481 (_3!1392 lt!431479) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17732)

(declare-fun arrayBitRangesEq!0 (array!17732 array!17732 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296260 (arrayBitRangesEq!0 arr!273 (_3!1392 lt!431479) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431485 () Unit!20653)

(declare-fun arrayBitRangesEqTransitive!0 (array!17732 array!17732 array!17732 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20653)

(assert (=> b!296260 (= lt!431485 (arrayBitRangesEqTransitive!0 arr!273 lt!431481 (_3!1392 lt!431479) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296260 (arrayBitRangesEq!0 arr!273 lt!431481 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23314 0))(
  ( (tuple2!23315 (_1!13050 Bool) (_2!13050 BitStream!13372)) )
))
(declare-fun lt!431487 () tuple2!23314)

(declare-fun lt!431482 () Unit!20653)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17732 (_ BitVec 64) Bool) Unit!20653)

(assert (=> b!296260 (= lt!431482 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13050 lt!431487)))))

(declare-fun e!211959 () Bool)

(assert (=> b!296260 e!211959))

(declare-fun res!244601 () Bool)

(assert (=> b!296260 (=> (not res!244601) (not e!211959))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun thiss!1728 () BitStream!13372)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296260 (= res!244601 (= (bvsub (bvadd (bitIndex!0 (size!7684 (buf!7747 thiss!1728)) (currentByte!14268 thiss!1728) (currentBit!14263 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7684 (buf!7747 (_2!13049 lt!431479))) (currentByte!14268 (_2!13049 lt!431479)) (currentBit!14263 (_2!13049 lt!431479)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13372 (_ BitVec 64) array!17732 (_ BitVec 64) (_ BitVec 64)) tuple3!1884)

(assert (=> b!296260 (= lt!431479 (readBitsLoop!0 (_2!13050 lt!431487) nBits!523 lt!431481 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296260 (validate_offset_bits!1 ((_ sign_extend 32) (size!7684 (buf!7747 (_2!13050 lt!431487)))) ((_ sign_extend 32) (currentByte!14268 (_2!13050 lt!431487))) ((_ sign_extend 32) (currentBit!14263 (_2!13050 lt!431487))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431480 () Unit!20653)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13372 BitStream!13372 (_ BitVec 64) (_ BitVec 64)) Unit!20653)

(assert (=> b!296260 (= lt!431480 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13050 lt!431487) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431484 () (_ BitVec 32))

(declare-fun lt!431478 () (_ BitVec 32))

(assert (=> b!296260 (= lt!431481 (array!17733 (store (arr!8743 arr!273) lt!431484 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8743 arr!273) lt!431484)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431478)))) ((_ sign_extend 24) (ite (_1!13050 lt!431487) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431478) #b00000000))))) (size!7684 arr!273)))))

(assert (=> b!296260 (= lt!431478 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296260 (= lt!431484 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13372) tuple2!23314)

(assert (=> b!296260 (= lt!431487 (readBit!0 thiss!1728))))

(declare-fun b!296261 () Bool)

(declare-fun res!244600 () Bool)

(assert (=> b!296261 (=> (not res!244600) (not e!211958))))

(assert (=> b!296261 (= res!244600 (validate_offset_bits!1 ((_ sign_extend 32) (size!7684 (buf!7747 thiss!1728))) ((_ sign_extend 32) (currentByte!14268 thiss!1728)) ((_ sign_extend 32) (currentBit!14263 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296263 () Bool)

(assert (=> b!296263 (= e!211959 (and (= (buf!7747 thiss!1728) (buf!7747 (_2!13049 lt!431479))) (= (size!7684 arr!273) (size!7684 (_3!1392 lt!431479)))))))

(declare-fun b!296264 () Bool)

(declare-fun res!244597 () Bool)

(assert (=> b!296264 (=> (not res!244597) (not e!211958))))

(assert (=> b!296264 (= res!244597 (bvslt from!505 to!474))))

(declare-fun b!296265 () Bool)

(assert (=> b!296265 (= e!211962 (= lt!431483 (_1!13050 lt!431487)))))

(declare-fun res!244599 () Bool)

(assert (=> start!66064 (=> (not res!244599) (not e!211958))))

(assert (=> start!66064 (= res!244599 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7684 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66064 e!211958))

(declare-fun e!211957 () Bool)

(declare-fun inv!12 (BitStream!13372) Bool)

(assert (=> start!66064 (and (inv!12 thiss!1728) e!211957)))

(assert (=> start!66064 true))

(declare-fun array_inv!7296 (array!17732) Bool)

(assert (=> start!66064 (array_inv!7296 arr!273)))

(declare-fun b!296262 () Bool)

(assert (=> b!296262 (= e!211957 (array_inv!7296 (buf!7747 thiss!1728)))))

(assert (= (and start!66064 res!244599) b!296261))

(assert (= (and b!296261 res!244600) b!296264))

(assert (= (and b!296264 res!244597) b!296260))

(assert (= (and b!296260 res!244601) b!296263))

(assert (= (and b!296260 res!244598) b!296265))

(assert (= start!66064 b!296262))

(declare-fun m!434245 () Bool)

(assert (=> b!296260 m!434245))

(declare-fun m!434247 () Bool)

(assert (=> b!296260 m!434247))

(declare-fun m!434249 () Bool)

(assert (=> b!296260 m!434249))

(declare-fun m!434251 () Bool)

(assert (=> b!296260 m!434251))

(declare-fun m!434253 () Bool)

(assert (=> b!296260 m!434253))

(declare-fun m!434255 () Bool)

(assert (=> b!296260 m!434255))

(declare-fun m!434257 () Bool)

(assert (=> b!296260 m!434257))

(declare-fun m!434259 () Bool)

(assert (=> b!296260 m!434259))

(declare-fun m!434261 () Bool)

(assert (=> b!296260 m!434261))

(declare-fun m!434263 () Bool)

(assert (=> b!296260 m!434263))

(declare-fun m!434265 () Bool)

(assert (=> b!296260 m!434265))

(declare-fun m!434267 () Bool)

(assert (=> b!296260 m!434267))

(declare-fun m!434269 () Bool)

(assert (=> b!296260 m!434269))

(declare-fun m!434271 () Bool)

(assert (=> b!296260 m!434271))

(declare-fun m!434273 () Bool)

(assert (=> b!296260 m!434273))

(declare-fun m!434275 () Bool)

(assert (=> b!296260 m!434275))

(declare-fun m!434277 () Bool)

(assert (=> b!296261 m!434277))

(declare-fun m!434279 () Bool)

(assert (=> start!66064 m!434279))

(declare-fun m!434281 () Bool)

(assert (=> start!66064 m!434281))

(declare-fun m!434283 () Bool)

(assert (=> b!296262 m!434283))

(push 1)

(assert (not start!66064))

(assert (not b!296261))

(assert (not b!296260))

(assert (not b!296262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

