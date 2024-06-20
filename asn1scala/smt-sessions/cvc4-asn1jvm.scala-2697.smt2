; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66062 () Bool)

(assert start!66062)

(declare-fun b!296242 () Bool)

(declare-fun e!211941 () Bool)

(declare-datatypes ((array!17730 0))(
  ( (array!17731 (arr!8742 (Array (_ BitVec 32) (_ BitVec 8))) (size!7683 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13370 0))(
  ( (BitStream!13371 (buf!7746 array!17730) (currentByte!14267 (_ BitVec 32)) (currentBit!14262 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13370)

(declare-fun array_inv!7295 (array!17730) Bool)

(assert (=> b!296242 (= e!211941 (array_inv!7295 (buf!7746 thiss!1728)))))

(declare-fun b!296243 () Bool)

(declare-fun res!244583 () Bool)

(declare-fun e!211942 () Bool)

(assert (=> b!296243 (=> (not res!244583) (not e!211942))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296243 (= res!244583 (validate_offset_bits!1 ((_ sign_extend 32) (size!7683 (buf!7746 thiss!1728))) ((_ sign_extend 32) (currentByte!14267 thiss!1728)) ((_ sign_extend 32) (currentBit!14262 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!244582 () Bool)

(assert (=> start!66062 (=> (not res!244582) (not e!211942))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17730)

(assert (=> start!66062 (= res!244582 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7683 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66062 e!211942))

(declare-fun inv!12 (BitStream!13370) Bool)

(assert (=> start!66062 (and (inv!12 thiss!1728) e!211941)))

(assert (=> start!66062 true))

(assert (=> start!66062 (array_inv!7295 arr!273)))

(declare-fun b!296244 () Bool)

(declare-fun res!244585 () Bool)

(assert (=> b!296244 (=> (not res!244585) (not e!211942))))

(assert (=> b!296244 (= res!244585 (bvslt from!505 to!474))))

(declare-fun b!296245 () Bool)

(assert (=> b!296245 (= e!211942 (not true))))

(declare-fun e!211943 () Bool)

(assert (=> b!296245 e!211943))

(declare-fun res!244584 () Bool)

(assert (=> b!296245 (=> (not res!244584) (not e!211943))))

(declare-fun lt!431454 () Bool)

(declare-fun lt!431448 () array!17730)

(declare-fun bitAt!0 (array!17730 (_ BitVec 64)) Bool)

(assert (=> b!296245 (= res!244584 (= (bitAt!0 lt!431448 from!505) lt!431454))))

(declare-datatypes ((Unit!20651 0))(
  ( (Unit!20652) )
))
(declare-datatypes ((tuple3!1882 0))(
  ( (tuple3!1883 (_1!13047 Unit!20651) (_2!13047 BitStream!13370) (_3!1391 array!17730)) )
))
(declare-fun lt!431457 () tuple3!1882)

(assert (=> b!296245 (= lt!431454 (bitAt!0 (_3!1391 lt!431457) from!505))))

(declare-fun lt!431449 () Unit!20651)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17730 array!17730 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20651)

(assert (=> b!296245 (= lt!431449 (arrayBitRangesEqImpliesEq!0 lt!431448 (_3!1391 lt!431457) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17730 array!17730 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296245 (arrayBitRangesEq!0 arr!273 (_3!1391 lt!431457) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431456 () Unit!20651)

(declare-fun arrayBitRangesEqTransitive!0 (array!17730 array!17730 array!17730 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20651)

(assert (=> b!296245 (= lt!431456 (arrayBitRangesEqTransitive!0 arr!273 lt!431448 (_3!1391 lt!431457) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296245 (arrayBitRangesEq!0 arr!273 lt!431448 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431451 () Unit!20651)

(declare-datatypes ((tuple2!23312 0))(
  ( (tuple2!23313 (_1!13048 Bool) (_2!13048 BitStream!13370)) )
))
(declare-fun lt!431450 () tuple2!23312)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17730 (_ BitVec 64) Bool) Unit!20651)

(assert (=> b!296245 (= lt!431451 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13048 lt!431450)))))

(declare-fun e!211939 () Bool)

(assert (=> b!296245 e!211939))

(declare-fun res!244586 () Bool)

(assert (=> b!296245 (=> (not res!244586) (not e!211939))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296245 (= res!244586 (= (bvsub (bvadd (bitIndex!0 (size!7683 (buf!7746 thiss!1728)) (currentByte!14267 thiss!1728) (currentBit!14262 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7683 (buf!7746 (_2!13047 lt!431457))) (currentByte!14267 (_2!13047 lt!431457)) (currentBit!14262 (_2!13047 lt!431457)))))))

(declare-fun readBitsLoop!0 (BitStream!13370 (_ BitVec 64) array!17730 (_ BitVec 64) (_ BitVec 64)) tuple3!1882)

(assert (=> b!296245 (= lt!431457 (readBitsLoop!0 (_2!13048 lt!431450) nBits!523 lt!431448 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296245 (validate_offset_bits!1 ((_ sign_extend 32) (size!7683 (buf!7746 (_2!13048 lt!431450)))) ((_ sign_extend 32) (currentByte!14267 (_2!13048 lt!431450))) ((_ sign_extend 32) (currentBit!14262 (_2!13048 lt!431450))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431455 () Unit!20651)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13370 BitStream!13370 (_ BitVec 64) (_ BitVec 64)) Unit!20651)

(assert (=> b!296245 (= lt!431455 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13048 lt!431450) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431453 () (_ BitVec 32))

(declare-fun lt!431452 () (_ BitVec 32))

(assert (=> b!296245 (= lt!431448 (array!17731 (store (arr!8742 arr!273) lt!431453 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8742 arr!273) lt!431453)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431452)))) ((_ sign_extend 24) (ite (_1!13048 lt!431450) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431452) #b00000000))))) (size!7683 arr!273)))))

(assert (=> b!296245 (= lt!431452 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296245 (= lt!431453 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13370) tuple2!23312)

(assert (=> b!296245 (= lt!431450 (readBit!0 thiss!1728))))

(declare-fun b!296246 () Bool)

(assert (=> b!296246 (= e!211943 (= lt!431454 (_1!13048 lt!431450)))))

(declare-fun b!296247 () Bool)

(assert (=> b!296247 (= e!211939 (and (= (buf!7746 thiss!1728) (buf!7746 (_2!13047 lt!431457))) (= (size!7683 arr!273) (size!7683 (_3!1391 lt!431457)))))))

(assert (= (and start!66062 res!244582) b!296243))

(assert (= (and b!296243 res!244583) b!296244))

(assert (= (and b!296244 res!244585) b!296245))

(assert (= (and b!296245 res!244586) b!296247))

(assert (= (and b!296245 res!244584) b!296246))

(assert (= start!66062 b!296242))

(declare-fun m!434205 () Bool)

(assert (=> b!296242 m!434205))

(declare-fun m!434207 () Bool)

(assert (=> b!296243 m!434207))

(declare-fun m!434209 () Bool)

(assert (=> start!66062 m!434209))

(declare-fun m!434211 () Bool)

(assert (=> start!66062 m!434211))

(declare-fun m!434213 () Bool)

(assert (=> b!296245 m!434213))

(declare-fun m!434215 () Bool)

(assert (=> b!296245 m!434215))

(declare-fun m!434217 () Bool)

(assert (=> b!296245 m!434217))

(declare-fun m!434219 () Bool)

(assert (=> b!296245 m!434219))

(declare-fun m!434221 () Bool)

(assert (=> b!296245 m!434221))

(declare-fun m!434223 () Bool)

(assert (=> b!296245 m!434223))

(declare-fun m!434225 () Bool)

(assert (=> b!296245 m!434225))

(declare-fun m!434227 () Bool)

(assert (=> b!296245 m!434227))

(declare-fun m!434229 () Bool)

(assert (=> b!296245 m!434229))

(declare-fun m!434231 () Bool)

(assert (=> b!296245 m!434231))

(declare-fun m!434233 () Bool)

(assert (=> b!296245 m!434233))

(declare-fun m!434235 () Bool)

(assert (=> b!296245 m!434235))

(declare-fun m!434237 () Bool)

(assert (=> b!296245 m!434237))

(declare-fun m!434239 () Bool)

(assert (=> b!296245 m!434239))

(declare-fun m!434241 () Bool)

(assert (=> b!296245 m!434241))

(declare-fun m!434243 () Bool)

(assert (=> b!296245 m!434243))

(push 1)

(assert (not b!296245))

(assert (not start!66062))

(assert (not b!296243))

(assert (not b!296242))

(check-sat)

(pop 1)

