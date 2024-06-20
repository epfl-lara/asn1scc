; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66060 () Bool)

(assert start!66060)

(declare-fun res!244567 () Bool)

(declare-fun e!211923 () Bool)

(assert (=> start!66060 (=> (not res!244567) (not e!211923))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17728 0))(
  ( (array!17729 (arr!8741 (Array (_ BitVec 32) (_ BitVec 8))) (size!7682 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17728)

(assert (=> start!66060 (= res!244567 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7682 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66060 e!211923))

(declare-datatypes ((BitStream!13368 0))(
  ( (BitStream!13369 (buf!7745 array!17728) (currentByte!14266 (_ BitVec 32)) (currentBit!14261 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13368)

(declare-fun e!211925 () Bool)

(declare-fun inv!12 (BitStream!13368) Bool)

(assert (=> start!66060 (and (inv!12 thiss!1728) e!211925)))

(assert (=> start!66060 true))

(declare-fun array_inv!7294 (array!17728) Bool)

(assert (=> start!66060 (array_inv!7294 arr!273)))

(declare-fun b!296224 () Bool)

(declare-fun res!244569 () Bool)

(assert (=> b!296224 (=> (not res!244569) (not e!211923))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296224 (= res!244569 (validate_offset_bits!1 ((_ sign_extend 32) (size!7682 (buf!7745 thiss!1728))) ((_ sign_extend 32) (currentByte!14266 thiss!1728)) ((_ sign_extend 32) (currentBit!14261 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296225 () Bool)

(assert (=> b!296225 (= e!211925 (array_inv!7294 (buf!7745 thiss!1728)))))

(declare-fun b!296226 () Bool)

(declare-fun res!244568 () Bool)

(assert (=> b!296226 (=> (not res!244568) (not e!211923))))

(assert (=> b!296226 (= res!244568 (bvslt from!505 to!474))))

(declare-fun b!296227 () Bool)

(assert (=> b!296227 (= e!211923 (not true))))

(declare-fun e!211926 () Bool)

(assert (=> b!296227 e!211926))

(declare-fun res!244570 () Bool)

(assert (=> b!296227 (=> (not res!244570) (not e!211926))))

(declare-fun lt!431424 () array!17728)

(declare-fun lt!431422 () Bool)

(declare-fun bitAt!0 (array!17728 (_ BitVec 64)) Bool)

(assert (=> b!296227 (= res!244570 (= (bitAt!0 lt!431424 from!505) lt!431422))))

(declare-datatypes ((Unit!20649 0))(
  ( (Unit!20650) )
))
(declare-datatypes ((tuple3!1880 0))(
  ( (tuple3!1881 (_1!13045 Unit!20649) (_2!13045 BitStream!13368) (_3!1390 array!17728)) )
))
(declare-fun lt!431421 () tuple3!1880)

(assert (=> b!296227 (= lt!431422 (bitAt!0 (_3!1390 lt!431421) from!505))))

(declare-fun lt!431419 () Unit!20649)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17728 array!17728 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20649)

(assert (=> b!296227 (= lt!431419 (arrayBitRangesEqImpliesEq!0 lt!431424 (_3!1390 lt!431421) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17728 array!17728 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296227 (arrayBitRangesEq!0 arr!273 (_3!1390 lt!431421) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431426 () Unit!20649)

(declare-fun arrayBitRangesEqTransitive!0 (array!17728 array!17728 array!17728 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20649)

(assert (=> b!296227 (= lt!431426 (arrayBitRangesEqTransitive!0 arr!273 lt!431424 (_3!1390 lt!431421) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296227 (arrayBitRangesEq!0 arr!273 lt!431424 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431425 () Unit!20649)

(declare-datatypes ((tuple2!23310 0))(
  ( (tuple2!23311 (_1!13046 Bool) (_2!13046 BitStream!13368)) )
))
(declare-fun lt!431427 () tuple2!23310)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17728 (_ BitVec 64) Bool) Unit!20649)

(assert (=> b!296227 (= lt!431425 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13046 lt!431427)))))

(declare-fun e!211924 () Bool)

(assert (=> b!296227 e!211924))

(declare-fun res!244571 () Bool)

(assert (=> b!296227 (=> (not res!244571) (not e!211924))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296227 (= res!244571 (= (bvsub (bvadd (bitIndex!0 (size!7682 (buf!7745 thiss!1728)) (currentByte!14266 thiss!1728) (currentBit!14261 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7682 (buf!7745 (_2!13045 lt!431421))) (currentByte!14266 (_2!13045 lt!431421)) (currentBit!14261 (_2!13045 lt!431421)))))))

(declare-fun readBitsLoop!0 (BitStream!13368 (_ BitVec 64) array!17728 (_ BitVec 64) (_ BitVec 64)) tuple3!1880)

(assert (=> b!296227 (= lt!431421 (readBitsLoop!0 (_2!13046 lt!431427) nBits!523 lt!431424 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296227 (validate_offset_bits!1 ((_ sign_extend 32) (size!7682 (buf!7745 (_2!13046 lt!431427)))) ((_ sign_extend 32) (currentByte!14266 (_2!13046 lt!431427))) ((_ sign_extend 32) (currentBit!14261 (_2!13046 lt!431427))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431420 () Unit!20649)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13368 BitStream!13368 (_ BitVec 64) (_ BitVec 64)) Unit!20649)

(assert (=> b!296227 (= lt!431420 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13046 lt!431427) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431418 () (_ BitVec 32))

(declare-fun lt!431423 () (_ BitVec 32))

(assert (=> b!296227 (= lt!431424 (array!17729 (store (arr!8741 arr!273) lt!431418 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8741 arr!273) lt!431418)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431423)))) ((_ sign_extend 24) (ite (_1!13046 lt!431427) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431423) #b00000000))))) (size!7682 arr!273)))))

(assert (=> b!296227 (= lt!431423 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296227 (= lt!431418 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13368) tuple2!23310)

(assert (=> b!296227 (= lt!431427 (readBit!0 thiss!1728))))

(declare-fun b!296228 () Bool)

(assert (=> b!296228 (= e!211924 (and (= (buf!7745 thiss!1728) (buf!7745 (_2!13045 lt!431421))) (= (size!7682 arr!273) (size!7682 (_3!1390 lt!431421)))))))

(declare-fun b!296229 () Bool)

(assert (=> b!296229 (= e!211926 (= lt!431422 (_1!13046 lt!431427)))))

(assert (= (and start!66060 res!244567) b!296224))

(assert (= (and b!296224 res!244569) b!296226))

(assert (= (and b!296226 res!244568) b!296227))

(assert (= (and b!296227 res!244571) b!296228))

(assert (= (and b!296227 res!244570) b!296229))

(assert (= start!66060 b!296225))

(declare-fun m!434165 () Bool)

(assert (=> start!66060 m!434165))

(declare-fun m!434167 () Bool)

(assert (=> start!66060 m!434167))

(declare-fun m!434169 () Bool)

(assert (=> b!296224 m!434169))

(declare-fun m!434171 () Bool)

(assert (=> b!296225 m!434171))

(declare-fun m!434173 () Bool)

(assert (=> b!296227 m!434173))

(declare-fun m!434175 () Bool)

(assert (=> b!296227 m!434175))

(declare-fun m!434177 () Bool)

(assert (=> b!296227 m!434177))

(declare-fun m!434179 () Bool)

(assert (=> b!296227 m!434179))

(declare-fun m!434181 () Bool)

(assert (=> b!296227 m!434181))

(declare-fun m!434183 () Bool)

(assert (=> b!296227 m!434183))

(declare-fun m!434185 () Bool)

(assert (=> b!296227 m!434185))

(declare-fun m!434187 () Bool)

(assert (=> b!296227 m!434187))

(declare-fun m!434189 () Bool)

(assert (=> b!296227 m!434189))

(declare-fun m!434191 () Bool)

(assert (=> b!296227 m!434191))

(declare-fun m!434193 () Bool)

(assert (=> b!296227 m!434193))

(declare-fun m!434195 () Bool)

(assert (=> b!296227 m!434195))

(declare-fun m!434197 () Bool)

(assert (=> b!296227 m!434197))

(declare-fun m!434199 () Bool)

(assert (=> b!296227 m!434199))

(declare-fun m!434201 () Bool)

(assert (=> b!296227 m!434201))

(declare-fun m!434203 () Bool)

(assert (=> b!296227 m!434203))

(check-sat (not b!296227) (not start!66060) (not b!296225) (not b!296224))
