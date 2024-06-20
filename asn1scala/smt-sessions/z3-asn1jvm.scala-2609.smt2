; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64572 () Bool)

(assert start!64572)

(declare-fun b!289733 () Bool)

(declare-fun res!239379 () Bool)

(declare-fun e!206189 () Bool)

(assert (=> b!289733 (=> (not res!239379) (not e!206189))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289733 (= res!239379 (bvslt from!505 to!474))))

(declare-fun b!289734 () Bool)

(declare-fun res!239380 () Bool)

(assert (=> b!289734 (=> (not res!239380) (not e!206189))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17161 0))(
  ( (array!17162 (arr!8426 (Array (_ BitVec 32) (_ BitVec 8))) (size!7424 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12858 0))(
  ( (BitStream!12859 (buf!7490 array!17161) (currentByte!13897 (_ BitVec 32)) (currentBit!13892 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12858)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289734 (= res!239380 (validate_offset_bits!1 ((_ sign_extend 32) (size!7424 (buf!7490 thiss!1728))) ((_ sign_extend 32) (currentByte!13897 thiss!1728)) ((_ sign_extend 32) (currentBit!13892 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289735 () Bool)

(declare-fun e!206192 () Bool)

(declare-fun array_inv!7036 (array!17161) Bool)

(assert (=> b!289735 (= e!206192 (array_inv!7036 (buf!7490 thiss!1728)))))

(declare-fun b!289736 () Bool)

(assert (=> b!289736 (= e!206189 (not true))))

(declare-fun arr!273 () array!17161)

(declare-fun lt!420174 () array!17161)

(declare-fun arrayBitRangesEq!0 (array!17161 array!17161 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289736 (arrayBitRangesEq!0 arr!273 lt!420174 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20089 0))(
  ( (Unit!20090) )
))
(declare-fun lt!420175 () Unit!20089)

(declare-datatypes ((tuple2!22722 0))(
  ( (tuple2!22723 (_1!12571 Bool) (_2!12571 BitStream!12858)) )
))
(declare-fun lt!420173 () tuple2!22722)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17161 (_ BitVec 64) Bool) Unit!20089)

(assert (=> b!289736 (= lt!420175 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12571 lt!420173)))))

(declare-fun e!206193 () Bool)

(assert (=> b!289736 e!206193))

(declare-fun res!239381 () Bool)

(assert (=> b!289736 (=> (not res!239381) (not e!206193))))

(declare-datatypes ((tuple3!1592 0))(
  ( (tuple3!1593 (_1!12572 Unit!20089) (_2!12572 BitStream!12858) (_3!1210 array!17161)) )
))
(declare-fun lt!420171 () tuple3!1592)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289736 (= res!239381 (= (bvsub (bvadd (bitIndex!0 (size!7424 (buf!7490 thiss!1728)) (currentByte!13897 thiss!1728) (currentBit!13892 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7424 (buf!7490 (_2!12572 lt!420171))) (currentByte!13897 (_2!12572 lt!420171)) (currentBit!13892 (_2!12572 lt!420171)))))))

(declare-fun readBitsLoop!0 (BitStream!12858 (_ BitVec 64) array!17161 (_ BitVec 64) (_ BitVec 64)) tuple3!1592)

(assert (=> b!289736 (= lt!420171 (readBitsLoop!0 (_2!12571 lt!420173) nBits!523 lt!420174 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289736 (validate_offset_bits!1 ((_ sign_extend 32) (size!7424 (buf!7490 (_2!12571 lt!420173)))) ((_ sign_extend 32) (currentByte!13897 (_2!12571 lt!420173))) ((_ sign_extend 32) (currentBit!13892 (_2!12571 lt!420173))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420176 () Unit!20089)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12858 BitStream!12858 (_ BitVec 64) (_ BitVec 64)) Unit!20089)

(assert (=> b!289736 (= lt!420176 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12571 lt!420173) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!420177 () (_ BitVec 32))

(declare-fun lt!420172 () (_ BitVec 32))

(assert (=> b!289736 (= lt!420174 (array!17162 (store (arr!8426 arr!273) lt!420177 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8426 arr!273) lt!420177)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420172)))) ((_ sign_extend 24) (ite (_1!12571 lt!420173) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!420172) #b00000000))))) (size!7424 arr!273)))))

(assert (=> b!289736 (= lt!420172 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289736 (= lt!420177 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12858) tuple2!22722)

(assert (=> b!289736 (= lt!420173 (readBit!0 thiss!1728))))

(declare-fun b!289737 () Bool)

(assert (=> b!289737 (= e!206193 (and (= (buf!7490 thiss!1728) (buf!7490 (_2!12572 lt!420171))) (= (size!7424 arr!273) (size!7424 (_3!1210 lt!420171)))))))

(declare-fun res!239378 () Bool)

(assert (=> start!64572 (=> (not res!239378) (not e!206189))))

(assert (=> start!64572 (= res!239378 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7424 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64572 e!206189))

(declare-fun inv!12 (BitStream!12858) Bool)

(assert (=> start!64572 (and (inv!12 thiss!1728) e!206192)))

(assert (=> start!64572 true))

(assert (=> start!64572 (array_inv!7036 arr!273)))

(assert (= (and start!64572 res!239378) b!289734))

(assert (= (and b!289734 res!239380) b!289733))

(assert (= (and b!289733 res!239379) b!289736))

(assert (= (and b!289736 res!239381) b!289737))

(assert (= start!64572 b!289735))

(declare-fun m!422941 () Bool)

(assert (=> b!289734 m!422941))

(declare-fun m!422943 () Bool)

(assert (=> b!289735 m!422943))

(declare-fun m!422945 () Bool)

(assert (=> b!289736 m!422945))

(declare-fun m!422947 () Bool)

(assert (=> b!289736 m!422947))

(declare-fun m!422949 () Bool)

(assert (=> b!289736 m!422949))

(declare-fun m!422951 () Bool)

(assert (=> b!289736 m!422951))

(declare-fun m!422953 () Bool)

(assert (=> b!289736 m!422953))

(declare-fun m!422955 () Bool)

(assert (=> b!289736 m!422955))

(declare-fun m!422957 () Bool)

(assert (=> b!289736 m!422957))

(declare-fun m!422959 () Bool)

(assert (=> b!289736 m!422959))

(declare-fun m!422961 () Bool)

(assert (=> b!289736 m!422961))

(declare-fun m!422963 () Bool)

(assert (=> b!289736 m!422963))

(declare-fun m!422965 () Bool)

(assert (=> b!289736 m!422965))

(declare-fun m!422967 () Bool)

(assert (=> start!64572 m!422967))

(declare-fun m!422969 () Bool)

(assert (=> start!64572 m!422969))

(check-sat (not start!64572) (not b!289736) (not b!289735) (not b!289734))
