; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66162 () Bool)

(assert start!66162)

(declare-fun b!296659 () Bool)

(declare-fun e!212300 () Bool)

(declare-datatypes ((array!17755 0))(
  ( (array!17756 (arr!8759 (Array (_ BitVec 32) (_ BitVec 8))) (size!7694 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13392 0))(
  ( (BitStream!13393 (buf!7757 array!17755) (currentByte!14284 (_ BitVec 32)) (currentBit!14279 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13392)

(declare-fun array_inv!7306 (array!17755) Bool)

(assert (=> b!296659 (= e!212300 (array_inv!7306 (buf!7757 thiss!1728)))))

(declare-fun res!244925 () Bool)

(declare-fun e!212297 () Bool)

(assert (=> start!66162 (=> (not res!244925) (not e!212297))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17755)

(assert (=> start!66162 (= res!244925 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7694 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66162 e!212297))

(declare-fun inv!12 (BitStream!13392) Bool)

(assert (=> start!66162 (and (inv!12 thiss!1728) e!212300)))

(assert (=> start!66162 true))

(assert (=> start!66162 (array_inv!7306 arr!273)))

(declare-fun b!296660 () Bool)

(declare-fun e!212299 () Bool)

(declare-fun lt!432347 () Bool)

(declare-datatypes ((tuple2!23346 0))(
  ( (tuple2!23347 (_1!13078 Bool) (_2!13078 BitStream!13392)) )
))
(declare-fun lt!432350 () tuple2!23346)

(assert (=> b!296660 (= e!212299 (= lt!432347 (_1!13078 lt!432350)))))

(declare-fun b!296661 () Bool)

(declare-fun res!244924 () Bool)

(assert (=> b!296661 (=> (not res!244924) (not e!212297))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296661 (= res!244924 (validate_offset_bits!1 ((_ sign_extend 32) (size!7694 (buf!7757 thiss!1728))) ((_ sign_extend 32) (currentByte!14284 thiss!1728)) ((_ sign_extend 32) (currentBit!14279 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!296662 () Bool)

(declare-fun e!212298 () Bool)

(declare-datatypes ((Unit!20685 0))(
  ( (Unit!20686) )
))
(declare-datatypes ((tuple3!1904 0))(
  ( (tuple3!1905 (_1!13079 Unit!20685) (_2!13079 BitStream!13392) (_3!1405 array!17755)) )
))
(declare-fun lt!432348 () tuple3!1904)

(assert (=> b!296662 (= e!212298 (and (= (buf!7757 thiss!1728) (buf!7757 (_2!13079 lt!432348))) (= (size!7694 arr!273) (size!7694 (_3!1405 lt!432348)))))))

(declare-fun b!296663 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296663 (= e!212297 (not (invariant!0 (currentBit!14279 (_2!13079 lt!432348)) (currentByte!14284 (_2!13079 lt!432348)) (size!7694 (buf!7757 (_2!13079 lt!432348))))))))

(assert (=> b!296663 e!212299))

(declare-fun res!244921 () Bool)

(assert (=> b!296663 (=> (not res!244921) (not e!212299))))

(declare-fun lt!432353 () array!17755)

(declare-fun bitAt!0 (array!17755 (_ BitVec 64)) Bool)

(assert (=> b!296663 (= res!244921 (= (bitAt!0 lt!432353 from!505) lt!432347))))

(assert (=> b!296663 (= lt!432347 (bitAt!0 (_3!1405 lt!432348) from!505))))

(declare-fun lt!432354 () Unit!20685)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17755 array!17755 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20685)

(assert (=> b!296663 (= lt!432354 (arrayBitRangesEqImpliesEq!0 lt!432353 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17755 array!17755 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!296663 (arrayBitRangesEq!0 arr!273 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432346 () Unit!20685)

(declare-fun arrayBitRangesEqTransitive!0 (array!17755 array!17755 array!17755 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20685)

(assert (=> b!296663 (= lt!432346 (arrayBitRangesEqTransitive!0 arr!273 lt!432353 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!296663 (arrayBitRangesEq!0 arr!273 lt!432353 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432345 () Unit!20685)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17755 (_ BitVec 64) Bool) Unit!20685)

(assert (=> b!296663 (= lt!432345 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13078 lt!432350)))))

(assert (=> b!296663 e!212298))

(declare-fun res!244923 () Bool)

(assert (=> b!296663 (=> (not res!244923) (not e!212298))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!296663 (= res!244923 (= (bvsub (bvadd (bitIndex!0 (size!7694 (buf!7757 thiss!1728)) (currentByte!14284 thiss!1728) (currentBit!14279 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7694 (buf!7757 (_2!13079 lt!432348))) (currentByte!14284 (_2!13079 lt!432348)) (currentBit!14279 (_2!13079 lt!432348)))))))

(declare-fun readBitsLoop!0 (BitStream!13392 (_ BitVec 64) array!17755 (_ BitVec 64) (_ BitVec 64)) tuple3!1904)

(assert (=> b!296663 (= lt!432348 (readBitsLoop!0 (_2!13078 lt!432350) nBits!523 lt!432353 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!296663 (validate_offset_bits!1 ((_ sign_extend 32) (size!7694 (buf!7757 (_2!13078 lt!432350)))) ((_ sign_extend 32) (currentByte!14284 (_2!13078 lt!432350))) ((_ sign_extend 32) (currentBit!14279 (_2!13078 lt!432350))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432352 () Unit!20685)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13392 BitStream!13392 (_ BitVec 64) (_ BitVec 64)) Unit!20685)

(assert (=> b!296663 (= lt!432352 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13078 lt!432350) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!432349 () (_ BitVec 32))

(declare-fun lt!432351 () (_ BitVec 32))

(assert (=> b!296663 (= lt!432353 (array!17756 (store (arr!8759 arr!273) lt!432349 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8759 arr!273) lt!432349)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432351)))) ((_ sign_extend 24) (ite (_1!13078 lt!432350) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432351) #b00000000))))) (size!7694 arr!273)))))

(assert (=> b!296663 (= lt!432351 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296663 (= lt!432349 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13392) tuple2!23346)

(assert (=> b!296663 (= lt!432350 (readBit!0 thiss!1728))))

(declare-fun b!296664 () Bool)

(declare-fun res!244922 () Bool)

(assert (=> b!296664 (=> (not res!244922) (not e!212297))))

(assert (=> b!296664 (= res!244922 (bvslt from!505 to!474))))

(assert (= (and start!66162 res!244925) b!296661))

(assert (= (and b!296661 res!244924) b!296664))

(assert (= (and b!296664 res!244922) b!296663))

(assert (= (and b!296663 res!244923) b!296662))

(assert (= (and b!296663 res!244921) b!296660))

(assert (= start!66162 b!296659))

(declare-fun m!435043 () Bool)

(assert (=> b!296659 m!435043))

(declare-fun m!435045 () Bool)

(assert (=> start!66162 m!435045))

(declare-fun m!435047 () Bool)

(assert (=> start!66162 m!435047))

(declare-fun m!435049 () Bool)

(assert (=> b!296661 m!435049))

(declare-fun m!435051 () Bool)

(assert (=> b!296663 m!435051))

(declare-fun m!435053 () Bool)

(assert (=> b!296663 m!435053))

(declare-fun m!435055 () Bool)

(assert (=> b!296663 m!435055))

(declare-fun m!435057 () Bool)

(assert (=> b!296663 m!435057))

(declare-fun m!435059 () Bool)

(assert (=> b!296663 m!435059))

(declare-fun m!435061 () Bool)

(assert (=> b!296663 m!435061))

(declare-fun m!435063 () Bool)

(assert (=> b!296663 m!435063))

(declare-fun m!435065 () Bool)

(assert (=> b!296663 m!435065))

(declare-fun m!435067 () Bool)

(assert (=> b!296663 m!435067))

(declare-fun m!435069 () Bool)

(assert (=> b!296663 m!435069))

(declare-fun m!435071 () Bool)

(assert (=> b!296663 m!435071))

(declare-fun m!435073 () Bool)

(assert (=> b!296663 m!435073))

(declare-fun m!435075 () Bool)

(assert (=> b!296663 m!435075))

(declare-fun m!435077 () Bool)

(assert (=> b!296663 m!435077))

(declare-fun m!435079 () Bool)

(assert (=> b!296663 m!435079))

(declare-fun m!435081 () Bool)

(assert (=> b!296663 m!435081))

(declare-fun m!435083 () Bool)

(assert (=> b!296663 m!435083))

(check-sat (not b!296659) (not b!296663) (not start!66162) (not b!296661))
(check-sat)
(get-model)

(declare-fun d!99940 () Bool)

(assert (=> d!99940 (= (array_inv!7306 (buf!7757 thiss!1728)) (bvsge (size!7694 (buf!7757 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!296659 d!99940))

(declare-fun d!99942 () Bool)

(declare-fun e!212373 () Bool)

(assert (=> d!99942 e!212373))

(declare-fun res!244996 () Bool)

(assert (=> d!99942 (=> (not res!244996) (not e!212373))))

(declare-fun lt!432505 () (_ BitVec 64))

(declare-fun lt!432500 () tuple3!1904)

(assert (=> d!99942 (= res!244996 (= (bvsub lt!432505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7694 (buf!7757 (_2!13079 lt!432500))) (currentByte!14284 (_2!13079 lt!432500)) (currentBit!14279 (_2!13079 lt!432500)))))))

(assert (=> d!99942 (or (= (bvand lt!432505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432512 () (_ BitVec 64))

(assert (=> d!99942 (= lt!432505 (bvadd lt!432512 to!474))))

(assert (=> d!99942 (or (not (= (bvand lt!432512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!432512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!432512 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99942 (= lt!432512 (bitIndex!0 (size!7694 (buf!7757 (_2!13078 lt!432350))) (currentByte!14284 (_2!13078 lt!432350)) (currentBit!14279 (_2!13078 lt!432350))))))

(declare-fun e!212376 () tuple3!1904)

(assert (=> d!99942 (= lt!432500 e!212376)))

(declare-fun c!13546 () Bool)

(assert (=> d!99942 (= c!13546 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99942 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99942 (= (readBitsLoop!0 (_2!13078 lt!432350) nBits!523 lt!432353 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!432500)))

(declare-fun lt!432501 () (_ BitVec 64))

(declare-fun lt!432503 () (_ BitVec 32))

(declare-fun bm!5192 () Bool)

(declare-fun lt!432510 () tuple2!23346)

(declare-fun lt!432530 () array!17755)

(declare-fun lt!432524 () (_ BitVec 64))

(declare-fun lt!432502 () array!17755)

(declare-fun call!5195 () Bool)

(declare-fun lt!432527 () (_ BitVec 32))

(assert (=> bm!5192 (= call!5195 (arrayBitRangesEq!0 (ite c!13546 lt!432353 lt!432502) (ite c!13546 (array!17756 (store (arr!8759 lt!432353) lt!432527 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8759 lt!432353) lt!432527)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432503)))) ((_ sign_extend 24) (ite (_1!13078 lt!432510) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432503) #b00000000))))) (size!7694 lt!432353)) lt!432530) (ite c!13546 #b0000000000000000000000000000000000000000000000000000000000000000 lt!432501) (ite c!13546 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!432524)))))

(declare-fun b!296756 () Bool)

(declare-fun res!244997 () Bool)

(assert (=> b!296756 (=> (not res!244997) (not e!212373))))

(assert (=> b!296756 (= res!244997 (and (= (buf!7757 (_2!13078 lt!432350)) (buf!7757 (_2!13079 lt!432500))) (= (size!7694 lt!432353) (size!7694 (_3!1405 lt!432500)))))))

(declare-fun b!296757 () Bool)

(declare-fun e!212374 () Bool)

(declare-datatypes ((tuple2!23350 0))(
  ( (tuple2!23351 (_1!13082 BitStream!13392) (_2!13082 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13392) tuple2!23350)

(assert (=> b!296757 (= e!212374 (= (bitAt!0 (_3!1405 lt!432500) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13082 (readBitPure!0 (_2!13078 lt!432350)))))))

(declare-fun b!296758 () Bool)

(declare-fun lt!432507 () Unit!20685)

(declare-fun lt!432508 () tuple3!1904)

(assert (=> b!296758 (= e!212376 (tuple3!1905 lt!432507 (_2!13079 lt!432508) (_3!1405 lt!432508)))))

(assert (=> b!296758 (= lt!432510 (readBit!0 (_2!13078 lt!432350)))))

(declare-fun lt!432531 () (_ BitVec 32))

(assert (=> b!296758 (= lt!432531 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432513 () (_ BitVec 32))

(assert (=> b!296758 (= lt!432513 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432515 () array!17755)

(assert (=> b!296758 (= lt!432515 (array!17756 (store (arr!8759 lt!432353) lt!432531 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8759 lt!432353) lt!432531)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432513)))) ((_ sign_extend 24) (ite (_1!13078 lt!432510) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432513) #b00000000))))) (size!7694 lt!432353)))))

(declare-fun lt!432506 () (_ BitVec 64))

(assert (=> b!296758 (= lt!432506 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!432509 () (_ BitVec 64))

(assert (=> b!296758 (= lt!432509 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!432517 () Unit!20685)

(assert (=> b!296758 (= lt!432517 (validateOffsetBitsIneqLemma!0 (_2!13078 lt!432350) (_2!13078 lt!432510) lt!432506 lt!432509))))

(assert (=> b!296758 (validate_offset_bits!1 ((_ sign_extend 32) (size!7694 (buf!7757 (_2!13078 lt!432510)))) ((_ sign_extend 32) (currentByte!14284 (_2!13078 lt!432510))) ((_ sign_extend 32) (currentBit!14279 (_2!13078 lt!432510))) (bvsub lt!432506 lt!432509))))

(declare-fun lt!432521 () Unit!20685)

(assert (=> b!296758 (= lt!432521 lt!432517)))

(assert (=> b!296758 (= lt!432508 (readBitsLoop!0 (_2!13078 lt!432510) nBits!523 lt!432515 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!245000 () Bool)

(assert (=> b!296758 (= res!245000 (= (bvsub (bvadd (bitIndex!0 (size!7694 (buf!7757 (_2!13078 lt!432350))) (currentByte!14284 (_2!13078 lt!432350)) (currentBit!14279 (_2!13078 lt!432350))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7694 (buf!7757 (_2!13079 lt!432508))) (currentByte!14284 (_2!13079 lt!432508)) (currentBit!14279 (_2!13079 lt!432508)))))))

(declare-fun e!212375 () Bool)

(assert (=> b!296758 (=> (not res!245000) (not e!212375))))

(assert (=> b!296758 e!212375))

(declare-fun lt!432529 () Unit!20685)

(declare-fun Unit!20689 () Unit!20685)

(assert (=> b!296758 (= lt!432529 Unit!20689)))

(assert (=> b!296758 (= lt!432527 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296758 (= lt!432503 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!432511 () Unit!20685)

(assert (=> b!296758 (= lt!432511 (arrayBitRangesUpdatedAtLemma!0 lt!432353 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!13078 lt!432510)))))

(assert (=> b!296758 call!5195))

(declare-fun lt!432514 () Unit!20685)

(assert (=> b!296758 (= lt!432514 lt!432511)))

(declare-fun lt!432520 () (_ BitVec 64))

(assert (=> b!296758 (= lt!432520 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432526 () Unit!20685)

(assert (=> b!296758 (= lt!432526 (arrayBitRangesEqTransitive!0 lt!432353 lt!432515 (_3!1405 lt!432508) lt!432520 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!5196 () Bool)

(assert (=> b!296758 call!5196))

(declare-fun lt!432528 () Unit!20685)

(assert (=> b!296758 (= lt!432528 lt!432526)))

(assert (=> b!296758 (arrayBitRangesEq!0 lt!432353 (_3!1405 lt!432508) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!432496 () Unit!20685)

(declare-fun Unit!20690 () Unit!20685)

(assert (=> b!296758 (= lt!432496 Unit!20690)))

(declare-fun lt!432499 () Unit!20685)

(assert (=> b!296758 (= lt!432499 (arrayBitRangesEqImpliesEq!0 lt!432515 (_3!1405 lt!432508) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!296758 (= (bitAt!0 lt!432515 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1405 lt!432508) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!432497 () Unit!20685)

(assert (=> b!296758 (= lt!432497 lt!432499)))

(declare-fun lt!432522 () Unit!20685)

(declare-fun Unit!20691 () Unit!20685)

(assert (=> b!296758 (= lt!432522 Unit!20691)))

(declare-fun lt!432498 () Bool)

(assert (=> b!296758 (= lt!432498 (= (bitAt!0 (_3!1405 lt!432508) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!13078 lt!432510)))))

(declare-fun Unit!20692 () Unit!20685)

(assert (=> b!296758 (= lt!432507 Unit!20692)))

(assert (=> b!296758 lt!432498))

(declare-fun b!296759 () Bool)

(declare-fun res!245002 () Bool)

(assert (=> b!296759 (=> (not res!245002) (not e!212373))))

(assert (=> b!296759 (= res!245002 e!212374)))

(declare-fun res!244999 () Bool)

(assert (=> b!296759 (=> res!244999 e!212374)))

(assert (=> b!296759 (= res!244999 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun bm!5193 () Bool)

(assert (=> bm!5193 (= call!5196 (arrayBitRangesEq!0 lt!432353 (ite c!13546 (_3!1405 lt!432508) lt!432353) (ite c!13546 lt!432520 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13546 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7694 lt!432353)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!296760 () Bool)

(declare-fun res!245001 () Bool)

(assert (=> b!296760 (=> (not res!245001) (not e!212373))))

(assert (=> b!296760 (= res!245001 (invariant!0 (currentBit!14279 (_2!13079 lt!432500)) (currentByte!14284 (_2!13079 lt!432500)) (size!7694 (buf!7757 (_2!13079 lt!432500)))))))

(declare-fun b!296761 () Bool)

(assert (=> b!296761 (= e!212375 (and (= (buf!7757 (_2!13078 lt!432350)) (buf!7757 (_2!13079 lt!432508))) (= (size!7694 lt!432353) (size!7694 (_3!1405 lt!432508)))))))

(declare-fun lt!432523 () Unit!20685)

(declare-fun b!296762 () Bool)

(assert (=> b!296762 (= e!212376 (tuple3!1905 lt!432523 (_2!13078 lt!432350) lt!432353))))

(declare-fun lt!432518 () Unit!20685)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17755) Unit!20685)

(assert (=> b!296762 (= lt!432518 (arrayBitRangesEqReflexiveLemma!0 lt!432353))))

(assert (=> b!296762 call!5196))

(declare-fun lt!432519 () Unit!20685)

(assert (=> b!296762 (= lt!432519 lt!432518)))

(assert (=> b!296762 (= lt!432502 lt!432353)))

(assert (=> b!296762 (= lt!432530 lt!432353)))

(declare-fun lt!432525 () (_ BitVec 64))

(assert (=> b!296762 (= lt!432525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!432504 () (_ BitVec 64))

(assert (=> b!296762 (= lt!432504 ((_ sign_extend 32) (size!7694 lt!432353)))))

(declare-fun lt!432516 () (_ BitVec 64))

(assert (=> b!296762 (= lt!432516 (bvmul lt!432504 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!296762 (= lt!432501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!296762 (= lt!432524 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17755 array!17755 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20685)

(assert (=> b!296762 (= lt!432523 (arrayBitRangesEqSlicedLemma!0 lt!432502 lt!432530 lt!432525 lt!432516 lt!432501 lt!432524))))

(assert (=> b!296762 call!5195))

(declare-fun b!296763 () Bool)

(declare-datatypes ((List!993 0))(
  ( (Nil!990) (Cons!989 (h!1108 Bool) (t!1878 List!993)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13392 array!17755 (_ BitVec 64) (_ BitVec 64)) List!993)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13392 BitStream!13392 (_ BitVec 64)) List!993)

(assert (=> b!296763 (= e!212373 (= (byteArrayBitContentToList!0 (_2!13079 lt!432500) (_3!1405 lt!432500) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!13079 lt!432500) (_2!13078 lt!432350) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!296763 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296763 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296764 () Bool)

(declare-fun res!244998 () Bool)

(assert (=> b!296764 (=> (not res!244998) (not e!212373))))

(assert (=> b!296764 (= res!244998 (arrayBitRangesEq!0 lt!432353 (_3!1405 lt!432500) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (= (and d!99942 c!13546) b!296758))

(assert (= (and d!99942 (not c!13546)) b!296762))

(assert (= (and b!296758 res!245000) b!296761))

(assert (= (or b!296758 b!296762) bm!5192))

(assert (= (or b!296758 b!296762) bm!5193))

(assert (= (and d!99942 res!244996) b!296756))

(assert (= (and b!296756 res!244997) b!296764))

(assert (= (and b!296764 res!244998) b!296759))

(assert (= (and b!296759 (not res!244999)) b!296757))

(assert (= (and b!296759 res!245002) b!296760))

(assert (= (and b!296760 res!245001) b!296763))

(declare-fun m!435185 () Bool)

(assert (=> b!296760 m!435185))

(declare-fun m!435187 () Bool)

(assert (=> b!296757 m!435187))

(declare-fun m!435189 () Bool)

(assert (=> b!296757 m!435189))

(declare-fun m!435191 () Bool)

(assert (=> bm!5193 m!435191))

(declare-fun m!435193 () Bool)

(assert (=> bm!5192 m!435193))

(declare-fun m!435195 () Bool)

(assert (=> bm!5192 m!435195))

(declare-fun m!435197 () Bool)

(assert (=> bm!5192 m!435197))

(declare-fun m!435199 () Bool)

(assert (=> bm!5192 m!435199))

(declare-fun m!435201 () Bool)

(assert (=> b!296762 m!435201))

(declare-fun m!435203 () Bool)

(assert (=> b!296762 m!435203))

(declare-fun m!435205 () Bool)

(assert (=> d!99942 m!435205))

(declare-fun m!435207 () Bool)

(assert (=> d!99942 m!435207))

(declare-fun m!435209 () Bool)

(assert (=> b!296763 m!435209))

(declare-fun m!435211 () Bool)

(assert (=> b!296763 m!435211))

(declare-fun m!435213 () Bool)

(assert (=> b!296764 m!435213))

(declare-fun m!435215 () Bool)

(assert (=> b!296758 m!435215))

(declare-fun m!435217 () Bool)

(assert (=> b!296758 m!435217))

(declare-fun m!435219 () Bool)

(assert (=> b!296758 m!435219))

(declare-fun m!435221 () Bool)

(assert (=> b!296758 m!435221))

(declare-fun m!435223 () Bool)

(assert (=> b!296758 m!435223))

(declare-fun m!435225 () Bool)

(assert (=> b!296758 m!435225))

(declare-fun m!435227 () Bool)

(assert (=> b!296758 m!435227))

(declare-fun m!435229 () Bool)

(assert (=> b!296758 m!435229))

(declare-fun m!435231 () Bool)

(assert (=> b!296758 m!435231))

(declare-fun m!435233 () Bool)

(assert (=> b!296758 m!435233))

(assert (=> b!296758 m!435207))

(declare-fun m!435235 () Bool)

(assert (=> b!296758 m!435235))

(declare-fun m!435237 () Bool)

(assert (=> b!296758 m!435237))

(declare-fun m!435239 () Bool)

(assert (=> b!296758 m!435239))

(declare-fun m!435241 () Bool)

(assert (=> b!296758 m!435241))

(assert (=> b!296663 d!99942))

(declare-fun d!99968 () Bool)

(declare-fun e!212379 () Bool)

(assert (=> d!99968 e!212379))

(declare-fun res!245005 () Bool)

(assert (=> d!99968 (=> (not res!245005) (not e!212379))))

(declare-fun lt!432542 () (_ BitVec 32))

(assert (=> d!99968 (= res!245005 (and (bvsge lt!432542 #b00000000000000000000000000000000) (bvslt lt!432542 (size!7694 arr!273))))))

(declare-fun lt!432540 () Unit!20685)

(declare-fun lt!432543 () (_ BitVec 32))

(declare-fun lt!432541 () (_ BitVec 8))

(declare-fun choose!53 (array!17755 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20685)

(assert (=> d!99968 (= lt!432540 (choose!53 arr!273 from!505 (_1!13078 lt!432350) lt!432542 lt!432543 lt!432541))))

(assert (=> d!99968 (= lt!432541 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8759 arr!273) lt!432542)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432543)))) ((_ sign_extend 24) (ite (_1!13078 lt!432350) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!432543) #b00000000)))))))

(assert (=> d!99968 (= lt!432543 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99968 (= lt!432542 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99968 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!13078 lt!432350)) lt!432540)))

(declare-fun b!296768 () Bool)

(assert (=> b!296768 (= e!212379 (arrayBitRangesEq!0 arr!273 (array!17756 (store (arr!8759 arr!273) lt!432542 lt!432541) (size!7694 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99968 res!245005) b!296768))

(declare-fun m!435243 () Bool)

(assert (=> d!99968 m!435243))

(declare-fun m!435245 () Bool)

(assert (=> d!99968 m!435245))

(declare-fun m!435247 () Bool)

(assert (=> d!99968 m!435247))

(declare-fun m!435249 () Bool)

(assert (=> b!296768 m!435249))

(declare-fun m!435251 () Bool)

(assert (=> b!296768 m!435251))

(assert (=> b!296663 d!99968))

(declare-fun d!99970 () Bool)

(declare-fun e!212382 () Bool)

(assert (=> d!99970 e!212382))

(declare-fun res!245010 () Bool)

(assert (=> d!99970 (=> (not res!245010) (not e!212382))))

(declare-fun lt!432557 () (_ BitVec 64))

(declare-fun lt!432560 () (_ BitVec 64))

(declare-fun lt!432556 () (_ BitVec 64))

(assert (=> d!99970 (= res!245010 (= lt!432557 (bvsub lt!432560 lt!432556)))))

(assert (=> d!99970 (or (= (bvand lt!432560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432560 lt!432556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99970 (= lt!432556 (remainingBits!0 ((_ sign_extend 32) (size!7694 (buf!7757 thiss!1728))) ((_ sign_extend 32) (currentByte!14284 thiss!1728)) ((_ sign_extend 32) (currentBit!14279 thiss!1728))))))

(declare-fun lt!432559 () (_ BitVec 64))

(declare-fun lt!432558 () (_ BitVec 64))

(assert (=> d!99970 (= lt!432560 (bvmul lt!432559 lt!432558))))

(assert (=> d!99970 (or (= lt!432559 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!432558 (bvsdiv (bvmul lt!432559 lt!432558) lt!432559)))))

(assert (=> d!99970 (= lt!432558 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99970 (= lt!432559 ((_ sign_extend 32) (size!7694 (buf!7757 thiss!1728))))))

(assert (=> d!99970 (= lt!432557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14284 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14279 thiss!1728))))))

(assert (=> d!99970 (invariant!0 (currentBit!14279 thiss!1728) (currentByte!14284 thiss!1728) (size!7694 (buf!7757 thiss!1728)))))

(assert (=> d!99970 (= (bitIndex!0 (size!7694 (buf!7757 thiss!1728)) (currentByte!14284 thiss!1728) (currentBit!14279 thiss!1728)) lt!432557)))

(declare-fun b!296773 () Bool)

(declare-fun res!245011 () Bool)

(assert (=> b!296773 (=> (not res!245011) (not e!212382))))

(assert (=> b!296773 (= res!245011 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!432557))))

(declare-fun b!296774 () Bool)

(declare-fun lt!432561 () (_ BitVec 64))

(assert (=> b!296774 (= e!212382 (bvsle lt!432557 (bvmul lt!432561 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296774 (or (= lt!432561 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!432561 #b0000000000000000000000000000000000000000000000000000000000001000) lt!432561)))))

(assert (=> b!296774 (= lt!432561 ((_ sign_extend 32) (size!7694 (buf!7757 thiss!1728))))))

(assert (= (and d!99970 res!245010) b!296773))

(assert (= (and b!296773 res!245011) b!296774))

(declare-fun m!435253 () Bool)

(assert (=> d!99970 m!435253))

(declare-fun m!435255 () Bool)

(assert (=> d!99970 m!435255))

(assert (=> b!296663 d!99970))

(declare-fun d!99972 () Bool)

(assert (=> d!99972 (= (bitAt!0 lt!432353 from!505) (bitAt!0 (_3!1405 lt!432348) from!505))))

(declare-fun lt!432564 () Unit!20685)

(declare-fun choose!31 (array!17755 array!17755 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20685)

(assert (=> d!99972 (= lt!432564 (choose!31 lt!432353 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99972 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99972 (= (arrayBitRangesEqImpliesEq!0 lt!432353 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!432564)))

(declare-fun bs!25570 () Bool)

(assert (= bs!25570 d!99972))

(assert (=> bs!25570 m!435051))

(assert (=> bs!25570 m!435067))

(declare-fun m!435257 () Bool)

(assert (=> bs!25570 m!435257))

(assert (=> b!296663 d!99972))

(declare-fun d!99974 () Bool)

(declare-fun e!212383 () Bool)

(assert (=> d!99974 e!212383))

(declare-fun res!245012 () Bool)

(assert (=> d!99974 (=> (not res!245012) (not e!212383))))

(declare-fun lt!432566 () (_ BitVec 64))

(declare-fun lt!432565 () (_ BitVec 64))

(declare-fun lt!432569 () (_ BitVec 64))

(assert (=> d!99974 (= res!245012 (= lt!432566 (bvsub lt!432569 lt!432565)))))

(assert (=> d!99974 (or (= (bvand lt!432569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432565 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!432569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!432569 lt!432565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99974 (= lt!432565 (remainingBits!0 ((_ sign_extend 32) (size!7694 (buf!7757 (_2!13079 lt!432348)))) ((_ sign_extend 32) (currentByte!14284 (_2!13079 lt!432348))) ((_ sign_extend 32) (currentBit!14279 (_2!13079 lt!432348)))))))

(declare-fun lt!432568 () (_ BitVec 64))

(declare-fun lt!432567 () (_ BitVec 64))

(assert (=> d!99974 (= lt!432569 (bvmul lt!432568 lt!432567))))

(assert (=> d!99974 (or (= lt!432568 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!432567 (bvsdiv (bvmul lt!432568 lt!432567) lt!432568)))))

(assert (=> d!99974 (= lt!432567 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99974 (= lt!432568 ((_ sign_extend 32) (size!7694 (buf!7757 (_2!13079 lt!432348)))))))

(assert (=> d!99974 (= lt!432566 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14284 (_2!13079 lt!432348))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14279 (_2!13079 lt!432348)))))))

(assert (=> d!99974 (invariant!0 (currentBit!14279 (_2!13079 lt!432348)) (currentByte!14284 (_2!13079 lt!432348)) (size!7694 (buf!7757 (_2!13079 lt!432348))))))

(assert (=> d!99974 (= (bitIndex!0 (size!7694 (buf!7757 (_2!13079 lt!432348))) (currentByte!14284 (_2!13079 lt!432348)) (currentBit!14279 (_2!13079 lt!432348))) lt!432566)))

(declare-fun b!296775 () Bool)

(declare-fun res!245013 () Bool)

(assert (=> b!296775 (=> (not res!245013) (not e!212383))))

(assert (=> b!296775 (= res!245013 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!432566))))

(declare-fun b!296776 () Bool)

(declare-fun lt!432570 () (_ BitVec 64))

(assert (=> b!296776 (= e!212383 (bvsle lt!432566 (bvmul lt!432570 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296776 (or (= lt!432570 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!432570 #b0000000000000000000000000000000000000000000000000000000000001000) lt!432570)))))

(assert (=> b!296776 (= lt!432570 ((_ sign_extend 32) (size!7694 (buf!7757 (_2!13079 lt!432348)))))))

(assert (= (and d!99974 res!245012) b!296775))

(assert (= (and b!296775 res!245013) b!296776))

(declare-fun m!435259 () Bool)

(assert (=> d!99974 m!435259))

(assert (=> d!99974 m!435083))

(assert (=> b!296663 d!99974))

(declare-fun d!99976 () Bool)

(assert (=> d!99976 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7694 (buf!7757 (_2!13078 lt!432350)))) ((_ sign_extend 32) (currentByte!14284 (_2!13078 lt!432350))) ((_ sign_extend 32) (currentBit!14279 (_2!13078 lt!432350))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7694 (buf!7757 (_2!13078 lt!432350)))) ((_ sign_extend 32) (currentByte!14284 (_2!13078 lt!432350))) ((_ sign_extend 32) (currentBit!14279 (_2!13078 lt!432350)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25571 () Bool)

(assert (= bs!25571 d!99976))

(declare-fun m!435261 () Bool)

(assert (=> bs!25571 m!435261))

(assert (=> b!296663 d!99976))

(declare-fun d!99978 () Bool)

(declare-fun e!212390 () Bool)

(assert (=> d!99978 e!212390))

(declare-fun res!245016 () Bool)

(assert (=> d!99978 (=> (not res!245016) (not e!212390))))

(declare-datatypes ((tuple2!23352 0))(
  ( (tuple2!23353 (_1!13084 Unit!20685) (_2!13084 BitStream!13392)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13392) tuple2!23352)

(assert (=> d!99978 (= res!245016 (= (buf!7757 (_2!13084 (increaseBitIndex!0 thiss!1728))) (buf!7757 thiss!1728)))))

(declare-fun lt!432587 () Bool)

(assert (=> d!99978 (= lt!432587 (not (= (bvand ((_ sign_extend 24) (select (arr!8759 (buf!7757 thiss!1728)) (currentByte!14284 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14279 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432585 () tuple2!23346)

(assert (=> d!99978 (= lt!432585 (tuple2!23347 (not (= (bvand ((_ sign_extend 24) (select (arr!8759 (buf!7757 thiss!1728)) (currentByte!14284 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14279 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13084 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99978 (validate_offset_bit!0 ((_ sign_extend 32) (size!7694 (buf!7757 thiss!1728))) ((_ sign_extend 32) (currentByte!14284 thiss!1728)) ((_ sign_extend 32) (currentBit!14279 thiss!1728)))))

(assert (=> d!99978 (= (readBit!0 thiss!1728) lt!432585)))

(declare-fun lt!432589 () (_ BitVec 64))

(declare-fun b!296779 () Bool)

(declare-fun lt!432590 () (_ BitVec 64))

(assert (=> b!296779 (= e!212390 (= (bitIndex!0 (size!7694 (buf!7757 (_2!13084 (increaseBitIndex!0 thiss!1728)))) (currentByte!14284 (_2!13084 (increaseBitIndex!0 thiss!1728))) (currentBit!14279 (_2!13084 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!432589 lt!432590)))))

(assert (=> b!296779 (or (not (= (bvand lt!432589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!432590 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!432589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!432589 lt!432590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!296779 (= lt!432590 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!296779 (= lt!432589 (bitIndex!0 (size!7694 (buf!7757 thiss!1728)) (currentByte!14284 thiss!1728) (currentBit!14279 thiss!1728)))))

(declare-fun lt!432588 () Bool)

(assert (=> b!296779 (= lt!432588 (not (= (bvand ((_ sign_extend 24) (select (arr!8759 (buf!7757 thiss!1728)) (currentByte!14284 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14279 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432586 () Bool)

(assert (=> b!296779 (= lt!432586 (not (= (bvand ((_ sign_extend 24) (select (arr!8759 (buf!7757 thiss!1728)) (currentByte!14284 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14279 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!432591 () Bool)

(assert (=> b!296779 (= lt!432591 (not (= (bvand ((_ sign_extend 24) (select (arr!8759 (buf!7757 thiss!1728)) (currentByte!14284 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14279 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99978 res!245016) b!296779))

(declare-fun m!435263 () Bool)

(assert (=> d!99978 m!435263))

(declare-fun m!435265 () Bool)

(assert (=> d!99978 m!435265))

(declare-fun m!435267 () Bool)

(assert (=> d!99978 m!435267))

(declare-fun m!435269 () Bool)

(assert (=> d!99978 m!435269))

(assert (=> b!296779 m!435265))

(declare-fun m!435271 () Bool)

(assert (=> b!296779 m!435271))

(assert (=> b!296779 m!435073))

(assert (=> b!296779 m!435263))

(assert (=> b!296779 m!435267))

(assert (=> b!296663 d!99978))

(declare-datatypes ((tuple4!908 0))(
  ( (tuple4!909 (_1!13085 (_ BitVec 32)) (_2!13085 (_ BitVec 32)) (_3!1408 (_ BitVec 32)) (_4!454 (_ BitVec 32))) )
))
(declare-fun lt!432670 () tuple4!908)

(declare-fun b!296812 () Bool)

(declare-fun e!212412 () Bool)

(declare-fun arrayRangesEq!1512 (array!17755 array!17755 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296812 (= e!212412 (arrayRangesEq!1512 arr!273 (_3!1405 lt!432348) (_1!13085 lt!432670) (_2!13085 lt!432670)))))

(declare-fun b!296813 () Bool)

(declare-fun e!212416 () Bool)

(declare-fun call!5203 () Bool)

(assert (=> b!296813 (= e!212416 call!5203)))

(declare-fun b!296814 () Bool)

(declare-fun e!212411 () Bool)

(assert (=> b!296814 (= e!212416 e!212411)))

(declare-fun res!245044 () Bool)

(declare-fun lt!432671 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!296814 (= res!245044 (byteRangesEq!0 (select (arr!8759 arr!273) (_3!1408 lt!432670)) (select (arr!8759 (_3!1405 lt!432348)) (_3!1408 lt!432670)) lt!432671 #b00000000000000000000000000001000))))

(assert (=> b!296814 (=> (not res!245044) (not e!212411))))

(declare-fun bm!5200 () Bool)

(declare-fun lt!432672 () (_ BitVec 32))

(declare-fun c!13551 () Bool)

(assert (=> bm!5200 (= call!5203 (byteRangesEq!0 (ite c!13551 (select (arr!8759 arr!273) (_3!1408 lt!432670)) (select (arr!8759 arr!273) (_4!454 lt!432670))) (ite c!13551 (select (arr!8759 (_3!1405 lt!432348)) (_3!1408 lt!432670)) (select (arr!8759 (_3!1405 lt!432348)) (_4!454 lt!432670))) (ite c!13551 lt!432671 #b00000000000000000000000000000000) lt!432672))))

(declare-fun d!99980 () Bool)

(declare-fun res!245041 () Bool)

(declare-fun e!212415 () Bool)

(assert (=> d!99980 (=> res!245041 e!212415)))

(assert (=> d!99980 (= res!245041 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99980 (= (arrayBitRangesEq!0 arr!273 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212415)))

(declare-fun b!296815 () Bool)

(declare-fun res!245042 () Bool)

(assert (=> b!296815 (= res!245042 (= lt!432672 #b00000000000000000000000000000000))))

(declare-fun e!212413 () Bool)

(assert (=> b!296815 (=> res!245042 e!212413)))

(assert (=> b!296815 (= e!212411 e!212413)))

(declare-fun b!296816 () Bool)

(declare-fun e!212414 () Bool)

(assert (=> b!296816 (= e!212414 e!212416)))

(assert (=> b!296816 (= c!13551 (= (_3!1408 lt!432670) (_4!454 lt!432670)))))

(declare-fun b!296817 () Bool)

(assert (=> b!296817 (= e!212415 e!212414)))

(declare-fun res!245043 () Bool)

(assert (=> b!296817 (=> (not res!245043) (not e!212414))))

(assert (=> b!296817 (= res!245043 e!212412)))

(declare-fun res!245045 () Bool)

(assert (=> b!296817 (=> res!245045 e!212412)))

(assert (=> b!296817 (= res!245045 (bvsge (_1!13085 lt!432670) (_2!13085 lt!432670)))))

(assert (=> b!296817 (= lt!432672 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296817 (= lt!432671 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!908)

(assert (=> b!296817 (= lt!432670 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!296818 () Bool)

(assert (=> b!296818 (= e!212413 call!5203)))

(assert (= (and d!99980 (not res!245041)) b!296817))

(assert (= (and b!296817 (not res!245045)) b!296812))

(assert (= (and b!296817 res!245043) b!296816))

(assert (= (and b!296816 c!13551) b!296813))

(assert (= (and b!296816 (not c!13551)) b!296814))

(assert (= (and b!296814 res!245044) b!296815))

(assert (= (and b!296815 (not res!245042)) b!296818))

(assert (= (or b!296813 b!296818) bm!5200))

(declare-fun m!435273 () Bool)

(assert (=> b!296812 m!435273))

(declare-fun m!435275 () Bool)

(assert (=> b!296814 m!435275))

(declare-fun m!435277 () Bool)

(assert (=> b!296814 m!435277))

(assert (=> b!296814 m!435275))

(assert (=> b!296814 m!435277))

(declare-fun m!435279 () Bool)

(assert (=> b!296814 m!435279))

(declare-fun m!435281 () Bool)

(assert (=> bm!5200 m!435281))

(declare-fun m!435283 () Bool)

(assert (=> bm!5200 m!435283))

(assert (=> bm!5200 m!435275))

(declare-fun m!435285 () Bool)

(assert (=> bm!5200 m!435285))

(assert (=> bm!5200 m!435277))

(declare-fun m!435287 () Bool)

(assert (=> b!296817 m!435287))

(assert (=> b!296663 d!99980))

(declare-fun d!99982 () Bool)

(assert (=> d!99982 (arrayBitRangesEq!0 arr!273 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!432675 () Unit!20685)

(declare-fun choose!49 (array!17755 array!17755 array!17755 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20685)

(assert (=> d!99982 (= lt!432675 (choose!49 arr!273 lt!432353 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99982 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99982 (= (arrayBitRangesEqTransitive!0 arr!273 lt!432353 (_3!1405 lt!432348) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!432675)))

(declare-fun bs!25572 () Bool)

(assert (= bs!25572 d!99982))

(assert (=> bs!25572 m!435059))

(declare-fun m!435289 () Bool)

(assert (=> bs!25572 m!435289))

(assert (=> b!296663 d!99982))

(declare-fun d!99984 () Bool)

(assert (=> d!99984 (= (invariant!0 (currentBit!14279 (_2!13079 lt!432348)) (currentByte!14284 (_2!13079 lt!432348)) (size!7694 (buf!7757 (_2!13079 lt!432348)))) (and (bvsge (currentBit!14279 (_2!13079 lt!432348)) #b00000000000000000000000000000000) (bvslt (currentBit!14279 (_2!13079 lt!432348)) #b00000000000000000000000000001000) (bvsge (currentByte!14284 (_2!13079 lt!432348)) #b00000000000000000000000000000000) (or (bvslt (currentByte!14284 (_2!13079 lt!432348)) (size!7694 (buf!7757 (_2!13079 lt!432348)))) (and (= (currentBit!14279 (_2!13079 lt!432348)) #b00000000000000000000000000000000) (= (currentByte!14284 (_2!13079 lt!432348)) (size!7694 (buf!7757 (_2!13079 lt!432348))))))))))

(assert (=> b!296663 d!99984))

(declare-fun d!99986 () Bool)

(assert (=> d!99986 (= (bitAt!0 (_3!1405 lt!432348) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8759 (_3!1405 lt!432348)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25573 () Bool)

(assert (= bs!25573 d!99986))

(declare-fun m!435349 () Bool)

(assert (=> bs!25573 m!435349))

(declare-fun m!435351 () Bool)

(assert (=> bs!25573 m!435351))

(assert (=> b!296663 d!99986))

(declare-fun d!99990 () Bool)

(declare-fun e!212426 () Bool)

(assert (=> d!99990 e!212426))

(declare-fun res!245061 () Bool)

(assert (=> d!99990 (=> (not res!245061) (not e!212426))))

(assert (=> d!99990 (= res!245061 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!432732 () Unit!20685)

(declare-fun choose!27 (BitStream!13392 BitStream!13392 (_ BitVec 64) (_ BitVec 64)) Unit!20685)

(assert (=> d!99990 (= lt!432732 (choose!27 thiss!1728 (_2!13078 lt!432350) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99990 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99990 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!13078 lt!432350) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!432732)))

(declare-fun b!296836 () Bool)

(assert (=> b!296836 (= e!212426 (validate_offset_bits!1 ((_ sign_extend 32) (size!7694 (buf!7757 (_2!13078 lt!432350)))) ((_ sign_extend 32) (currentByte!14284 (_2!13078 lt!432350))) ((_ sign_extend 32) (currentBit!14279 (_2!13078 lt!432350))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99990 res!245061) b!296836))

(declare-fun m!435355 () Bool)

(assert (=> d!99990 m!435355))

(assert (=> b!296836 m!435053))

(assert (=> b!296663 d!99990))

(declare-fun d!99994 () Bool)

(assert (=> d!99994 (= (bitAt!0 lt!432353 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8759 lt!432353) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25574 () Bool)

(assert (= bs!25574 d!99994))

(declare-fun m!435357 () Bool)

(assert (=> bs!25574 m!435357))

(assert (=> bs!25574 m!435351))

(assert (=> b!296663 d!99994))

(declare-fun b!296837 () Bool)

(declare-fun e!212428 () Bool)

(declare-fun lt!432733 () tuple4!908)

(assert (=> b!296837 (= e!212428 (arrayRangesEq!1512 arr!273 lt!432353 (_1!13085 lt!432733) (_2!13085 lt!432733)))))

(declare-fun b!296838 () Bool)

(declare-fun e!212432 () Bool)

(declare-fun call!5206 () Bool)

(assert (=> b!296838 (= e!212432 call!5206)))

(declare-fun b!296839 () Bool)

(declare-fun e!212427 () Bool)

(assert (=> b!296839 (= e!212432 e!212427)))

(declare-fun lt!432734 () (_ BitVec 32))

(declare-fun res!245065 () Bool)

(assert (=> b!296839 (= res!245065 (byteRangesEq!0 (select (arr!8759 arr!273) (_3!1408 lt!432733)) (select (arr!8759 lt!432353) (_3!1408 lt!432733)) lt!432734 #b00000000000000000000000000001000))))

(assert (=> b!296839 (=> (not res!245065) (not e!212427))))

(declare-fun lt!432735 () (_ BitVec 32))

(declare-fun c!13553 () Bool)

(declare-fun bm!5203 () Bool)

(assert (=> bm!5203 (= call!5206 (byteRangesEq!0 (ite c!13553 (select (arr!8759 arr!273) (_3!1408 lt!432733)) (select (arr!8759 arr!273) (_4!454 lt!432733))) (ite c!13553 (select (arr!8759 lt!432353) (_3!1408 lt!432733)) (select (arr!8759 lt!432353) (_4!454 lt!432733))) (ite c!13553 lt!432734 #b00000000000000000000000000000000) lt!432735))))

(declare-fun d!99996 () Bool)

(declare-fun res!245062 () Bool)

(declare-fun e!212431 () Bool)

(assert (=> d!99996 (=> res!245062 e!212431)))

(assert (=> d!99996 (= res!245062 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99996 (= (arrayBitRangesEq!0 arr!273 lt!432353 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!212431)))

(declare-fun b!296840 () Bool)

(declare-fun res!245063 () Bool)

(assert (=> b!296840 (= res!245063 (= lt!432735 #b00000000000000000000000000000000))))

(declare-fun e!212429 () Bool)

(assert (=> b!296840 (=> res!245063 e!212429)))

(assert (=> b!296840 (= e!212427 e!212429)))

(declare-fun b!296841 () Bool)

(declare-fun e!212430 () Bool)

(assert (=> b!296841 (= e!212430 e!212432)))

(assert (=> b!296841 (= c!13553 (= (_3!1408 lt!432733) (_4!454 lt!432733)))))

(declare-fun b!296842 () Bool)

(assert (=> b!296842 (= e!212431 e!212430)))

(declare-fun res!245064 () Bool)

(assert (=> b!296842 (=> (not res!245064) (not e!212430))))

(assert (=> b!296842 (= res!245064 e!212428)))

(declare-fun res!245066 () Bool)

(assert (=> b!296842 (=> res!245066 e!212428)))

(assert (=> b!296842 (= res!245066 (bvsge (_1!13085 lt!432733) (_2!13085 lt!432733)))))

(assert (=> b!296842 (= lt!432735 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296842 (= lt!432734 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!296842 (= lt!432733 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!296843 () Bool)

(assert (=> b!296843 (= e!212429 call!5206)))

(assert (= (and d!99996 (not res!245062)) b!296842))

(assert (= (and b!296842 (not res!245066)) b!296837))

(assert (= (and b!296842 res!245064) b!296841))

(assert (= (and b!296841 c!13553) b!296838))

(assert (= (and b!296841 (not c!13553)) b!296839))

(assert (= (and b!296839 res!245065) b!296840))

(assert (= (and b!296840 (not res!245063)) b!296843))

(assert (= (or b!296838 b!296843) bm!5203))

(declare-fun m!435359 () Bool)

(assert (=> b!296837 m!435359))

(declare-fun m!435361 () Bool)

(assert (=> b!296839 m!435361))

(declare-fun m!435363 () Bool)

(assert (=> b!296839 m!435363))

(assert (=> b!296839 m!435361))

(assert (=> b!296839 m!435363))

(declare-fun m!435365 () Bool)

(assert (=> b!296839 m!435365))

(declare-fun m!435367 () Bool)

(assert (=> bm!5203 m!435367))

(declare-fun m!435369 () Bool)

(assert (=> bm!5203 m!435369))

(assert (=> bm!5203 m!435361))

(declare-fun m!435371 () Bool)

(assert (=> bm!5203 m!435371))

(assert (=> bm!5203 m!435363))

(assert (=> b!296842 m!435287))

(assert (=> b!296663 d!99996))

(declare-fun d!99998 () Bool)

(assert (=> d!99998 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14279 thiss!1728) (currentByte!14284 thiss!1728) (size!7694 (buf!7757 thiss!1728))))))

(declare-fun bs!25575 () Bool)

(assert (= bs!25575 d!99998))

(assert (=> bs!25575 m!435255))

(assert (=> start!66162 d!99998))

(declare-fun d!100000 () Bool)

(assert (=> d!100000 (= (array_inv!7306 arr!273) (bvsge (size!7694 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!66162 d!100000))

(declare-fun d!100002 () Bool)

(assert (=> d!100002 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7694 (buf!7757 thiss!1728))) ((_ sign_extend 32) (currentByte!14284 thiss!1728)) ((_ sign_extend 32) (currentBit!14279 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7694 (buf!7757 thiss!1728))) ((_ sign_extend 32) (currentByte!14284 thiss!1728)) ((_ sign_extend 32) (currentBit!14279 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25576 () Bool)

(assert (= bs!25576 d!100002))

(assert (=> bs!25576 m!435253))

(assert (=> b!296661 d!100002))

(check-sat (not b!296839) (not bm!5203) (not b!296763) (not b!296758) (not d!99990) (not b!296812) (not b!296817) (not b!296762) (not b!296836) (not d!100002) (not d!99970) (not b!296842) (not d!99998) (not d!99976) (not d!99974) (not d!99978) (not b!296814) (not bm!5193) (not b!296837) (not b!296768) (not b!296779) (not d!99942) (not bm!5192) (not b!296760) (not b!296764) (not d!99968) (not d!99982) (not bm!5200) (not d!99972) (not b!296757))
