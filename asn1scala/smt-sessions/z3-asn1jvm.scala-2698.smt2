; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66066 () Bool)

(assert start!66066)

(declare-fun res!244614 () Bool)

(declare-fun e!211975 () Bool)

(assert (=> start!66066 (=> (not res!244614) (not e!211975))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17734 0))(
  ( (array!17735 (arr!8744 (Array (_ BitVec 32) (_ BitVec 8))) (size!7685 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17734)

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!66066 (= res!244614 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7685 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66066 e!211975))

(declare-datatypes ((BitStream!13374 0))(
  ( (BitStream!13375 (buf!7748 array!17734) (currentByte!14269 (_ BitVec 32)) (currentBit!14264 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13374)

(declare-fun e!211979 () Bool)

(declare-fun inv!12 (BitStream!13374) Bool)

(assert (=> start!66066 (and (inv!12 thiss!1728) e!211979)))

(assert (=> start!66066 true))

(declare-fun array_inv!7297 (array!17734) Bool)

(assert (=> start!66066 (array_inv!7297 arr!273)))

(declare-fun b!296278 () Bool)

(declare-fun res!244616 () Bool)

(assert (=> b!296278 (=> (not res!244616) (not e!211975))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296278 (= res!244616 (validate_offset_bits!1 ((_ sign_extend 32) (size!7685 (buf!7748 thiss!1728))) ((_ sign_extend 32) (currentByte!14269 thiss!1728)) ((_ sign_extend 32) (currentBit!14264 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296279 () Bool)

(assert (=> b!296279 (= e!211975 (not true))))

(declare-fun e!211980 () Bool)

(assert (=> b!296279 e!211980))

(declare-fun res!244612 () Bool)

(assert (=> b!296279 (=> (not res!244612) (not e!211980))))

(declare-fun lt!431508 () array!17734)

(declare-fun lt!431509 () Bool)

(declare-fun bitAt!0 (array!17734 (_ BitVec 64)) Bool)

(assert (=> b!296279 (= res!244612 (= (bitAt!0 lt!431508 from!505) lt!431509))))

(declare-datatypes ((Unit!20655 0))(
  ( (Unit!20656) )
))
(declare-datatypes ((tuple3!1886 0))(
  ( (tuple3!1887 (_1!13051 Unit!20655) (_2!13051 BitStream!13374) (_3!1393 array!17734)) )
))
(declare-fun lt!431517 () tuple3!1886)

(assert (=> b!296279 (= lt!431509 (bitAt!0 (_3!1393 lt!431517) from!505))))

(declare-fun lt!431511 () Unit!20655)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17734 array!17734 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20655)

(assert (=> b!296279 (= lt!431511 (arrayBitRangesEqImpliesEq!0 lt!431508 (_3!1393 lt!431517) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17734 array!17734 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296279 (arrayBitRangesEq!0 arr!273 (_3!1393 lt!431517) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431510 () Unit!20655)

(declare-fun arrayBitRangesEqTransitive!0 (array!17734 array!17734 array!17734 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20655)

(assert (=> b!296279 (= lt!431510 (arrayBitRangesEqTransitive!0 arr!273 lt!431508 (_3!1393 lt!431517) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296279 (arrayBitRangesEq!0 arr!273 lt!431508 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431516 () Unit!20655)

(declare-datatypes ((tuple2!23316 0))(
  ( (tuple2!23317 (_1!13052 Bool) (_2!13052 BitStream!13374)) )
))
(declare-fun lt!431513 () tuple2!23316)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17734 (_ BitVec 64) Bool) Unit!20655)

(assert (=> b!296279 (= lt!431516 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13052 lt!431513)))))

(declare-fun e!211977 () Bool)

(assert (=> b!296279 e!211977))

(declare-fun res!244615 () Bool)

(assert (=> b!296279 (=> (not res!244615) (not e!211977))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296279 (= res!244615 (= (bvsub (bvadd (bitIndex!0 (size!7685 (buf!7748 thiss!1728)) (currentByte!14269 thiss!1728) (currentBit!14264 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7685 (buf!7748 (_2!13051 lt!431517))) (currentByte!14269 (_2!13051 lt!431517)) (currentBit!14264 (_2!13051 lt!431517)))))))

(declare-fun readBitsLoop!0 (BitStream!13374 (_ BitVec 64) array!17734 (_ BitVec 64) (_ BitVec 64)) tuple3!1886)

(assert (=> b!296279 (= lt!431517 (readBitsLoop!0 (_2!13052 lt!431513) nBits!523 lt!431508 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296279 (validate_offset_bits!1 ((_ sign_extend 32) (size!7685 (buf!7748 (_2!13052 lt!431513)))) ((_ sign_extend 32) (currentByte!14269 (_2!13052 lt!431513))) ((_ sign_extend 32) (currentBit!14264 (_2!13052 lt!431513))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431512 () Unit!20655)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13374 BitStream!13374 (_ BitVec 64) (_ BitVec 64)) Unit!20655)

(assert (=> b!296279 (= lt!431512 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13052 lt!431513) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431514 () (_ BitVec 32))

(declare-fun lt!431515 () (_ BitVec 32))

(assert (=> b!296279 (= lt!431508 (array!17735 (store (arr!8744 arr!273) lt!431515 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8744 arr!273) lt!431515)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431514)))) ((_ sign_extend 24) (ite (_1!13052 lt!431513) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431514) #b00000000))))) (size!7685 arr!273)))))

(assert (=> b!296279 (= lt!431514 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296279 (= lt!431515 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13374) tuple2!23316)

(assert (=> b!296279 (= lt!431513 (readBit!0 thiss!1728))))

(declare-fun b!296280 () Bool)

(declare-fun res!244613 () Bool)

(assert (=> b!296280 (=> (not res!244613) (not e!211975))))

(assert (=> b!296280 (= res!244613 (bvslt from!505 to!474))))

(declare-fun b!296281 () Bool)

(assert (=> b!296281 (= e!211977 (and (= (buf!7748 thiss!1728) (buf!7748 (_2!13051 lt!431517))) (= (size!7685 arr!273) (size!7685 (_3!1393 lt!431517)))))))

(declare-fun b!296282 () Bool)

(assert (=> b!296282 (= e!211979 (array_inv!7297 (buf!7748 thiss!1728)))))

(declare-fun b!296283 () Bool)

(assert (=> b!296283 (= e!211980 (= lt!431509 (_1!13052 lt!431513)))))

(assert (= (and start!66066 res!244614) b!296278))

(assert (= (and b!296278 res!244616) b!296280))

(assert (= (and b!296280 res!244613) b!296279))

(assert (= (and b!296279 res!244615) b!296281))

(assert (= (and b!296279 res!244612) b!296283))

(assert (= start!66066 b!296282))

(declare-fun m!434285 () Bool)

(assert (=> start!66066 m!434285))

(declare-fun m!434287 () Bool)

(assert (=> start!66066 m!434287))

(declare-fun m!434289 () Bool)

(assert (=> b!296278 m!434289))

(declare-fun m!434291 () Bool)

(assert (=> b!296279 m!434291))

(declare-fun m!434293 () Bool)

(assert (=> b!296279 m!434293))

(declare-fun m!434295 () Bool)

(assert (=> b!296279 m!434295))

(declare-fun m!434297 () Bool)

(assert (=> b!296279 m!434297))

(declare-fun m!434299 () Bool)

(assert (=> b!296279 m!434299))

(declare-fun m!434301 () Bool)

(assert (=> b!296279 m!434301))

(declare-fun m!434303 () Bool)

(assert (=> b!296279 m!434303))

(declare-fun m!434305 () Bool)

(assert (=> b!296279 m!434305))

(declare-fun m!434307 () Bool)

(assert (=> b!296279 m!434307))

(declare-fun m!434309 () Bool)

(assert (=> b!296279 m!434309))

(declare-fun m!434311 () Bool)

(assert (=> b!296279 m!434311))

(declare-fun m!434313 () Bool)

(assert (=> b!296279 m!434313))

(declare-fun m!434315 () Bool)

(assert (=> b!296279 m!434315))

(declare-fun m!434317 () Bool)

(assert (=> b!296279 m!434317))

(declare-fun m!434319 () Bool)

(assert (=> b!296279 m!434319))

(declare-fun m!434321 () Bool)

(assert (=> b!296279 m!434321))

(declare-fun m!434323 () Bool)

(assert (=> b!296282 m!434323))

(check-sat (not b!296282) (not start!66066) (not b!296279) (not b!296278))
