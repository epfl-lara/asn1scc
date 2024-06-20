; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64588 () Bool)

(assert start!64588)

(declare-fun b!289853 () Bool)

(declare-fun res!239474 () Bool)

(declare-fun e!206313 () Bool)

(assert (=> b!289853 (=> (not res!239474) (not e!206313))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289853 (= res!239474 (bvslt from!505 to!474))))

(declare-fun b!289854 () Bool)

(declare-fun e!206310 () Bool)

(declare-datatypes ((array!17177 0))(
  ( (array!17178 (arr!8434 (Array (_ BitVec 32) (_ BitVec 8))) (size!7432 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12874 0))(
  ( (BitStream!12875 (buf!7498 array!17177) (currentByte!13905 (_ BitVec 32)) (currentBit!13900 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12874)

(declare-fun array_inv!7044 (array!17177) Bool)

(assert (=> b!289854 (= e!206310 (array_inv!7044 (buf!7498 thiss!1728)))))

(declare-fun res!239475 () Bool)

(assert (=> start!64588 (=> (not res!239475) (not e!206313))))

(declare-fun arr!273 () array!17177)

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!64588 (= res!239475 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7432 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64588 e!206313))

(declare-fun inv!12 (BitStream!12874) Bool)

(assert (=> start!64588 (and (inv!12 thiss!1728) e!206310)))

(assert (=> start!64588 true))

(assert (=> start!64588 (array_inv!7044 arr!273)))

(declare-fun b!289855 () Bool)

(declare-fun res!239476 () Bool)

(assert (=> b!289855 (=> (not res!239476) (not e!206313))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289855 (= res!239476 (validate_offset_bits!1 ((_ sign_extend 32) (size!7432 (buf!7498 thiss!1728))) ((_ sign_extend 32) (currentByte!13905 thiss!1728)) ((_ sign_extend 32) (currentBit!13900 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun e!206312 () Bool)

(declare-datatypes ((Unit!20105 0))(
  ( (Unit!20106) )
))
(declare-datatypes ((tuple3!1608 0))(
  ( (tuple3!1609 (_1!12587 Unit!20105) (_2!12587 BitStream!12874) (_3!1218 array!17177)) )
))
(declare-fun lt!420348 () tuple3!1608)

(declare-fun b!289856 () Bool)

(assert (=> b!289856 (= e!206312 (and (= (buf!7498 thiss!1728) (buf!7498 (_2!12587 lt!420348))) (= (size!7432 arr!273) (size!7432 (_3!1218 lt!420348)))))))

(declare-fun b!289857 () Bool)

(assert (=> b!289857 (= e!206313 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17177 array!17177 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289857 (arrayBitRangesEq!0 arr!273 (_3!1218 lt!420348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420343 () Unit!20105)

(declare-fun lt!420346 () array!17177)

(declare-fun arrayBitRangesEqTransitive!0 (array!17177 array!17177 array!17177 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20105)

(assert (=> b!289857 (= lt!420343 (arrayBitRangesEqTransitive!0 arr!273 lt!420346 (_3!1218 lt!420348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!289857 (arrayBitRangesEq!0 arr!273 lt!420346 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420345 () Unit!20105)

(declare-datatypes ((tuple2!22738 0))(
  ( (tuple2!22739 (_1!12588 Bool) (_2!12588 BitStream!12874)) )
))
(declare-fun lt!420342 () tuple2!22738)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17177 (_ BitVec 64) Bool) Unit!20105)

(assert (=> b!289857 (= lt!420345 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12588 lt!420342)))))

(assert (=> b!289857 e!206312))

(declare-fun res!239477 () Bool)

(assert (=> b!289857 (=> (not res!239477) (not e!206312))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289857 (= res!239477 (= (bvsub (bvadd (bitIndex!0 (size!7432 (buf!7498 thiss!1728)) (currentByte!13905 thiss!1728) (currentBit!13900 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7432 (buf!7498 (_2!12587 lt!420348))) (currentByte!13905 (_2!12587 lt!420348)) (currentBit!13900 (_2!12587 lt!420348)))))))

(declare-fun readBitsLoop!0 (BitStream!12874 (_ BitVec 64) array!17177 (_ BitVec 64) (_ BitVec 64)) tuple3!1608)

(assert (=> b!289857 (= lt!420348 (readBitsLoop!0 (_2!12588 lt!420342) nBits!523 lt!420346 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289857 (validate_offset_bits!1 ((_ sign_extend 32) (size!7432 (buf!7498 (_2!12588 lt!420342)))) ((_ sign_extend 32) (currentByte!13905 (_2!12588 lt!420342))) ((_ sign_extend 32) (currentBit!13900 (_2!12588 lt!420342))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420347 () Unit!20105)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12874 BitStream!12874 (_ BitVec 64) (_ BitVec 64)) Unit!20105)

(assert (=> b!289857 (= lt!420347 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12588 lt!420342) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420341 () (_ BitVec 32))

(declare-fun lt!420344 () (_ BitVec 32))

(assert (=> b!289857 (= lt!420346 (array!17178 (store (arr!8434 arr!273) lt!420344 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8434 arr!273) lt!420344)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420341)))) ((_ sign_extend 24) (ite (_1!12588 lt!420342) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420341) #b00000000))))) (size!7432 arr!273)))))

(assert (=> b!289857 (= lt!420341 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289857 (= lt!420344 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12874) tuple2!22738)

(assert (=> b!289857 (= lt!420342 (readBit!0 thiss!1728))))

(assert (= (and start!64588 res!239475) b!289855))

(assert (= (and b!289855 res!239476) b!289853))

(assert (= (and b!289853 res!239474) b!289857))

(assert (= (and b!289857 res!239477) b!289856))

(assert (= start!64588 b!289854))

(declare-fun m!423181 () Bool)

(assert (=> b!289854 m!423181))

(declare-fun m!423183 () Bool)

(assert (=> start!64588 m!423183))

(declare-fun m!423185 () Bool)

(assert (=> start!64588 m!423185))

(declare-fun m!423187 () Bool)

(assert (=> b!289855 m!423187))

(declare-fun m!423189 () Bool)

(assert (=> b!289857 m!423189))

(declare-fun m!423191 () Bool)

(assert (=> b!289857 m!423191))

(declare-fun m!423193 () Bool)

(assert (=> b!289857 m!423193))

(declare-fun m!423195 () Bool)

(assert (=> b!289857 m!423195))

(declare-fun m!423197 () Bool)

(assert (=> b!289857 m!423197))

(declare-fun m!423199 () Bool)

(assert (=> b!289857 m!423199))

(declare-fun m!423201 () Bool)

(assert (=> b!289857 m!423201))

(declare-fun m!423203 () Bool)

(assert (=> b!289857 m!423203))

(declare-fun m!423205 () Bool)

(assert (=> b!289857 m!423205))

(declare-fun m!423207 () Bool)

(assert (=> b!289857 m!423207))

(declare-fun m!423209 () Bool)

(assert (=> b!289857 m!423209))

(declare-fun m!423211 () Bool)

(assert (=> b!289857 m!423211))

(declare-fun m!423213 () Bool)

(assert (=> b!289857 m!423213))

(push 1)

(assert (not b!289854))

(assert (not b!289857))

(assert (not b!289855))

(assert (not start!64588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

