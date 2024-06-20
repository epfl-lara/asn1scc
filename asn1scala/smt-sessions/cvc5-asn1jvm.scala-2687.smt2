; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65722 () Bool)

(assert start!65722)

(declare-fun b!294776 () Bool)

(declare-fun res!243398 () Bool)

(declare-fun e!210734 () Bool)

(assert (=> b!294776 (=> (not res!243398) (not e!210734))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!294776 (= res!243398 (bvslt from!505 to!474))))

(declare-fun b!294777 () Bool)

(declare-fun e!210737 () Bool)

(declare-datatypes ((array!17654 0))(
  ( (array!17655 (arr!8689 (Array (_ BitVec 32) (_ BitVec 8))) (size!7651 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13306 0))(
  ( (BitStream!13307 (buf!7714 array!17654) (currentByte!14211 (_ BitVec 32)) (currentBit!14206 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13306)

(declare-fun array_inv!7263 (array!17654) Bool)

(assert (=> b!294777 (= e!210737 (array_inv!7263 (buf!7714 thiss!1728)))))

(declare-datatypes ((Unit!20539 0))(
  ( (Unit!20540) )
))
(declare-datatypes ((tuple3!1818 0))(
  ( (tuple3!1819 (_1!12941 Unit!20539) (_2!12941 BitStream!13306) (_3!1347 array!17654)) )
))
(declare-fun lt!428285 () tuple3!1818)

(declare-fun e!210736 () Bool)

(declare-fun arr!273 () array!17654)

(declare-fun b!294778 () Bool)

(assert (=> b!294778 (= e!210736 (and (= (buf!7714 thiss!1728) (buf!7714 (_2!12941 lt!428285))) (= (size!7651 arr!273) (size!7651 (_3!1347 lt!428285)))))))

(declare-fun b!294779 () Bool)

(declare-fun res!243399 () Bool)

(assert (=> b!294779 (=> (not res!243399) (not e!210734))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294779 (= res!243399 (validate_offset_bits!1 ((_ sign_extend 32) (size!7651 (buf!7714 thiss!1728))) ((_ sign_extend 32) (currentByte!14211 thiss!1728)) ((_ sign_extend 32) (currentBit!14206 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!243401 () Bool)

(assert (=> start!65722 (=> (not res!243401) (not e!210734))))

(assert (=> start!65722 (= res!243401 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7651 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65722 e!210734))

(declare-fun inv!12 (BitStream!13306) Bool)

(assert (=> start!65722 (and (inv!12 thiss!1728) e!210737)))

(assert (=> start!65722 true))

(assert (=> start!65722 (array_inv!7263 arr!273)))

(declare-fun b!294780 () Bool)

(assert (=> b!294780 (= e!210734 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17654 array!17654 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294780 (arrayBitRangesEq!0 arr!273 (_3!1347 lt!428285) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!428280 () Unit!20539)

(declare-fun lt!428284 () array!17654)

(declare-fun arrayBitRangesEqTransitive!0 (array!17654 array!17654 array!17654 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20539)

(assert (=> b!294780 (= lt!428280 (arrayBitRangesEqTransitive!0 arr!273 lt!428284 (_3!1347 lt!428285) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!294780 (arrayBitRangesEq!0 arr!273 lt!428284 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23188 0))(
  ( (tuple2!23189 (_1!12942 Bool) (_2!12942 BitStream!13306)) )
))
(declare-fun lt!428286 () tuple2!23188)

(declare-fun lt!428283 () Unit!20539)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17654 (_ BitVec 64) Bool) Unit!20539)

(assert (=> b!294780 (= lt!428283 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12942 lt!428286)))))

(assert (=> b!294780 e!210736))

(declare-fun res!243400 () Bool)

(assert (=> b!294780 (=> (not res!243400) (not e!210736))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294780 (= res!243400 (= (bvsub (bvadd (bitIndex!0 (size!7651 (buf!7714 thiss!1728)) (currentByte!14211 thiss!1728) (currentBit!14206 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7651 (buf!7714 (_2!12941 lt!428285))) (currentByte!14211 (_2!12941 lt!428285)) (currentBit!14206 (_2!12941 lt!428285)))))))

(declare-fun readBitsLoop!0 (BitStream!13306 (_ BitVec 64) array!17654 (_ BitVec 64) (_ BitVec 64)) tuple3!1818)

(assert (=> b!294780 (= lt!428285 (readBitsLoop!0 (_2!12942 lt!428286) nBits!523 lt!428284 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294780 (validate_offset_bits!1 ((_ sign_extend 32) (size!7651 (buf!7714 (_2!12942 lt!428286)))) ((_ sign_extend 32) (currentByte!14211 (_2!12942 lt!428286))) ((_ sign_extend 32) (currentBit!14206 (_2!12942 lt!428286))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428281 () Unit!20539)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13306 BitStream!13306 (_ BitVec 64) (_ BitVec 64)) Unit!20539)

(assert (=> b!294780 (= lt!428281 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12942 lt!428286) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!428279 () (_ BitVec 32))

(declare-fun lt!428282 () (_ BitVec 32))

(assert (=> b!294780 (= lt!428284 (array!17655 (store (arr!8689 arr!273) lt!428279 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8689 arr!273) lt!428279)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428282)))) ((_ sign_extend 24) (ite (_1!12942 lt!428286) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!428282) #b00000000))))) (size!7651 arr!273)))))

(assert (=> b!294780 (= lt!428282 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294780 (= lt!428279 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13306) tuple2!23188)

(assert (=> b!294780 (= lt!428286 (readBit!0 thiss!1728))))

(assert (= (and start!65722 res!243401) b!294779))

(assert (= (and b!294779 res!243399) b!294776))

(assert (= (and b!294776 res!243398) b!294780))

(assert (= (and b!294780 res!243400) b!294778))

(assert (= start!65722 b!294777))

(declare-fun m!431383 () Bool)

(assert (=> b!294777 m!431383))

(declare-fun m!431385 () Bool)

(assert (=> b!294779 m!431385))

(declare-fun m!431387 () Bool)

(assert (=> start!65722 m!431387))

(declare-fun m!431389 () Bool)

(assert (=> start!65722 m!431389))

(declare-fun m!431391 () Bool)

(assert (=> b!294780 m!431391))

(declare-fun m!431393 () Bool)

(assert (=> b!294780 m!431393))

(declare-fun m!431395 () Bool)

(assert (=> b!294780 m!431395))

(declare-fun m!431397 () Bool)

(assert (=> b!294780 m!431397))

(declare-fun m!431399 () Bool)

(assert (=> b!294780 m!431399))

(declare-fun m!431401 () Bool)

(assert (=> b!294780 m!431401))

(declare-fun m!431403 () Bool)

(assert (=> b!294780 m!431403))

(declare-fun m!431405 () Bool)

(assert (=> b!294780 m!431405))

(declare-fun m!431407 () Bool)

(assert (=> b!294780 m!431407))

(declare-fun m!431409 () Bool)

(assert (=> b!294780 m!431409))

(declare-fun m!431411 () Bool)

(assert (=> b!294780 m!431411))

(declare-fun m!431413 () Bool)

(assert (=> b!294780 m!431413))

(declare-fun m!431415 () Bool)

(assert (=> b!294780 m!431415))

(push 1)

(assert (not start!65722))

(assert (not b!294777))

(assert (not b!294780))

(assert (not b!294779))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

