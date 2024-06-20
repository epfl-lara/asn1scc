; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64556 () Bool)

(assert start!64556)

(declare-fun b!289613 () Bool)

(declare-fun e!206073 () Bool)

(assert (=> b!289613 (= e!206073 (not true))))

(declare-fun e!206070 () Bool)

(assert (=> b!289613 e!206070))

(declare-fun res!239282 () Bool)

(assert (=> b!289613 (=> (not res!239282) (not e!206070))))

(declare-datatypes ((array!17145 0))(
  ( (array!17146 (arr!8418 (Array (_ BitVec 32) (_ BitVec 8))) (size!7416 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12842 0))(
  ( (BitStream!12843 (buf!7482 array!17145) (currentByte!13889 (_ BitVec 32)) (currentBit!13884 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12842)

(declare-datatypes ((Unit!20073 0))(
  ( (Unit!20074) )
))
(declare-datatypes ((tuple3!1576 0))(
  ( (tuple3!1577 (_1!12555 Unit!20073) (_2!12555 BitStream!12842) (_3!1202 array!17145)) )
))
(declare-fun lt!420009 () tuple3!1576)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289613 (= res!239282 (= (bvsub (bvadd (bitIndex!0 (size!7416 (buf!7482 thiss!1728)) (currentByte!13889 thiss!1728) (currentBit!13884 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7416 (buf!7482 (_2!12555 lt!420009))) (currentByte!13889 (_2!12555 lt!420009)) (currentBit!13884 (_2!12555 lt!420009)))))))

(declare-fun lt!420006 () (_ BitVec 32))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((tuple2!22706 0))(
  ( (tuple2!22707 (_1!12556 Bool) (_2!12556 BitStream!12842)) )
))
(declare-fun lt!420005 () tuple2!22706)

(declare-fun arr!273 () array!17145)

(declare-fun lt!420007 () (_ BitVec 32))

(declare-fun readBitsLoop!0 (BitStream!12842 (_ BitVec 64) array!17145 (_ BitVec 64) (_ BitVec 64)) tuple3!1576)

(assert (=> b!289613 (= lt!420009 (readBitsLoop!0 (_2!12556 lt!420005) nBits!523 (array!17146 (store (arr!8418 arr!273) lt!420007 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8418 arr!273) lt!420007)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420006)))) ((_ sign_extend 24) (ite (_1!12556 lt!420005) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420006) #b00000000))))) (size!7416 arr!273)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289613 (validate_offset_bits!1 ((_ sign_extend 32) (size!7416 (buf!7482 (_2!12556 lt!420005)))) ((_ sign_extend 32) (currentByte!13889 (_2!12556 lt!420005))) ((_ sign_extend 32) (currentBit!13884 (_2!12556 lt!420005))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420008 () Unit!20073)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12842 BitStream!12842 (_ BitVec 64) (_ BitVec 64)) Unit!20073)

(assert (=> b!289613 (= lt!420008 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12556 lt!420005) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!289613 (= lt!420006 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289613 (= lt!420007 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12842) tuple2!22706)

(assert (=> b!289613 (= lt!420005 (readBit!0 thiss!1728))))

(declare-fun res!239284 () Bool)

(assert (=> start!64556 (=> (not res!239284) (not e!206073))))

(assert (=> start!64556 (= res!239284 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7416 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64556 e!206073))

(declare-fun e!206072 () Bool)

(declare-fun inv!12 (BitStream!12842) Bool)

(assert (=> start!64556 (and (inv!12 thiss!1728) e!206072)))

(assert (=> start!64556 true))

(declare-fun array_inv!7028 (array!17145) Bool)

(assert (=> start!64556 (array_inv!7028 arr!273)))

(declare-fun b!289614 () Bool)

(assert (=> b!289614 (= e!206072 (array_inv!7028 (buf!7482 thiss!1728)))))

(declare-fun b!289615 () Bool)

(declare-fun res!239285 () Bool)

(assert (=> b!289615 (=> (not res!239285) (not e!206073))))

(assert (=> b!289615 (= res!239285 (validate_offset_bits!1 ((_ sign_extend 32) (size!7416 (buf!7482 thiss!1728))) ((_ sign_extend 32) (currentByte!13889 thiss!1728)) ((_ sign_extend 32) (currentBit!13884 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289616 () Bool)

(assert (=> b!289616 (= e!206070 (and (= (buf!7482 thiss!1728) (buf!7482 (_2!12555 lt!420009))) (= (size!7416 arr!273) (size!7416 (_3!1202 lt!420009)))))))

(declare-fun b!289617 () Bool)

(declare-fun res!239283 () Bool)

(assert (=> b!289617 (=> (not res!239283) (not e!206073))))

(assert (=> b!289617 (= res!239283 (bvslt from!505 to!474))))

(assert (= (and start!64556 res!239284) b!289615))

(assert (= (and b!289615 res!239285) b!289617))

(assert (= (and b!289617 res!239283) b!289613))

(assert (= (and b!289613 res!239282) b!289616))

(assert (= start!64556 b!289614))

(declare-fun m!422705 () Bool)

(assert (=> b!289613 m!422705))

(declare-fun m!422707 () Bool)

(assert (=> b!289613 m!422707))

(declare-fun m!422709 () Bool)

(assert (=> b!289613 m!422709))

(declare-fun m!422711 () Bool)

(assert (=> b!289613 m!422711))

(declare-fun m!422713 () Bool)

(assert (=> b!289613 m!422713))

(declare-fun m!422715 () Bool)

(assert (=> b!289613 m!422715))

(declare-fun m!422717 () Bool)

(assert (=> b!289613 m!422717))

(declare-fun m!422719 () Bool)

(assert (=> b!289613 m!422719))

(declare-fun m!422721 () Bool)

(assert (=> b!289613 m!422721))

(declare-fun m!422723 () Bool)

(assert (=> start!64556 m!422723))

(declare-fun m!422725 () Bool)

(assert (=> start!64556 m!422725))

(declare-fun m!422727 () Bool)

(assert (=> b!289614 m!422727))

(declare-fun m!422729 () Bool)

(assert (=> b!289615 m!422729))

(push 1)

(assert (not b!289615))

(assert (not b!289614))

(assert (not start!64556))

(assert (not b!289613))

(check-sat)

