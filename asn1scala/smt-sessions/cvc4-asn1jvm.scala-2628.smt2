; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64922 () Bool)

(assert start!64922)

(declare-fun res!240659 () Bool)

(declare-fun e!207598 () Bool)

(assert (=> start!64922 (=> (not res!240659) (not e!207598))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17286 0))(
  ( (array!17287 (arr!8502 (Array (_ BitVec 32) (_ BitVec 8))) (size!7482 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17286)

(assert (=> start!64922 (= res!240659 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7482 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64922 e!207598))

(declare-datatypes ((BitStream!12974 0))(
  ( (BitStream!12975 (buf!7548 array!17286) (currentByte!13982 (_ BitVec 32)) (currentBit!13977 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12974)

(declare-fun e!207601 () Bool)

(declare-fun inv!12 (BitStream!12974) Bool)

(assert (=> start!64922 (and (inv!12 thiss!1728) e!207601)))

(assert (=> start!64922 true))

(declare-fun array_inv!7094 (array!17286) Bool)

(assert (=> start!64922 (array_inv!7094 arr!273)))

(declare-fun b!291322 () Bool)

(assert (=> b!291322 (= e!207598 (not true))))

(declare-datatypes ((tuple2!22876 0))(
  ( (tuple2!22877 (_1!12715 BitStream!12974) (_2!12715 Bool)) )
))
(declare-fun lt!423380 () tuple2!22876)

(declare-fun readBitPure!0 (BitStream!12974) tuple2!22876)

(assert (=> b!291322 (= lt!423380 (readBitPure!0 thiss!1728))))

(declare-fun e!207603 () Bool)

(assert (=> b!291322 e!207603))

(declare-fun res!240658 () Bool)

(assert (=> b!291322 (=> (not res!240658) (not e!207603))))

(declare-fun lt!423375 () Bool)

(declare-fun lt!423377 () array!17286)

(declare-fun bitAt!0 (array!17286 (_ BitVec 64)) Bool)

(assert (=> b!291322 (= res!240658 (= (bitAt!0 lt!423377 from!505) lt!423375))))

(declare-datatypes ((Unit!20241 0))(
  ( (Unit!20242) )
))
(declare-datatypes ((tuple3!1708 0))(
  ( (tuple3!1709 (_1!12716 Unit!20241) (_2!12716 BitStream!12974) (_3!1277 array!17286)) )
))
(declare-fun lt!423376 () tuple3!1708)

(assert (=> b!291322 (= lt!423375 (bitAt!0 (_3!1277 lt!423376) from!505))))

(declare-fun lt!423383 () Unit!20241)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17286 array!17286 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20241)

(assert (=> b!291322 (= lt!423383 (arrayBitRangesEqImpliesEq!0 lt!423377 (_3!1277 lt!423376) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17286 array!17286 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291322 (arrayBitRangesEq!0 arr!273 (_3!1277 lt!423376) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423379 () Unit!20241)

(declare-fun arrayBitRangesEqTransitive!0 (array!17286 array!17286 array!17286 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20241)

(assert (=> b!291322 (= lt!423379 (arrayBitRangesEqTransitive!0 arr!273 lt!423377 (_3!1277 lt!423376) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291322 (arrayBitRangesEq!0 arr!273 lt!423377 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22878 0))(
  ( (tuple2!22879 (_1!12717 Bool) (_2!12717 BitStream!12974)) )
))
(declare-fun lt!423382 () tuple2!22878)

(declare-fun lt!423381 () Unit!20241)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17286 (_ BitVec 64) Bool) Unit!20241)

(assert (=> b!291322 (= lt!423381 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12717 lt!423382)))))

(declare-fun e!207600 () Bool)

(assert (=> b!291322 e!207600))

(declare-fun res!240662 () Bool)

(assert (=> b!291322 (=> (not res!240662) (not e!207600))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291322 (= res!240662 (= (bvsub (bvadd (bitIndex!0 (size!7482 (buf!7548 thiss!1728)) (currentByte!13982 thiss!1728) (currentBit!13977 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7482 (buf!7548 (_2!12716 lt!423376))) (currentByte!13982 (_2!12716 lt!423376)) (currentBit!13977 (_2!12716 lt!423376)))))))

(declare-fun readBitsLoop!0 (BitStream!12974 (_ BitVec 64) array!17286 (_ BitVec 64) (_ BitVec 64)) tuple3!1708)

(assert (=> b!291322 (= lt!423376 (readBitsLoop!0 (_2!12717 lt!423382) nBits!523 lt!423377 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291322 (validate_offset_bits!1 ((_ sign_extend 32) (size!7482 (buf!7548 (_2!12717 lt!423382)))) ((_ sign_extend 32) (currentByte!13982 (_2!12717 lt!423382))) ((_ sign_extend 32) (currentBit!13977 (_2!12717 lt!423382))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423384 () Unit!20241)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12974 BitStream!12974 (_ BitVec 64) (_ BitVec 64)) Unit!20241)

(assert (=> b!291322 (= lt!423384 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12717 lt!423382) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423374 () (_ BitVec 32))

(declare-fun lt!423378 () (_ BitVec 32))

(assert (=> b!291322 (= lt!423377 (array!17287 (store (arr!8502 arr!273) lt!423374 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8502 arr!273) lt!423374)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423378)))) ((_ sign_extend 24) (ite (_1!12717 lt!423382) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423378) #b00000000))))) (size!7482 arr!273)))))

(assert (=> b!291322 (= lt!423378 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291322 (= lt!423374 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12974) tuple2!22878)

(assert (=> b!291322 (= lt!423382 (readBit!0 thiss!1728))))

(declare-fun b!291323 () Bool)

(assert (=> b!291323 (= e!207601 (array_inv!7094 (buf!7548 thiss!1728)))))

(declare-fun b!291324 () Bool)

(assert (=> b!291324 (= e!207600 (and (= (buf!7548 thiss!1728) (buf!7548 (_2!12716 lt!423376))) (= (size!7482 arr!273) (size!7482 (_3!1277 lt!423376)))))))

(declare-fun b!291325 () Bool)

(declare-fun res!240661 () Bool)

(assert (=> b!291325 (=> (not res!240661) (not e!207598))))

(assert (=> b!291325 (= res!240661 (validate_offset_bits!1 ((_ sign_extend 32) (size!7482 (buf!7548 thiss!1728))) ((_ sign_extend 32) (currentByte!13982 thiss!1728)) ((_ sign_extend 32) (currentBit!13977 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291326 () Bool)

(assert (=> b!291326 (= e!207603 (= lt!423375 (_1!12717 lt!423382)))))

(declare-fun b!291327 () Bool)

(declare-fun res!240660 () Bool)

(assert (=> b!291327 (=> (not res!240660) (not e!207598))))

(assert (=> b!291327 (= res!240660 (bvslt from!505 to!474))))

(assert (= (and start!64922 res!240659) b!291325))

(assert (= (and b!291325 res!240661) b!291327))

(assert (= (and b!291327 res!240660) b!291322))

(assert (= (and b!291322 res!240662) b!291324))

(assert (= (and b!291322 res!240658) b!291326))

(assert (= start!64922 b!291323))

(declare-fun m!426229 () Bool)

(assert (=> start!64922 m!426229))

(declare-fun m!426231 () Bool)

(assert (=> start!64922 m!426231))

(declare-fun m!426233 () Bool)

(assert (=> b!291322 m!426233))

(declare-fun m!426235 () Bool)

(assert (=> b!291322 m!426235))

(declare-fun m!426237 () Bool)

(assert (=> b!291322 m!426237))

(declare-fun m!426239 () Bool)

(assert (=> b!291322 m!426239))

(declare-fun m!426241 () Bool)

(assert (=> b!291322 m!426241))

(declare-fun m!426243 () Bool)

(assert (=> b!291322 m!426243))

(declare-fun m!426245 () Bool)

(assert (=> b!291322 m!426245))

(declare-fun m!426247 () Bool)

(assert (=> b!291322 m!426247))

(declare-fun m!426249 () Bool)

(assert (=> b!291322 m!426249))

(declare-fun m!426251 () Bool)

(assert (=> b!291322 m!426251))

(declare-fun m!426253 () Bool)

(assert (=> b!291322 m!426253))

(declare-fun m!426255 () Bool)

(assert (=> b!291322 m!426255))

(declare-fun m!426257 () Bool)

(assert (=> b!291322 m!426257))

(declare-fun m!426259 () Bool)

(assert (=> b!291322 m!426259))

(declare-fun m!426261 () Bool)

(assert (=> b!291322 m!426261))

(declare-fun m!426263 () Bool)

(assert (=> b!291322 m!426263))

(declare-fun m!426265 () Bool)

(assert (=> b!291322 m!426265))

(declare-fun m!426267 () Bool)

(assert (=> b!291323 m!426267))

(declare-fun m!426269 () Bool)

(assert (=> b!291325 m!426269))

(push 1)

(assert (not b!291325))

(assert (not b!291323))

(assert (not start!64922))

(assert (not b!291322))

(check-sat)

