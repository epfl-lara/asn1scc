; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64824 () Bool)

(assert start!64824)

(declare-fun b!290923 () Bool)

(declare-fun res!240334 () Bool)

(declare-fun e!207259 () Bool)

(assert (=> b!290923 (=> (not res!240334) (not e!207259))))

(declare-datatypes ((array!17263 0))(
  ( (array!17264 (arr!8486 (Array (_ BitVec 32) (_ BitVec 8))) (size!7472 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12954 0))(
  ( (BitStream!12955 (buf!7538 array!17263) (currentByte!13963 (_ BitVec 32)) (currentBit!13958 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12954)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290923 (= res!240334 (validate_offset_bits!1 ((_ sign_extend 32) (size!7472 (buf!7538 thiss!1728))) ((_ sign_extend 32) (currentByte!13963 thiss!1728)) ((_ sign_extend 32) (currentBit!13958 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290924 () Bool)

(declare-fun res!240335 () Bool)

(assert (=> b!290924 (=> (not res!240335) (not e!207259))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290924 (= res!240335 (bvslt from!505 to!474))))

(declare-fun b!290925 () Bool)

(declare-fun e!207260 () Bool)

(declare-datatypes ((Unit!20209 0))(
  ( (Unit!20210) )
))
(declare-datatypes ((tuple3!1688 0))(
  ( (tuple3!1689 (_1!12684 Unit!20209) (_2!12684 BitStream!12954) (_3!1264 array!17263)) )
))
(declare-fun lt!422512 () tuple3!1688)

(declare-fun arr!273 () array!17263)

(assert (=> b!290925 (= e!207260 (and (= (buf!7538 thiss!1728) (buf!7538 (_2!12684 lt!422512))) (= (size!7472 arr!273) (size!7472 (_3!1264 lt!422512)))))))

(declare-fun b!290926 () Bool)

(declare-fun e!207264 () Bool)

(declare-fun array_inv!7084 (array!17263) Bool)

(assert (=> b!290926 (= e!207264 (array_inv!7084 (buf!7538 thiss!1728)))))

(declare-fun res!240337 () Bool)

(assert (=> start!64824 (=> (not res!240337) (not e!207259))))

(assert (=> start!64824 (= res!240337 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7472 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64824 e!207259))

(declare-fun inv!12 (BitStream!12954) Bool)

(assert (=> start!64824 (and (inv!12 thiss!1728) e!207264)))

(assert (=> start!64824 true))

(assert (=> start!64824 (array_inv!7084 arr!273)))

(declare-fun b!290927 () Bool)

(assert (=> b!290927 (= e!207259 (not (bvsle from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7472 arr!273))))))))

(declare-fun e!207261 () Bool)

(assert (=> b!290927 e!207261))

(declare-fun res!240338 () Bool)

(assert (=> b!290927 (=> (not res!240338) (not e!207261))))

(declare-fun lt!422516 () array!17263)

(declare-fun lt!422511 () Bool)

(declare-fun bitAt!0 (array!17263 (_ BitVec 64)) Bool)

(assert (=> b!290927 (= res!240338 (= (bitAt!0 lt!422516 from!505) lt!422511))))

(assert (=> b!290927 (= lt!422511 (bitAt!0 (_3!1264 lt!422512) from!505))))

(declare-fun lt!422510 () Unit!20209)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17263 array!17263 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20209)

(assert (=> b!290927 (= lt!422510 (arrayBitRangesEqImpliesEq!0 lt!422516 (_3!1264 lt!422512) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17263 array!17263 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290927 (arrayBitRangesEq!0 arr!273 (_3!1264 lt!422512) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422513 () Unit!20209)

(declare-fun arrayBitRangesEqTransitive!0 (array!17263 array!17263 array!17263 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20209)

(assert (=> b!290927 (= lt!422513 (arrayBitRangesEqTransitive!0 arr!273 lt!422516 (_3!1264 lt!422512) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290927 (arrayBitRangesEq!0 arr!273 lt!422516 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422509 () Unit!20209)

(declare-datatypes ((tuple2!22840 0))(
  ( (tuple2!22841 (_1!12685 Bool) (_2!12685 BitStream!12954)) )
))
(declare-fun lt!422515 () tuple2!22840)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17263 (_ BitVec 64) Bool) Unit!20209)

(assert (=> b!290927 (= lt!422509 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12685 lt!422515)))))

(assert (=> b!290927 e!207260))

(declare-fun res!240336 () Bool)

(assert (=> b!290927 (=> (not res!240336) (not e!207260))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290927 (= res!240336 (= (bvsub (bvadd (bitIndex!0 (size!7472 (buf!7538 thiss!1728)) (currentByte!13963 thiss!1728) (currentBit!13958 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7472 (buf!7538 (_2!12684 lt!422512))) (currentByte!13963 (_2!12684 lt!422512)) (currentBit!13958 (_2!12684 lt!422512)))))))

(declare-fun readBitsLoop!0 (BitStream!12954 (_ BitVec 64) array!17263 (_ BitVec 64) (_ BitVec 64)) tuple3!1688)

(assert (=> b!290927 (= lt!422512 (readBitsLoop!0 (_2!12685 lt!422515) nBits!523 lt!422516 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290927 (validate_offset_bits!1 ((_ sign_extend 32) (size!7472 (buf!7538 (_2!12685 lt!422515)))) ((_ sign_extend 32) (currentByte!13963 (_2!12685 lt!422515))) ((_ sign_extend 32) (currentBit!13958 (_2!12685 lt!422515))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422514 () Unit!20209)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12954 BitStream!12954 (_ BitVec 64) (_ BitVec 64)) Unit!20209)

(assert (=> b!290927 (= lt!422514 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12685 lt!422515) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422517 () (_ BitVec 32))

(declare-fun lt!422508 () (_ BitVec 32))

(assert (=> b!290927 (= lt!422516 (array!17264 (store (arr!8486 arr!273) lt!422517 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8486 arr!273) lt!422517)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422508)))) ((_ sign_extend 24) (ite (_1!12685 lt!422515) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422508) #b00000000))))) (size!7472 arr!273)))))

(assert (=> b!290927 (= lt!422508 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290927 (= lt!422517 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12954) tuple2!22840)

(assert (=> b!290927 (= lt!422515 (readBit!0 thiss!1728))))

(declare-fun b!290928 () Bool)

(assert (=> b!290928 (= e!207261 (= lt!422511 (_1!12685 lt!422515)))))

(assert (= (and start!64824 res!240337) b!290923))

(assert (= (and b!290923 res!240334) b!290924))

(assert (= (and b!290924 res!240335) b!290927))

(assert (= (and b!290927 res!240336) b!290925))

(assert (= (and b!290927 res!240338) b!290928))

(assert (= start!64824 b!290926))

(declare-fun m!425435 () Bool)

(assert (=> b!290923 m!425435))

(declare-fun m!425437 () Bool)

(assert (=> b!290926 m!425437))

(declare-fun m!425439 () Bool)

(assert (=> start!64824 m!425439))

(declare-fun m!425441 () Bool)

(assert (=> start!64824 m!425441))

(declare-fun m!425443 () Bool)

(assert (=> b!290927 m!425443))

(declare-fun m!425445 () Bool)

(assert (=> b!290927 m!425445))

(declare-fun m!425447 () Bool)

(assert (=> b!290927 m!425447))

(declare-fun m!425449 () Bool)

(assert (=> b!290927 m!425449))

(declare-fun m!425451 () Bool)

(assert (=> b!290927 m!425451))

(declare-fun m!425453 () Bool)

(assert (=> b!290927 m!425453))

(declare-fun m!425455 () Bool)

(assert (=> b!290927 m!425455))

(declare-fun m!425457 () Bool)

(assert (=> b!290927 m!425457))

(declare-fun m!425459 () Bool)

(assert (=> b!290927 m!425459))

(declare-fun m!425461 () Bool)

(assert (=> b!290927 m!425461))

(declare-fun m!425463 () Bool)

(assert (=> b!290927 m!425463))

(declare-fun m!425465 () Bool)

(assert (=> b!290927 m!425465))

(declare-fun m!425467 () Bool)

(assert (=> b!290927 m!425467))

(declare-fun m!425469 () Bool)

(assert (=> b!290927 m!425469))

(declare-fun m!425471 () Bool)

(assert (=> b!290927 m!425471))

(declare-fun m!425473 () Bool)

(assert (=> b!290927 m!425473))

(check-sat (not b!290926) (not b!290927) (not start!64824) (not b!290923))
(check-sat)
