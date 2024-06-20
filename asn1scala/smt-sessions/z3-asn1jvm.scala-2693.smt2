; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65892 () Bool)

(assert start!65892)

(declare-fun b!295534 () Bool)

(declare-fun res!244005 () Bool)

(declare-fun e!211369 () Bool)

(assert (=> b!295534 (=> (not res!244005) (not e!211369))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!295534 (= res!244005 (bvslt from!505 to!474))))

(declare-datatypes ((array!17698 0))(
  ( (array!17699 (arr!8717 (Array (_ BitVec 32) (_ BitVec 8))) (size!7670 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13344 0))(
  ( (BitStream!13345 (buf!7733 array!17698) (currentByte!14242 (_ BitVec 32)) (currentBit!14237 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13344)

(declare-fun e!211373 () Bool)

(declare-fun b!295535 () Bool)

(declare-datatypes ((Unit!20601 0))(
  ( (Unit!20602) )
))
(declare-datatypes ((tuple3!1856 0))(
  ( (tuple3!1857 (_1!12997 Unit!20601) (_2!12997 BitStream!13344) (_3!1372 array!17698)) )
))
(declare-fun lt!429903 () tuple3!1856)

(declare-fun arr!273 () array!17698)

(assert (=> b!295535 (= e!211373 (and (= (buf!7733 thiss!1728) (buf!7733 (_2!12997 lt!429903))) (= (size!7670 arr!273) (size!7670 (_3!1372 lt!429903)))))))

(declare-fun b!295536 () Bool)

(declare-fun res!244007 () Bool)

(assert (=> b!295536 (=> (not res!244007) (not e!211369))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295536 (= res!244007 (validate_offset_bits!1 ((_ sign_extend 32) (size!7670 (buf!7733 thiss!1728))) ((_ sign_extend 32) (currentByte!14242 thiss!1728)) ((_ sign_extend 32) (currentBit!14237 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!295537 () Bool)

(declare-fun lt!429910 () (_ BitVec 64))

(declare-fun lt!429909 () (_ BitVec 64))

(assert (=> b!295537 (= e!211369 (not (or (not (= lt!429909 (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!429909 (bvand lt!429910 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!429914 () (_ BitVec 64))

(assert (=> b!295537 (= lt!429909 (bvand lt!429914 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!211371 () Bool)

(assert (=> b!295537 e!211371))

(declare-fun res!244004 () Bool)

(assert (=> b!295537 (=> (not res!244004) (not e!211371))))

(declare-fun lt!429904 () Bool)

(declare-fun lt!429913 () array!17698)

(declare-fun bitAt!0 (array!17698 (_ BitVec 64)) Bool)

(assert (=> b!295537 (= res!244004 (= (bitAt!0 lt!429913 from!505) lt!429904))))

(assert (=> b!295537 (= lt!429904 (bitAt!0 (_3!1372 lt!429903) from!505))))

(declare-fun lt!429906 () Unit!20601)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17698 array!17698 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20601)

(assert (=> b!295537 (= lt!429906 (arrayBitRangesEqImpliesEq!0 lt!429913 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17698 array!17698 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295537 (arrayBitRangesEq!0 arr!273 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429908 () Unit!20601)

(declare-fun arrayBitRangesEqTransitive!0 (array!17698 array!17698 array!17698 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20601)

(assert (=> b!295537 (= lt!429908 (arrayBitRangesEqTransitive!0 arr!273 lt!429913 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295537 (arrayBitRangesEq!0 arr!273 lt!429913 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429911 () Unit!20601)

(declare-datatypes ((tuple2!23250 0))(
  ( (tuple2!23251 (_1!12998 Bool) (_2!12998 BitStream!13344)) )
))
(declare-fun lt!429905 () tuple2!23250)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17698 (_ BitVec 64) Bool) Unit!20601)

(assert (=> b!295537 (= lt!429911 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12998 lt!429905)))))

(assert (=> b!295537 e!211373))

(declare-fun res!244006 () Bool)

(assert (=> b!295537 (=> (not res!244006) (not e!211373))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295537 (= res!244006 (= (bvsub lt!429910 from!505) (bitIndex!0 (size!7670 (buf!7733 (_2!12997 lt!429903))) (currentByte!14242 (_2!12997 lt!429903)) (currentBit!14237 (_2!12997 lt!429903)))))))

(assert (=> b!295537 (= lt!429910 (bvadd lt!429914 to!474))))

(assert (=> b!295537 (= lt!429914 (bitIndex!0 (size!7670 (buf!7733 thiss!1728)) (currentByte!14242 thiss!1728) (currentBit!14237 thiss!1728)))))

(declare-fun readBitsLoop!0 (BitStream!13344 (_ BitVec 64) array!17698 (_ BitVec 64) (_ BitVec 64)) tuple3!1856)

(assert (=> b!295537 (= lt!429903 (readBitsLoop!0 (_2!12998 lt!429905) nBits!523 lt!429913 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!295537 (validate_offset_bits!1 ((_ sign_extend 32) (size!7670 (buf!7733 (_2!12998 lt!429905)))) ((_ sign_extend 32) (currentByte!14242 (_2!12998 lt!429905))) ((_ sign_extend 32) (currentBit!14237 (_2!12998 lt!429905))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429915 () Unit!20601)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13344 BitStream!13344 (_ BitVec 64) (_ BitVec 64)) Unit!20601)

(assert (=> b!295537 (= lt!429915 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12998 lt!429905) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429907 () (_ BitVec 32))

(declare-fun lt!429912 () (_ BitVec 32))

(assert (=> b!295537 (= lt!429913 (array!17699 (store (arr!8717 arr!273) lt!429907 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8717 arr!273) lt!429907)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429912)))) ((_ sign_extend 24) (ite (_1!12998 lt!429905) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429912) #b00000000))))) (size!7670 arr!273)))))

(assert (=> b!295537 (= lt!429912 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295537 (= lt!429907 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13344) tuple2!23250)

(assert (=> b!295537 (= lt!429905 (readBit!0 thiss!1728))))

(declare-fun b!295538 () Bool)

(assert (=> b!295538 (= e!211371 (= lt!429904 (_1!12998 lt!429905)))))

(declare-fun res!244003 () Bool)

(assert (=> start!65892 (=> (not res!244003) (not e!211369))))

(assert (=> start!65892 (= res!244003 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7670 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65892 e!211369))

(declare-fun e!211372 () Bool)

(declare-fun inv!12 (BitStream!13344) Bool)

(assert (=> start!65892 (and (inv!12 thiss!1728) e!211372)))

(assert (=> start!65892 true))

(declare-fun array_inv!7282 (array!17698) Bool)

(assert (=> start!65892 (array_inv!7282 arr!273)))

(declare-fun b!295539 () Bool)

(assert (=> b!295539 (= e!211372 (array_inv!7282 (buf!7733 thiss!1728)))))

(assert (= (and start!65892 res!244003) b!295536))

(assert (= (and b!295536 res!244007) b!295534))

(assert (= (and b!295534 res!244005) b!295537))

(assert (= (and b!295537 res!244006) b!295535))

(assert (= (and b!295537 res!244004) b!295538))

(assert (= start!65892 b!295539))

(declare-fun m!432881 () Bool)

(assert (=> b!295536 m!432881))

(declare-fun m!432883 () Bool)

(assert (=> b!295537 m!432883))

(declare-fun m!432885 () Bool)

(assert (=> b!295537 m!432885))

(declare-fun m!432887 () Bool)

(assert (=> b!295537 m!432887))

(declare-fun m!432889 () Bool)

(assert (=> b!295537 m!432889))

(declare-fun m!432891 () Bool)

(assert (=> b!295537 m!432891))

(declare-fun m!432893 () Bool)

(assert (=> b!295537 m!432893))

(declare-fun m!432895 () Bool)

(assert (=> b!295537 m!432895))

(declare-fun m!432897 () Bool)

(assert (=> b!295537 m!432897))

(declare-fun m!432899 () Bool)

(assert (=> b!295537 m!432899))

(declare-fun m!432901 () Bool)

(assert (=> b!295537 m!432901))

(declare-fun m!432903 () Bool)

(assert (=> b!295537 m!432903))

(declare-fun m!432905 () Bool)

(assert (=> b!295537 m!432905))

(declare-fun m!432907 () Bool)

(assert (=> b!295537 m!432907))

(declare-fun m!432909 () Bool)

(assert (=> b!295537 m!432909))

(declare-fun m!432911 () Bool)

(assert (=> b!295537 m!432911))

(declare-fun m!432913 () Bool)

(assert (=> b!295537 m!432913))

(declare-fun m!432915 () Bool)

(assert (=> start!65892 m!432915))

(declare-fun m!432917 () Bool)

(assert (=> start!65892 m!432917))

(declare-fun m!432919 () Bool)

(assert (=> b!295539 m!432919))

(check-sat (not b!295539) (not start!65892) (not b!295536) (not b!295537))
(check-sat)
(get-model)

(declare-fun d!99612 () Bool)

(assert (=> d!99612 (= (array_inv!7282 (buf!7733 thiss!1728)) (bvsge (size!7670 (buf!7733 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!295539 d!99612))

(declare-fun d!99614 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99614 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14237 thiss!1728) (currentByte!14242 thiss!1728) (size!7670 (buf!7733 thiss!1728))))))

(declare-fun bs!25476 () Bool)

(assert (= bs!25476 d!99614))

(declare-fun m!432961 () Bool)

(assert (=> bs!25476 m!432961))

(assert (=> start!65892 d!99614))

(declare-fun d!99616 () Bool)

(assert (=> d!99616 (= (array_inv!7282 arr!273) (bvsge (size!7670 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65892 d!99616))

(declare-fun d!99618 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99618 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7670 (buf!7733 thiss!1728))) ((_ sign_extend 32) (currentByte!14242 thiss!1728)) ((_ sign_extend 32) (currentBit!14237 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7670 (buf!7733 thiss!1728))) ((_ sign_extend 32) (currentByte!14242 thiss!1728)) ((_ sign_extend 32) (currentBit!14237 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25477 () Bool)

(assert (= bs!25477 d!99618))

(declare-fun m!432963 () Bool)

(assert (=> bs!25477 m!432963))

(assert (=> b!295536 d!99618))

(declare-fun d!99620 () Bool)

(declare-fun e!211395 () Bool)

(assert (=> d!99620 e!211395))

(declare-fun res!244025 () Bool)

(assert (=> d!99620 (=> (not res!244025) (not e!211395))))

(declare-fun lt!429963 () (_ BitVec 32))

(assert (=> d!99620 (= res!244025 (and (bvsge lt!429963 #b00000000000000000000000000000000) (bvslt lt!429963 (size!7670 arr!273))))))

(declare-fun lt!429965 () Unit!20601)

(declare-fun lt!429966 () (_ BitVec 8))

(declare-fun lt!429964 () (_ BitVec 32))

(declare-fun choose!53 (array!17698 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20601)

(assert (=> d!99620 (= lt!429965 (choose!53 arr!273 from!505 (_1!12998 lt!429905) lt!429963 lt!429964 lt!429966))))

(assert (=> d!99620 (= lt!429966 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8717 arr!273) lt!429963)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429964)))) ((_ sign_extend 24) (ite (_1!12998 lt!429905) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429964) #b00000000)))))))

(assert (=> d!99620 (= lt!429964 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99620 (= lt!429963 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99620 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12998 lt!429905)) lt!429965)))

(declare-fun b!295561 () Bool)

(assert (=> b!295561 (= e!211395 (arrayBitRangesEq!0 arr!273 (array!17699 (store (arr!8717 arr!273) lt!429963 lt!429966) (size!7670 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99620 res!244025) b!295561))

(declare-fun m!432965 () Bool)

(assert (=> d!99620 m!432965))

(declare-fun m!432967 () Bool)

(assert (=> d!99620 m!432967))

(declare-fun m!432969 () Bool)

(assert (=> d!99620 m!432969))

(declare-fun m!432971 () Bool)

(assert (=> b!295561 m!432971))

(declare-fun m!432973 () Bool)

(assert (=> b!295561 m!432973))

(assert (=> b!295537 d!99620))

(declare-fun d!99622 () Bool)

(assert (=> d!99622 (= (bitAt!0 lt!429913 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8717 lt!429913) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25478 () Bool)

(assert (= bs!25478 d!99622))

(declare-fun m!432975 () Bool)

(assert (=> bs!25478 m!432975))

(declare-fun m!432977 () Bool)

(assert (=> bs!25478 m!432977))

(assert (=> b!295537 d!99622))

(declare-fun d!99624 () Bool)

(assert (=> d!99624 (= (bitAt!0 (_3!1372 lt!429903) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8717 (_3!1372 lt!429903)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25479 () Bool)

(assert (= bs!25479 d!99624))

(declare-fun m!432979 () Bool)

(assert (=> bs!25479 m!432979))

(assert (=> bs!25479 m!432977))

(assert (=> b!295537 d!99624))

(declare-fun d!99626 () Bool)

(assert (=> d!99626 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7670 (buf!7733 (_2!12998 lt!429905)))) ((_ sign_extend 32) (currentByte!14242 (_2!12998 lt!429905))) ((_ sign_extend 32) (currentBit!14237 (_2!12998 lt!429905))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7670 (buf!7733 (_2!12998 lt!429905)))) ((_ sign_extend 32) (currentByte!14242 (_2!12998 lt!429905))) ((_ sign_extend 32) (currentBit!14237 (_2!12998 lt!429905)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25480 () Bool)

(assert (= bs!25480 d!99626))

(declare-fun m!432981 () Bool)

(assert (=> bs!25480 m!432981))

(assert (=> b!295537 d!99626))

(declare-fun d!99628 () Bool)

(assert (=> d!99628 (arrayBitRangesEq!0 arr!273 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429969 () Unit!20601)

(declare-fun choose!49 (array!17698 array!17698 array!17698 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20601)

(assert (=> d!99628 (= lt!429969 (choose!49 arr!273 lt!429913 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99628 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99628 (= (arrayBitRangesEqTransitive!0 arr!273 lt!429913 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!429969)))

(declare-fun bs!25481 () Bool)

(assert (= bs!25481 d!99628))

(assert (=> bs!25481 m!432889))

(declare-fun m!432983 () Bool)

(assert (=> bs!25481 m!432983))

(assert (=> b!295537 d!99628))

(declare-fun b!295576 () Bool)

(declare-fun e!211412 () Bool)

(declare-fun call!5096 () Bool)

(assert (=> b!295576 (= e!211412 call!5096)))

(declare-fun b!295577 () Bool)

(declare-datatypes ((tuple4!888 0))(
  ( (tuple4!889 (_1!13001 (_ BitVec 32)) (_2!13001 (_ BitVec 32)) (_3!1374 (_ BitVec 32)) (_4!444 (_ BitVec 32))) )
))
(declare-fun lt!429976 () tuple4!888)

(declare-fun e!211409 () Bool)

(declare-fun arrayRangesEq!1502 (array!17698 array!17698 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295577 (= e!211409 (arrayRangesEq!1502 arr!273 lt!429913 (_1!13001 lt!429976) (_2!13001 lt!429976)))))

(declare-fun b!295578 () Bool)

(declare-fun e!211410 () Bool)

(declare-fun e!211408 () Bool)

(assert (=> b!295578 (= e!211410 e!211408)))

(declare-fun lt!429978 () (_ BitVec 32))

(declare-fun res!244038 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295578 (= res!244038 (byteRangesEq!0 (select (arr!8717 arr!273) (_3!1374 lt!429976)) (select (arr!8717 lt!429913) (_3!1374 lt!429976)) lt!429978 #b00000000000000000000000000001000))))

(assert (=> b!295578 (=> (not res!244038) (not e!211408))))

(declare-fun c!13476 () Bool)

(declare-fun lt!429977 () (_ BitVec 32))

(declare-fun bm!5093 () Bool)

(assert (=> bm!5093 (= call!5096 (byteRangesEq!0 (ite c!13476 (select (arr!8717 arr!273) (_3!1374 lt!429976)) (select (arr!8717 arr!273) (_4!444 lt!429976))) (ite c!13476 (select (arr!8717 lt!429913) (_3!1374 lt!429976)) (select (arr!8717 lt!429913) (_4!444 lt!429976))) (ite c!13476 lt!429978 #b00000000000000000000000000000000) lt!429977))))

(declare-fun b!295580 () Bool)

(declare-fun e!211411 () Bool)

(declare-fun e!211413 () Bool)

(assert (=> b!295580 (= e!211411 e!211413)))

(declare-fun res!244039 () Bool)

(assert (=> b!295580 (=> (not res!244039) (not e!211413))))

(assert (=> b!295580 (= res!244039 e!211409)))

(declare-fun res!244037 () Bool)

(assert (=> b!295580 (=> res!244037 e!211409)))

(assert (=> b!295580 (= res!244037 (bvsge (_1!13001 lt!429976) (_2!13001 lt!429976)))))

(assert (=> b!295580 (= lt!429977 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295580 (= lt!429978 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!888)

(assert (=> b!295580 (= lt!429976 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295581 () Bool)

(assert (=> b!295581 (= e!211410 call!5096)))

(declare-fun b!295582 () Bool)

(declare-fun res!244040 () Bool)

(assert (=> b!295582 (= res!244040 (= lt!429977 #b00000000000000000000000000000000))))

(assert (=> b!295582 (=> res!244040 e!211412)))

(assert (=> b!295582 (= e!211408 e!211412)))

(declare-fun b!295579 () Bool)

(assert (=> b!295579 (= e!211413 e!211410)))

(assert (=> b!295579 (= c!13476 (= (_3!1374 lt!429976) (_4!444 lt!429976)))))

(declare-fun d!99630 () Bool)

(declare-fun res!244036 () Bool)

(assert (=> d!99630 (=> res!244036 e!211411)))

(assert (=> d!99630 (= res!244036 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99630 (= (arrayBitRangesEq!0 arr!273 lt!429913 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211411)))

(assert (= (and d!99630 (not res!244036)) b!295580))

(assert (= (and b!295580 (not res!244037)) b!295577))

(assert (= (and b!295580 res!244039) b!295579))

(assert (= (and b!295579 c!13476) b!295581))

(assert (= (and b!295579 (not c!13476)) b!295578))

(assert (= (and b!295578 res!244038) b!295582))

(assert (= (and b!295582 (not res!244040)) b!295576))

(assert (= (or b!295581 b!295576) bm!5093))

(declare-fun m!432985 () Bool)

(assert (=> b!295577 m!432985))

(declare-fun m!432987 () Bool)

(assert (=> b!295578 m!432987))

(declare-fun m!432989 () Bool)

(assert (=> b!295578 m!432989))

(assert (=> b!295578 m!432987))

(assert (=> b!295578 m!432989))

(declare-fun m!432991 () Bool)

(assert (=> b!295578 m!432991))

(declare-fun m!432993 () Bool)

(assert (=> bm!5093 m!432993))

(assert (=> bm!5093 m!432987))

(assert (=> bm!5093 m!432989))

(declare-fun m!432995 () Bool)

(assert (=> bm!5093 m!432995))

(declare-fun m!432997 () Bool)

(assert (=> bm!5093 m!432997))

(declare-fun m!432999 () Bool)

(assert (=> b!295580 m!432999))

(assert (=> b!295537 d!99630))

(declare-fun b!295679 () Bool)

(declare-fun res!244120 () Bool)

(declare-fun e!211498 () Bool)

(assert (=> b!295679 (=> (not res!244120) (not e!211498))))

(declare-fun lt!430167 () tuple3!1856)

(assert (=> b!295679 (= res!244120 (invariant!0 (currentBit!14237 (_2!12997 lt!430167)) (currentByte!14242 (_2!12997 lt!430167)) (size!7670 (buf!7733 (_2!12997 lt!430167)))))))

(declare-fun lt!430189 () (_ BitVec 64))

(declare-fun lt!430163 () array!17698)

(declare-fun bm!5106 () Bool)

(declare-fun lt!430178 () array!17698)

(declare-fun lt!430171 () (_ BitVec 64))

(declare-fun lt!430175 () tuple3!1856)

(declare-fun lt!430172 () (_ BitVec 64))

(declare-fun c!13487 () Bool)

(declare-fun call!5109 () Bool)

(assert (=> bm!5106 (= call!5109 (arrayBitRangesEq!0 (ite c!13487 lt!429913 lt!430163) (ite c!13487 (_3!1372 lt!430175) lt!430178) (ite c!13487 lt!430189 lt!430171) (ite c!13487 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!430172)))))

(declare-fun b!295681 () Bool)

(declare-fun e!211497 () Bool)

(declare-datatypes ((tuple2!23254 0))(
  ( (tuple2!23255 (_1!13002 BitStream!13344) (_2!13002 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13344) tuple2!23254)

(assert (=> b!295681 (= e!211497 (= (bitAt!0 (_3!1372 lt!430167) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13002 (readBitPure!0 (_2!12998 lt!429905)))))))

(declare-fun b!295682 () Bool)

(declare-fun res!244121 () Bool)

(assert (=> b!295682 (=> (not res!244121) (not e!211498))))

(assert (=> b!295682 (= res!244121 e!211497)))

(declare-fun res!244122 () Bool)

(assert (=> b!295682 (=> res!244122 e!211497)))

(assert (=> b!295682 (= res!244122 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun b!295683 () Bool)

(declare-fun e!211499 () tuple3!1856)

(declare-fun lt!430177 () Unit!20601)

(assert (=> b!295683 (= e!211499 (tuple3!1857 lt!430177 (_2!12997 lt!430175) (_3!1372 lt!430175)))))

(declare-fun lt!430183 () tuple2!23250)

(assert (=> b!295683 (= lt!430183 (readBit!0 (_2!12998 lt!429905)))))

(declare-fun lt!430158 () (_ BitVec 32))

(assert (=> b!295683 (= lt!430158 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430174 () (_ BitVec 32))

(assert (=> b!295683 (= lt!430174 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430179 () array!17698)

(assert (=> b!295683 (= lt!430179 (array!17699 (store (arr!8717 lt!429913) lt!430158 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8717 lt!429913) lt!430158)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430174)))) ((_ sign_extend 24) (ite (_1!12998 lt!430183) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430174) #b00000000))))) (size!7670 lt!429913)))))

(declare-fun lt!430188 () (_ BitVec 64))

(assert (=> b!295683 (= lt!430188 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430164 () (_ BitVec 64))

(assert (=> b!295683 (= lt!430164 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!430166 () Unit!20601)

(assert (=> b!295683 (= lt!430166 (validateOffsetBitsIneqLemma!0 (_2!12998 lt!429905) (_2!12998 lt!430183) lt!430188 lt!430164))))

(assert (=> b!295683 (validate_offset_bits!1 ((_ sign_extend 32) (size!7670 (buf!7733 (_2!12998 lt!430183)))) ((_ sign_extend 32) (currentByte!14242 (_2!12998 lt!430183))) ((_ sign_extend 32) (currentBit!14237 (_2!12998 lt!430183))) (bvsub lt!430188 lt!430164))))

(declare-fun lt!430162 () Unit!20601)

(assert (=> b!295683 (= lt!430162 lt!430166)))

(assert (=> b!295683 (= lt!430175 (readBitsLoop!0 (_2!12998 lt!430183) nBits!523 lt!430179 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!244117 () Bool)

(assert (=> b!295683 (= res!244117 (= (bvsub (bvadd (bitIndex!0 (size!7670 (buf!7733 (_2!12998 lt!429905))) (currentByte!14242 (_2!12998 lt!429905)) (currentBit!14237 (_2!12998 lt!429905))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7670 (buf!7733 (_2!12997 lt!430175))) (currentByte!14242 (_2!12997 lt!430175)) (currentBit!14237 (_2!12997 lt!430175)))))))

(declare-fun e!211496 () Bool)

(assert (=> b!295683 (=> (not res!244117) (not e!211496))))

(assert (=> b!295683 e!211496))

(declare-fun lt!430185 () Unit!20601)

(declare-fun Unit!20605 () Unit!20601)

(assert (=> b!295683 (= lt!430185 Unit!20605)))

(declare-fun lt!430191 () (_ BitVec 32))

(assert (=> b!295683 (= lt!430191 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430190 () (_ BitVec 32))

(assert (=> b!295683 (= lt!430190 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430160 () Unit!20601)

(assert (=> b!295683 (= lt!430160 (arrayBitRangesUpdatedAtLemma!0 lt!429913 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12998 lt!430183)))))

(declare-fun call!5110 () Bool)

(assert (=> b!295683 call!5110))

(declare-fun lt!430184 () Unit!20601)

(assert (=> b!295683 (= lt!430184 lt!430160)))

(assert (=> b!295683 (= lt!430189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430180 () Unit!20601)

(assert (=> b!295683 (= lt!430180 (arrayBitRangesEqTransitive!0 lt!429913 lt!430179 (_3!1372 lt!430175) lt!430189 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295683 call!5109))

(declare-fun lt!430182 () Unit!20601)

(assert (=> b!295683 (= lt!430182 lt!430180)))

(assert (=> b!295683 (arrayBitRangesEq!0 lt!429913 (_3!1372 lt!430175) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!430168 () Unit!20601)

(declare-fun Unit!20606 () Unit!20601)

(assert (=> b!295683 (= lt!430168 Unit!20606)))

(declare-fun lt!430159 () Unit!20601)

(assert (=> b!295683 (= lt!430159 (arrayBitRangesEqImpliesEq!0 lt!430179 (_3!1372 lt!430175) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295683 (= (bitAt!0 lt!430179 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1372 lt!430175) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430176 () Unit!20601)

(assert (=> b!295683 (= lt!430176 lt!430159)))

(declare-fun lt!430165 () Unit!20601)

(declare-fun Unit!20607 () Unit!20601)

(assert (=> b!295683 (= lt!430165 Unit!20607)))

(declare-fun lt!430169 () Bool)

(assert (=> b!295683 (= lt!430169 (= (bitAt!0 (_3!1372 lt!430175) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12998 lt!430183)))))

(declare-fun Unit!20608 () Unit!20601)

(assert (=> b!295683 (= lt!430177 Unit!20608)))

(assert (=> b!295683 lt!430169))

(declare-fun b!295684 () Bool)

(assert (=> b!295684 (= e!211496 (and (= (buf!7733 (_2!12998 lt!429905)) (buf!7733 (_2!12997 lt!430175))) (= (size!7670 lt!429913) (size!7670 (_3!1372 lt!430175)))))))

(declare-fun bm!5107 () Bool)

(assert (=> bm!5107 (= call!5110 (arrayBitRangesEq!0 lt!429913 (ite c!13487 (array!17699 (store (arr!8717 lt!429913) lt!430191 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8717 lt!429913) lt!430191)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430190)))) ((_ sign_extend 24) (ite (_1!12998 lt!430183) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430190) #b00000000))))) (size!7670 lt!429913)) lt!429913) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13487 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7670 lt!429913)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!295685 () Bool)

(declare-fun lt!430170 () Unit!20601)

(assert (=> b!295685 (= e!211499 (tuple3!1857 lt!430170 (_2!12998 lt!429905) lt!429913))))

(declare-fun lt!430181 () Unit!20601)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17698) Unit!20601)

(assert (=> b!295685 (= lt!430181 (arrayBitRangesEqReflexiveLemma!0 lt!429913))))

(assert (=> b!295685 call!5110))

(declare-fun lt!430186 () Unit!20601)

(assert (=> b!295685 (= lt!430186 lt!430181)))

(assert (=> b!295685 (= lt!430163 lt!429913)))

(assert (=> b!295685 (= lt!430178 lt!429913)))

(declare-fun lt!430156 () (_ BitVec 64))

(assert (=> b!295685 (= lt!430156 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430187 () (_ BitVec 64))

(assert (=> b!295685 (= lt!430187 ((_ sign_extend 32) (size!7670 lt!429913)))))

(declare-fun lt!430173 () (_ BitVec 64))

(assert (=> b!295685 (= lt!430173 (bvmul lt!430187 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!295685 (= lt!430171 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!295685 (= lt!430172 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17698 array!17698 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20601)

(assert (=> b!295685 (= lt!430170 (arrayBitRangesEqSlicedLemma!0 lt!430163 lt!430178 lt!430156 lt!430173 lt!430171 lt!430172))))

(assert (=> b!295685 call!5109))

(declare-fun b!295680 () Bool)

(declare-datatypes ((List!984 0))(
  ( (Nil!981) (Cons!980 (h!1099 Bool) (t!1869 List!984)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13344 array!17698 (_ BitVec 64) (_ BitVec 64)) List!984)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13344 BitStream!13344 (_ BitVec 64)) List!984)

(assert (=> b!295680 (= e!211498 (= (byteArrayBitContentToList!0 (_2!12997 lt!430167) (_3!1372 lt!430167) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12997 lt!430167) (_2!12998 lt!429905) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295680 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295680 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!99632 () Bool)

(assert (=> d!99632 e!211498))

(declare-fun res!244118 () Bool)

(assert (=> d!99632 (=> (not res!244118) (not e!211498))))

(declare-fun lt!430161 () (_ BitVec 64))

(assert (=> d!99632 (= res!244118 (= (bvsub lt!430161 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7670 (buf!7733 (_2!12997 lt!430167))) (currentByte!14242 (_2!12997 lt!430167)) (currentBit!14237 (_2!12997 lt!430167)))))))

(assert (=> d!99632 (or (= (bvand lt!430161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430161 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!430157 () (_ BitVec 64))

(assert (=> d!99632 (= lt!430161 (bvadd lt!430157 to!474))))

(assert (=> d!99632 (or (not (= (bvand lt!430157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430157 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99632 (= lt!430157 (bitIndex!0 (size!7670 (buf!7733 (_2!12998 lt!429905))) (currentByte!14242 (_2!12998 lt!429905)) (currentBit!14237 (_2!12998 lt!429905))))))

(assert (=> d!99632 (= lt!430167 e!211499)))

(assert (=> d!99632 (= c!13487 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99632 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99632 (= (readBitsLoop!0 (_2!12998 lt!429905) nBits!523 lt!429913 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!430167)))

(declare-fun b!295686 () Bool)

(declare-fun res!244119 () Bool)

(assert (=> b!295686 (=> (not res!244119) (not e!211498))))

(assert (=> b!295686 (= res!244119 (arrayBitRangesEq!0 lt!429913 (_3!1372 lt!430167) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!295687 () Bool)

(declare-fun res!244116 () Bool)

(assert (=> b!295687 (=> (not res!244116) (not e!211498))))

(assert (=> b!295687 (= res!244116 (and (= (buf!7733 (_2!12998 lt!429905)) (buf!7733 (_2!12997 lt!430167))) (= (size!7670 lt!429913) (size!7670 (_3!1372 lt!430167)))))))

(assert (= (and d!99632 c!13487) b!295683))

(assert (= (and d!99632 (not c!13487)) b!295685))

(assert (= (and b!295683 res!244117) b!295684))

(assert (= (or b!295683 b!295685) bm!5106))

(assert (= (or b!295683 b!295685) bm!5107))

(assert (= (and d!99632 res!244118) b!295687))

(assert (= (and b!295687 res!244116) b!295686))

(assert (= (and b!295686 res!244119) b!295682))

(assert (= (and b!295682 (not res!244122)) b!295681))

(assert (= (and b!295682 res!244121) b!295679))

(assert (= (and b!295679 res!244120) b!295680))

(declare-fun m!433113 () Bool)

(assert (=> b!295685 m!433113))

(declare-fun m!433115 () Bool)

(assert (=> b!295685 m!433115))

(declare-fun m!433117 () Bool)

(assert (=> b!295679 m!433117))

(declare-fun m!433119 () Bool)

(assert (=> d!99632 m!433119))

(declare-fun m!433121 () Bool)

(assert (=> d!99632 m!433121))

(declare-fun m!433123 () Bool)

(assert (=> bm!5106 m!433123))

(declare-fun m!433125 () Bool)

(assert (=> bm!5107 m!433125))

(declare-fun m!433127 () Bool)

(assert (=> bm!5107 m!433127))

(declare-fun m!433129 () Bool)

(assert (=> bm!5107 m!433129))

(declare-fun m!433131 () Bool)

(assert (=> bm!5107 m!433131))

(declare-fun m!433133 () Bool)

(assert (=> b!295686 m!433133))

(assert (=> b!295683 m!433121))

(declare-fun m!433135 () Bool)

(assert (=> b!295683 m!433135))

(declare-fun m!433137 () Bool)

(assert (=> b!295683 m!433137))

(declare-fun m!433139 () Bool)

(assert (=> b!295683 m!433139))

(declare-fun m!433141 () Bool)

(assert (=> b!295683 m!433141))

(declare-fun m!433143 () Bool)

(assert (=> b!295683 m!433143))

(declare-fun m!433145 () Bool)

(assert (=> b!295683 m!433145))

(declare-fun m!433147 () Bool)

(assert (=> b!295683 m!433147))

(declare-fun m!433149 () Bool)

(assert (=> b!295683 m!433149))

(declare-fun m!433151 () Bool)

(assert (=> b!295683 m!433151))

(declare-fun m!433153 () Bool)

(assert (=> b!295683 m!433153))

(declare-fun m!433155 () Bool)

(assert (=> b!295683 m!433155))

(declare-fun m!433157 () Bool)

(assert (=> b!295683 m!433157))

(declare-fun m!433159 () Bool)

(assert (=> b!295683 m!433159))

(declare-fun m!433161 () Bool)

(assert (=> b!295683 m!433161))

(declare-fun m!433163 () Bool)

(assert (=> b!295681 m!433163))

(declare-fun m!433165 () Bool)

(assert (=> b!295681 m!433165))

(declare-fun m!433167 () Bool)

(assert (=> b!295680 m!433167))

(declare-fun m!433169 () Bool)

(assert (=> b!295680 m!433169))

(assert (=> b!295537 d!99632))

(declare-fun d!99672 () Bool)

(declare-fun e!211505 () Bool)

(assert (=> d!99672 e!211505))

(declare-fun res!244133 () Bool)

(assert (=> d!99672 (=> (not res!244133) (not e!211505))))

(declare-fun lt!430224 () (_ BitVec 64))

(declare-fun lt!430226 () (_ BitVec 64))

(declare-fun lt!430222 () (_ BitVec 64))

(assert (=> d!99672 (= res!244133 (= lt!430224 (bvsub lt!430226 lt!430222)))))

(assert (=> d!99672 (or (= (bvand lt!430226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430226 lt!430222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99672 (= lt!430222 (remainingBits!0 ((_ sign_extend 32) (size!7670 (buf!7733 (_2!12997 lt!429903)))) ((_ sign_extend 32) (currentByte!14242 (_2!12997 lt!429903))) ((_ sign_extend 32) (currentBit!14237 (_2!12997 lt!429903)))))))

(declare-fun lt!430223 () (_ BitVec 64))

(declare-fun lt!430225 () (_ BitVec 64))

(assert (=> d!99672 (= lt!430226 (bvmul lt!430223 lt!430225))))

(assert (=> d!99672 (or (= lt!430223 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430225 (bvsdiv (bvmul lt!430223 lt!430225) lt!430223)))))

(assert (=> d!99672 (= lt!430225 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99672 (= lt!430223 ((_ sign_extend 32) (size!7670 (buf!7733 (_2!12997 lt!429903)))))))

(assert (=> d!99672 (= lt!430224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14242 (_2!12997 lt!429903))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14237 (_2!12997 lt!429903)))))))

(assert (=> d!99672 (invariant!0 (currentBit!14237 (_2!12997 lt!429903)) (currentByte!14242 (_2!12997 lt!429903)) (size!7670 (buf!7733 (_2!12997 lt!429903))))))

(assert (=> d!99672 (= (bitIndex!0 (size!7670 (buf!7733 (_2!12997 lt!429903))) (currentByte!14242 (_2!12997 lt!429903)) (currentBit!14237 (_2!12997 lt!429903))) lt!430224)))

(declare-fun b!295698 () Bool)

(declare-fun res!244134 () Bool)

(assert (=> b!295698 (=> (not res!244134) (not e!211505))))

(assert (=> b!295698 (= res!244134 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430224))))

(declare-fun b!295699 () Bool)

(declare-fun lt!430227 () (_ BitVec 64))

(assert (=> b!295699 (= e!211505 (bvsle lt!430224 (bvmul lt!430227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295699 (or (= lt!430227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430227)))))

(assert (=> b!295699 (= lt!430227 ((_ sign_extend 32) (size!7670 (buf!7733 (_2!12997 lt!429903)))))))

(assert (= (and d!99672 res!244133) b!295698))

(assert (= (and b!295698 res!244134) b!295699))

(declare-fun m!433173 () Bool)

(assert (=> d!99672 m!433173))

(declare-fun m!433175 () Bool)

(assert (=> d!99672 m!433175))

(assert (=> b!295537 d!99672))

(declare-fun b!295700 () Bool)

(declare-fun e!211510 () Bool)

(declare-fun call!5111 () Bool)

(assert (=> b!295700 (= e!211510 call!5111)))

(declare-fun e!211507 () Bool)

(declare-fun lt!430228 () tuple4!888)

(declare-fun b!295701 () Bool)

(assert (=> b!295701 (= e!211507 (arrayRangesEq!1502 arr!273 (_3!1372 lt!429903) (_1!13001 lt!430228) (_2!13001 lt!430228)))))

(declare-fun b!295702 () Bool)

(declare-fun e!211508 () Bool)

(declare-fun e!211506 () Bool)

(assert (=> b!295702 (= e!211508 e!211506)))

(declare-fun lt!430230 () (_ BitVec 32))

(declare-fun res!244137 () Bool)

(assert (=> b!295702 (= res!244137 (byteRangesEq!0 (select (arr!8717 arr!273) (_3!1374 lt!430228)) (select (arr!8717 (_3!1372 lt!429903)) (_3!1374 lt!430228)) lt!430230 #b00000000000000000000000000001000))))

(assert (=> b!295702 (=> (not res!244137) (not e!211506))))

(declare-fun lt!430229 () (_ BitVec 32))

(declare-fun bm!5108 () Bool)

(declare-fun c!13488 () Bool)

(assert (=> bm!5108 (= call!5111 (byteRangesEq!0 (ite c!13488 (select (arr!8717 arr!273) (_3!1374 lt!430228)) (select (arr!8717 arr!273) (_4!444 lt!430228))) (ite c!13488 (select (arr!8717 (_3!1372 lt!429903)) (_3!1374 lt!430228)) (select (arr!8717 (_3!1372 lt!429903)) (_4!444 lt!430228))) (ite c!13488 lt!430230 #b00000000000000000000000000000000) lt!430229))))

(declare-fun b!295704 () Bool)

(declare-fun e!211509 () Bool)

(declare-fun e!211511 () Bool)

(assert (=> b!295704 (= e!211509 e!211511)))

(declare-fun res!244138 () Bool)

(assert (=> b!295704 (=> (not res!244138) (not e!211511))))

(assert (=> b!295704 (= res!244138 e!211507)))

(declare-fun res!244136 () Bool)

(assert (=> b!295704 (=> res!244136 e!211507)))

(assert (=> b!295704 (= res!244136 (bvsge (_1!13001 lt!430228) (_2!13001 lt!430228)))))

(assert (=> b!295704 (= lt!430229 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295704 (= lt!430230 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295704 (= lt!430228 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295705 () Bool)

(assert (=> b!295705 (= e!211508 call!5111)))

(declare-fun b!295706 () Bool)

(declare-fun res!244139 () Bool)

(assert (=> b!295706 (= res!244139 (= lt!430229 #b00000000000000000000000000000000))))

(assert (=> b!295706 (=> res!244139 e!211510)))

(assert (=> b!295706 (= e!211506 e!211510)))

(declare-fun b!295703 () Bool)

(assert (=> b!295703 (= e!211511 e!211508)))

(assert (=> b!295703 (= c!13488 (= (_3!1374 lt!430228) (_4!444 lt!430228)))))

(declare-fun d!99676 () Bool)

(declare-fun res!244135 () Bool)

(assert (=> d!99676 (=> res!244135 e!211509)))

(assert (=> d!99676 (= res!244135 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99676 (= (arrayBitRangesEq!0 arr!273 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211509)))

(assert (= (and d!99676 (not res!244135)) b!295704))

(assert (= (and b!295704 (not res!244136)) b!295701))

(assert (= (and b!295704 res!244138) b!295703))

(assert (= (and b!295703 c!13488) b!295705))

(assert (= (and b!295703 (not c!13488)) b!295702))

(assert (= (and b!295702 res!244137) b!295706))

(assert (= (and b!295706 (not res!244139)) b!295700))

(assert (= (or b!295705 b!295700) bm!5108))

(declare-fun m!433177 () Bool)

(assert (=> b!295701 m!433177))

(declare-fun m!433179 () Bool)

(assert (=> b!295702 m!433179))

(declare-fun m!433181 () Bool)

(assert (=> b!295702 m!433181))

(assert (=> b!295702 m!433179))

(assert (=> b!295702 m!433181))

(declare-fun m!433183 () Bool)

(assert (=> b!295702 m!433183))

(declare-fun m!433185 () Bool)

(assert (=> bm!5108 m!433185))

(assert (=> bm!5108 m!433179))

(assert (=> bm!5108 m!433181))

(declare-fun m!433187 () Bool)

(assert (=> bm!5108 m!433187))

(declare-fun m!433189 () Bool)

(assert (=> bm!5108 m!433189))

(assert (=> b!295704 m!432999))

(assert (=> b!295537 d!99676))

(declare-fun d!99678 () Bool)

(declare-fun e!211521 () Bool)

(assert (=> d!99678 e!211521))

(declare-fun res!244145 () Bool)

(assert (=> d!99678 (=> (not res!244145) (not e!211521))))

(declare-datatypes ((tuple2!23256 0))(
  ( (tuple2!23257 (_1!13003 Unit!20601) (_2!13003 BitStream!13344)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13344) tuple2!23256)

(assert (=> d!99678 (= res!244145 (= (buf!7733 (_2!13003 (increaseBitIndex!0 thiss!1728))) (buf!7733 thiss!1728)))))

(declare-fun lt!430262 () Bool)

(assert (=> d!99678 (= lt!430262 (not (= (bvand ((_ sign_extend 24) (select (arr!8717 (buf!7733 thiss!1728)) (currentByte!14242 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14237 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430264 () tuple2!23250)

(assert (=> d!99678 (= lt!430264 (tuple2!23251 (not (= (bvand ((_ sign_extend 24) (select (arr!8717 (buf!7733 thiss!1728)) (currentByte!14242 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14237 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13003 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99678 (validate_offset_bit!0 ((_ sign_extend 32) (size!7670 (buf!7733 thiss!1728))) ((_ sign_extend 32) (currentByte!14242 thiss!1728)) ((_ sign_extend 32) (currentBit!14237 thiss!1728)))))

(assert (=> d!99678 (= (readBit!0 thiss!1728) lt!430264)))

(declare-fun lt!430263 () (_ BitVec 64))

(declare-fun lt!430265 () (_ BitVec 64))

(declare-fun b!295713 () Bool)

(assert (=> b!295713 (= e!211521 (= (bitIndex!0 (size!7670 (buf!7733 (_2!13003 (increaseBitIndex!0 thiss!1728)))) (currentByte!14242 (_2!13003 (increaseBitIndex!0 thiss!1728))) (currentBit!14237 (_2!13003 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!430265 lt!430263)))))

(assert (=> b!295713 (or (not (= (bvand lt!430265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430263 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430265 lt!430263) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295713 (= lt!430263 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295713 (= lt!430265 (bitIndex!0 (size!7670 (buf!7733 thiss!1728)) (currentByte!14242 thiss!1728) (currentBit!14237 thiss!1728)))))

(declare-fun lt!430261 () Bool)

(assert (=> b!295713 (= lt!430261 (not (= (bvand ((_ sign_extend 24) (select (arr!8717 (buf!7733 thiss!1728)) (currentByte!14242 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14237 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430266 () Bool)

(assert (=> b!295713 (= lt!430266 (not (= (bvand ((_ sign_extend 24) (select (arr!8717 (buf!7733 thiss!1728)) (currentByte!14242 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14237 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430260 () Bool)

(assert (=> b!295713 (= lt!430260 (not (= (bvand ((_ sign_extend 24) (select (arr!8717 (buf!7733 thiss!1728)) (currentByte!14242 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14237 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99678 res!244145) b!295713))

(declare-fun m!433205 () Bool)

(assert (=> d!99678 m!433205))

(declare-fun m!433207 () Bool)

(assert (=> d!99678 m!433207))

(declare-fun m!433209 () Bool)

(assert (=> d!99678 m!433209))

(declare-fun m!433211 () Bool)

(assert (=> d!99678 m!433211))

(declare-fun m!433213 () Bool)

(assert (=> b!295713 m!433213))

(assert (=> b!295713 m!433209))

(assert (=> b!295713 m!433205))

(assert (=> b!295713 m!433207))

(assert (=> b!295713 m!432901))

(assert (=> b!295537 d!99678))

(declare-fun d!99686 () Bool)

(declare-fun e!211522 () Bool)

(assert (=> d!99686 e!211522))

(declare-fun res!244146 () Bool)

(assert (=> d!99686 (=> (not res!244146) (not e!211522))))

(declare-fun lt!430267 () (_ BitVec 64))

(declare-fun lt!430271 () (_ BitVec 64))

(declare-fun lt!430269 () (_ BitVec 64))

(assert (=> d!99686 (= res!244146 (= lt!430269 (bvsub lt!430271 lt!430267)))))

(assert (=> d!99686 (or (= (bvand lt!430271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430271 lt!430267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99686 (= lt!430267 (remainingBits!0 ((_ sign_extend 32) (size!7670 (buf!7733 thiss!1728))) ((_ sign_extend 32) (currentByte!14242 thiss!1728)) ((_ sign_extend 32) (currentBit!14237 thiss!1728))))))

(declare-fun lt!430268 () (_ BitVec 64))

(declare-fun lt!430270 () (_ BitVec 64))

(assert (=> d!99686 (= lt!430271 (bvmul lt!430268 lt!430270))))

(assert (=> d!99686 (or (= lt!430268 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430270 (bvsdiv (bvmul lt!430268 lt!430270) lt!430268)))))

(assert (=> d!99686 (= lt!430270 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99686 (= lt!430268 ((_ sign_extend 32) (size!7670 (buf!7733 thiss!1728))))))

(assert (=> d!99686 (= lt!430269 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14242 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14237 thiss!1728))))))

(assert (=> d!99686 (invariant!0 (currentBit!14237 thiss!1728) (currentByte!14242 thiss!1728) (size!7670 (buf!7733 thiss!1728)))))

(assert (=> d!99686 (= (bitIndex!0 (size!7670 (buf!7733 thiss!1728)) (currentByte!14242 thiss!1728) (currentBit!14237 thiss!1728)) lt!430269)))

(declare-fun b!295714 () Bool)

(declare-fun res!244147 () Bool)

(assert (=> b!295714 (=> (not res!244147) (not e!211522))))

(assert (=> b!295714 (= res!244147 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430269))))

(declare-fun b!295715 () Bool)

(declare-fun lt!430272 () (_ BitVec 64))

(assert (=> b!295715 (= e!211522 (bvsle lt!430269 (bvmul lt!430272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295715 (or (= lt!430272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430272)))))

(assert (=> b!295715 (= lt!430272 ((_ sign_extend 32) (size!7670 (buf!7733 thiss!1728))))))

(assert (= (and d!99686 res!244146) b!295714))

(assert (= (and b!295714 res!244147) b!295715))

(assert (=> d!99686 m!432963))

(assert (=> d!99686 m!432961))

(assert (=> b!295537 d!99686))

(declare-fun d!99688 () Bool)

(declare-fun e!211525 () Bool)

(assert (=> d!99688 e!211525))

(declare-fun res!244150 () Bool)

(assert (=> d!99688 (=> (not res!244150) (not e!211525))))

(assert (=> d!99688 (= res!244150 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!430275 () Unit!20601)

(declare-fun choose!27 (BitStream!13344 BitStream!13344 (_ BitVec 64) (_ BitVec 64)) Unit!20601)

(assert (=> d!99688 (= lt!430275 (choose!27 thiss!1728 (_2!12998 lt!429905) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99688 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99688 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12998 lt!429905) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!430275)))

(declare-fun b!295718 () Bool)

(assert (=> b!295718 (= e!211525 (validate_offset_bits!1 ((_ sign_extend 32) (size!7670 (buf!7733 (_2!12998 lt!429905)))) ((_ sign_extend 32) (currentByte!14242 (_2!12998 lt!429905))) ((_ sign_extend 32) (currentBit!14237 (_2!12998 lt!429905))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99688 res!244150) b!295718))

(declare-fun m!433215 () Bool)

(assert (=> d!99688 m!433215))

(assert (=> b!295718 m!432913))

(assert (=> b!295537 d!99688))

(declare-fun d!99690 () Bool)

(assert (=> d!99690 (= (bitAt!0 lt!429913 from!505) (bitAt!0 (_3!1372 lt!429903) from!505))))

(declare-fun lt!430278 () Unit!20601)

(declare-fun choose!31 (array!17698 array!17698 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20601)

(assert (=> d!99690 (= lt!430278 (choose!31 lt!429913 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99690 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99690 (= (arrayBitRangesEqImpliesEq!0 lt!429913 (_3!1372 lt!429903) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430278)))

(declare-fun bs!25490 () Bool)

(assert (= bs!25490 d!99690))

(assert (=> bs!25490 m!432893))

(assert (=> bs!25490 m!432885))

(declare-fun m!433217 () Bool)

(assert (=> bs!25490 m!433217))

(assert (=> b!295537 d!99690))

(check-sat (not d!99632) (not b!295561) (not b!295679) (not b!295685) (not b!295713) (not b!295704) (not b!295683) (not d!99614) (not b!295580) (not b!295681) (not d!99688) (not d!99628) (not b!295686) (not d!99678) (not d!99686) (not b!295701) (not bm!5107) (not d!99618) (not bm!5093) (not b!295577) (not b!295702) (not d!99672) (not d!99690) (not b!295680) (not bm!5106) (not b!295578) (not d!99620) (not d!99626) (not bm!5108) (not b!295718))
