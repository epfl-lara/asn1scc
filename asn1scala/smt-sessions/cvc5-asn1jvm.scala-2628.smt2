; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64918 () Bool)

(assert start!64918)

(declare-fun res!240630 () Bool)

(declare-fun e!207564 () Bool)

(assert (=> start!64918 (=> (not res!240630) (not e!207564))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17282 0))(
  ( (array!17283 (arr!8500 (Array (_ BitVec 32) (_ BitVec 8))) (size!7480 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17282)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64918 (= res!240630 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7480 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64918 e!207564))

(declare-datatypes ((BitStream!12970 0))(
  ( (BitStream!12971 (buf!7546 array!17282) (currentByte!13980 (_ BitVec 32)) (currentBit!13975 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12970)

(declare-fun e!207565 () Bool)

(declare-fun inv!12 (BitStream!12970) Bool)

(assert (=> start!64918 (and (inv!12 thiss!1728) e!207565)))

(assert (=> start!64918 true))

(declare-fun array_inv!7092 (array!17282) Bool)

(assert (=> start!64918 (array_inv!7092 arr!273)))

(declare-fun b!291286 () Bool)

(declare-fun e!207562 () Bool)

(declare-fun lt!423314 () Bool)

(declare-datatypes ((tuple2!22868 0))(
  ( (tuple2!22869 (_1!12709 Bool) (_2!12709 BitStream!12970)) )
))
(declare-fun lt!423312 () tuple2!22868)

(assert (=> b!291286 (= e!207562 (= lt!423314 (_1!12709 lt!423312)))))

(declare-fun b!291287 () Bool)

(assert (=> b!291287 (= e!207565 (array_inv!7092 (buf!7546 thiss!1728)))))

(declare-fun e!207563 () Bool)

(declare-datatypes ((Unit!20237 0))(
  ( (Unit!20238) )
))
(declare-datatypes ((tuple3!1704 0))(
  ( (tuple3!1705 (_1!12710 Unit!20237) (_2!12710 BitStream!12970) (_3!1275 array!17282)) )
))
(declare-fun lt!423309 () tuple3!1704)

(declare-fun b!291288 () Bool)

(assert (=> b!291288 (= e!207563 (and (= (buf!7546 thiss!1728) (buf!7546 (_2!12710 lt!423309))) (= (size!7480 arr!273) (size!7480 (_3!1275 lt!423309)))))))

(declare-fun b!291289 () Bool)

(declare-fun res!240628 () Bool)

(assert (=> b!291289 (=> (not res!240628) (not e!207564))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291289 (= res!240628 (validate_offset_bits!1 ((_ sign_extend 32) (size!7480 (buf!7546 thiss!1728))) ((_ sign_extend 32) (currentByte!13980 thiss!1728)) ((_ sign_extend 32) (currentBit!13975 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291290 () Bool)

(declare-fun res!240632 () Bool)

(assert (=> b!291290 (=> (not res!240632) (not e!207564))))

(assert (=> b!291290 (= res!240632 (bvslt from!505 to!474))))

(declare-fun b!291291 () Bool)

(assert (=> b!291291 (= e!207564 (not true))))

(declare-datatypes ((tuple2!22870 0))(
  ( (tuple2!22871 (_1!12711 BitStream!12970) (_2!12711 Bool)) )
))
(declare-fun lt!423310 () tuple2!22870)

(declare-fun readBitPure!0 (BitStream!12970) tuple2!22870)

(assert (=> b!291291 (= lt!423310 (readBitPure!0 thiss!1728))))

(assert (=> b!291291 e!207562))

(declare-fun res!240631 () Bool)

(assert (=> b!291291 (=> (not res!240631) (not e!207562))))

(declare-fun lt!423313 () array!17282)

(declare-fun bitAt!0 (array!17282 (_ BitVec 64)) Bool)

(assert (=> b!291291 (= res!240631 (= (bitAt!0 lt!423313 from!505) lt!423314))))

(assert (=> b!291291 (= lt!423314 (bitAt!0 (_3!1275 lt!423309) from!505))))

(declare-fun lt!423311 () Unit!20237)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17282 array!17282 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20237)

(assert (=> b!291291 (= lt!423311 (arrayBitRangesEqImpliesEq!0 lt!423313 (_3!1275 lt!423309) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17282 array!17282 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291291 (arrayBitRangesEq!0 arr!273 (_3!1275 lt!423309) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423317 () Unit!20237)

(declare-fun arrayBitRangesEqTransitive!0 (array!17282 array!17282 array!17282 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20237)

(assert (=> b!291291 (= lt!423317 (arrayBitRangesEqTransitive!0 arr!273 lt!423313 (_3!1275 lt!423309) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291291 (arrayBitRangesEq!0 arr!273 lt!423313 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423315 () Unit!20237)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17282 (_ BitVec 64) Bool) Unit!20237)

(assert (=> b!291291 (= lt!423315 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12709 lt!423312)))))

(assert (=> b!291291 e!207563))

(declare-fun res!240629 () Bool)

(assert (=> b!291291 (=> (not res!240629) (not e!207563))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291291 (= res!240629 (= (bvsub (bvadd (bitIndex!0 (size!7480 (buf!7546 thiss!1728)) (currentByte!13980 thiss!1728) (currentBit!13975 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7480 (buf!7546 (_2!12710 lt!423309))) (currentByte!13980 (_2!12710 lt!423309)) (currentBit!13975 (_2!12710 lt!423309)))))))

(declare-fun readBitsLoop!0 (BitStream!12970 (_ BitVec 64) array!17282 (_ BitVec 64) (_ BitVec 64)) tuple3!1704)

(assert (=> b!291291 (= lt!423309 (readBitsLoop!0 (_2!12709 lt!423312) nBits!523 lt!423313 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291291 (validate_offset_bits!1 ((_ sign_extend 32) (size!7480 (buf!7546 (_2!12709 lt!423312)))) ((_ sign_extend 32) (currentByte!13980 (_2!12709 lt!423312))) ((_ sign_extend 32) (currentBit!13975 (_2!12709 lt!423312))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423308 () Unit!20237)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12970 BitStream!12970 (_ BitVec 64) (_ BitVec 64)) Unit!20237)

(assert (=> b!291291 (= lt!423308 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12709 lt!423312) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423316 () (_ BitVec 32))

(declare-fun lt!423318 () (_ BitVec 32))

(assert (=> b!291291 (= lt!423313 (array!17283 (store (arr!8500 arr!273) lt!423318 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8500 arr!273) lt!423318)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423316)))) ((_ sign_extend 24) (ite (_1!12709 lt!423312) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423316) #b00000000))))) (size!7480 arr!273)))))

(assert (=> b!291291 (= lt!423316 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291291 (= lt!423318 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12970) tuple2!22868)

(assert (=> b!291291 (= lt!423312 (readBit!0 thiss!1728))))

(assert (= (and start!64918 res!240630) b!291289))

(assert (= (and b!291289 res!240628) b!291290))

(assert (= (and b!291290 res!240632) b!291291))

(assert (= (and b!291291 res!240629) b!291288))

(assert (= (and b!291291 res!240631) b!291286))

(assert (= start!64918 b!291287))

(declare-fun m!426145 () Bool)

(assert (=> start!64918 m!426145))

(declare-fun m!426147 () Bool)

(assert (=> start!64918 m!426147))

(declare-fun m!426149 () Bool)

(assert (=> b!291287 m!426149))

(declare-fun m!426151 () Bool)

(assert (=> b!291289 m!426151))

(declare-fun m!426153 () Bool)

(assert (=> b!291291 m!426153))

(declare-fun m!426155 () Bool)

(assert (=> b!291291 m!426155))

(declare-fun m!426157 () Bool)

(assert (=> b!291291 m!426157))

(declare-fun m!426159 () Bool)

(assert (=> b!291291 m!426159))

(declare-fun m!426161 () Bool)

(assert (=> b!291291 m!426161))

(declare-fun m!426163 () Bool)

(assert (=> b!291291 m!426163))

(declare-fun m!426165 () Bool)

(assert (=> b!291291 m!426165))

(declare-fun m!426167 () Bool)

(assert (=> b!291291 m!426167))

(declare-fun m!426169 () Bool)

(assert (=> b!291291 m!426169))

(declare-fun m!426171 () Bool)

(assert (=> b!291291 m!426171))

(declare-fun m!426173 () Bool)

(assert (=> b!291291 m!426173))

(declare-fun m!426175 () Bool)

(assert (=> b!291291 m!426175))

(declare-fun m!426177 () Bool)

(assert (=> b!291291 m!426177))

(declare-fun m!426179 () Bool)

(assert (=> b!291291 m!426179))

(declare-fun m!426181 () Bool)

(assert (=> b!291291 m!426181))

(declare-fun m!426183 () Bool)

(assert (=> b!291291 m!426183))

(declare-fun m!426185 () Bool)

(assert (=> b!291291 m!426185))

(push 1)

(assert (not b!291287))

(assert (not start!64918))

(assert (not b!291291))

(assert (not b!291289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

