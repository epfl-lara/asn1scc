; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64568 () Bool)

(assert start!64568)

(declare-fun b!289703 () Bool)

(declare-fun res!239354 () Bool)

(declare-fun e!206163 () Bool)

(assert (=> b!289703 (=> (not res!239354) (not e!206163))))

(declare-datatypes ((array!17157 0))(
  ( (array!17158 (arr!8424 (Array (_ BitVec 32) (_ BitVec 8))) (size!7422 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12854 0))(
  ( (BitStream!12855 (buf!7488 array!17157) (currentByte!13895 (_ BitVec 32)) (currentBit!13890 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12854)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289703 (= res!239354 (validate_offset_bits!1 ((_ sign_extend 32) (size!7422 (buf!7488 thiss!1728))) ((_ sign_extend 32) (currentByte!13895 thiss!1728)) ((_ sign_extend 32) (currentBit!13890 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289704 () Bool)

(assert (=> b!289704 (= e!206163 (not true))))

(declare-fun arr!273 () array!17157)

(declare-fun lt!420130 () array!17157)

(declare-fun arrayBitRangesEq!0 (array!17157 array!17157 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289704 (arrayBitRangesEq!0 arr!273 lt!420130 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22718 0))(
  ( (tuple2!22719 (_1!12567 Bool) (_2!12567 BitStream!12854)) )
))
(declare-fun lt!420135 () tuple2!22718)

(declare-datatypes ((Unit!20085 0))(
  ( (Unit!20086) )
))
(declare-fun lt!420131 () Unit!20085)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17157 (_ BitVec 64) Bool) Unit!20085)

(assert (=> b!289704 (= lt!420131 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12567 lt!420135)))))

(declare-fun e!206160 () Bool)

(assert (=> b!289704 e!206160))

(declare-fun res!239356 () Bool)

(assert (=> b!289704 (=> (not res!239356) (not e!206160))))

(declare-datatypes ((tuple3!1588 0))(
  ( (tuple3!1589 (_1!12568 Unit!20085) (_2!12568 BitStream!12854) (_3!1208 array!17157)) )
))
(declare-fun lt!420132 () tuple3!1588)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289704 (= res!239356 (= (bvsub (bvadd (bitIndex!0 (size!7422 (buf!7488 thiss!1728)) (currentByte!13895 thiss!1728) (currentBit!13890 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7422 (buf!7488 (_2!12568 lt!420132))) (currentByte!13895 (_2!12568 lt!420132)) (currentBit!13890 (_2!12568 lt!420132)))))))

(declare-fun readBitsLoop!0 (BitStream!12854 (_ BitVec 64) array!17157 (_ BitVec 64) (_ BitVec 64)) tuple3!1588)

(assert (=> b!289704 (= lt!420132 (readBitsLoop!0 (_2!12567 lt!420135) nBits!523 lt!420130 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289704 (validate_offset_bits!1 ((_ sign_extend 32) (size!7422 (buf!7488 (_2!12567 lt!420135)))) ((_ sign_extend 32) (currentByte!13895 (_2!12567 lt!420135))) ((_ sign_extend 32) (currentBit!13890 (_2!12567 lt!420135))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420134 () Unit!20085)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12854 BitStream!12854 (_ BitVec 64) (_ BitVec 64)) Unit!20085)

(assert (=> b!289704 (= lt!420134 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12567 lt!420135) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420129 () (_ BitVec 32))

(declare-fun lt!420133 () (_ BitVec 32))

(assert (=> b!289704 (= lt!420130 (array!17158 (store (arr!8424 arr!273) lt!420129 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8424 arr!273) lt!420129)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420133)))) ((_ sign_extend 24) (ite (_1!12567 lt!420135) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420133) #b00000000))))) (size!7422 arr!273)))))

(assert (=> b!289704 (= lt!420133 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289704 (= lt!420129 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12854) tuple2!22718)

(assert (=> b!289704 (= lt!420135 (readBit!0 thiss!1728))))

(declare-fun res!239357 () Bool)

(assert (=> start!64568 (=> (not res!239357) (not e!206163))))

(assert (=> start!64568 (= res!239357 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7422 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64568 e!206163))

(declare-fun e!206162 () Bool)

(declare-fun inv!12 (BitStream!12854) Bool)

(assert (=> start!64568 (and (inv!12 thiss!1728) e!206162)))

(assert (=> start!64568 true))

(declare-fun array_inv!7034 (array!17157) Bool)

(assert (=> start!64568 (array_inv!7034 arr!273)))

(declare-fun b!289705 () Bool)

(assert (=> b!289705 (= e!206162 (array_inv!7034 (buf!7488 thiss!1728)))))

(declare-fun b!289706 () Bool)

(declare-fun res!239355 () Bool)

(assert (=> b!289706 (=> (not res!239355) (not e!206163))))

(assert (=> b!289706 (= res!239355 (bvslt from!505 to!474))))

(declare-fun b!289707 () Bool)

(assert (=> b!289707 (= e!206160 (and (= (buf!7488 thiss!1728) (buf!7488 (_2!12568 lt!420132))) (= (size!7422 arr!273) (size!7422 (_3!1208 lt!420132)))))))

(assert (= (and start!64568 res!239357) b!289703))

(assert (= (and b!289703 res!239354) b!289706))

(assert (= (and b!289706 res!239355) b!289704))

(assert (= (and b!289704 res!239356) b!289707))

(assert (= start!64568 b!289705))

(declare-fun m!422881 () Bool)

(assert (=> b!289703 m!422881))

(declare-fun m!422883 () Bool)

(assert (=> b!289704 m!422883))

(declare-fun m!422885 () Bool)

(assert (=> b!289704 m!422885))

(declare-fun m!422887 () Bool)

(assert (=> b!289704 m!422887))

(declare-fun m!422889 () Bool)

(assert (=> b!289704 m!422889))

(declare-fun m!422891 () Bool)

(assert (=> b!289704 m!422891))

(declare-fun m!422893 () Bool)

(assert (=> b!289704 m!422893))

(declare-fun m!422895 () Bool)

(assert (=> b!289704 m!422895))

(declare-fun m!422897 () Bool)

(assert (=> b!289704 m!422897))

(declare-fun m!422899 () Bool)

(assert (=> b!289704 m!422899))

(declare-fun m!422901 () Bool)

(assert (=> b!289704 m!422901))

(declare-fun m!422903 () Bool)

(assert (=> b!289704 m!422903))

(declare-fun m!422905 () Bool)

(assert (=> start!64568 m!422905))

(declare-fun m!422907 () Bool)

(assert (=> start!64568 m!422907))

(declare-fun m!422909 () Bool)

(assert (=> b!289705 m!422909))

(push 1)

(assert (not b!289703))

(assert (not start!64568))

(assert (not b!289705))

(assert (not b!289704))

(check-sat)

