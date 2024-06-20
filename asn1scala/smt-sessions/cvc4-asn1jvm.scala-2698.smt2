; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66068 () Bool)

(assert start!66068)

(declare-fun b!296296 () Bool)

(declare-datatypes ((array!17736 0))(
  ( (array!17737 (arr!8745 (Array (_ BitVec 32) (_ BitVec 8))) (size!7686 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13376 0))(
  ( (BitStream!13377 (buf!7749 array!17736) (currentByte!14270 (_ BitVec 32)) (currentBit!14265 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13376)

(declare-fun e!211998 () Bool)

(declare-datatypes ((Unit!20657 0))(
  ( (Unit!20658) )
))
(declare-datatypes ((tuple3!1888 0))(
  ( (tuple3!1889 (_1!13053 Unit!20657) (_2!13053 BitStream!13376) (_3!1394 array!17736)) )
))
(declare-fun lt!431547 () tuple3!1888)

(declare-fun arr!273 () array!17736)

(assert (=> b!296296 (= e!211998 (and (= (buf!7749 thiss!1728) (buf!7749 (_2!13053 lt!431547))) (= (size!7686 arr!273) (size!7686 (_3!1394 lt!431547)))))))

(declare-fun b!296297 () Bool)

(declare-fun e!211993 () Bool)

(declare-fun lt!431543 () Bool)

(declare-datatypes ((tuple2!23318 0))(
  ( (tuple2!23319 (_1!13054 Bool) (_2!13054 BitStream!13376)) )
))
(declare-fun lt!431540 () tuple2!23318)

(assert (=> b!296297 (= e!211993 (= lt!431543 (_1!13054 lt!431540)))))

(declare-fun b!296298 () Bool)

(declare-fun res!244629 () Bool)

(declare-fun e!211995 () Bool)

(assert (=> b!296298 (=> (not res!244629) (not e!211995))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!296298 (= res!244629 (bvslt from!505 to!474))))

(declare-fun b!296299 () Bool)

(assert (=> b!296299 (= e!211995 (not true))))

(assert (=> b!296299 e!211993))

(declare-fun res!244628 () Bool)

(assert (=> b!296299 (=> (not res!244628) (not e!211993))))

(declare-fun lt!431544 () array!17736)

(declare-fun bitAt!0 (array!17736 (_ BitVec 64)) Bool)

(assert (=> b!296299 (= res!244628 (= (bitAt!0 lt!431544 from!505) lt!431543))))

(assert (=> b!296299 (= lt!431543 (bitAt!0 (_3!1394 lt!431547) from!505))))

(declare-fun lt!431539 () Unit!20657)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17736 array!17736 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20657)

(assert (=> b!296299 (= lt!431539 (arrayBitRangesEqImpliesEq!0 lt!431544 (_3!1394 lt!431547) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17736 array!17736 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296299 (arrayBitRangesEq!0 arr!273 (_3!1394 lt!431547) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431545 () Unit!20657)

(declare-fun arrayBitRangesEqTransitive!0 (array!17736 array!17736 array!17736 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20657)

(assert (=> b!296299 (= lt!431545 (arrayBitRangesEqTransitive!0 arr!273 lt!431544 (_3!1394 lt!431547) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296299 (arrayBitRangesEq!0 arr!273 lt!431544 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431546 () Unit!20657)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17736 (_ BitVec 64) Bool) Unit!20657)

(assert (=> b!296299 (= lt!431546 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13054 lt!431540)))))

(assert (=> b!296299 e!211998))

(declare-fun res!244627 () Bool)

(assert (=> b!296299 (=> (not res!244627) (not e!211998))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296299 (= res!244627 (= (bvsub (bvadd (bitIndex!0 (size!7686 (buf!7749 thiss!1728)) (currentByte!14270 thiss!1728) (currentBit!14265 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7686 (buf!7749 (_2!13053 lt!431547))) (currentByte!14270 (_2!13053 lt!431547)) (currentBit!14265 (_2!13053 lt!431547)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13376 (_ BitVec 64) array!17736 (_ BitVec 64) (_ BitVec 64)) tuple3!1888)

(assert (=> b!296299 (= lt!431547 (readBitsLoop!0 (_2!13054 lt!431540) nBits!523 lt!431544 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296299 (validate_offset_bits!1 ((_ sign_extend 32) (size!7686 (buf!7749 (_2!13054 lt!431540)))) ((_ sign_extend 32) (currentByte!14270 (_2!13054 lt!431540))) ((_ sign_extend 32) (currentBit!14265 (_2!13054 lt!431540))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431542 () Unit!20657)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13376 BitStream!13376 (_ BitVec 64) (_ BitVec 64)) Unit!20657)

(assert (=> b!296299 (= lt!431542 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13054 lt!431540) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431538 () (_ BitVec 32))

(declare-fun lt!431541 () (_ BitVec 32))

(assert (=> b!296299 (= lt!431544 (array!17737 (store (arr!8745 arr!273) lt!431538 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8745 arr!273) lt!431538)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431541)))) ((_ sign_extend 24) (ite (_1!13054 lt!431540) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431541) #b00000000))))) (size!7686 arr!273)))))

(assert (=> b!296299 (= lt!431541 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296299 (= lt!431538 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13376) tuple2!23318)

(assert (=> b!296299 (= lt!431540 (readBit!0 thiss!1728))))

(declare-fun b!296300 () Bool)

(declare-fun res!244630 () Bool)

(assert (=> b!296300 (=> (not res!244630) (not e!211995))))

(assert (=> b!296300 (= res!244630 (validate_offset_bits!1 ((_ sign_extend 32) (size!7686 (buf!7749 thiss!1728))) ((_ sign_extend 32) (currentByte!14270 thiss!1728)) ((_ sign_extend 32) (currentBit!14265 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!244631 () Bool)

(assert (=> start!66068 (=> (not res!244631) (not e!211995))))

(assert (=> start!66068 (= res!244631 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7686 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66068 e!211995))

(declare-fun e!211996 () Bool)

(declare-fun inv!12 (BitStream!13376) Bool)

(assert (=> start!66068 (and (inv!12 thiss!1728) e!211996)))

(assert (=> start!66068 true))

(declare-fun array_inv!7298 (array!17736) Bool)

(assert (=> start!66068 (array_inv!7298 arr!273)))

(declare-fun b!296301 () Bool)

(assert (=> b!296301 (= e!211996 (array_inv!7298 (buf!7749 thiss!1728)))))

(assert (= (and start!66068 res!244631) b!296300))

(assert (= (and b!296300 res!244630) b!296298))

(assert (= (and b!296298 res!244629) b!296299))

(assert (= (and b!296299 res!244627) b!296296))

(assert (= (and b!296299 res!244628) b!296297))

(assert (= start!66068 b!296301))

(declare-fun m!434325 () Bool)

(assert (=> b!296299 m!434325))

(declare-fun m!434327 () Bool)

(assert (=> b!296299 m!434327))

(declare-fun m!434329 () Bool)

(assert (=> b!296299 m!434329))

(declare-fun m!434331 () Bool)

(assert (=> b!296299 m!434331))

(declare-fun m!434333 () Bool)

(assert (=> b!296299 m!434333))

(declare-fun m!434335 () Bool)

(assert (=> b!296299 m!434335))

(declare-fun m!434337 () Bool)

(assert (=> b!296299 m!434337))

(declare-fun m!434339 () Bool)

(assert (=> b!296299 m!434339))

(declare-fun m!434341 () Bool)

(assert (=> b!296299 m!434341))

(declare-fun m!434343 () Bool)

(assert (=> b!296299 m!434343))

(declare-fun m!434345 () Bool)

(assert (=> b!296299 m!434345))

(declare-fun m!434347 () Bool)

(assert (=> b!296299 m!434347))

(declare-fun m!434349 () Bool)

(assert (=> b!296299 m!434349))

(declare-fun m!434351 () Bool)

(assert (=> b!296299 m!434351))

(declare-fun m!434353 () Bool)

(assert (=> b!296299 m!434353))

(declare-fun m!434355 () Bool)

(assert (=> b!296299 m!434355))

(declare-fun m!434357 () Bool)

(assert (=> b!296300 m!434357))

(declare-fun m!434359 () Bool)

(assert (=> start!66068 m!434359))

(declare-fun m!434361 () Bool)

(assert (=> start!66068 m!434361))

(declare-fun m!434363 () Bool)

(assert (=> b!296301 m!434363))

(push 1)

