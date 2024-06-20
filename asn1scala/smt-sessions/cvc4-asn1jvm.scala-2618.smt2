; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64628 () Bool)

(assert start!64628)

(declare-fun b!290153 () Bool)

(declare-fun res!239715 () Bool)

(declare-fun e!206610 () Bool)

(assert (=> b!290153 (=> (not res!239715) (not e!206610))))

(declare-datatypes ((array!17217 0))(
  ( (array!17218 (arr!8454 (Array (_ BitVec 32) (_ BitVec 8))) (size!7452 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12914 0))(
  ( (BitStream!12915 (buf!7518 array!17217) (currentByte!13925 (_ BitVec 32)) (currentBit!13920 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12914)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290153 (= res!239715 (validate_offset_bits!1 ((_ sign_extend 32) (size!7452 (buf!7518 thiss!1728))) ((_ sign_extend 32) (currentByte!13925 thiss!1728)) ((_ sign_extend 32) (currentBit!13920 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!290154 () Bool)

(declare-fun e!206612 () Bool)

(declare-fun array_inv!7064 (array!17217) Bool)

(assert (=> b!290154 (= e!206612 (array_inv!7064 (buf!7518 thiss!1728)))))

(declare-fun b!290155 () Bool)

(assert (=> b!290155 (= e!206610 (not true))))

(declare-fun arr!273 () array!17217)

(declare-datatypes ((Unit!20145 0))(
  ( (Unit!20146) )
))
(declare-datatypes ((tuple3!1648 0))(
  ( (tuple3!1649 (_1!12627 Unit!20145) (_2!12627 BitStream!12914) (_3!1238 array!17217)) )
))
(declare-fun lt!420827 () tuple3!1648)

(declare-fun arrayBitRangesEq!0 (array!17217 array!17217 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!290155 (arrayBitRangesEq!0 arr!273 (_3!1238 lt!420827) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420823 () Unit!20145)

(declare-fun lt!420824 () array!17217)

(declare-fun arrayBitRangesEqTransitive!0 (array!17217 array!17217 array!17217 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20145)

(assert (=> b!290155 (= lt!420823 (arrayBitRangesEqTransitive!0 arr!273 lt!420824 (_3!1238 lt!420827) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!290155 (arrayBitRangesEq!0 arr!273 lt!420824 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22778 0))(
  ( (tuple2!22779 (_1!12628 Bool) (_2!12628 BitStream!12914)) )
))
(declare-fun lt!420822 () tuple2!22778)

(declare-fun lt!420825 () Unit!20145)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17217 (_ BitVec 64) Bool) Unit!20145)

(assert (=> b!290155 (= lt!420825 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12628 lt!420822)))))

(declare-fun e!206611 () Bool)

(assert (=> b!290155 e!206611))

(declare-fun res!239714 () Bool)

(assert (=> b!290155 (=> (not res!239714) (not e!206611))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!290155 (= res!239714 (= (bvsub (bvadd (bitIndex!0 (size!7452 (buf!7518 thiss!1728)) (currentByte!13925 thiss!1728) (currentBit!13920 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7452 (buf!7518 (_2!12627 lt!420827))) (currentByte!13925 (_2!12627 lt!420827)) (currentBit!13920 (_2!12627 lt!420827)))))))

(declare-fun readBitsLoop!0 (BitStream!12914 (_ BitVec 64) array!17217 (_ BitVec 64) (_ BitVec 64)) tuple3!1648)

(assert (=> b!290155 (= lt!420827 (readBitsLoop!0 (_2!12628 lt!420822) nBits!523 lt!420824 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!290155 (validate_offset_bits!1 ((_ sign_extend 32) (size!7452 (buf!7518 (_2!12628 lt!420822)))) ((_ sign_extend 32) (currentByte!13925 (_2!12628 lt!420822))) ((_ sign_extend 32) (currentBit!13920 (_2!12628 lt!420822))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420828 () Unit!20145)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12914 BitStream!12914 (_ BitVec 64) (_ BitVec 64)) Unit!20145)

(assert (=> b!290155 (= lt!420828 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12628 lt!420822) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420821 () (_ BitVec 32))

(declare-fun lt!420826 () (_ BitVec 32))

(assert (=> b!290155 (= lt!420824 (array!17218 (store (arr!8454 arr!273) lt!420821 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8454 arr!273) lt!420821)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420826)))) ((_ sign_extend 24) (ite (_1!12628 lt!420822) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420826) #b00000000))))) (size!7452 arr!273)))))

(assert (=> b!290155 (= lt!420826 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!290155 (= lt!420821 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12914) tuple2!22778)

(assert (=> b!290155 (= lt!420822 (readBit!0 thiss!1728))))

(declare-fun b!290156 () Bool)

(declare-fun res!239717 () Bool)

(assert (=> b!290156 (=> (not res!239717) (not e!206610))))

(assert (=> b!290156 (= res!239717 (bvslt from!505 to!474))))

(declare-fun b!290157 () Bool)

(assert (=> b!290157 (= e!206611 (and (= (buf!7518 thiss!1728) (buf!7518 (_2!12627 lt!420827))) (= (size!7452 arr!273) (size!7452 (_3!1238 lt!420827)))))))

(declare-fun res!239716 () Bool)

(assert (=> start!64628 (=> (not res!239716) (not e!206610))))

(assert (=> start!64628 (= res!239716 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7452 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64628 e!206610))

(declare-fun inv!12 (BitStream!12914) Bool)

(assert (=> start!64628 (and (inv!12 thiss!1728) e!206612)))

(assert (=> start!64628 true))

(assert (=> start!64628 (array_inv!7064 arr!273)))

(assert (= (and start!64628 res!239716) b!290153))

(assert (= (and b!290153 res!239715) b!290156))

(assert (= (and b!290156 res!239717) b!290155))

(assert (= (and b!290155 res!239714) b!290157))

(assert (= start!64628 b!290154))

(declare-fun m!423861 () Bool)

(assert (=> b!290153 m!423861))

(declare-fun m!423863 () Bool)

(assert (=> b!290154 m!423863))

(declare-fun m!423865 () Bool)

(assert (=> b!290155 m!423865))

(declare-fun m!423867 () Bool)

(assert (=> b!290155 m!423867))

(declare-fun m!423869 () Bool)

(assert (=> b!290155 m!423869))

(declare-fun m!423871 () Bool)

(assert (=> b!290155 m!423871))

(declare-fun m!423873 () Bool)

(assert (=> b!290155 m!423873))

(declare-fun m!423875 () Bool)

(assert (=> b!290155 m!423875))

(declare-fun m!423877 () Bool)

(assert (=> b!290155 m!423877))

(declare-fun m!423879 () Bool)

(assert (=> b!290155 m!423879))

(declare-fun m!423881 () Bool)

(assert (=> b!290155 m!423881))

(declare-fun m!423883 () Bool)

(assert (=> b!290155 m!423883))

(declare-fun m!423885 () Bool)

(assert (=> b!290155 m!423885))

(declare-fun m!423887 () Bool)

(assert (=> b!290155 m!423887))

(declare-fun m!423889 () Bool)

(assert (=> b!290155 m!423889))

(declare-fun m!423891 () Bool)

(assert (=> start!64628 m!423891))

(declare-fun m!423893 () Bool)

(assert (=> start!64628 m!423893))

(push 1)

