; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64570 () Bool)

(assert start!64570)

(declare-fun b!289718 () Bool)

(declare-fun e!206175 () Bool)

(declare-datatypes ((array!17159 0))(
  ( (array!17160 (arr!8425 (Array (_ BitVec 32) (_ BitVec 8))) (size!7423 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12856 0))(
  ( (BitStream!12857 (buf!7489 array!17159) (currentByte!13896 (_ BitVec 32)) (currentBit!13891 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12856)

(declare-fun array_inv!7035 (array!17159) Bool)

(assert (=> b!289718 (= e!206175 (array_inv!7035 (buf!7489 thiss!1728)))))

(declare-datatypes ((Unit!20087 0))(
  ( (Unit!20088) )
))
(declare-datatypes ((tuple3!1590 0))(
  ( (tuple3!1591 (_1!12569 Unit!20087) (_2!12569 BitStream!12856) (_3!1209 array!17159)) )
))
(declare-fun lt!420152 () tuple3!1590)

(declare-fun b!289719 () Bool)

(declare-fun e!206176 () Bool)

(declare-fun arr!273 () array!17159)

(assert (=> b!289719 (= e!206176 (and (= (buf!7489 thiss!1728) (buf!7489 (_2!12569 lt!420152))) (= (size!7423 arr!273) (size!7423 (_3!1209 lt!420152)))))))

(declare-fun res!239368 () Bool)

(declare-fun e!206177 () Bool)

(assert (=> start!64570 (=> (not res!239368) (not e!206177))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!64570 (= res!239368 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7423 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64570 e!206177))

(declare-fun inv!12 (BitStream!12856) Bool)

(assert (=> start!64570 (and (inv!12 thiss!1728) e!206175)))

(assert (=> start!64570 true))

(assert (=> start!64570 (array_inv!7035 arr!273)))

(declare-fun b!289720 () Bool)

(assert (=> b!289720 (= e!206177 (not true))))

(declare-fun lt!420151 () array!17159)

(declare-fun arrayBitRangesEq!0 (array!17159 array!17159 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289720 (arrayBitRangesEq!0 arr!273 lt!420151 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!420153 () Unit!20087)

(declare-datatypes ((tuple2!22720 0))(
  ( (tuple2!22721 (_1!12570 Bool) (_2!12570 BitStream!12856)) )
))
(declare-fun lt!420155 () tuple2!22720)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17159 (_ BitVec 64) Bool) Unit!20087)

(assert (=> b!289720 (= lt!420153 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12570 lt!420155)))))

(assert (=> b!289720 e!206176))

(declare-fun res!239369 () Bool)

(assert (=> b!289720 (=> (not res!239369) (not e!206176))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289720 (= res!239369 (= (bvsub (bvadd (bitIndex!0 (size!7423 (buf!7489 thiss!1728)) (currentByte!13896 thiss!1728) (currentBit!13891 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7423 (buf!7489 (_2!12569 lt!420152))) (currentByte!13896 (_2!12569 lt!420152)) (currentBit!13891 (_2!12569 lt!420152)))))))

(declare-fun readBitsLoop!0 (BitStream!12856 (_ BitVec 64) array!17159 (_ BitVec 64) (_ BitVec 64)) tuple3!1590)

(assert (=> b!289720 (= lt!420152 (readBitsLoop!0 (_2!12570 lt!420155) nBits!523 lt!420151 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289720 (validate_offset_bits!1 ((_ sign_extend 32) (size!7423 (buf!7489 (_2!12570 lt!420155)))) ((_ sign_extend 32) (currentByte!13896 (_2!12570 lt!420155))) ((_ sign_extend 32) (currentBit!13891 (_2!12570 lt!420155))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420150 () Unit!20087)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12856 BitStream!12856 (_ BitVec 64) (_ BitVec 64)) Unit!20087)

(assert (=> b!289720 (= lt!420150 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12570 lt!420155) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420156 () (_ BitVec 32))

(declare-fun lt!420154 () (_ BitVec 32))

(assert (=> b!289720 (= lt!420151 (array!17160 (store (arr!8425 arr!273) lt!420156 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8425 arr!273) lt!420156)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420154)))) ((_ sign_extend 24) (ite (_1!12570 lt!420155) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420154) #b00000000))))) (size!7423 arr!273)))))

(assert (=> b!289720 (= lt!420154 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289720 (= lt!420156 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12856) tuple2!22720)

(assert (=> b!289720 (= lt!420155 (readBit!0 thiss!1728))))

(declare-fun b!289721 () Bool)

(declare-fun res!239366 () Bool)

(assert (=> b!289721 (=> (not res!239366) (not e!206177))))

(assert (=> b!289721 (= res!239366 (bvslt from!505 to!474))))

(declare-fun b!289722 () Bool)

(declare-fun res!239367 () Bool)

(assert (=> b!289722 (=> (not res!239367) (not e!206177))))

(assert (=> b!289722 (= res!239367 (validate_offset_bits!1 ((_ sign_extend 32) (size!7423 (buf!7489 thiss!1728))) ((_ sign_extend 32) (currentByte!13896 thiss!1728)) ((_ sign_extend 32) (currentBit!13891 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64570 res!239368) b!289722))

(assert (= (and b!289722 res!239367) b!289721))

(assert (= (and b!289721 res!239366) b!289720))

(assert (= (and b!289720 res!239369) b!289719))

(assert (= start!64570 b!289718))

(declare-fun m!422911 () Bool)

(assert (=> b!289718 m!422911))

(declare-fun m!422913 () Bool)

(assert (=> start!64570 m!422913))

(declare-fun m!422915 () Bool)

(assert (=> start!64570 m!422915))

(declare-fun m!422917 () Bool)

(assert (=> b!289720 m!422917))

(declare-fun m!422919 () Bool)

(assert (=> b!289720 m!422919))

(declare-fun m!422921 () Bool)

(assert (=> b!289720 m!422921))

(declare-fun m!422923 () Bool)

(assert (=> b!289720 m!422923))

(declare-fun m!422925 () Bool)

(assert (=> b!289720 m!422925))

(declare-fun m!422927 () Bool)

(assert (=> b!289720 m!422927))

(declare-fun m!422929 () Bool)

(assert (=> b!289720 m!422929))

(declare-fun m!422931 () Bool)

(assert (=> b!289720 m!422931))

(declare-fun m!422933 () Bool)

(assert (=> b!289720 m!422933))

(declare-fun m!422935 () Bool)

(assert (=> b!289720 m!422935))

(declare-fun m!422937 () Bool)

(assert (=> b!289720 m!422937))

(declare-fun m!422939 () Bool)

(assert (=> b!289722 m!422939))

(push 1)

(assert (not b!289722))

(assert (not b!289720))

(assert (not start!64570))

(assert (not b!289718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

