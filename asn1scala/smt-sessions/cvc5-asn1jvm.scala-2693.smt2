; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65890 () Bool)

(assert start!65890)

(declare-fun b!295516 () Bool)

(declare-fun res!243991 () Bool)

(declare-fun e!211356 () Bool)

(assert (=> b!295516 (=> (not res!243991) (not e!211356))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!295516 (= res!243991 (bvslt from!505 to!474))))

(declare-fun b!295517 () Bool)

(declare-fun e!211352 () Bool)

(declare-datatypes ((array!17696 0))(
  ( (array!17697 (arr!8716 (Array (_ BitVec 32) (_ BitVec 8))) (size!7669 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13342 0))(
  ( (BitStream!13343 (buf!7732 array!17696) (currentByte!14241 (_ BitVec 32)) (currentBit!14236 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13342)

(declare-fun array_inv!7281 (array!17696) Bool)

(assert (=> b!295517 (= e!211352 (array_inv!7281 (buf!7732 thiss!1728)))))

(declare-fun res!243988 () Bool)

(assert (=> start!65890 (=> (not res!243988) (not e!211356))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun arr!273 () array!17696)

(assert (=> start!65890 (= res!243988 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7669 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65890 e!211356))

(declare-fun inv!12 (BitStream!13342) Bool)

(assert (=> start!65890 (and (inv!12 thiss!1728) e!211352)))

(assert (=> start!65890 true))

(assert (=> start!65890 (array_inv!7281 arr!273)))

(declare-fun b!295518 () Bool)

(declare-fun res!243989 () Bool)

(assert (=> b!295518 (=> (not res!243989) (not e!211356))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295518 (= res!243989 (validate_offset_bits!1 ((_ sign_extend 32) (size!7669 (buf!7732 thiss!1728))) ((_ sign_extend 32) (currentByte!14241 thiss!1728)) ((_ sign_extend 32) (currentBit!14236 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!295519 () Bool)

(declare-fun e!211351 () Bool)

(declare-fun lt!429872 () Bool)

(declare-datatypes ((tuple2!23248 0))(
  ( (tuple2!23249 (_1!12995 Bool) (_2!12995 BitStream!13342)) )
))
(declare-fun lt!429873 () tuple2!23248)

(assert (=> b!295519 (= e!211351 (= lt!429872 (_1!12995 lt!429873)))))

(declare-fun b!295520 () Bool)

(declare-fun lt!429870 () (_ BitVec 64))

(declare-fun lt!429867 () (_ BitVec 64))

(assert (=> b!295520 (= e!211356 (not (or (not (= lt!429867 (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!429867 (bvand lt!429870 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!429874 () (_ BitVec 64))

(assert (=> b!295520 (= lt!429867 (bvand lt!429874 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295520 e!211351))

(declare-fun res!243990 () Bool)

(assert (=> b!295520 (=> (not res!243990) (not e!211351))))

(declare-fun lt!429869 () array!17696)

(declare-fun bitAt!0 (array!17696 (_ BitVec 64)) Bool)

(assert (=> b!295520 (= res!243990 (= (bitAt!0 lt!429869 from!505) lt!429872))))

(declare-datatypes ((Unit!20599 0))(
  ( (Unit!20600) )
))
(declare-datatypes ((tuple3!1854 0))(
  ( (tuple3!1855 (_1!12996 Unit!20599) (_2!12996 BitStream!13342) (_3!1371 array!17696)) )
))
(declare-fun lt!429864 () tuple3!1854)

(assert (=> b!295520 (= lt!429872 (bitAt!0 (_3!1371 lt!429864) from!505))))

(declare-fun lt!429868 () Unit!20599)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17696 array!17696 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20599)

(assert (=> b!295520 (= lt!429868 (arrayBitRangesEqImpliesEq!0 lt!429869 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17696 array!17696 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!295520 (arrayBitRangesEq!0 arr!273 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429866 () Unit!20599)

(declare-fun arrayBitRangesEqTransitive!0 (array!17696 array!17696 array!17696 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20599)

(assert (=> b!295520 (= lt!429866 (arrayBitRangesEqTransitive!0 arr!273 lt!429869 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!295520 (arrayBitRangesEq!0 arr!273 lt!429869 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!429875 () Unit!20599)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17696 (_ BitVec 64) Bool) Unit!20599)

(assert (=> b!295520 (= lt!429875 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12995 lt!429873)))))

(declare-fun e!211355 () Bool)

(assert (=> b!295520 e!211355))

(declare-fun res!243992 () Bool)

(assert (=> b!295520 (=> (not res!243992) (not e!211355))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!295520 (= res!243992 (= (bvsub lt!429870 from!505) (bitIndex!0 (size!7669 (buf!7732 (_2!12996 lt!429864))) (currentByte!14241 (_2!12996 lt!429864)) (currentBit!14236 (_2!12996 lt!429864)))))))

(assert (=> b!295520 (= lt!429870 (bvadd lt!429874 to!474))))

(assert (=> b!295520 (= lt!429874 (bitIndex!0 (size!7669 (buf!7732 thiss!1728)) (currentByte!14241 thiss!1728) (currentBit!14236 thiss!1728)))))

(declare-fun readBitsLoop!0 (BitStream!13342 (_ BitVec 64) array!17696 (_ BitVec 64) (_ BitVec 64)) tuple3!1854)

(assert (=> b!295520 (= lt!429864 (readBitsLoop!0 (_2!12995 lt!429873) nBits!523 lt!429869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!295520 (validate_offset_bits!1 ((_ sign_extend 32) (size!7669 (buf!7732 (_2!12995 lt!429873)))) ((_ sign_extend 32) (currentByte!14241 (_2!12995 lt!429873))) ((_ sign_extend 32) (currentBit!14236 (_2!12995 lt!429873))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429876 () Unit!20599)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13342 BitStream!13342 (_ BitVec 64) (_ BitVec 64)) Unit!20599)

(assert (=> b!295520 (= lt!429876 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12995 lt!429873) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!429865 () (_ BitVec 32))

(declare-fun lt!429871 () (_ BitVec 32))

(assert (=> b!295520 (= lt!429869 (array!17697 (store (arr!8716 arr!273) lt!429865 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8716 arr!273) lt!429865)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429871)))) ((_ sign_extend 24) (ite (_1!12995 lt!429873) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!429871) #b00000000))))) (size!7669 arr!273)))))

(assert (=> b!295520 (= lt!429871 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295520 (= lt!429865 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13342) tuple2!23248)

(assert (=> b!295520 (= lt!429873 (readBit!0 thiss!1728))))

(declare-fun b!295521 () Bool)

(assert (=> b!295521 (= e!211355 (and (= (buf!7732 thiss!1728) (buf!7732 (_2!12996 lt!429864))) (= (size!7669 arr!273) (size!7669 (_3!1371 lt!429864)))))))

(assert (= (and start!65890 res!243988) b!295518))

(assert (= (and b!295518 res!243989) b!295516))

(assert (= (and b!295516 res!243991) b!295520))

(assert (= (and b!295520 res!243992) b!295521))

(assert (= (and b!295520 res!243990) b!295519))

(assert (= start!65890 b!295517))

(declare-fun m!432841 () Bool)

(assert (=> b!295517 m!432841))

(declare-fun m!432843 () Bool)

(assert (=> start!65890 m!432843))

(declare-fun m!432845 () Bool)

(assert (=> start!65890 m!432845))

(declare-fun m!432847 () Bool)

(assert (=> b!295518 m!432847))

(declare-fun m!432849 () Bool)

(assert (=> b!295520 m!432849))

(declare-fun m!432851 () Bool)

(assert (=> b!295520 m!432851))

(declare-fun m!432853 () Bool)

(assert (=> b!295520 m!432853))

(declare-fun m!432855 () Bool)

(assert (=> b!295520 m!432855))

(declare-fun m!432857 () Bool)

(assert (=> b!295520 m!432857))

(declare-fun m!432859 () Bool)

(assert (=> b!295520 m!432859))

(declare-fun m!432861 () Bool)

(assert (=> b!295520 m!432861))

(declare-fun m!432863 () Bool)

(assert (=> b!295520 m!432863))

(declare-fun m!432865 () Bool)

(assert (=> b!295520 m!432865))

(declare-fun m!432867 () Bool)

(assert (=> b!295520 m!432867))

(declare-fun m!432869 () Bool)

(assert (=> b!295520 m!432869))

(declare-fun m!432871 () Bool)

(assert (=> b!295520 m!432871))

(declare-fun m!432873 () Bool)

(assert (=> b!295520 m!432873))

(declare-fun m!432875 () Bool)

(assert (=> b!295520 m!432875))

(declare-fun m!432877 () Bool)

(assert (=> b!295520 m!432877))

(declare-fun m!432879 () Bool)

(assert (=> b!295520 m!432879))

(push 1)

(assert (not b!295518))

(assert (not b!295520))

(assert (not start!65890))

(assert (not b!295517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99634 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99634 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7669 (buf!7732 thiss!1728))) ((_ sign_extend 32) (currentByte!14241 thiss!1728)) ((_ sign_extend 32) (currentBit!14236 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7669 (buf!7732 thiss!1728))) ((_ sign_extend 32) (currentByte!14241 thiss!1728)) ((_ sign_extend 32) (currentBit!14236 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25482 () Bool)

(assert (= bs!25482 d!99634))

(declare-fun m!433001 () Bool)

(assert (=> bs!25482 m!433001))

(assert (=> b!295518 d!99634))

(declare-fun b!295597 () Bool)

(declare-fun e!211429 () Bool)

(declare-fun e!211428 () Bool)

(assert (=> b!295597 (= e!211429 e!211428)))

(declare-fun c!13479 () Bool)

(declare-datatypes ((tuple4!890 0))(
  ( (tuple4!891 (_1!13004 (_ BitVec 32)) (_2!13004 (_ BitVec 32)) (_3!1375 (_ BitVec 32)) (_4!445 (_ BitVec 32))) )
))
(declare-fun lt!429987 () tuple4!890)

(assert (=> b!295597 (= c!13479 (= (_3!1375 lt!429987) (_4!445 lt!429987)))))

(declare-fun b!295598 () Bool)

(declare-fun e!211431 () Bool)

(assert (=> b!295598 (= e!211431 e!211429)))

(declare-fun res!244055 () Bool)

(assert (=> b!295598 (=> (not res!244055) (not e!211429))))

(declare-fun e!211427 () Bool)

(assert (=> b!295598 (= res!244055 e!211427)))

(declare-fun res!244053 () Bool)

(assert (=> b!295598 (=> res!244053 e!211427)))

(assert (=> b!295598 (= res!244053 (bvsge (_1!13004 lt!429987) (_2!13004 lt!429987)))))

(declare-fun lt!429985 () (_ BitVec 32))

(assert (=> b!295598 (= lt!429985 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!429986 () (_ BitVec 32))

(assert (=> b!295598 (= lt!429986 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!890)

(assert (=> b!295598 (= lt!429987 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295599 () Bool)

(declare-fun e!211430 () Bool)

(assert (=> b!295599 (= e!211428 e!211430)))

(declare-fun res!244054 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295599 (= res!244054 (byteRangesEq!0 (select (arr!8716 arr!273) (_3!1375 lt!429987)) (select (arr!8716 lt!429869) (_3!1375 lt!429987)) lt!429986 #b00000000000000000000000000001000))))

(assert (=> b!295599 (=> (not res!244054) (not e!211430))))

(declare-fun b!295600 () Bool)

(declare-fun e!211426 () Bool)

(declare-fun call!5099 () Bool)

(assert (=> b!295600 (= e!211426 call!5099)))

(declare-fun bm!5096 () Bool)

(assert (=> bm!5096 (= call!5099 (byteRangesEq!0 (ite c!13479 (select (arr!8716 arr!273) (_3!1375 lt!429987)) (select (arr!8716 arr!273) (_4!445 lt!429987))) (ite c!13479 (select (arr!8716 lt!429869) (_3!1375 lt!429987)) (select (arr!8716 lt!429869) (_4!445 lt!429987))) (ite c!13479 lt!429986 #b00000000000000000000000000000000) lt!429985))))

(declare-fun b!295601 () Bool)

(assert (=> b!295601 (= e!211428 call!5099)))

(declare-fun d!99636 () Bool)

(declare-fun res!244051 () Bool)

(assert (=> d!99636 (=> res!244051 e!211431)))

(assert (=> d!99636 (= res!244051 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99636 (= (arrayBitRangesEq!0 arr!273 lt!429869 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211431)))

(declare-fun b!295602 () Bool)

(declare-fun res!244052 () Bool)

(assert (=> b!295602 (= res!244052 (= lt!429985 #b00000000000000000000000000000000))))

(assert (=> b!295602 (=> res!244052 e!211426)))

(assert (=> b!295602 (= e!211430 e!211426)))

(declare-fun b!295603 () Bool)

(declare-fun arrayRangesEq!1503 (array!17696 array!17696 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!295603 (= e!211427 (arrayRangesEq!1503 arr!273 lt!429869 (_1!13004 lt!429987) (_2!13004 lt!429987)))))

(assert (= (and d!99636 (not res!244051)) b!295598))

(assert (= (and b!295598 (not res!244053)) b!295603))

(assert (= (and b!295598 res!244055) b!295597))

(assert (= (and b!295597 c!13479) b!295601))

(assert (= (and b!295597 (not c!13479)) b!295599))

(assert (= (and b!295599 res!244054) b!295602))

(assert (= (and b!295602 (not res!244052)) b!295600))

(assert (= (or b!295601 b!295600) bm!5096))

(declare-fun m!433003 () Bool)

(assert (=> b!295598 m!433003))

(declare-fun m!433005 () Bool)

(assert (=> b!295599 m!433005))

(declare-fun m!433007 () Bool)

(assert (=> b!295599 m!433007))

(assert (=> b!295599 m!433005))

(assert (=> b!295599 m!433007))

(declare-fun m!433009 () Bool)

(assert (=> b!295599 m!433009))

(declare-fun m!433011 () Bool)

(assert (=> bm!5096 m!433011))

(assert (=> bm!5096 m!433007))

(declare-fun m!433013 () Bool)

(assert (=> bm!5096 m!433013))

(assert (=> bm!5096 m!433005))

(declare-fun m!433015 () Bool)

(assert (=> bm!5096 m!433015))

(declare-fun m!433017 () Bool)

(assert (=> b!295603 m!433017))

(assert (=> b!295520 d!99636))

(declare-fun d!99638 () Bool)

(declare-fun e!211434 () Bool)

(assert (=> d!99638 e!211434))

(declare-fun res!244058 () Bool)

(assert (=> d!99638 (=> (not res!244058) (not e!211434))))

(assert (=> d!99638 (= res!244058 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429990 () Unit!20599)

(declare-fun choose!27 (BitStream!13342 BitStream!13342 (_ BitVec 64) (_ BitVec 64)) Unit!20599)

(assert (=> d!99638 (= lt!429990 (choose!27 thiss!1728 (_2!12995 lt!429873) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!99638 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!99638 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12995 lt!429873) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!429990)))

(declare-fun b!295606 () Bool)

(assert (=> b!295606 (= e!211434 (validate_offset_bits!1 ((_ sign_extend 32) (size!7669 (buf!7732 (_2!12995 lt!429873)))) ((_ sign_extend 32) (currentByte!14241 (_2!12995 lt!429873))) ((_ sign_extend 32) (currentBit!14236 (_2!12995 lt!429873))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!99638 res!244058) b!295606))

(declare-fun m!433019 () Bool)

(assert (=> d!99638 m!433019))

(assert (=> b!295606 m!432871))

(assert (=> b!295520 d!99638))

(declare-fun d!99640 () Bool)

(declare-fun e!211437 () Bool)

(assert (=> d!99640 e!211437))

(declare-fun res!244061 () Bool)

(assert (=> d!99640 (=> (not res!244061) (not e!211437))))

(declare-fun lt!429999 () (_ BitVec 32))

(assert (=> d!99640 (= res!244061 (and (bvsge lt!429999 #b00000000000000000000000000000000) (bvslt lt!429999 (size!7669 arr!273))))))

(declare-fun lt!430000 () (_ BitVec 32))

(declare-fun lt!430002 () Unit!20599)

(declare-fun lt!430001 () (_ BitVec 8))

(declare-fun choose!53 (array!17696 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20599)

(assert (=> d!99640 (= lt!430002 (choose!53 arr!273 from!505 (_1!12995 lt!429873) lt!429999 lt!430000 lt!430001))))

(assert (=> d!99640 (= lt!430001 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8716 arr!273) lt!429999)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430000)))) ((_ sign_extend 24) (ite (_1!12995 lt!429873) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430000) #b00000000)))))))

(assert (=> d!99640 (= lt!430000 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99640 (= lt!429999 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!99640 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12995 lt!429873)) lt!430002)))

(declare-fun b!295610 () Bool)

(assert (=> b!295610 (= e!211437 (arrayBitRangesEq!0 arr!273 (array!17697 (store (arr!8716 arr!273) lt!429999 lt!430001) (size!7669 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!99640 res!244061) b!295610))

(declare-fun m!433021 () Bool)

(assert (=> d!99640 m!433021))

(declare-fun m!433023 () Bool)

(assert (=> d!99640 m!433023))

(declare-fun m!433025 () Bool)

(assert (=> d!99640 m!433025))

(declare-fun m!433027 () Bool)

(assert (=> b!295610 m!433027))

(declare-fun m!433029 () Bool)

(assert (=> b!295610 m!433029))

(assert (=> b!295520 d!99640))

(declare-fun d!99642 () Bool)

(assert (=> d!99642 (= (bitAt!0 (_3!1371 lt!429864) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8716 (_3!1371 lt!429864)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25483 () Bool)

(assert (= bs!25483 d!99642))

(declare-fun m!433031 () Bool)

(assert (=> bs!25483 m!433031))

(declare-fun m!433033 () Bool)

(assert (=> bs!25483 m!433033))

(assert (=> b!295520 d!99642))

(declare-fun d!99644 () Bool)

(declare-fun e!211440 () Bool)

(assert (=> d!99644 e!211440))

(declare-fun res!244066 () Bool)

(assert (=> d!99644 (=> (not res!244066) (not e!211440))))

(declare-fun lt!430015 () (_ BitVec 64))

(declare-fun lt!430019 () (_ BitVec 64))

(declare-fun lt!430018 () (_ BitVec 64))

(assert (=> d!99644 (= res!244066 (= lt!430015 (bvsub lt!430018 lt!430019)))))

(assert (=> d!99644 (or (= (bvand lt!430018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430019 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430018 lt!430019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99644 (= lt!430019 (remainingBits!0 ((_ sign_extend 32) (size!7669 (buf!7732 thiss!1728))) ((_ sign_extend 32) (currentByte!14241 thiss!1728)) ((_ sign_extend 32) (currentBit!14236 thiss!1728))))))

(declare-fun lt!430020 () (_ BitVec 64))

(declare-fun lt!430017 () (_ BitVec 64))

(assert (=> d!99644 (= lt!430018 (bvmul lt!430020 lt!430017))))

(assert (=> d!99644 (or (= lt!430020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430017 (bvsdiv (bvmul lt!430020 lt!430017) lt!430020)))))

(assert (=> d!99644 (= lt!430017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99644 (= lt!430020 ((_ sign_extend 32) (size!7669 (buf!7732 thiss!1728))))))

(assert (=> d!99644 (= lt!430015 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14241 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14236 thiss!1728))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99644 (invariant!0 (currentBit!14236 thiss!1728) (currentByte!14241 thiss!1728) (size!7669 (buf!7732 thiss!1728)))))

(assert (=> d!99644 (= (bitIndex!0 (size!7669 (buf!7732 thiss!1728)) (currentByte!14241 thiss!1728) (currentBit!14236 thiss!1728)) lt!430015)))

(declare-fun b!295615 () Bool)

(declare-fun res!244067 () Bool)

(assert (=> b!295615 (=> (not res!244067) (not e!211440))))

(assert (=> b!295615 (= res!244067 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430015))))

(declare-fun b!295616 () Bool)

(declare-fun lt!430016 () (_ BitVec 64))

(assert (=> b!295616 (= e!211440 (bvsle lt!430015 (bvmul lt!430016 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295616 (or (= lt!430016 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430016 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430016)))))

(assert (=> b!295616 (= lt!430016 ((_ sign_extend 32) (size!7669 (buf!7732 thiss!1728))))))

(assert (= (and d!99644 res!244066) b!295615))

(assert (= (and b!295615 res!244067) b!295616))

(assert (=> d!99644 m!433001))

(declare-fun m!433035 () Bool)

(assert (=> d!99644 m!433035))

(assert (=> b!295520 d!99644))

(declare-fun b!295617 () Bool)

(declare-fun e!211444 () Bool)

(declare-fun e!211443 () Bool)

(assert (=> b!295617 (= e!211444 e!211443)))

(declare-fun c!13480 () Bool)

(declare-fun lt!430023 () tuple4!890)

(assert (=> b!295617 (= c!13480 (= (_3!1375 lt!430023) (_4!445 lt!430023)))))

(declare-fun b!295618 () Bool)

(declare-fun e!211446 () Bool)

(assert (=> b!295618 (= e!211446 e!211444)))

(declare-fun res!244072 () Bool)

(assert (=> b!295618 (=> (not res!244072) (not e!211444))))

(declare-fun e!211442 () Bool)

(assert (=> b!295618 (= res!244072 e!211442)))

(declare-fun res!244070 () Bool)

(assert (=> b!295618 (=> res!244070 e!211442)))

(assert (=> b!295618 (= res!244070 (bvsge (_1!13004 lt!430023) (_2!13004 lt!430023)))))

(declare-fun lt!430021 () (_ BitVec 32))

(assert (=> b!295618 (= lt!430021 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430022 () (_ BitVec 32))

(assert (=> b!295618 (= lt!430022 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295618 (= lt!430023 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!295619 () Bool)

(declare-fun e!211445 () Bool)

(assert (=> b!295619 (= e!211443 e!211445)))

(declare-fun res!244071 () Bool)

(assert (=> b!295619 (= res!244071 (byteRangesEq!0 (select (arr!8716 arr!273) (_3!1375 lt!430023)) (select (arr!8716 (_3!1371 lt!429864)) (_3!1375 lt!430023)) lt!430022 #b00000000000000000000000000001000))))

(assert (=> b!295619 (=> (not res!244071) (not e!211445))))

(declare-fun b!295620 () Bool)

(declare-fun e!211441 () Bool)

(declare-fun call!5100 () Bool)

(assert (=> b!295620 (= e!211441 call!5100)))

(declare-fun bm!5097 () Bool)

(assert (=> bm!5097 (= call!5100 (byteRangesEq!0 (ite c!13480 (select (arr!8716 arr!273) (_3!1375 lt!430023)) (select (arr!8716 arr!273) (_4!445 lt!430023))) (ite c!13480 (select (arr!8716 (_3!1371 lt!429864)) (_3!1375 lt!430023)) (select (arr!8716 (_3!1371 lt!429864)) (_4!445 lt!430023))) (ite c!13480 lt!430022 #b00000000000000000000000000000000) lt!430021))))

(declare-fun b!295621 () Bool)

(assert (=> b!295621 (= e!211443 call!5100)))

(declare-fun d!99646 () Bool)

(declare-fun res!244068 () Bool)

(assert (=> d!99646 (=> res!244068 e!211446)))

(assert (=> d!99646 (= res!244068 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!99646 (= (arrayBitRangesEq!0 arr!273 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!211446)))

(declare-fun b!295622 () Bool)

(declare-fun res!244069 () Bool)

(assert (=> b!295622 (= res!244069 (= lt!430021 #b00000000000000000000000000000000))))

(assert (=> b!295622 (=> res!244069 e!211441)))

(assert (=> b!295622 (= e!211445 e!211441)))

(declare-fun b!295623 () Bool)

(assert (=> b!295623 (= e!211442 (arrayRangesEq!1503 arr!273 (_3!1371 lt!429864) (_1!13004 lt!430023) (_2!13004 lt!430023)))))

(assert (= (and d!99646 (not res!244068)) b!295618))

(assert (= (and b!295618 (not res!244070)) b!295623))

(assert (= (and b!295618 res!244072) b!295617))

(assert (= (and b!295617 c!13480) b!295621))

(assert (= (and b!295617 (not c!13480)) b!295619))

(assert (= (and b!295619 res!244071) b!295622))

(assert (= (and b!295622 (not res!244069)) b!295620))

(assert (= (or b!295621 b!295620) bm!5097))

(assert (=> b!295618 m!433003))

(declare-fun m!433037 () Bool)

(assert (=> b!295619 m!433037))

(declare-fun m!433039 () Bool)

(assert (=> b!295619 m!433039))

(assert (=> b!295619 m!433037))

(assert (=> b!295619 m!433039))

(declare-fun m!433041 () Bool)

(assert (=> b!295619 m!433041))

(declare-fun m!433043 () Bool)

(assert (=> bm!5097 m!433043))

(assert (=> bm!5097 m!433039))

(declare-fun m!433045 () Bool)

(assert (=> bm!5097 m!433045))

(assert (=> bm!5097 m!433037))

(declare-fun m!433047 () Bool)

(assert (=> bm!5097 m!433047))

(declare-fun m!433049 () Bool)

(assert (=> b!295623 m!433049))

(assert (=> b!295520 d!99646))

(declare-fun d!99648 () Bool)

(declare-fun e!211453 () Bool)

(assert (=> d!99648 e!211453))

(declare-fun res!244075 () Bool)

(assert (=> d!99648 (=> (not res!244075) (not e!211453))))

(declare-datatypes ((tuple2!23258 0))(
  ( (tuple2!23259 (_1!13005 Unit!20599) (_2!13005 BitStream!13342)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13342) tuple2!23258)

(assert (=> d!99648 (= res!244075 (= (buf!7732 (_2!13005 (increaseBitIndex!0 thiss!1728))) (buf!7732 thiss!1728)))))

(declare-fun lt!430038 () Bool)

(assert (=> d!99648 (= lt!430038 (not (= (bvand ((_ sign_extend 24) (select (arr!8716 (buf!7732 thiss!1728)) (currentByte!14241 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14236 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430040 () tuple2!23248)

(assert (=> d!99648 (= lt!430040 (tuple2!23249 (not (= (bvand ((_ sign_extend 24) (select (arr!8716 (buf!7732 thiss!1728)) (currentByte!14241 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14236 thiss!1728)))) #b00000000000000000000000000000000)) (_2!13005 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99648 (validate_offset_bit!0 ((_ sign_extend 32) (size!7669 (buf!7732 thiss!1728))) ((_ sign_extend 32) (currentByte!14241 thiss!1728)) ((_ sign_extend 32) (currentBit!14236 thiss!1728)))))

(assert (=> d!99648 (= (readBit!0 thiss!1728) lt!430040)))

(declare-fun lt!430039 () (_ BitVec 64))

(declare-fun lt!430041 () (_ BitVec 64))

(declare-fun b!295626 () Bool)

(assert (=> b!295626 (= e!211453 (= (bitIndex!0 (size!7669 (buf!7732 (_2!13005 (increaseBitIndex!0 thiss!1728)))) (currentByte!14241 (_2!13005 (increaseBitIndex!0 thiss!1728))) (currentBit!14236 (_2!13005 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!430039 lt!430041)))))

(assert (=> b!295626 (or (not (= (bvand lt!430039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430041 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430039 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430039 lt!430041) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295626 (= lt!430041 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!295626 (= lt!430039 (bitIndex!0 (size!7669 (buf!7732 thiss!1728)) (currentByte!14241 thiss!1728) (currentBit!14236 thiss!1728)))))

(declare-fun lt!430043 () Bool)

(assert (=> b!295626 (= lt!430043 (not (= (bvand ((_ sign_extend 24) (select (arr!8716 (buf!7732 thiss!1728)) (currentByte!14241 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14236 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430044 () Bool)

(assert (=> b!295626 (= lt!430044 (not (= (bvand ((_ sign_extend 24) (select (arr!8716 (buf!7732 thiss!1728)) (currentByte!14241 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14236 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!430042 () Bool)

(assert (=> b!295626 (= lt!430042 (not (= (bvand ((_ sign_extend 24) (select (arr!8716 (buf!7732 thiss!1728)) (currentByte!14241 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14236 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99648 res!244075) b!295626))

(declare-fun m!433051 () Bool)

(assert (=> d!99648 m!433051))

(declare-fun m!433053 () Bool)

(assert (=> d!99648 m!433053))

(declare-fun m!433055 () Bool)

(assert (=> d!99648 m!433055))

(declare-fun m!433057 () Bool)

(assert (=> d!99648 m!433057))

(assert (=> b!295626 m!433051))

(assert (=> b!295626 m!432853))

(declare-fun m!433059 () Bool)

(assert (=> b!295626 m!433059))

(assert (=> b!295626 m!433055))

(assert (=> b!295626 m!433053))

(assert (=> b!295520 d!99648))

(declare-fun lt!430365 () tuple3!1854)

(declare-fun b!295737 () Bool)

(declare-fun e!211535 () Bool)

(assert (=> b!295737 (= e!211535 (and (= (buf!7732 (_2!12995 lt!429873)) (buf!7732 (_2!12996 lt!430365))) (= (size!7669 lt!429869) (size!7669 (_3!1371 lt!430365)))))))

(declare-fun b!295738 () Bool)

(declare-fun lt!430353 () Unit!20599)

(declare-fun e!211537 () tuple3!1854)

(assert (=> b!295738 (= e!211537 (tuple3!1855 lt!430353 (_2!12995 lt!429873) lt!429869))))

(declare-fun lt!430354 () Unit!20599)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17696) Unit!20599)

(assert (=> b!295738 (= lt!430354 (arrayBitRangesEqReflexiveLemma!0 lt!429869))))

(declare-fun call!5117 () Bool)

(assert (=> b!295738 call!5117))

(declare-fun lt!430383 () Unit!20599)

(assert (=> b!295738 (= lt!430383 lt!430354)))

(declare-fun lt!430355 () array!17696)

(assert (=> b!295738 (= lt!430355 lt!429869)))

(declare-fun lt!430376 () array!17696)

(assert (=> b!295738 (= lt!430376 lt!429869)))

(declare-fun lt!430356 () (_ BitVec 64))

(assert (=> b!295738 (= lt!430356 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430372 () (_ BitVec 64))

(assert (=> b!295738 (= lt!430372 ((_ sign_extend 32) (size!7669 lt!429869)))))

(declare-fun lt!430375 () (_ BitVec 64))

(assert (=> b!295738 (= lt!430375 (bvmul lt!430372 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!430364 () (_ BitVec 64))

(assert (=> b!295738 (= lt!430364 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430366 () (_ BitVec 64))

(assert (=> b!295738 (= lt!430366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17696 array!17696 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20599)

(assert (=> b!295738 (= lt!430353 (arrayBitRangesEqSlicedLemma!0 lt!430355 lt!430376 lt!430356 lt!430375 lt!430364 lt!430366))))

(declare-fun call!5116 () Bool)

(assert (=> b!295738 call!5116))

(declare-fun b!295739 () Bool)

(declare-fun res!244169 () Bool)

(declare-fun e!211534 () Bool)

(assert (=> b!295739 (=> (not res!244169) (not e!211534))))

(declare-fun lt!430371 () tuple3!1854)

(assert (=> b!295739 (= res!244169 (invariant!0 (currentBit!14236 (_2!12996 lt!430371)) (currentByte!14241 (_2!12996 lt!430371)) (size!7669 (buf!7732 (_2!12996 lt!430371)))))))

(declare-fun b!295740 () Bool)

(declare-fun res!244167 () Bool)

(assert (=> b!295740 (=> (not res!244167) (not e!211534))))

(assert (=> b!295740 (= res!244167 (and (= (buf!7732 (_2!12995 lt!429873)) (buf!7732 (_2!12996 lt!430371))) (= (size!7669 lt!429869) (size!7669 (_3!1371 lt!430371)))))))

(declare-fun lt!430384 () (_ BitVec 32))

(declare-fun bm!5113 () Bool)

(declare-fun c!13491 () Bool)

(declare-fun lt!430386 () (_ BitVec 32))

(declare-fun lt!430360 () tuple2!23248)

(assert (=> bm!5113 (= call!5117 (arrayBitRangesEq!0 lt!429869 (ite c!13491 (array!17697 (store (arr!8716 lt!429869) lt!430384 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8716 lt!429869) lt!430384)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430386)))) ((_ sign_extend 24) (ite (_1!12995 lt!430360) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430386) #b00000000))))) (size!7669 lt!429869)) lt!429869) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13491 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7669 lt!429869)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!295741 () Bool)

(declare-fun lt!430351 () Unit!20599)

(assert (=> b!295741 (= e!211537 (tuple3!1855 lt!430351 (_2!12996 lt!430365) (_3!1371 lt!430365)))))

(assert (=> b!295741 (= lt!430360 (readBit!0 (_2!12995 lt!429873)))))

(declare-fun lt!430358 () (_ BitVec 32))

(assert (=> b!295741 (= lt!430358 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430352 () (_ BitVec 32))

(assert (=> b!295741 (= lt!430352 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430385 () array!17696)

(assert (=> b!295741 (= lt!430385 (array!17697 (store (arr!8716 lt!429869) lt!430358 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8716 lt!429869) lt!430358)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430352)))) ((_ sign_extend 24) (ite (_1!12995 lt!430360) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!430352) #b00000000))))) (size!7669 lt!429869)))))

(declare-fun lt!430370 () (_ BitVec 64))

(assert (=> b!295741 (= lt!430370 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430382 () (_ BitVec 64))

(assert (=> b!295741 (= lt!430382 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!430363 () Unit!20599)

(assert (=> b!295741 (= lt!430363 (validateOffsetBitsIneqLemma!0 (_2!12995 lt!429873) (_2!12995 lt!430360) lt!430370 lt!430382))))

(assert (=> b!295741 (validate_offset_bits!1 ((_ sign_extend 32) (size!7669 (buf!7732 (_2!12995 lt!430360)))) ((_ sign_extend 32) (currentByte!14241 (_2!12995 lt!430360))) ((_ sign_extend 32) (currentBit!14236 (_2!12995 lt!430360))) (bvsub lt!430370 lt!430382))))

(declare-fun lt!430367 () Unit!20599)

(assert (=> b!295741 (= lt!430367 lt!430363)))

(assert (=> b!295741 (= lt!430365 (readBitsLoop!0 (_2!12995 lt!430360) nBits!523 lt!430385 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!244166 () Bool)

(assert (=> b!295741 (= res!244166 (= (bvsub (bvadd (bitIndex!0 (size!7669 (buf!7732 (_2!12995 lt!429873))) (currentByte!14241 (_2!12995 lt!429873)) (currentBit!14236 (_2!12995 lt!429873))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7669 (buf!7732 (_2!12996 lt!430365))) (currentByte!14241 (_2!12996 lt!430365)) (currentBit!14236 (_2!12996 lt!430365)))))))

(assert (=> b!295741 (=> (not res!244166) (not e!211535))))

(assert (=> b!295741 e!211535))

(declare-fun lt!430368 () Unit!20599)

(declare-fun Unit!20609 () Unit!20599)

(assert (=> b!295741 (= lt!430368 Unit!20609)))

(assert (=> b!295741 (= lt!430384 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295741 (= lt!430386 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!430380 () Unit!20599)

(assert (=> b!295741 (= lt!430380 (arrayBitRangesUpdatedAtLemma!0 lt!429869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12995 lt!430360)))))

(assert (=> b!295741 call!5117))

(declare-fun lt!430359 () Unit!20599)

(assert (=> b!295741 (= lt!430359 lt!430380)))

(declare-fun lt!430362 () (_ BitVec 64))

(assert (=> b!295741 (= lt!430362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!430378 () Unit!20599)

(assert (=> b!295741 (= lt!430378 (arrayBitRangesEqTransitive!0 lt!429869 lt!430385 (_3!1371 lt!430365) lt!430362 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295741 (arrayBitRangesEq!0 lt!429869 (_3!1371 lt!430365) lt!430362 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!430379 () Unit!20599)

(assert (=> b!295741 (= lt!430379 lt!430378)))

(assert (=> b!295741 call!5116))

(declare-fun lt!430377 () Unit!20599)

(declare-fun Unit!20610 () Unit!20599)

(assert (=> b!295741 (= lt!430377 Unit!20610)))

(declare-fun lt!430369 () Unit!20599)

(assert (=> b!295741 (= lt!430369 (arrayBitRangesEqImpliesEq!0 lt!430385 (_3!1371 lt!430365) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!295741 (= (bitAt!0 lt!430385 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1371 lt!430365) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!430357 () Unit!20599)

(assert (=> b!295741 (= lt!430357 lt!430369)))

(declare-fun lt!430381 () Unit!20599)

(declare-fun Unit!20611 () Unit!20599)

(assert (=> b!295741 (= lt!430381 Unit!20611)))

(declare-fun lt!430373 () Bool)

(assert (=> b!295741 (= lt!430373 (= (bitAt!0 (_3!1371 lt!430365) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12995 lt!430360)))))

(declare-fun Unit!20612 () Unit!20599)

(assert (=> b!295741 (= lt!430351 Unit!20612)))

(assert (=> b!295741 lt!430373))

(declare-fun b!295743 () Bool)

(declare-datatypes ((List!985 0))(
  ( (Nil!982) (Cons!981 (h!1100 Bool) (t!1870 List!985)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13342 array!17696 (_ BitVec 64) (_ BitVec 64)) List!985)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13342 BitStream!13342 (_ BitVec 64)) List!985)

(assert (=> b!295743 (= e!211534 (= (byteArrayBitContentToList!0 (_2!12996 lt!430371) (_3!1371 lt!430371) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12996 lt!430371) (_2!12995 lt!429873) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!295743 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!295743 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295744 () Bool)

(declare-fun e!211536 () Bool)

(declare-datatypes ((tuple2!23260 0))(
  ( (tuple2!23261 (_1!13006 BitStream!13342) (_2!13006 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13342) tuple2!23260)

(assert (=> b!295744 (= e!211536 (= (bitAt!0 (_3!1371 lt!430371) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!13006 (readBitPure!0 (_2!12995 lt!429873)))))))

(declare-fun b!295745 () Bool)

(declare-fun res!244165 () Bool)

(assert (=> b!295745 (=> (not res!244165) (not e!211534))))

(assert (=> b!295745 (= res!244165 (arrayBitRangesEq!0 lt!429869 (_3!1371 lt!430371) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun bm!5114 () Bool)

(assert (=> bm!5114 (= call!5116 (arrayBitRangesEq!0 (ite c!13491 lt!429869 lt!430355) (ite c!13491 (_3!1371 lt!430365) lt!430376) (ite c!13491 #b0000000000000000000000000000000000000000000000000000000000000000 lt!430364) (ite c!13491 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!430366)))))

(declare-fun b!295742 () Bool)

(declare-fun res!244171 () Bool)

(assert (=> b!295742 (=> (not res!244171) (not e!211534))))

(assert (=> b!295742 (= res!244171 e!211536)))

(declare-fun res!244168 () Bool)

(assert (=> b!295742 (=> res!244168 e!211536)))

(assert (=> b!295742 (= res!244168 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun d!99650 () Bool)

(assert (=> d!99650 e!211534))

(declare-fun res!244170 () Bool)

(assert (=> d!99650 (=> (not res!244170) (not e!211534))))

(declare-fun lt!430374 () (_ BitVec 64))

(assert (=> d!99650 (= res!244170 (= (bvsub lt!430374 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7669 (buf!7732 (_2!12996 lt!430371))) (currentByte!14241 (_2!12996 lt!430371)) (currentBit!14236 (_2!12996 lt!430371)))))))

(assert (=> d!99650 (or (= (bvand lt!430374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430374 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!430361 () (_ BitVec 64))

(assert (=> d!99650 (= lt!430374 (bvadd lt!430361 to!474))))

(assert (=> d!99650 (or (not (= (bvand lt!430361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!430361 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!430361 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99650 (= lt!430361 (bitIndex!0 (size!7669 (buf!7732 (_2!12995 lt!429873))) (currentByte!14241 (_2!12995 lt!429873)) (currentBit!14236 (_2!12995 lt!429873))))))

(assert (=> d!99650 (= lt!430371 e!211537)))

(assert (=> d!99650 (= c!13491 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!99650 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!99650 (= (readBitsLoop!0 (_2!12995 lt!429873) nBits!523 lt!429869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!430371)))

(assert (= (and d!99650 c!13491) b!295741))

(assert (= (and d!99650 (not c!13491)) b!295738))

(assert (= (and b!295741 res!244166) b!295737))

(assert (= (or b!295741 b!295738) bm!5114))

(assert (= (or b!295741 b!295738) bm!5113))

(assert (= (and d!99650 res!244170) b!295740))

(assert (= (and b!295740 res!244167) b!295745))

(assert (= (and b!295745 res!244165) b!295742))

(assert (= (and b!295742 (not res!244168)) b!295744))

(assert (= (and b!295742 res!244171) b!295739))

(assert (= (and b!295739 res!244169) b!295743))

(declare-fun m!433219 () Bool)

(assert (=> d!99650 m!433219))

(declare-fun m!433221 () Bool)

(assert (=> d!99650 m!433221))

(declare-fun m!433223 () Bool)

(assert (=> bm!5113 m!433223))

(declare-fun m!433225 () Bool)

(assert (=> bm!5113 m!433225))

(declare-fun m!433227 () Bool)

(assert (=> bm!5113 m!433227))

(declare-fun m!433229 () Bool)

(assert (=> bm!5113 m!433229))

(declare-fun m!433231 () Bool)

(assert (=> b!295741 m!433231))

(declare-fun m!433233 () Bool)

(assert (=> b!295741 m!433233))

(declare-fun m!433235 () Bool)

(assert (=> b!295741 m!433235))

(declare-fun m!433237 () Bool)

(assert (=> b!295741 m!433237))

(declare-fun m!433239 () Bool)

(assert (=> b!295741 m!433239))

(declare-fun m!433241 () Bool)

(assert (=> b!295741 m!433241))

(declare-fun m!433243 () Bool)

(assert (=> b!295741 m!433243))

(declare-fun m!433245 () Bool)

(assert (=> b!295741 m!433245))

(declare-fun m!433247 () Bool)

(assert (=> b!295741 m!433247))

(declare-fun m!433249 () Bool)

(assert (=> b!295741 m!433249))

(declare-fun m!433251 () Bool)

(assert (=> b!295741 m!433251))

(declare-fun m!433253 () Bool)

(assert (=> b!295741 m!433253))

(assert (=> b!295741 m!433221))

(declare-fun m!433255 () Bool)

(assert (=> b!295741 m!433255))

(declare-fun m!433257 () Bool)

(assert (=> b!295741 m!433257))

(declare-fun m!433259 () Bool)

(assert (=> b!295745 m!433259))

(declare-fun m!433261 () Bool)

(assert (=> b!295744 m!433261))

(declare-fun m!433263 () Bool)

(assert (=> b!295744 m!433263))

(declare-fun m!433265 () Bool)

(assert (=> bm!5114 m!433265))

(declare-fun m!433267 () Bool)

(assert (=> b!295739 m!433267))

(declare-fun m!433269 () Bool)

(assert (=> b!295738 m!433269))

(declare-fun m!433271 () Bool)

(assert (=> b!295738 m!433271))

(declare-fun m!433273 () Bool)

(assert (=> b!295743 m!433273))

(declare-fun m!433275 () Bool)

(assert (=> b!295743 m!433275))

(assert (=> b!295520 d!99650))

(declare-fun d!99692 () Bool)

(declare-fun e!211538 () Bool)

(assert (=> d!99692 e!211538))

(declare-fun res!244172 () Bool)

(assert (=> d!99692 (=> (not res!244172) (not e!211538))))

(declare-fun lt!430391 () (_ BitVec 64))

(declare-fun lt!430390 () (_ BitVec 64))

(declare-fun lt!430387 () (_ BitVec 64))

(assert (=> d!99692 (= res!244172 (= lt!430387 (bvsub lt!430390 lt!430391)))))

(assert (=> d!99692 (or (= (bvand lt!430390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!430391 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!430390 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!430390 lt!430391) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!99692 (= lt!430391 (remainingBits!0 ((_ sign_extend 32) (size!7669 (buf!7732 (_2!12996 lt!429864)))) ((_ sign_extend 32) (currentByte!14241 (_2!12996 lt!429864))) ((_ sign_extend 32) (currentBit!14236 (_2!12996 lt!429864)))))))

(declare-fun lt!430392 () (_ BitVec 64))

(declare-fun lt!430389 () (_ BitVec 64))

(assert (=> d!99692 (= lt!430390 (bvmul lt!430392 lt!430389))))

(assert (=> d!99692 (or (= lt!430392 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!430389 (bvsdiv (bvmul lt!430392 lt!430389) lt!430392)))))

(assert (=> d!99692 (= lt!430389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!99692 (= lt!430392 ((_ sign_extend 32) (size!7669 (buf!7732 (_2!12996 lt!429864)))))))

(assert (=> d!99692 (= lt!430387 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14241 (_2!12996 lt!429864))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14236 (_2!12996 lt!429864)))))))

(assert (=> d!99692 (invariant!0 (currentBit!14236 (_2!12996 lt!429864)) (currentByte!14241 (_2!12996 lt!429864)) (size!7669 (buf!7732 (_2!12996 lt!429864))))))

(assert (=> d!99692 (= (bitIndex!0 (size!7669 (buf!7732 (_2!12996 lt!429864))) (currentByte!14241 (_2!12996 lt!429864)) (currentBit!14236 (_2!12996 lt!429864))) lt!430387)))

(declare-fun b!295746 () Bool)

(declare-fun res!244173 () Bool)

(assert (=> b!295746 (=> (not res!244173) (not e!211538))))

(assert (=> b!295746 (= res!244173 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!430387))))

(declare-fun b!295747 () Bool)

(declare-fun lt!430388 () (_ BitVec 64))

(assert (=> b!295747 (= e!211538 (bvsle lt!430387 (bvmul lt!430388 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!295747 (or (= lt!430388 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!430388 #b0000000000000000000000000000000000000000000000000000000000001000) lt!430388)))))

(assert (=> b!295747 (= lt!430388 ((_ sign_extend 32) (size!7669 (buf!7732 (_2!12996 lt!429864)))))))

(assert (= (and d!99692 res!244172) b!295746))

(assert (= (and b!295746 res!244173) b!295747))

(declare-fun m!433277 () Bool)

(assert (=> d!99692 m!433277))

(declare-fun m!433279 () Bool)

(assert (=> d!99692 m!433279))

(assert (=> b!295520 d!99692))

(declare-fun d!99694 () Bool)

(assert (=> d!99694 (= (bitAt!0 lt!429869 from!505) (bitAt!0 (_3!1371 lt!429864) from!505))))

(declare-fun lt!430395 () Unit!20599)

(declare-fun choose!31 (array!17696 array!17696 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20599)

(assert (=> d!99694 (= lt!430395 (choose!31 lt!429869 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99694 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99694 (= (arrayBitRangesEqImpliesEq!0 lt!429869 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430395)))

(declare-fun bs!25491 () Bool)

(assert (= bs!25491 d!99694))

(assert (=> bs!25491 m!432867))

(assert (=> bs!25491 m!432869))

(declare-fun m!433281 () Bool)

(assert (=> bs!25491 m!433281))

(assert (=> b!295520 d!99694))

(declare-fun d!99696 () Bool)

(assert (=> d!99696 (arrayBitRangesEq!0 arr!273 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!430398 () Unit!20599)

(declare-fun choose!49 (array!17696 array!17696 array!17696 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20599)

(assert (=> d!99696 (= lt!430398 (choose!49 arr!273 lt!429869 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99696 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!99696 (= (arrayBitRangesEqTransitive!0 arr!273 lt!429869 (_3!1371 lt!429864) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!430398)))

(declare-fun bs!25492 () Bool)

(assert (= bs!25492 d!99696))

(assert (=> bs!25492 m!432865))

(declare-fun m!433283 () Bool)

(assert (=> bs!25492 m!433283))

(assert (=> b!295520 d!99696))

(declare-fun d!99698 () Bool)

(assert (=> d!99698 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7669 (buf!7732 (_2!12995 lt!429873)))) ((_ sign_extend 32) (currentByte!14241 (_2!12995 lt!429873))) ((_ sign_extend 32) (currentBit!14236 (_2!12995 lt!429873))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7669 (buf!7732 (_2!12995 lt!429873)))) ((_ sign_extend 32) (currentByte!14241 (_2!12995 lt!429873))) ((_ sign_extend 32) (currentBit!14236 (_2!12995 lt!429873)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25493 () Bool)

(assert (= bs!25493 d!99698))

(declare-fun m!433285 () Bool)

(assert (=> bs!25493 m!433285))

(assert (=> b!295520 d!99698))

(declare-fun d!99700 () Bool)

(assert (=> d!99700 (= (bitAt!0 lt!429869 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8716 lt!429869) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25494 () Bool)

(assert (= bs!25494 d!99700))

(declare-fun m!433287 () Bool)

(assert (=> bs!25494 m!433287))

(assert (=> bs!25494 m!433033))

(assert (=> b!295520 d!99700))

(declare-fun d!99702 () Bool)

(assert (=> d!99702 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14236 thiss!1728) (currentByte!14241 thiss!1728) (size!7669 (buf!7732 thiss!1728))))))

(declare-fun bs!25495 () Bool)

(assert (= bs!25495 d!99702))

(assert (=> bs!25495 m!433035))

(assert (=> start!65890 d!99702))

(declare-fun d!99704 () Bool)

(assert (=> d!99704 (= (array_inv!7281 arr!273) (bvsge (size!7669 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65890 d!99704))

(declare-fun d!99706 () Bool)

(assert (=> d!99706 (= (array_inv!7281 (buf!7732 thiss!1728)) (bvsge (size!7669 (buf!7732 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!295517 d!99706))

(push 1)

(assert (not d!99648))

(assert (not b!295623))

(assert (not b!295619))

(assert (not b!295626))

(assert (not bm!5113))

(assert (not bm!5114))

(assert (not d!99702))

(assert (not b!295606))

(assert (not d!99698))

(assert (not b!295739))

(assert (not d!99634))

(assert (not b!295598))

(assert (not bm!5096))

(assert (not d!99696))

(assert (not d!99650))

(assert (not d!99644))

(assert (not d!99692))

(assert (not b!295599))

(assert (not b!295745))

(assert (not bm!5097))

(assert (not b!295610))

(assert (not d!99640))

(assert (not b!295743))

(assert (not b!295603))

(assert (not b!295738))

(assert (not b!295618))

(assert (not b!295744))

(assert (not b!295741))

(assert (not d!99638))

(assert (not d!99694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

