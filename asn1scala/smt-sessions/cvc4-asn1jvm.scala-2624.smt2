; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64820 () Bool)

(assert start!64820)

(declare-fun b!290887 () Bool)

(declare-fun e!207226 () Bool)

(assert (=> b!290887 (= e!207226 (not true))))

(declare-fun e!207225 () Bool)

(assert (=> b!290887 e!207225))

(declare-fun res!240307 () Bool)

(assert (=> b!290887 (=> (not res!240307) (not e!207225))))

(declare-datatypes ((array!17259 0))(
  ( (array!17260 (arr!8484 (Array (_ BitVec 32) (_ BitVec 8))) (size!7470 (_ BitVec 32))) )
))
(declare-fun lt!422452 () array!17259)

(declare-fun lt!422456 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun bitAt!0 (array!17259 (_ BitVec 64)) Bool)

(assert (=> b!290887 (= res!240307 (= (bitAt!0 lt!422452 from!505) lt!422456))))

(declare-datatypes ((BitStream!12950 0))(
  ( (BitStream!12951 (buf!7536 array!17259) (currentByte!13961 (_ BitVec 32)) (currentBit!13956 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20205 0))(
  ( (Unit!20206) )
))
(declare-datatypes ((tuple3!1684 0))(
  ( (tuple3!1685 (_1!12680 Unit!20205) (_2!12680 BitStream!12950) (_3!1262 array!17259)) )
))
(declare-fun lt!422455 () tuple3!1684)

(assert (=> b!290887 (= lt!422456 (bitAt!0 (_3!1262 lt!422455) from!505))))

(declare-fun lt!422457 () Unit!20205)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17259 array!17259 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20205)

(assert (=> b!290887 (= lt!422457 (arrayBitRangesEqImpliesEq!0 lt!422452 (_3!1262 lt!422455) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17259)

(declare-fun arrayBitRangesEq!0 (array!17259 array!17259 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290887 (arrayBitRangesEq!0 arr!273 (_3!1262 lt!422455) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422449 () Unit!20205)

(declare-fun arrayBitRangesEqTransitive!0 (array!17259 array!17259 array!17259 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20205)

(assert (=> b!290887 (= lt!422449 (arrayBitRangesEqTransitive!0 arr!273 lt!422452 (_3!1262 lt!422455) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290887 (arrayBitRangesEq!0 arr!273 lt!422452 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22836 0))(
  ( (tuple2!22837 (_1!12681 Bool) (_2!12681 BitStream!12950)) )
))
(declare-fun lt!422448 () tuple2!22836)

(declare-fun lt!422450 () Unit!20205)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17259 (_ BitVec 64) Bool) Unit!20205)

(assert (=> b!290887 (= lt!422450 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12681 lt!422448)))))

(declare-fun e!207227 () Bool)

(assert (=> b!290887 e!207227))

(declare-fun res!240308 () Bool)

(assert (=> b!290887 (=> (not res!240308) (not e!207227))))

(declare-fun thiss!1728 () BitStream!12950)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290887 (= res!240308 (= (bvsub (bvadd (bitIndex!0 (size!7470 (buf!7536 thiss!1728)) (currentByte!13961 thiss!1728) (currentBit!13956 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7470 (buf!7536 (_2!12680 lt!422455))) (currentByte!13961 (_2!12680 lt!422455)) (currentBit!13956 (_2!12680 lt!422455)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12950 (_ BitVec 64) array!17259 (_ BitVec 64) (_ BitVec 64)) tuple3!1684)

(assert (=> b!290887 (= lt!422455 (readBitsLoop!0 (_2!12681 lt!422448) nBits!523 lt!422452 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290887 (validate_offset_bits!1 ((_ sign_extend 32) (size!7470 (buf!7536 (_2!12681 lt!422448)))) ((_ sign_extend 32) (currentByte!13961 (_2!12681 lt!422448))) ((_ sign_extend 32) (currentBit!13956 (_2!12681 lt!422448))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422453 () Unit!20205)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12950 BitStream!12950 (_ BitVec 64) (_ BitVec 64)) Unit!20205)

(assert (=> b!290887 (= lt!422453 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12681 lt!422448) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422451 () (_ BitVec 32))

(declare-fun lt!422454 () (_ BitVec 32))

(assert (=> b!290887 (= lt!422452 (array!17260 (store (arr!8484 arr!273) lt!422454 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8484 arr!273) lt!422454)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422451)))) ((_ sign_extend 24) (ite (_1!12681 lt!422448) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422451) #b00000000))))) (size!7470 arr!273)))))

(assert (=> b!290887 (= lt!422451 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290887 (= lt!422454 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12950) tuple2!22836)

(assert (=> b!290887 (= lt!422448 (readBit!0 thiss!1728))))

(declare-fun b!290888 () Bool)

(declare-fun res!240304 () Bool)

(assert (=> b!290888 (=> (not res!240304) (not e!207226))))

(assert (=> b!290888 (= res!240304 (validate_offset_bits!1 ((_ sign_extend 32) (size!7470 (buf!7536 thiss!1728))) ((_ sign_extend 32) (currentByte!13961 thiss!1728)) ((_ sign_extend 32) (currentBit!13956 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290889 () Bool)

(assert (=> b!290889 (= e!207227 (and (= (buf!7536 thiss!1728) (buf!7536 (_2!12680 lt!422455))) (= (size!7470 arr!273) (size!7470 (_3!1262 lt!422455)))))))

(declare-fun b!290890 () Bool)

(declare-fun res!240305 () Bool)

(assert (=> b!290890 (=> (not res!240305) (not e!207226))))

(assert (=> b!290890 (= res!240305 (bvslt from!505 to!474))))

(declare-fun res!240306 () Bool)

(assert (=> start!64820 (=> (not res!240306) (not e!207226))))

(assert (=> start!64820 (= res!240306 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7470 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64820 e!207226))

(declare-fun e!207223 () Bool)

(declare-fun inv!12 (BitStream!12950) Bool)

(assert (=> start!64820 (and (inv!12 thiss!1728) e!207223)))

(assert (=> start!64820 true))

(declare-fun array_inv!7082 (array!17259) Bool)

(assert (=> start!64820 (array_inv!7082 arr!273)))

(declare-fun b!290891 () Bool)

(assert (=> b!290891 (= e!207223 (array_inv!7082 (buf!7536 thiss!1728)))))

(declare-fun b!290892 () Bool)

(assert (=> b!290892 (= e!207225 (= lt!422456 (_1!12681 lt!422448)))))

(assert (= (and start!64820 res!240306) b!290888))

(assert (= (and b!290888 res!240304) b!290890))

(assert (= (and b!290890 res!240305) b!290887))

(assert (= (and b!290887 res!240308) b!290889))

(assert (= (and b!290887 res!240307) b!290892))

(assert (= start!64820 b!290891))

(declare-fun m!425355 () Bool)

(assert (=> b!290887 m!425355))

(declare-fun m!425357 () Bool)

(assert (=> b!290887 m!425357))

(declare-fun m!425359 () Bool)

(assert (=> b!290887 m!425359))

(declare-fun m!425361 () Bool)

(assert (=> b!290887 m!425361))

(declare-fun m!425363 () Bool)

(assert (=> b!290887 m!425363))

(declare-fun m!425365 () Bool)

(assert (=> b!290887 m!425365))

(declare-fun m!425367 () Bool)

(assert (=> b!290887 m!425367))

(declare-fun m!425369 () Bool)

(assert (=> b!290887 m!425369))

(declare-fun m!425371 () Bool)

(assert (=> b!290887 m!425371))

(declare-fun m!425373 () Bool)

(assert (=> b!290887 m!425373))

(declare-fun m!425375 () Bool)

(assert (=> b!290887 m!425375))

(declare-fun m!425377 () Bool)

(assert (=> b!290887 m!425377))

(declare-fun m!425379 () Bool)

(assert (=> b!290887 m!425379))

(declare-fun m!425381 () Bool)

(assert (=> b!290887 m!425381))

(declare-fun m!425383 () Bool)

(assert (=> b!290887 m!425383))

(declare-fun m!425385 () Bool)

(assert (=> b!290887 m!425385))

(declare-fun m!425387 () Bool)

(assert (=> b!290888 m!425387))

(declare-fun m!425389 () Bool)

(assert (=> start!64820 m!425389))

(declare-fun m!425391 () Bool)

(assert (=> start!64820 m!425391))

(declare-fun m!425393 () Bool)

(assert (=> b!290891 m!425393))

(push 1)

(assert (not b!290891))

(assert (not start!64820))

(assert (not b!290887))

(assert (not b!290888))

(check-sat)

