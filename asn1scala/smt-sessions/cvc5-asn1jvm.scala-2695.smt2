; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66046 () Bool)

(assert start!66046)

(declare-fun b!296066 () Bool)

(declare-fun e!211780 () Bool)

(declare-fun e!211779 () Bool)

(assert (=> b!296066 (= e!211780 (not e!211779))))

(declare-fun res!244436 () Bool)

(assert (=> b!296066 (=> res!244436 e!211779)))

(declare-fun lt!431208 () Bool)

(declare-datatypes ((array!17714 0))(
  ( (array!17715 (arr!8734 (Array (_ BitVec 32) (_ BitVec 8))) (size!7675 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13354 0))(
  ( (BitStream!13355 (buf!7738 array!17714) (currentByte!14259 (_ BitVec 32)) (currentBit!14254 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13354)

(declare-datatypes ((tuple2!23284 0))(
  ( (tuple2!23285 (_1!13025 BitStream!13354) (_2!13025 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13354) tuple2!23284)

(assert (=> b!296066 (= res!244436 (not (= lt!431208 (_2!13025 (readBitPure!0 thiss!1728)))))))

(declare-fun e!211784 () Bool)

(assert (=> b!296066 e!211784))

(declare-fun res!244434 () Bool)

(assert (=> b!296066 (=> (not res!244434) (not e!211784))))

(declare-fun lt!431215 () array!17714)

(declare-fun from!505 () (_ BitVec 64))

(declare-fun bitAt!0 (array!17714 (_ BitVec 64)) Bool)

(assert (=> b!296066 (= res!244434 (= (bitAt!0 lt!431215 from!505) lt!431208))))

(declare-datatypes ((Unit!20635 0))(
  ( (Unit!20636) )
))
(declare-datatypes ((tuple3!1866 0))(
  ( (tuple3!1867 (_1!13026 Unit!20635) (_2!13026 BitStream!13354) (_3!1383 array!17714)) )
))
(declare-fun lt!431213 () tuple3!1866)

(assert (=> b!296066 (= lt!431208 (bitAt!0 (_3!1383 lt!431213) from!505))))

(declare-fun lt!431212 () Unit!20635)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17714 array!17714 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20635)

(assert (=> b!296066 (= lt!431212 (arrayBitRangesEqImpliesEq!0 lt!431215 (_3!1383 lt!431213) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17714)

(declare-fun arrayBitRangesEq!0 (array!17714 array!17714 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296066 (arrayBitRangesEq!0 arr!273 (_3!1383 lt!431213) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!431209 () Unit!20635)

(declare-fun arrayBitRangesEqTransitive!0 (array!17714 array!17714 array!17714 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20635)

(assert (=> b!296066 (= lt!431209 (arrayBitRangesEqTransitive!0 arr!273 lt!431215 (_3!1383 lt!431213) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296066 (arrayBitRangesEq!0 arr!273 lt!431215 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!23286 0))(
  ( (tuple2!23287 (_1!13027 Bool) (_2!13027 BitStream!13354)) )
))
(declare-fun lt!431216 () tuple2!23286)

(declare-fun lt!431211 () Unit!20635)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17714 (_ BitVec 64) Bool) Unit!20635)

(assert (=> b!296066 (= lt!431211 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13027 lt!431216)))))

(declare-fun e!211783 () Bool)

(assert (=> b!296066 e!211783))

(declare-fun res!244435 () Bool)

(assert (=> b!296066 (=> (not res!244435) (not e!211783))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296066 (= res!244435 (= (bvsub (bvadd (bitIndex!0 (size!7675 (buf!7738 thiss!1728)) (currentByte!14259 thiss!1728) (currentBit!14254 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7675 (buf!7738 (_2!13026 lt!431213))) (currentByte!14259 (_2!13026 lt!431213)) (currentBit!14254 (_2!13026 lt!431213)))))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun readBitsLoop!0 (BitStream!13354 (_ BitVec 64) array!17714 (_ BitVec 64) (_ BitVec 64)) tuple3!1866)

(assert (=> b!296066 (= lt!431213 (readBitsLoop!0 (_2!13027 lt!431216) nBits!523 lt!431215 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296066 (validate_offset_bits!1 ((_ sign_extend 32) (size!7675 (buf!7738 (_2!13027 lt!431216)))) ((_ sign_extend 32) (currentByte!14259 (_2!13027 lt!431216))) ((_ sign_extend 32) (currentBit!14254 (_2!13027 lt!431216))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431210 () Unit!20635)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13354 BitStream!13354 (_ BitVec 64) (_ BitVec 64)) Unit!20635)

(assert (=> b!296066 (= lt!431210 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13027 lt!431216) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!431217 () (_ BitVec 32))

(declare-fun lt!431214 () (_ BitVec 32))

(assert (=> b!296066 (= lt!431215 (array!17715 (store (arr!8734 arr!273) lt!431214 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8734 arr!273) lt!431214)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431217)))) ((_ sign_extend 24) (ite (_1!13027 lt!431216) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!431217) #b00000000))))) (size!7675 arr!273)))))

(assert (=> b!296066 (= lt!431217 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296066 (= lt!431214 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13354) tuple2!23286)

(assert (=> b!296066 (= lt!431216 (readBit!0 thiss!1728))))

(declare-fun b!296067 () Bool)

(assert (=> b!296067 (= e!211784 (= lt!431208 (_1!13027 lt!431216)))))

(declare-fun b!296068 () Bool)

(declare-fun res!244430 () Bool)

(assert (=> b!296068 (=> res!244430 e!211779)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296068 (= res!244430 (not (invariant!0 (currentBit!14254 (_2!13026 lt!431213)) (currentByte!14259 (_2!13026 lt!431213)) (size!7675 (buf!7738 (_2!13026 lt!431213))))))))

(declare-fun b!296069 () Bool)

(declare-fun e!211781 () Bool)

(declare-fun array_inv!7287 (array!17714) Bool)

(assert (=> b!296069 (= e!211781 (array_inv!7287 (buf!7738 thiss!1728)))))

(declare-fun b!296070 () Bool)

(declare-fun res!244431 () Bool)

(assert (=> b!296070 (=> (not res!244431) (not e!211780))))

(assert (=> b!296070 (= res!244431 (bvslt from!505 to!474))))

(declare-fun b!296071 () Bool)

(assert (=> b!296071 (= e!211779 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 from!505) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!244432 () Bool)

(assert (=> start!66046 (=> (not res!244432) (not e!211780))))

(assert (=> start!66046 (= res!244432 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7675 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66046 e!211780))

(declare-fun inv!12 (BitStream!13354) Bool)

(assert (=> start!66046 (and (inv!12 thiss!1728) e!211781)))

(assert (=> start!66046 true))

(assert (=> start!66046 (array_inv!7287 arr!273)))

(declare-fun b!296072 () Bool)

(declare-fun res!244433 () Bool)

(assert (=> b!296072 (=> (not res!244433) (not e!211780))))

(assert (=> b!296072 (= res!244433 (validate_offset_bits!1 ((_ sign_extend 32) (size!7675 (buf!7738 thiss!1728))) ((_ sign_extend 32) (currentByte!14259 thiss!1728)) ((_ sign_extend 32) (currentBit!14254 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296073 () Bool)

(assert (=> b!296073 (= e!211783 (and (= (buf!7738 thiss!1728) (buf!7738 (_2!13026 lt!431213))) (= (size!7675 arr!273) (size!7675 (_3!1383 lt!431213)))))))

(assert (= (and start!66046 res!244432) b!296072))

(assert (= (and b!296072 res!244433) b!296070))

(assert (= (and b!296070 res!244431) b!296066))

(assert (= (and b!296066 res!244435) b!296073))

(assert (= (and b!296066 res!244434) b!296067))

(assert (= (and b!296066 (not res!244436)) b!296068))

(assert (= (and b!296068 (not res!244430)) b!296071))

(assert (= start!66046 b!296069))

(declare-fun m!433861 () Bool)

(assert (=> b!296072 m!433861))

(declare-fun m!433863 () Bool)

(assert (=> b!296066 m!433863))

(declare-fun m!433865 () Bool)

(assert (=> b!296066 m!433865))

(declare-fun m!433867 () Bool)

(assert (=> b!296066 m!433867))

(declare-fun m!433869 () Bool)

(assert (=> b!296066 m!433869))

(declare-fun m!433871 () Bool)

(assert (=> b!296066 m!433871))

(declare-fun m!433873 () Bool)

(assert (=> b!296066 m!433873))

(declare-fun m!433875 () Bool)

(assert (=> b!296066 m!433875))

(declare-fun m!433877 () Bool)

(assert (=> b!296066 m!433877))

(declare-fun m!433879 () Bool)

(assert (=> b!296066 m!433879))

(declare-fun m!433881 () Bool)

(assert (=> b!296066 m!433881))

(declare-fun m!433883 () Bool)

(assert (=> b!296066 m!433883))

(declare-fun m!433885 () Bool)

(assert (=> b!296066 m!433885))

(declare-fun m!433887 () Bool)

(assert (=> b!296066 m!433887))

(declare-fun m!433889 () Bool)

(assert (=> b!296066 m!433889))

(declare-fun m!433891 () Bool)

(assert (=> b!296066 m!433891))

(declare-fun m!433893 () Bool)

(assert (=> b!296066 m!433893))

(declare-fun m!433895 () Bool)

(assert (=> b!296066 m!433895))

(declare-fun m!433897 () Bool)

(assert (=> b!296068 m!433897))

(declare-fun m!433899 () Bool)

(assert (=> b!296069 m!433899))

(declare-fun m!433901 () Bool)

(assert (=> start!66046 m!433901))

(declare-fun m!433903 () Bool)

(assert (=> start!66046 m!433903))

(push 1)

(assert (not b!296072))

(assert (not start!66046))

(assert (not b!296068))

(assert (not b!296069))

(assert (not b!296066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

