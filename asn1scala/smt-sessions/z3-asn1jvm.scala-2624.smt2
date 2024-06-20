; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64818 () Bool)

(assert start!64818)

(declare-fun b!290870 () Bool)

(declare-fun e!207209 () Bool)

(declare-fun lt!422421 () Bool)

(declare-datatypes ((array!17257 0))(
  ( (array!17258 (arr!8483 (Array (_ BitVec 32) (_ BitVec 8))) (size!7469 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12948 0))(
  ( (BitStream!12949 (buf!7535 array!17257) (currentByte!13960 (_ BitVec 32)) (currentBit!13955 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22834 0))(
  ( (tuple2!22835 (_1!12678 Bool) (_2!12678 BitStream!12948)) )
))
(declare-fun lt!422424 () tuple2!22834)

(assert (=> b!290870 (= e!207209 (= lt!422421 (_1!12678 lt!422424)))))

(declare-fun b!290871 () Bool)

(declare-fun res!240292 () Bool)

(declare-fun e!207208 () Bool)

(assert (=> b!290871 (=> (not res!240292) (not e!207208))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!290871 (= res!240292 (bvslt from!505 to!474))))

(declare-fun b!290872 () Bool)

(declare-fun e!207207 () Bool)

(declare-fun thiss!1728 () BitStream!12948)

(declare-fun array_inv!7081 (array!17257) Bool)

(assert (=> b!290872 (= e!207207 (array_inv!7081 (buf!7535 thiss!1728)))))

(declare-fun b!290869 () Bool)

(assert (=> b!290869 (= e!207208 (not true))))

(assert (=> b!290869 e!207209))

(declare-fun res!240291 () Bool)

(assert (=> b!290869 (=> (not res!240291) (not e!207209))))

(declare-fun lt!422425 () array!17257)

(declare-fun bitAt!0 (array!17257 (_ BitVec 64)) Bool)

(assert (=> b!290869 (= res!240291 (= (bitAt!0 lt!422425 from!505) lt!422421))))

(declare-datatypes ((Unit!20203 0))(
  ( (Unit!20204) )
))
(declare-datatypes ((tuple3!1682 0))(
  ( (tuple3!1683 (_1!12679 Unit!20203) (_2!12679 BitStream!12948) (_3!1261 array!17257)) )
))
(declare-fun lt!422418 () tuple3!1682)

(assert (=> b!290869 (= lt!422421 (bitAt!0 (_3!1261 lt!422418) from!505))))

(declare-fun lt!422420 () Unit!20203)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17257 array!17257 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20203)

(assert (=> b!290869 (= lt!422420 (arrayBitRangesEqImpliesEq!0 lt!422425 (_3!1261 lt!422418) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17257)

(declare-fun arrayBitRangesEq!0 (array!17257 array!17257 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290869 (arrayBitRangesEq!0 arr!273 (_3!1261 lt!422418) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422422 () Unit!20203)

(declare-fun arrayBitRangesEqTransitive!0 (array!17257 array!17257 array!17257 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20203)

(assert (=> b!290869 (= lt!422422 (arrayBitRangesEqTransitive!0 arr!273 lt!422425 (_3!1261 lt!422418) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290869 (arrayBitRangesEq!0 arr!273 lt!422425 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!422423 () Unit!20203)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17257 (_ BitVec 64) Bool) Unit!20203)

(assert (=> b!290869 (= lt!422423 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12678 lt!422424)))))

(declare-fun e!207210 () Bool)

(assert (=> b!290869 e!207210))

(declare-fun res!240290 () Bool)

(assert (=> b!290869 (=> (not res!240290) (not e!207210))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290869 (= res!240290 (= (bvsub (bvadd (bitIndex!0 (size!7469 (buf!7535 thiss!1728)) (currentByte!13960 thiss!1728) (currentBit!13955 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7469 (buf!7535 (_2!12679 lt!422418))) (currentByte!13960 (_2!12679 lt!422418)) (currentBit!13955 (_2!12679 lt!422418)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12948 (_ BitVec 64) array!17257 (_ BitVec 64) (_ BitVec 64)) tuple3!1682)

(assert (=> b!290869 (= lt!422418 (readBitsLoop!0 (_2!12678 lt!422424) nBits!523 lt!422425 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290869 (validate_offset_bits!1 ((_ sign_extend 32) (size!7469 (buf!7535 (_2!12678 lt!422424)))) ((_ sign_extend 32) (currentByte!13960 (_2!12678 lt!422424))) ((_ sign_extend 32) (currentBit!13955 (_2!12678 lt!422424))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422426 () Unit!20203)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12948 BitStream!12948 (_ BitVec 64) (_ BitVec 64)) Unit!20203)

(assert (=> b!290869 (= lt!422426 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12678 lt!422424) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!422419 () (_ BitVec 32))

(declare-fun lt!422427 () (_ BitVec 32))

(assert (=> b!290869 (= lt!422425 (array!17258 (store (arr!8483 arr!273) lt!422427 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8483 arr!273) lt!422427)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422419)))) ((_ sign_extend 24) (ite (_1!12678 lt!422424) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!422419) #b00000000))))) (size!7469 arr!273)))))

(assert (=> b!290869 (= lt!422419 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290869 (= lt!422427 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12948) tuple2!22834)

(assert (=> b!290869 (= lt!422424 (readBit!0 thiss!1728))))

(declare-fun res!240293 () Bool)

(assert (=> start!64818 (=> (not res!240293) (not e!207208))))

(assert (=> start!64818 (= res!240293 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7469 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64818 e!207208))

(declare-fun inv!12 (BitStream!12948) Bool)

(assert (=> start!64818 (and (inv!12 thiss!1728) e!207207)))

(assert (=> start!64818 true))

(assert (=> start!64818 (array_inv!7081 arr!273)))

(declare-fun b!290873 () Bool)

(assert (=> b!290873 (= e!207210 (and (= (buf!7535 thiss!1728) (buf!7535 (_2!12679 lt!422418))) (= (size!7469 arr!273) (size!7469 (_3!1261 lt!422418)))))))

(declare-fun b!290874 () Bool)

(declare-fun res!240289 () Bool)

(assert (=> b!290874 (=> (not res!240289) (not e!207208))))

(assert (=> b!290874 (= res!240289 (validate_offset_bits!1 ((_ sign_extend 32) (size!7469 (buf!7535 thiss!1728))) ((_ sign_extend 32) (currentByte!13960 thiss!1728)) ((_ sign_extend 32) (currentBit!13955 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64818 res!240293) b!290874))

(assert (= (and b!290874 res!240289) b!290871))

(assert (= (and b!290871 res!240292) b!290869))

(assert (= (and b!290869 res!240290) b!290873))

(assert (= (and b!290869 res!240291) b!290870))

(assert (= start!64818 b!290872))

(declare-fun m!425315 () Bool)

(assert (=> b!290872 m!425315))

(declare-fun m!425317 () Bool)

(assert (=> b!290869 m!425317))

(declare-fun m!425319 () Bool)

(assert (=> b!290869 m!425319))

(declare-fun m!425321 () Bool)

(assert (=> b!290869 m!425321))

(declare-fun m!425323 () Bool)

(assert (=> b!290869 m!425323))

(declare-fun m!425325 () Bool)

(assert (=> b!290869 m!425325))

(declare-fun m!425327 () Bool)

(assert (=> b!290869 m!425327))

(declare-fun m!425329 () Bool)

(assert (=> b!290869 m!425329))

(declare-fun m!425331 () Bool)

(assert (=> b!290869 m!425331))

(declare-fun m!425333 () Bool)

(assert (=> b!290869 m!425333))

(declare-fun m!425335 () Bool)

(assert (=> b!290869 m!425335))

(declare-fun m!425337 () Bool)

(assert (=> b!290869 m!425337))

(declare-fun m!425339 () Bool)

(assert (=> b!290869 m!425339))

(declare-fun m!425341 () Bool)

(assert (=> b!290869 m!425341))

(declare-fun m!425343 () Bool)

(assert (=> b!290869 m!425343))

(declare-fun m!425345 () Bool)

(assert (=> b!290869 m!425345))

(declare-fun m!425347 () Bool)

(assert (=> b!290869 m!425347))

(declare-fun m!425349 () Bool)

(assert (=> start!64818 m!425349))

(declare-fun m!425351 () Bool)

(assert (=> start!64818 m!425351))

(declare-fun m!425353 () Bool)

(assert (=> b!290874 m!425353))

(check-sat (not start!64818) (not b!290869) (not b!290874) (not b!290872))
