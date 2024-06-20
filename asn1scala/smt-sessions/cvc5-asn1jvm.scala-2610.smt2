; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64576 () Bool)

(assert start!64576)

(declare-fun b!289763 () Bool)

(declare-fun e!206223 () Bool)

(assert (=> b!289763 (= e!206223 (not true))))

(declare-datatypes ((array!17165 0))(
  ( (array!17166 (arr!8428 (Array (_ BitVec 32) (_ BitVec 8))) (size!7426 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17165)

(declare-fun lt!420216 () array!17165)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!17165 array!17165 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289763 (arrayBitRangesEq!0 arr!273 lt!420216 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((BitStream!12862 0))(
  ( (BitStream!12863 (buf!7492 array!17165) (currentByte!13899 (_ BitVec 32)) (currentBit!13894 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22726 0))(
  ( (tuple2!22727 (_1!12575 Bool) (_2!12575 BitStream!12862)) )
))
(declare-fun lt!420213 () tuple2!22726)

(declare-datatypes ((Unit!20093 0))(
  ( (Unit!20094) )
))
(declare-fun lt!420219 () Unit!20093)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17165 (_ BitVec 64) Bool) Unit!20093)

(assert (=> b!289763 (= lt!420219 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12575 lt!420213)))))

(declare-fun e!206219 () Bool)

(assert (=> b!289763 e!206219))

(declare-fun res!239405 () Bool)

(assert (=> b!289763 (=> (not res!239405) (not e!206219))))

(declare-fun thiss!1728 () BitStream!12862)

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((tuple3!1596 0))(
  ( (tuple3!1597 (_1!12576 Unit!20093) (_2!12576 BitStream!12862) (_3!1212 array!17165)) )
))
(declare-fun lt!420217 () tuple3!1596)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289763 (= res!239405 (= (bvsub (bvadd (bitIndex!0 (size!7426 (buf!7492 thiss!1728)) (currentByte!13899 thiss!1728) (currentBit!13894 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7426 (buf!7492 (_2!12576 lt!420217))) (currentByte!13899 (_2!12576 lt!420217)) (currentBit!13894 (_2!12576 lt!420217)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!12862 (_ BitVec 64) array!17165 (_ BitVec 64) (_ BitVec 64)) tuple3!1596)

(assert (=> b!289763 (= lt!420217 (readBitsLoop!0 (_2!12575 lt!420213) nBits!523 lt!420216 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289763 (validate_offset_bits!1 ((_ sign_extend 32) (size!7426 (buf!7492 (_2!12575 lt!420213)))) ((_ sign_extend 32) (currentByte!13899 (_2!12575 lt!420213))) ((_ sign_extend 32) (currentBit!13894 (_2!12575 lt!420213))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420218 () Unit!20093)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12862 BitStream!12862 (_ BitVec 64) (_ BitVec 64)) Unit!20093)

(assert (=> b!289763 (= lt!420218 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12575 lt!420213) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420215 () (_ BitVec 32))

(declare-fun lt!420214 () (_ BitVec 32))

(assert (=> b!289763 (= lt!420216 (array!17166 (store (arr!8428 arr!273) lt!420215 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8428 arr!273) lt!420215)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420214)))) ((_ sign_extend 24) (ite (_1!12575 lt!420213) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420214) #b00000000))))) (size!7426 arr!273)))))

(assert (=> b!289763 (= lt!420214 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289763 (= lt!420215 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12862) tuple2!22726)

(assert (=> b!289763 (= lt!420213 (readBit!0 thiss!1728))))

(declare-fun res!239403 () Bool)

(assert (=> start!64576 (=> (not res!239403) (not e!206223))))

(assert (=> start!64576 (= res!239403 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7426 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64576 e!206223))

(declare-fun e!206222 () Bool)

(declare-fun inv!12 (BitStream!12862) Bool)

(assert (=> start!64576 (and (inv!12 thiss!1728) e!206222)))

(assert (=> start!64576 true))

(declare-fun array_inv!7038 (array!17165) Bool)

(assert (=> start!64576 (array_inv!7038 arr!273)))

(declare-fun b!289764 () Bool)

(assert (=> b!289764 (= e!206222 (array_inv!7038 (buf!7492 thiss!1728)))))

(declare-fun b!289765 () Bool)

(declare-fun res!239402 () Bool)

(assert (=> b!289765 (=> (not res!239402) (not e!206223))))

(assert (=> b!289765 (= res!239402 (bvslt from!505 to!474))))

(declare-fun b!289766 () Bool)

(assert (=> b!289766 (= e!206219 (and (= (buf!7492 thiss!1728) (buf!7492 (_2!12576 lt!420217))) (= (size!7426 arr!273) (size!7426 (_3!1212 lt!420217)))))))

(declare-fun b!289767 () Bool)

(declare-fun res!239404 () Bool)

(assert (=> b!289767 (=> (not res!239404) (not e!206223))))

(assert (=> b!289767 (= res!239404 (validate_offset_bits!1 ((_ sign_extend 32) (size!7426 (buf!7492 thiss!1728))) ((_ sign_extend 32) (currentByte!13899 thiss!1728)) ((_ sign_extend 32) (currentBit!13894 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64576 res!239403) b!289767))

(assert (= (and b!289767 res!239404) b!289765))

(assert (= (and b!289765 res!239402) b!289763))

(assert (= (and b!289763 res!239405) b!289766))

(assert (= start!64576 b!289764))

(declare-fun m!423001 () Bool)

(assert (=> b!289763 m!423001))

(declare-fun m!423003 () Bool)

(assert (=> b!289763 m!423003))

(declare-fun m!423005 () Bool)

(assert (=> b!289763 m!423005))

(declare-fun m!423007 () Bool)

(assert (=> b!289763 m!423007))

(declare-fun m!423009 () Bool)

(assert (=> b!289763 m!423009))

(declare-fun m!423011 () Bool)

(assert (=> b!289763 m!423011))

(declare-fun m!423013 () Bool)

(assert (=> b!289763 m!423013))

(declare-fun m!423015 () Bool)

(assert (=> b!289763 m!423015))

(declare-fun m!423017 () Bool)

(assert (=> b!289763 m!423017))

(declare-fun m!423019 () Bool)

(assert (=> b!289763 m!423019))

(declare-fun m!423021 () Bool)

(assert (=> b!289763 m!423021))

(declare-fun m!423023 () Bool)

(assert (=> start!64576 m!423023))

(declare-fun m!423025 () Bool)

(assert (=> start!64576 m!423025))

(declare-fun m!423027 () Bool)

(assert (=> b!289764 m!423027))

(declare-fun m!423029 () Bool)

(assert (=> b!289767 m!423029))

(push 1)

(assert (not start!64576))

(assert (not b!289767))

(assert (not b!289764))

(assert (not b!289763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

