; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65624 () Bool)

(assert start!65624)

(declare-fun b!294209 () Bool)

(declare-fun e!210228 () Bool)

(declare-datatypes ((array!17607 0))(
  ( (array!17608 (arr!8664 (Array (_ BitVec 32) (_ BitVec 8))) (size!7629 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13262 0))(
  ( (BitStream!13263 (buf!7692 array!17607) (currentByte!14183 (_ BitVec 32)) (currentBit!14178 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13262)

(declare-fun array_inv!7241 (array!17607) Bool)

(assert (=> b!294209 (= e!210228 (array_inv!7241 (buf!7692 thiss!1728)))))

(declare-fun b!294210 () Bool)

(declare-fun res!242945 () Bool)

(declare-fun e!210230 () Bool)

(assert (=> b!294210 (=> (not res!242945) (not e!210230))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294210 (= res!242945 (validate_offset_bits!1 ((_ sign_extend 32) (size!7629 (buf!7692 thiss!1728))) ((_ sign_extend 32) (currentByte!14183 thiss!1728)) ((_ sign_extend 32) (currentBit!14178 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294211 () Bool)

(assert (=> b!294211 (= e!210230 (not (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-fun arr!273 () array!17607)

(declare-fun lt!427245 () array!17607)

(declare-fun arrayBitRangesEq!0 (array!17607 array!17607 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294211 (arrayBitRangesEq!0 arr!273 lt!427245 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23132 0))(
  ( (tuple2!23133 (_1!12888 Bool) (_2!12888 BitStream!13262)) )
))
(declare-fun lt!427239 () tuple2!23132)

(declare-datatypes ((Unit!20483 0))(
  ( (Unit!20484) )
))
(declare-fun lt!427240 () Unit!20483)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17607 (_ BitVec 64) Bool) Unit!20483)

(assert (=> b!294211 (= lt!427240 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12888 lt!427239)))))

(declare-fun e!210227 () Bool)

(assert (=> b!294211 e!210227))

(declare-fun res!242943 () Bool)

(assert (=> b!294211 (=> (not res!242943) (not e!210227))))

(declare-datatypes ((tuple3!1774 0))(
  ( (tuple3!1775 (_1!12889 Unit!20483) (_2!12889 BitStream!13262) (_3!1322 array!17607)) )
))
(declare-fun lt!427241 () tuple3!1774)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294211 (= res!242943 (= (bvsub (bvadd (bitIndex!0 (size!7629 (buf!7692 thiss!1728)) (currentByte!14183 thiss!1728) (currentBit!14178 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7629 (buf!7692 (_2!12889 lt!427241))) (currentByte!14183 (_2!12889 lt!427241)) (currentBit!14178 (_2!12889 lt!427241)))))))

(declare-fun readBitsLoop!0 (BitStream!13262 (_ BitVec 64) array!17607 (_ BitVec 64) (_ BitVec 64)) tuple3!1774)

(assert (=> b!294211 (= lt!427241 (readBitsLoop!0 (_2!12888 lt!427239) nBits!523 lt!427245 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!294211 (validate_offset_bits!1 ((_ sign_extend 32) (size!7629 (buf!7692 (_2!12888 lt!427239)))) ((_ sign_extend 32) (currentByte!14183 (_2!12888 lt!427239))) ((_ sign_extend 32) (currentBit!14178 (_2!12888 lt!427239))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427243 () Unit!20483)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13262 BitStream!13262 (_ BitVec 64) (_ BitVec 64)) Unit!20483)

(assert (=> b!294211 (= lt!427243 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12888 lt!427239) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427242 () (_ BitVec 32))

(declare-fun lt!427244 () (_ BitVec 32))

(assert (=> b!294211 (= lt!427245 (array!17608 (store (arr!8664 arr!273) lt!427242 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8664 arr!273) lt!427242)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427244)))) ((_ sign_extend 24) (ite (_1!12888 lt!427239) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427244) #b00000000))))) (size!7629 arr!273)))))

(assert (=> b!294211 (= lt!427244 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294211 (= lt!427242 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13262) tuple2!23132)

(assert (=> b!294211 (= lt!427239 (readBit!0 thiss!1728))))

(declare-fun b!294212 () Bool)

(declare-fun res!242942 () Bool)

(assert (=> b!294212 (=> (not res!242942) (not e!210230))))

(assert (=> b!294212 (= res!242942 (bvslt from!505 to!474))))

(declare-fun res!242944 () Bool)

(assert (=> start!65624 (=> (not res!242944) (not e!210230))))

(assert (=> start!65624 (= res!242944 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7629 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65624 e!210230))

(declare-fun inv!12 (BitStream!13262) Bool)

(assert (=> start!65624 (and (inv!12 thiss!1728) e!210228)))

(assert (=> start!65624 true))

(assert (=> start!65624 (array_inv!7241 arr!273)))

(declare-fun b!294213 () Bool)

(assert (=> b!294213 (= e!210227 (and (= (buf!7692 thiss!1728) (buf!7692 (_2!12889 lt!427241))) (= (size!7629 arr!273) (size!7629 (_3!1322 lt!427241)))))))

(assert (= (and start!65624 res!242944) b!294210))

(assert (= (and b!294210 res!242945) b!294212))

(assert (= (and b!294212 res!242942) b!294211))

(assert (= (and b!294211 res!242943) b!294213))

(assert (= start!65624 b!294209))

(declare-fun m!430315 () Bool)

(assert (=> b!294209 m!430315))

(declare-fun m!430317 () Bool)

(assert (=> b!294210 m!430317))

(declare-fun m!430319 () Bool)

(assert (=> b!294211 m!430319))

(declare-fun m!430321 () Bool)

(assert (=> b!294211 m!430321))

(declare-fun m!430323 () Bool)

(assert (=> b!294211 m!430323))

(declare-fun m!430325 () Bool)

(assert (=> b!294211 m!430325))

(declare-fun m!430327 () Bool)

(assert (=> b!294211 m!430327))

(declare-fun m!430329 () Bool)

(assert (=> b!294211 m!430329))

(declare-fun m!430331 () Bool)

(assert (=> b!294211 m!430331))

(declare-fun m!430333 () Bool)

(assert (=> b!294211 m!430333))

(declare-fun m!430335 () Bool)

(assert (=> b!294211 m!430335))

(declare-fun m!430337 () Bool)

(assert (=> b!294211 m!430337))

(declare-fun m!430339 () Bool)

(assert (=> b!294211 m!430339))

(declare-fun m!430341 () Bool)

(assert (=> start!65624 m!430341))

(declare-fun m!430343 () Bool)

(assert (=> start!65624 m!430343))

(push 1)

(assert (not b!294210))

(assert (not b!294211))

(assert (not b!294209))

(assert (not start!65624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

