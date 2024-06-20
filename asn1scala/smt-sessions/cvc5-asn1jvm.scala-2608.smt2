; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64564 () Bool)

(assert start!64564)

(declare-fun b!289673 () Bool)

(declare-fun res!239331 () Bool)

(declare-fun e!206133 () Bool)

(assert (=> b!289673 (=> (not res!239331) (not e!206133))))

(declare-datatypes ((array!17153 0))(
  ( (array!17154 (arr!8422 (Array (_ BitVec 32) (_ BitVec 8))) (size!7420 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12850 0))(
  ( (BitStream!12851 (buf!7486 array!17153) (currentByte!13893 (_ BitVec 32)) (currentBit!13888 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12850)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289673 (= res!239331 (validate_offset_bits!1 ((_ sign_extend 32) (size!7420 (buf!7486 thiss!1728))) ((_ sign_extend 32) (currentByte!13893 thiss!1728)) ((_ sign_extend 32) (currentBit!13888 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!239333 () Bool)

(assert (=> start!64564 (=> (not res!239333) (not e!206133))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17153)

(assert (=> start!64564 (= res!239333 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7420 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64564 e!206133))

(declare-fun e!206130 () Bool)

(declare-fun inv!12 (BitStream!12850) Bool)

(assert (=> start!64564 (and (inv!12 thiss!1728) e!206130)))

(assert (=> start!64564 true))

(declare-fun array_inv!7032 (array!17153) Bool)

(assert (=> start!64564 (array_inv!7032 arr!273)))

(declare-fun b!289674 () Bool)

(assert (=> b!289674 (= e!206130 (array_inv!7032 (buf!7486 thiss!1728)))))

(declare-fun e!206132 () Bool)

(declare-fun b!289675 () Bool)

(declare-datatypes ((Unit!20081 0))(
  ( (Unit!20082) )
))
(declare-datatypes ((tuple3!1584 0))(
  ( (tuple3!1585 (_1!12563 Unit!20081) (_2!12563 BitStream!12850) (_3!1206 array!17153)) )
))
(declare-fun lt!420087 () tuple3!1584)

(assert (=> b!289675 (= e!206132 (and (= (buf!7486 thiss!1728) (buf!7486 (_2!12563 lt!420087))) (= (size!7420 arr!273) (size!7420 (_3!1206 lt!420087)))))))

(declare-fun b!289676 () Bool)

(assert (=> b!289676 (= e!206133 (not true))))

(declare-fun lt!420091 () array!17153)

(declare-fun arrayBitRangesEq!0 (array!17153 array!17153 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289676 (arrayBitRangesEq!0 arr!273 lt!420091 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420088 () Unit!20081)

(declare-datatypes ((tuple2!22714 0))(
  ( (tuple2!22715 (_1!12564 Bool) (_2!12564 BitStream!12850)) )
))
(declare-fun lt!420089 () tuple2!22714)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17153 (_ BitVec 64) Bool) Unit!20081)

(assert (=> b!289676 (= lt!420088 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12564 lt!420089)))))

(assert (=> b!289676 e!206132))

(declare-fun res!239332 () Bool)

(assert (=> b!289676 (=> (not res!239332) (not e!206132))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289676 (= res!239332 (= (bvsub (bvadd (bitIndex!0 (size!7420 (buf!7486 thiss!1728)) (currentByte!13893 thiss!1728) (currentBit!13888 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7420 (buf!7486 (_2!12563 lt!420087))) (currentByte!13893 (_2!12563 lt!420087)) (currentBit!13888 (_2!12563 lt!420087)))))))

(declare-fun readBitsLoop!0 (BitStream!12850 (_ BitVec 64) array!17153 (_ BitVec 64) (_ BitVec 64)) tuple3!1584)

(assert (=> b!289676 (= lt!420087 (readBitsLoop!0 (_2!12564 lt!420089) nBits!523 lt!420091 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289676 (validate_offset_bits!1 ((_ sign_extend 32) (size!7420 (buf!7486 (_2!12564 lt!420089)))) ((_ sign_extend 32) (currentByte!13893 (_2!12564 lt!420089))) ((_ sign_extend 32) (currentBit!13888 (_2!12564 lt!420089))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420093 () Unit!20081)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12850 BitStream!12850 (_ BitVec 64) (_ BitVec 64)) Unit!20081)

(assert (=> b!289676 (= lt!420093 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12564 lt!420089) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420092 () (_ BitVec 32))

(declare-fun lt!420090 () (_ BitVec 32))

(assert (=> b!289676 (= lt!420091 (array!17154 (store (arr!8422 arr!273) lt!420090 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8422 arr!273) lt!420090)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420092)))) ((_ sign_extend 24) (ite (_1!12564 lt!420089) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420092) #b00000000))))) (size!7420 arr!273)))))

(assert (=> b!289676 (= lt!420092 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289676 (= lt!420090 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12850) tuple2!22714)

(assert (=> b!289676 (= lt!420089 (readBit!0 thiss!1728))))

(declare-fun b!289677 () Bool)

(declare-fun res!239330 () Bool)

(assert (=> b!289677 (=> (not res!239330) (not e!206133))))

(assert (=> b!289677 (= res!239330 (bvslt from!505 to!474))))

(assert (= (and start!64564 res!239333) b!289673))

(assert (= (and b!289673 res!239331) b!289677))

(assert (= (and b!289677 res!239330) b!289676))

(assert (= (and b!289676 res!239332) b!289675))

(assert (= start!64564 b!289674))

(declare-fun m!422821 () Bool)

(assert (=> b!289673 m!422821))

(declare-fun m!422823 () Bool)

(assert (=> start!64564 m!422823))

(declare-fun m!422825 () Bool)

(assert (=> start!64564 m!422825))

(declare-fun m!422827 () Bool)

(assert (=> b!289674 m!422827))

(declare-fun m!422829 () Bool)

(assert (=> b!289676 m!422829))

(declare-fun m!422831 () Bool)

(assert (=> b!289676 m!422831))

(declare-fun m!422833 () Bool)

(assert (=> b!289676 m!422833))

(declare-fun m!422835 () Bool)

(assert (=> b!289676 m!422835))

(declare-fun m!422837 () Bool)

(assert (=> b!289676 m!422837))

(declare-fun m!422839 () Bool)

(assert (=> b!289676 m!422839))

(declare-fun m!422841 () Bool)

(assert (=> b!289676 m!422841))

(declare-fun m!422843 () Bool)

(assert (=> b!289676 m!422843))

(declare-fun m!422845 () Bool)

(assert (=> b!289676 m!422845))

(declare-fun m!422847 () Bool)

(assert (=> b!289676 m!422847))

(declare-fun m!422849 () Bool)

(assert (=> b!289676 m!422849))

(push 1)

(assert (not b!289676))

(assert (not b!289674))

(assert (not b!289673))

(assert (not start!64564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

