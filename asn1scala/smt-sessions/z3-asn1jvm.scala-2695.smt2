; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66048 () Bool)

(assert start!66048)

(declare-fun b!296090 () Bool)

(declare-fun e!211806 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!296090 (= e!211806 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!296091 () Bool)

(declare-fun res!244456 () Bool)

(assert (=> b!296091 (=> res!244456 e!211806)))

(declare-datatypes ((array!17716 0))(
  ( (array!17717 (arr!8735 (Array (_ BitVec 32) (_ BitVec 8))) (size!7676 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13356 0))(
  ( (BitStream!13357 (buf!7739 array!17716) (currentByte!14260 (_ BitVec 32)) (currentBit!14255 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20637 0))(
  ( (Unit!20638) )
))
(declare-datatypes ((tuple3!1868 0))(
  ( (tuple3!1869 (_1!13028 Unit!20637) (_2!13028 BitStream!13356) (_3!1384 array!17716)) )
))
(declare-fun lt!431246 () tuple3!1868)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296091 (= res!244456 (not (invariant!0 (currentBit!14255 (_2!13028 lt!431246)) (currentByte!14260 (_2!13028 lt!431246)) (size!7676 (buf!7739 (_2!13028 lt!431246))))))))

(declare-fun res!244454 () Bool)

(declare-fun e!211803 () Bool)

(assert (=> start!66048 (=> (not res!244454) (not e!211803))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17716)

(assert (=> start!66048 (= res!244454 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7676 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66048 e!211803))

(declare-fun thiss!1728 () BitStream!13356)

(declare-fun e!211804 () Bool)

(declare-fun inv!12 (BitStream!13356) Bool)

(assert (=> start!66048 (and (inv!12 thiss!1728) e!211804)))

(assert (=> start!66048 true))

(declare-fun array_inv!7288 (array!17716) Bool)

(assert (=> start!66048 (array_inv!7288 arr!273)))

(declare-fun b!296092 () Bool)

(assert (=> b!296092 (= e!211804 (array_inv!7288 (buf!7739 thiss!1728)))))

(declare-fun b!296093 () Bool)

(declare-fun res!244457 () Bool)

(assert (=> b!296093 (=> (not res!244457) (not e!211803))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296093 (= res!244457 (validate_offset_bits!1 ((_ sign_extend 32) (size!7676 (buf!7739 thiss!1728))) ((_ sign_extend 32) (currentByte!14260 thiss!1728)) ((_ sign_extend 32) (currentBit!14255 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296094 () Bool)

(declare-fun res!244453 () Bool)

(assert (=> b!296094 (=> (not res!244453) (not e!211803))))

(assert (=> b!296094 (= res!244453 (bvslt from!505 to!474))))

(declare-fun b!296095 () Bool)

(declare-fun e!211800 () Bool)

(declare-fun lt!431245 () Bool)

(declare-datatypes ((tuple2!23288 0))(
  ( (tuple2!23289 (_1!13029 Bool) (_2!13029 BitStream!13356)) )
))
(declare-fun lt!431239 () tuple2!23288)

(assert (=> b!296095 (= e!211800 (= lt!431245 (_1!13029 lt!431239)))))

(declare-fun b!296096 () Bool)

(declare-fun e!211802 () Bool)

(assert (=> b!296096 (= e!211802 (and (= (buf!7739 thiss!1728) (buf!7739 (_2!13028 lt!431246))) (= (size!7676 arr!273) (size!7676 (_3!1384 lt!431246)))))))

(declare-fun b!296097 () Bool)

(assert (=> b!296097 (= e!211803 (not e!211806))))

(declare-fun res!244452 () Bool)

(assert (=> b!296097 (=> res!244452 e!211806)))

(declare-datatypes ((tuple2!23290 0))(
  ( (tuple2!23291 (_1!13030 BitStream!13356) (_2!13030 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13356) tuple2!23290)

(assert (=> b!296097 (= res!244452 (not (= lt!431245 (_2!13030 (readBitPure!0 thiss!1728)))))))

(assert (=> b!296097 e!211800))

(declare-fun res!244451 () Bool)

(assert (=> b!296097 (=> (not res!244451) (not e!211800))))

(declare-fun lt!431243 () array!17716)

(declare-fun bitAt!0 (array!17716 (_ BitVec 64)) Bool)

(assert (=> b!296097 (= res!244451 (= (bitAt!0 lt!431243 from!505) lt!431245))))

(assert (=> b!296097 (= lt!431245 (bitAt!0 (_3!1384 lt!431246) from!505))))

(declare-fun lt!431247 () Unit!20637)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17716 array!17716 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20637)

(assert (=> b!296097 (= lt!431247 (arrayBitRangesEqImpliesEq!0 lt!431243 (_3!1384 lt!431246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17716 array!17716 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296097 (arrayBitRangesEq!0 arr!273 (_3!1384 lt!431246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431242 () Unit!20637)

(declare-fun arrayBitRangesEqTransitive!0 (array!17716 array!17716 array!17716 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20637)

(assert (=> b!296097 (= lt!431242 (arrayBitRangesEqTransitive!0 arr!273 lt!431243 (_3!1384 lt!431246) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296097 (arrayBitRangesEq!0 arr!273 lt!431243 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431240 () Unit!20637)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17716 (_ BitVec 64) Bool) Unit!20637)

(assert (=> b!296097 (= lt!431240 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13029 lt!431239)))))

(assert (=> b!296097 e!211802))

(declare-fun res!244455 () Bool)

(assert (=> b!296097 (=> (not res!244455) (not e!211802))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296097 (= res!244455 (= (bvsub (bvadd (bitIndex!0 (size!7676 (buf!7739 thiss!1728)) (currentByte!14260 thiss!1728) (currentBit!14255 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7676 (buf!7739 (_2!13028 lt!431246))) (currentByte!14260 (_2!13028 lt!431246)) (currentBit!14255 (_2!13028 lt!431246)))))))

(declare-fun readBitsLoop!0 (BitStream!13356 (_ BitVec 64) array!17716 (_ BitVec 64) (_ BitVec 64)) tuple3!1868)

(assert (=> b!296097 (= lt!431246 (readBitsLoop!0 (_2!13029 lt!431239) nBits!523 lt!431243 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296097 (validate_offset_bits!1 ((_ sign_extend 32) (size!7676 (buf!7739 (_2!13029 lt!431239)))) ((_ sign_extend 32) (currentByte!14260 (_2!13029 lt!431239))) ((_ sign_extend 32) (currentBit!14255 (_2!13029 lt!431239))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431244 () Unit!20637)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13356 BitStream!13356 (_ BitVec 64) (_ BitVec 64)) Unit!20637)

(assert (=> b!296097 (= lt!431244 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13029 lt!431239) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431238 () (_ BitVec 32))

(declare-fun lt!431241 () (_ BitVec 32))

(assert (=> b!296097 (= lt!431243 (array!17717 (store (arr!8735 arr!273) lt!431238 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8735 arr!273) lt!431238)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431241)))) ((_ sign_extend 24) (ite (_1!13029 lt!431239) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431241) #b00000000))))) (size!7676 arr!273)))))

(assert (=> b!296097 (= lt!431241 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296097 (= lt!431238 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13356) tuple2!23288)

(assert (=> b!296097 (= lt!431239 (readBit!0 thiss!1728))))

(assert (= (and start!66048 res!244454) b!296093))

(assert (= (and b!296093 res!244457) b!296094))

(assert (= (and b!296094 res!244453) b!296097))

(assert (= (and b!296097 res!244455) b!296096))

(assert (= (and b!296097 res!244451) b!296095))

(assert (= (and b!296097 (not res!244452)) b!296091))

(assert (= (and b!296091 (not res!244456)) b!296090))

(assert (= start!66048 b!296092))

(declare-fun m!433905 () Bool)

(assert (=> b!296097 m!433905))

(declare-fun m!433907 () Bool)

(assert (=> b!296097 m!433907))

(declare-fun m!433909 () Bool)

(assert (=> b!296097 m!433909))

(declare-fun m!433911 () Bool)

(assert (=> b!296097 m!433911))

(declare-fun m!433913 () Bool)

(assert (=> b!296097 m!433913))

(declare-fun m!433915 () Bool)

(assert (=> b!296097 m!433915))

(declare-fun m!433917 () Bool)

(assert (=> b!296097 m!433917))

(declare-fun m!433919 () Bool)

(assert (=> b!296097 m!433919))

(declare-fun m!433921 () Bool)

(assert (=> b!296097 m!433921))

(declare-fun m!433923 () Bool)

(assert (=> b!296097 m!433923))

(declare-fun m!433925 () Bool)

(assert (=> b!296097 m!433925))

(declare-fun m!433927 () Bool)

(assert (=> b!296097 m!433927))

(declare-fun m!433929 () Bool)

(assert (=> b!296097 m!433929))

(declare-fun m!433931 () Bool)

(assert (=> b!296097 m!433931))

(declare-fun m!433933 () Bool)

(assert (=> b!296097 m!433933))

(declare-fun m!433935 () Bool)

(assert (=> b!296097 m!433935))

(declare-fun m!433937 () Bool)

(assert (=> b!296097 m!433937))

(declare-fun m!433939 () Bool)

(assert (=> b!296091 m!433939))

(declare-fun m!433941 () Bool)

(assert (=> b!296093 m!433941))

(declare-fun m!433943 () Bool)

(assert (=> start!66048 m!433943))

(declare-fun m!433945 () Bool)

(assert (=> start!66048 m!433945))

(declare-fun m!433947 () Bool)

(assert (=> b!296092 m!433947))

(check-sat (not start!66048) (not b!296097) (not b!296093) (not b!296092) (not b!296091))
(check-sat)
