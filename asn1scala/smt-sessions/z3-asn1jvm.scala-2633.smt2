; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64950 () Bool)

(assert start!64950)

(declare-datatypes ((array!17314 0))(
  ( (array!17315 (arr!8516 (Array (_ BitVec 32) (_ BitVec 8))) (size!7496 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13002 0))(
  ( (BitStream!13003 (buf!7562 array!17314) (currentByte!13996 (_ BitVec 32)) (currentBit!13991 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!20269 0))(
  ( (Unit!20270) )
))
(declare-datatypes ((tuple3!1736 0))(
  ( (tuple3!1737 (_1!12757 Unit!20269) (_2!12757 BitStream!13002) (_3!1291 array!17314)) )
))
(declare-fun lt!423815 () tuple3!1736)

(declare-fun thiss!1728 () BitStream!13002)

(declare-fun e!207879 () Bool)

(declare-fun b!291620 () Bool)

(declare-fun arr!273 () array!17314)

(assert (=> b!291620 (= e!207879 (and (= (buf!7562 thiss!1728) (buf!7562 (_2!12757 lt!423815))) (= (size!7496 arr!273) (size!7496 (_3!1291 lt!423815)))))))

(declare-fun b!291621 () Bool)

(declare-fun res!240917 () Bool)

(declare-fun e!207877 () Bool)

(assert (=> b!291621 (=> res!240917 e!207877)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291621 (= res!240917 (not (invariant!0 (currentBit!13991 (_2!12757 lt!423815)) (currentByte!13996 (_2!12757 lt!423815)) (size!7496 (buf!7562 (_2!12757 lt!423815))))))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun b!291622 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291622 (= e!207877 (validate_offset_bits!1 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))) ((_ sign_extend 32) (currentByte!13996 thiss!1728)) ((_ sign_extend 32) (currentBit!13991 thiss!1728)) (bvsub to!474 from!505)))))

(declare-fun b!291623 () Bool)

(declare-fun res!240920 () Bool)

(declare-fun e!207875 () Bool)

(assert (=> b!291623 (=> (not res!240920) (not e!207875))))

(assert (=> b!291623 (= res!240920 (bvslt from!505 to!474))))

(declare-fun b!291624 () Bool)

(declare-fun res!240914 () Bool)

(assert (=> b!291624 (=> (not res!240914) (not e!207875))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> b!291624 (= res!240914 (validate_offset_bits!1 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))) ((_ sign_extend 32) (currentByte!13996 thiss!1728)) ((_ sign_extend 32) (currentBit!13991 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291625 () Bool)

(assert (=> b!291625 (= e!207875 (not e!207877))))

(declare-fun res!240916 () Bool)

(assert (=> b!291625 (=> res!240916 e!207877)))

(declare-fun lt!423814 () Bool)

(declare-datatypes ((tuple2!22932 0))(
  ( (tuple2!22933 (_1!12758 BitStream!13002) (_2!12758 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13002) tuple2!22932)

(assert (=> b!291625 (= res!240916 (not (= lt!423814 (_2!12758 (readBitPure!0 thiss!1728)))))))

(declare-fun e!207878 () Bool)

(assert (=> b!291625 e!207878))

(declare-fun res!240915 () Bool)

(assert (=> b!291625 (=> (not res!240915) (not e!207878))))

(declare-fun lt!423817 () array!17314)

(declare-fun bitAt!0 (array!17314 (_ BitVec 64)) Bool)

(assert (=> b!291625 (= res!240915 (= (bitAt!0 lt!423817 from!505) lt!423814))))

(assert (=> b!291625 (= lt!423814 (bitAt!0 (_3!1291 lt!423815) from!505))))

(declare-fun lt!423818 () Unit!20269)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17314 array!17314 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20269)

(assert (=> b!291625 (= lt!423818 (arrayBitRangesEqImpliesEq!0 lt!423817 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arrayBitRangesEq!0 (array!17314 array!17314 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291625 (arrayBitRangesEq!0 arr!273 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423820 () Unit!20269)

(declare-fun arrayBitRangesEqTransitive!0 (array!17314 array!17314 array!17314 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20269)

(assert (=> b!291625 (= lt!423820 (arrayBitRangesEqTransitive!0 arr!273 lt!423817 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291625 (arrayBitRangesEq!0 arr!273 lt!423817 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423822 () Unit!20269)

(declare-datatypes ((tuple2!22934 0))(
  ( (tuple2!22935 (_1!12759 Bool) (_2!12759 BitStream!13002)) )
))
(declare-fun lt!423819 () tuple2!22934)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17314 (_ BitVec 64) Bool) Unit!20269)

(assert (=> b!291625 (= lt!423822 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12759 lt!423819)))))

(assert (=> b!291625 e!207879))

(declare-fun res!240919 () Bool)

(assert (=> b!291625 (=> (not res!240919) (not e!207879))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291625 (= res!240919 (= (bvsub (bvadd (bitIndex!0 (size!7496 (buf!7562 thiss!1728)) (currentByte!13996 thiss!1728) (currentBit!13991 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7496 (buf!7562 (_2!12757 lt!423815))) (currentByte!13996 (_2!12757 lt!423815)) (currentBit!13991 (_2!12757 lt!423815)))))))

(declare-fun readBitsLoop!0 (BitStream!13002 (_ BitVec 64) array!17314 (_ BitVec 64) (_ BitVec 64)) tuple3!1736)

(assert (=> b!291625 (= lt!423815 (readBitsLoop!0 (_2!12759 lt!423819) nBits!523 lt!423817 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291625 (validate_offset_bits!1 ((_ sign_extend 32) (size!7496 (buf!7562 (_2!12759 lt!423819)))) ((_ sign_extend 32) (currentByte!13996 (_2!12759 lt!423819))) ((_ sign_extend 32) (currentBit!13991 (_2!12759 lt!423819))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423816 () Unit!20269)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13002 BitStream!13002 (_ BitVec 64) (_ BitVec 64)) Unit!20269)

(assert (=> b!291625 (= lt!423816 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12759 lt!423819) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423821 () (_ BitVec 32))

(declare-fun lt!423813 () (_ BitVec 32))

(assert (=> b!291625 (= lt!423817 (array!17315 (store (arr!8516 arr!273) lt!423813 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8516 arr!273) lt!423813)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423821)))) ((_ sign_extend 24) (ite (_1!12759 lt!423819) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423821) #b00000000))))) (size!7496 arr!273)))))

(assert (=> b!291625 (= lt!423821 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291625 (= lt!423813 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13002) tuple2!22934)

(assert (=> b!291625 (= lt!423819 (readBit!0 thiss!1728))))

(declare-fun b!291626 () Bool)

(declare-fun e!207876 () Bool)

(declare-fun array_inv!7108 (array!17314) Bool)

(assert (=> b!291626 (= e!207876 (array_inv!7108 (buf!7562 thiss!1728)))))

(declare-fun b!291627 () Bool)

(assert (=> b!291627 (= e!207878 (= lt!423814 (_1!12759 lt!423819)))))

(declare-fun res!240918 () Bool)

(assert (=> start!64950 (=> (not res!240918) (not e!207875))))

(assert (=> start!64950 (= res!240918 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7496 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64950 e!207875))

(declare-fun inv!12 (BitStream!13002) Bool)

(assert (=> start!64950 (and (inv!12 thiss!1728) e!207876)))

(assert (=> start!64950 true))

(assert (=> start!64950 (array_inv!7108 arr!273)))

(assert (= (and start!64950 res!240918) b!291624))

(assert (= (and b!291624 res!240914) b!291623))

(assert (= (and b!291623 res!240920) b!291625))

(assert (= (and b!291625 res!240919) b!291620))

(assert (= (and b!291625 res!240915) b!291627))

(assert (= (and b!291625 (not res!240916)) b!291621))

(assert (= (and b!291621 (not res!240917)) b!291622))

(assert (= start!64950 b!291626))

(declare-fun m!426833 () Bool)

(assert (=> b!291622 m!426833))

(declare-fun m!426835 () Bool)

(assert (=> b!291626 m!426835))

(declare-fun m!426837 () Bool)

(assert (=> b!291624 m!426837))

(declare-fun m!426839 () Bool)

(assert (=> start!64950 m!426839))

(declare-fun m!426841 () Bool)

(assert (=> start!64950 m!426841))

(declare-fun m!426843 () Bool)

(assert (=> b!291621 m!426843))

(declare-fun m!426845 () Bool)

(assert (=> b!291625 m!426845))

(declare-fun m!426847 () Bool)

(assert (=> b!291625 m!426847))

(declare-fun m!426849 () Bool)

(assert (=> b!291625 m!426849))

(declare-fun m!426851 () Bool)

(assert (=> b!291625 m!426851))

(declare-fun m!426853 () Bool)

(assert (=> b!291625 m!426853))

(declare-fun m!426855 () Bool)

(assert (=> b!291625 m!426855))

(declare-fun m!426857 () Bool)

(assert (=> b!291625 m!426857))

(declare-fun m!426859 () Bool)

(assert (=> b!291625 m!426859))

(declare-fun m!426861 () Bool)

(assert (=> b!291625 m!426861))

(declare-fun m!426863 () Bool)

(assert (=> b!291625 m!426863))

(declare-fun m!426865 () Bool)

(assert (=> b!291625 m!426865))

(declare-fun m!426867 () Bool)

(assert (=> b!291625 m!426867))

(declare-fun m!426869 () Bool)

(assert (=> b!291625 m!426869))

(declare-fun m!426871 () Bool)

(assert (=> b!291625 m!426871))

(declare-fun m!426873 () Bool)

(assert (=> b!291625 m!426873))

(declare-fun m!426875 () Bool)

(assert (=> b!291625 m!426875))

(declare-fun m!426877 () Bool)

(assert (=> b!291625 m!426877))

(check-sat (not b!291624) (not b!291622) (not start!64950) (not b!291626) (not b!291625) (not b!291621))
(check-sat)
(get-model)

(declare-fun d!98692 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98692 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7496 (buf!7562 (_2!12759 lt!423819)))) ((_ sign_extend 32) (currentByte!13996 (_2!12759 lt!423819))) ((_ sign_extend 32) (currentBit!13991 (_2!12759 lt!423819))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7496 (buf!7562 (_2!12759 lt!423819)))) ((_ sign_extend 32) (currentByte!13996 (_2!12759 lt!423819))) ((_ sign_extend 32) (currentBit!13991 (_2!12759 lt!423819)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25155 () Bool)

(assert (= bs!25155 d!98692))

(declare-fun m!426925 () Bool)

(assert (=> bs!25155 m!426925))

(assert (=> b!291625 d!98692))

(declare-fun d!98694 () Bool)

(assert (=> d!98694 (= (bitAt!0 lt!423817 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8516 lt!423817) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25156 () Bool)

(assert (= bs!25156 d!98694))

(declare-fun m!426927 () Bool)

(assert (=> bs!25156 m!426927))

(declare-fun m!426929 () Bool)

(assert (=> bs!25156 m!426929))

(assert (=> b!291625 d!98694))

(declare-fun b!291711 () Bool)

(declare-fun res!240988 () Bool)

(declare-fun e!207944 () Bool)

(assert (=> b!291711 (=> (not res!240988) (not e!207944))))

(declare-fun lt!424002 () tuple3!1736)

(assert (=> b!291711 (= res!240988 (arrayBitRangesEq!0 lt!423817 (_3!1291 lt!424002) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun b!291712 () Bool)

(declare-fun e!207943 () tuple3!1736)

(declare-fun lt!423970 () Unit!20269)

(declare-fun lt!423972 () tuple3!1736)

(assert (=> b!291712 (= e!207943 (tuple3!1737 lt!423970 (_2!12757 lt!423972) (_3!1291 lt!423972)))))

(declare-fun lt!423977 () tuple2!22934)

(assert (=> b!291712 (= lt!423977 (readBit!0 (_2!12759 lt!423819)))))

(declare-fun lt!423988 () (_ BitVec 32))

(assert (=> b!291712 (= lt!423988 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423983 () (_ BitVec 32))

(assert (=> b!291712 (= lt!423983 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424005 () array!17314)

(assert (=> b!291712 (= lt!424005 (array!17315 (store (arr!8516 lt!423817) lt!423988 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8516 lt!423817) lt!423988)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423983)))) ((_ sign_extend 24) (ite (_1!12759 lt!423977) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423983) #b00000000))))) (size!7496 lt!423817)))))

(declare-fun lt!424001 () (_ BitVec 64))

(assert (=> b!291712 (= lt!424001 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!423979 () (_ BitVec 64))

(assert (=> b!291712 (= lt!423979 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!423971 () Unit!20269)

(assert (=> b!291712 (= lt!423971 (validateOffsetBitsIneqLemma!0 (_2!12759 lt!423819) (_2!12759 lt!423977) lt!424001 lt!423979))))

(assert (=> b!291712 (validate_offset_bits!1 ((_ sign_extend 32) (size!7496 (buf!7562 (_2!12759 lt!423977)))) ((_ sign_extend 32) (currentByte!13996 (_2!12759 lt!423977))) ((_ sign_extend 32) (currentBit!13991 (_2!12759 lt!423977))) (bvsub lt!424001 lt!423979))))

(declare-fun lt!424000 () Unit!20269)

(assert (=> b!291712 (= lt!424000 lt!423971)))

(assert (=> b!291712 (= lt!423972 (readBitsLoop!0 (_2!12759 lt!423977) nBits!523 lt!424005 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!240991 () Bool)

(assert (=> b!291712 (= res!240991 (= (bvsub (bvadd (bitIndex!0 (size!7496 (buf!7562 (_2!12759 lt!423819))) (currentByte!13996 (_2!12759 lt!423819)) (currentBit!13991 (_2!12759 lt!423819))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7496 (buf!7562 (_2!12757 lt!423972))) (currentByte!13996 (_2!12757 lt!423972)) (currentBit!13991 (_2!12757 lt!423972)))))))

(declare-fun e!207942 () Bool)

(assert (=> b!291712 (=> (not res!240991) (not e!207942))))

(assert (=> b!291712 e!207942))

(declare-fun lt!423989 () Unit!20269)

(declare-fun Unit!20273 () Unit!20269)

(assert (=> b!291712 (= lt!423989 Unit!20273)))

(declare-fun lt!423991 () (_ BitVec 32))

(assert (=> b!291712 (= lt!423991 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423978 () (_ BitVec 32))

(assert (=> b!291712 (= lt!423978 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!423981 () Unit!20269)

(assert (=> b!291712 (= lt!423981 (arrayBitRangesUpdatedAtLemma!0 lt!423817 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12759 lt!423977)))))

(assert (=> b!291712 (arrayBitRangesEq!0 lt!423817 (array!17315 (store (arr!8516 lt!423817) lt!423991 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8516 lt!423817) lt!423991)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423978)))) ((_ sign_extend 24) (ite (_1!12759 lt!423977) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423978) #b00000000))))) (size!7496 lt!423817)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!423996 () Unit!20269)

(assert (=> b!291712 (= lt!423996 lt!423981)))

(declare-fun lt!423999 () (_ BitVec 64))

(assert (=> b!291712 (= lt!423999 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423995 () Unit!20269)

(assert (=> b!291712 (= lt!423995 (arrayBitRangesEqTransitive!0 lt!423817 lt!424005 (_3!1291 lt!423972) lt!423999 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun call!4889 () Bool)

(assert (=> b!291712 call!4889))

(declare-fun lt!423980 () Unit!20269)

(assert (=> b!291712 (= lt!423980 lt!423995)))

(declare-fun call!4890 () Bool)

(assert (=> b!291712 call!4890))

(declare-fun lt!423974 () Unit!20269)

(declare-fun Unit!20274 () Unit!20269)

(assert (=> b!291712 (= lt!423974 Unit!20274)))

(declare-fun lt!423987 () Unit!20269)

(assert (=> b!291712 (= lt!423987 (arrayBitRangesEqImpliesEq!0 lt!424005 (_3!1291 lt!423972) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291712 (= (bitAt!0 lt!424005 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1291 lt!423972) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!423985 () Unit!20269)

(assert (=> b!291712 (= lt!423985 lt!423987)))

(declare-fun lt!423975 () Unit!20269)

(declare-fun Unit!20275 () Unit!20269)

(assert (=> b!291712 (= lt!423975 Unit!20275)))

(declare-fun lt!423982 () Bool)

(assert (=> b!291712 (= lt!423982 (= (bitAt!0 (_3!1291 lt!423972) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12759 lt!423977)))))

(declare-fun Unit!20276 () Unit!20269)

(assert (=> b!291712 (= lt!423970 Unit!20276)))

(assert (=> b!291712 lt!423982))

(declare-fun lt!423973 () array!17314)

(declare-fun lt!424003 () (_ BitVec 64))

(declare-fun c!13330 () Bool)

(declare-fun lt!423976 () array!17314)

(declare-fun lt!424004 () (_ BitVec 64))

(declare-fun bm!4886 () Bool)

(assert (=> bm!4886 (= call!4890 (arrayBitRangesEq!0 (ite c!13330 lt!423817 lt!423973) (ite c!13330 (_3!1291 lt!423972) lt!423976) (ite c!13330 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424003) (ite c!13330 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!424004)))))

(declare-fun b!291713 () Bool)

(assert (=> b!291713 (= e!207942 (and (= (buf!7562 (_2!12759 lt!423819)) (buf!7562 (_2!12757 lt!423972))) (= (size!7496 lt!423817) (size!7496 (_3!1291 lt!423972)))))))

(declare-fun lt!423993 () Unit!20269)

(declare-fun b!291714 () Bool)

(assert (=> b!291714 (= e!207943 (tuple3!1737 lt!423993 (_2!12759 lt!423819) lt!423817))))

(declare-fun lt!423998 () Unit!20269)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17314) Unit!20269)

(assert (=> b!291714 (= lt!423998 (arrayBitRangesEqReflexiveLemma!0 lt!423817))))

(assert (=> b!291714 call!4889))

(declare-fun lt!423992 () Unit!20269)

(assert (=> b!291714 (= lt!423992 lt!423998)))

(assert (=> b!291714 (= lt!423973 lt!423817)))

(assert (=> b!291714 (= lt!423976 lt!423817)))

(declare-fun lt!423997 () (_ BitVec 64))

(assert (=> b!291714 (= lt!423997 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!423990 () (_ BitVec 64))

(assert (=> b!291714 (= lt!423990 ((_ sign_extend 32) (size!7496 lt!423817)))))

(declare-fun lt!423986 () (_ BitVec 64))

(assert (=> b!291714 (= lt!423986 (bvmul lt!423990 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!291714 (= lt!424003 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!291714 (= lt!424004 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17314 array!17314 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20269)

(assert (=> b!291714 (= lt!423993 (arrayBitRangesEqSlicedLemma!0 lt!423973 lt!423976 lt!423997 lt!423986 lt!424003 lt!424004))))

(assert (=> b!291714 call!4890))

(declare-fun b!291715 () Bool)

(declare-fun res!240989 () Bool)

(assert (=> b!291715 (=> (not res!240989) (not e!207944))))

(assert (=> b!291715 (= res!240989 (invariant!0 (currentBit!13991 (_2!12757 lt!424002)) (currentByte!13996 (_2!12757 lt!424002)) (size!7496 (buf!7562 (_2!12757 lt!424002)))))))

(declare-fun b!291716 () Bool)

(declare-fun e!207945 () Bool)

(assert (=> b!291716 (= e!207945 (= (bitAt!0 (_3!1291 lt!424002) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12758 (readBitPure!0 (_2!12759 lt!423819)))))))

(declare-fun bm!4887 () Bool)

(assert (=> bm!4887 (= call!4889 (arrayBitRangesEq!0 lt!423817 (ite c!13330 (_3!1291 lt!423972) lt!423817) (ite c!13330 lt!423999 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!13330 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7496 lt!423817)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!291717 () Bool)

(declare-fun res!240993 () Bool)

(assert (=> b!291717 (=> (not res!240993) (not e!207944))))

(assert (=> b!291717 (= res!240993 (and (= (buf!7562 (_2!12759 lt!423819)) (buf!7562 (_2!12757 lt!424002))) (= (size!7496 lt!423817) (size!7496 (_3!1291 lt!424002)))))))

(declare-fun d!98696 () Bool)

(assert (=> d!98696 e!207944))

(declare-fun res!240990 () Bool)

(assert (=> d!98696 (=> (not res!240990) (not e!207944))))

(declare-fun lt!423984 () (_ BitVec 64))

(assert (=> d!98696 (= res!240990 (= (bvsub lt!423984 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7496 (buf!7562 (_2!12757 lt!424002))) (currentByte!13996 (_2!12757 lt!424002)) (currentBit!13991 (_2!12757 lt!424002)))))))

(assert (=> d!98696 (or (= (bvand lt!423984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423984 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423994 () (_ BitVec 64))

(assert (=> d!98696 (= lt!423984 (bvadd lt!423994 to!474))))

(assert (=> d!98696 (or (not (= (bvand lt!423994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!423994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!423994 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98696 (= lt!423994 (bitIndex!0 (size!7496 (buf!7562 (_2!12759 lt!423819))) (currentByte!13996 (_2!12759 lt!423819)) (currentBit!13991 (_2!12759 lt!423819))))))

(assert (=> d!98696 (= lt!424002 e!207943)))

(assert (=> d!98696 (= c!13330 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98696 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98696 (= (readBitsLoop!0 (_2!12759 lt!423819) nBits!523 lt!423817 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!424002)))

(declare-fun b!291718 () Bool)

(declare-datatypes ((List!964 0))(
  ( (Nil!961) (Cons!960 (h!1079 Bool) (t!1849 List!964)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13002 array!17314 (_ BitVec 64) (_ BitVec 64)) List!964)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13002 BitStream!13002 (_ BitVec 64)) List!964)

(assert (=> b!291718 (= e!207944 (= (byteArrayBitContentToList!0 (_2!12757 lt!424002) (_3!1291 lt!424002) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12757 lt!424002) (_2!12759 lt!423819) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!291718 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291718 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291719 () Bool)

(declare-fun res!240992 () Bool)

(assert (=> b!291719 (=> (not res!240992) (not e!207944))))

(assert (=> b!291719 (= res!240992 e!207945)))

(declare-fun res!240994 () Bool)

(assert (=> b!291719 (=> res!240994 e!207945)))

(assert (=> b!291719 (= res!240994 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(assert (= (and d!98696 c!13330) b!291712))

(assert (= (and d!98696 (not c!13330)) b!291714))

(assert (= (and b!291712 res!240991) b!291713))

(assert (= (or b!291712 b!291714) bm!4886))

(assert (= (or b!291712 b!291714) bm!4887))

(assert (= (and d!98696 res!240990) b!291717))

(assert (= (and b!291717 res!240993) b!291711))

(assert (= (and b!291711 res!240988) b!291719))

(assert (= (and b!291719 (not res!240994)) b!291716))

(assert (= (and b!291719 res!240992) b!291715))

(assert (= (and b!291715 res!240989) b!291718))

(declare-fun m!426985 () Bool)

(assert (=> d!98696 m!426985))

(declare-fun m!426987 () Bool)

(assert (=> d!98696 m!426987))

(declare-fun m!426989 () Bool)

(assert (=> b!291715 m!426989))

(declare-fun m!426991 () Bool)

(assert (=> b!291718 m!426991))

(declare-fun m!426993 () Bool)

(assert (=> b!291718 m!426993))

(declare-fun m!426995 () Bool)

(assert (=> b!291716 m!426995))

(declare-fun m!426997 () Bool)

(assert (=> b!291716 m!426997))

(declare-fun m!426999 () Bool)

(assert (=> b!291711 m!426999))

(declare-fun m!427001 () Bool)

(assert (=> b!291714 m!427001))

(declare-fun m!427003 () Bool)

(assert (=> b!291714 m!427003))

(declare-fun m!427005 () Bool)

(assert (=> bm!4886 m!427005))

(declare-fun m!427007 () Bool)

(assert (=> b!291712 m!427007))

(declare-fun m!427009 () Bool)

(assert (=> b!291712 m!427009))

(declare-fun m!427011 () Bool)

(assert (=> b!291712 m!427011))

(declare-fun m!427013 () Bool)

(assert (=> b!291712 m!427013))

(declare-fun m!427015 () Bool)

(assert (=> b!291712 m!427015))

(declare-fun m!427017 () Bool)

(assert (=> b!291712 m!427017))

(declare-fun m!427019 () Bool)

(assert (=> b!291712 m!427019))

(declare-fun m!427021 () Bool)

(assert (=> b!291712 m!427021))

(declare-fun m!427023 () Bool)

(assert (=> b!291712 m!427023))

(declare-fun m!427025 () Bool)

(assert (=> b!291712 m!427025))

(declare-fun m!427027 () Bool)

(assert (=> b!291712 m!427027))

(declare-fun m!427029 () Bool)

(assert (=> b!291712 m!427029))

(declare-fun m!427031 () Bool)

(assert (=> b!291712 m!427031))

(assert (=> b!291712 m!426987))

(declare-fun m!427033 () Bool)

(assert (=> b!291712 m!427033))

(declare-fun m!427035 () Bool)

(assert (=> b!291712 m!427035))

(declare-fun m!427037 () Bool)

(assert (=> b!291712 m!427037))

(declare-fun m!427039 () Bool)

(assert (=> b!291712 m!427039))

(declare-fun m!427041 () Bool)

(assert (=> bm!4887 m!427041))

(assert (=> b!291625 d!98696))

(declare-fun d!98724 () Bool)

(declare-fun e!207952 () Bool)

(assert (=> d!98724 e!207952))

(declare-fun res!241002 () Bool)

(assert (=> d!98724 (=> (not res!241002) (not e!207952))))

(declare-fun lt!424087 () (_ BitVec 64))

(declare-fun lt!424089 () (_ BitVec 64))

(declare-fun lt!424090 () (_ BitVec 64))

(assert (=> d!98724 (= res!241002 (= lt!424087 (bvsub lt!424089 lt!424090)))))

(assert (=> d!98724 (or (= (bvand lt!424089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!424090 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!424089 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!424089 lt!424090) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98724 (= lt!424090 (remainingBits!0 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))) ((_ sign_extend 32) (currentByte!13996 thiss!1728)) ((_ sign_extend 32) (currentBit!13991 thiss!1728))))))

(declare-fun lt!424091 () (_ BitVec 64))

(declare-fun lt!424088 () (_ BitVec 64))

(assert (=> d!98724 (= lt!424089 (bvmul lt!424091 lt!424088))))

(assert (=> d!98724 (or (= lt!424091 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!424088 (bvsdiv (bvmul lt!424091 lt!424088) lt!424091)))))

(assert (=> d!98724 (= lt!424088 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98724 (= lt!424091 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))))))

(assert (=> d!98724 (= lt!424087 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13996 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13991 thiss!1728))))))

(assert (=> d!98724 (invariant!0 (currentBit!13991 thiss!1728) (currentByte!13996 thiss!1728) (size!7496 (buf!7562 thiss!1728)))))

(assert (=> d!98724 (= (bitIndex!0 (size!7496 (buf!7562 thiss!1728)) (currentByte!13996 thiss!1728) (currentBit!13991 thiss!1728)) lt!424087)))

(declare-fun b!291730 () Bool)

(declare-fun res!241001 () Bool)

(assert (=> b!291730 (=> (not res!241001) (not e!207952))))

(assert (=> b!291730 (= res!241001 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!424087))))

(declare-fun b!291731 () Bool)

(declare-fun lt!424086 () (_ BitVec 64))

(assert (=> b!291731 (= e!207952 (bvsle lt!424087 (bvmul lt!424086 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291731 (or (= lt!424086 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424086 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424086)))))

(assert (=> b!291731 (= lt!424086 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))))))

(assert (= (and d!98724 res!241002) b!291730))

(assert (= (and b!291730 res!241001) b!291731))

(declare-fun m!427043 () Bool)

(assert (=> d!98724 m!427043))

(declare-fun m!427045 () Bool)

(assert (=> d!98724 m!427045))

(assert (=> b!291625 d!98724))

(declare-fun d!98726 () Bool)

(assert (=> d!98726 (= (bitAt!0 (_3!1291 lt!423815) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8516 (_3!1291 lt!423815)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25161 () Bool)

(assert (= bs!25161 d!98726))

(declare-fun m!427047 () Bool)

(assert (=> bs!25161 m!427047))

(assert (=> bs!25161 m!426929))

(assert (=> b!291625 d!98726))

(declare-fun d!98728 () Bool)

(assert (=> d!98728 (= (bitAt!0 lt!423817 from!505) (bitAt!0 (_3!1291 lt!423815) from!505))))

(declare-fun lt!424098 () Unit!20269)

(declare-fun choose!31 (array!17314 array!17314 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20269)

(assert (=> d!98728 (= lt!424098 (choose!31 lt!423817 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98728 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98728 (= (arrayBitRangesEqImpliesEq!0 lt!423817 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!424098)))

(declare-fun bs!25162 () Bool)

(assert (= bs!25162 d!98728))

(assert (=> bs!25162 m!426857))

(assert (=> bs!25162 m!426877))

(declare-fun m!427049 () Bool)

(assert (=> bs!25162 m!427049))

(assert (=> b!291625 d!98728))

(declare-fun d!98730 () Bool)

(declare-fun e!207959 () Bool)

(assert (=> d!98730 e!207959))

(declare-fun res!241017 () Bool)

(assert (=> d!98730 (=> (not res!241017) (not e!207959))))

(assert (=> d!98730 (= res!241017 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424101 () Unit!20269)

(declare-fun choose!27 (BitStream!13002 BitStream!13002 (_ BitVec 64) (_ BitVec 64)) Unit!20269)

(assert (=> d!98730 (= lt!424101 (choose!27 thiss!1728 (_2!12759 lt!423819) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98730 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12759 lt!423819) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!424101)))

(declare-fun b!291746 () Bool)

(assert (=> b!291746 (= e!207959 (validate_offset_bits!1 ((_ sign_extend 32) (size!7496 (buf!7562 (_2!12759 lt!423819)))) ((_ sign_extend 32) (currentByte!13996 (_2!12759 lt!423819))) ((_ sign_extend 32) (currentBit!13991 (_2!12759 lt!423819))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98730 res!241017) b!291746))

(declare-fun m!427051 () Bool)

(assert (=> d!98730 m!427051))

(assert (=> b!291746 m!426861))

(assert (=> b!291625 d!98730))

(declare-fun d!98732 () Bool)

(declare-fun lt!424140 () tuple2!22934)

(assert (=> d!98732 (= lt!424140 (readBit!0 thiss!1728))))

(assert (=> d!98732 (= (readBitPure!0 thiss!1728) (tuple2!22933 (_2!12759 lt!424140) (_1!12759 lt!424140)))))

(declare-fun bs!25163 () Bool)

(assert (= bs!25163 d!98732))

(assert (=> bs!25163 m!426875))

(assert (=> b!291625 d!98732))

(declare-fun d!98734 () Bool)

(declare-fun e!207988 () Bool)

(assert (=> d!98734 e!207988))

(declare-fun res!241042 () Bool)

(assert (=> d!98734 (=> (not res!241042) (not e!207988))))

(declare-datatypes ((tuple2!22940 0))(
  ( (tuple2!22941 (_1!12764 Unit!20269) (_2!12764 BitStream!13002)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13002) tuple2!22940)

(assert (=> d!98734 (= res!241042 (= (buf!7562 (_2!12764 (increaseBitIndex!0 thiss!1728))) (buf!7562 thiss!1728)))))

(declare-fun lt!424167 () Bool)

(assert (=> d!98734 (= lt!424167 (not (= (bvand ((_ sign_extend 24) (select (arr!8516 (buf!7562 thiss!1728)) (currentByte!13996 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13991 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424168 () tuple2!22934)

(assert (=> d!98734 (= lt!424168 (tuple2!22935 (not (= (bvand ((_ sign_extend 24) (select (arr!8516 (buf!7562 thiss!1728)) (currentByte!13996 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13991 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12764 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!98734 (validate_offset_bit!0 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))) ((_ sign_extend 32) (currentByte!13996 thiss!1728)) ((_ sign_extend 32) (currentBit!13991 thiss!1728)))))

(assert (=> d!98734 (= (readBit!0 thiss!1728) lt!424168)))

(declare-fun lt!424170 () (_ BitVec 64))

(declare-fun lt!424165 () (_ BitVec 64))

(declare-fun b!291779 () Bool)

(assert (=> b!291779 (= e!207988 (= (bitIndex!0 (size!7496 (buf!7562 (_2!12764 (increaseBitIndex!0 thiss!1728)))) (currentByte!13996 (_2!12764 (increaseBitIndex!0 thiss!1728))) (currentBit!13991 (_2!12764 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!424170 lt!424165)))))

(assert (=> b!291779 (or (not (= (bvand lt!424170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!424165 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!424170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!424170 lt!424165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291779 (= lt!424165 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!291779 (= lt!424170 (bitIndex!0 (size!7496 (buf!7562 thiss!1728)) (currentByte!13996 thiss!1728) (currentBit!13991 thiss!1728)))))

(declare-fun lt!424164 () Bool)

(assert (=> b!291779 (= lt!424164 (not (= (bvand ((_ sign_extend 24) (select (arr!8516 (buf!7562 thiss!1728)) (currentByte!13996 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13991 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424169 () Bool)

(assert (=> b!291779 (= lt!424169 (not (= (bvand ((_ sign_extend 24) (select (arr!8516 (buf!7562 thiss!1728)) (currentByte!13996 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13991 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424166 () Bool)

(assert (=> b!291779 (= lt!424166 (not (= (bvand ((_ sign_extend 24) (select (arr!8516 (buf!7562 thiss!1728)) (currentByte!13996 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13991 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98734 res!241042) b!291779))

(declare-fun m!427135 () Bool)

(assert (=> d!98734 m!427135))

(declare-fun m!427137 () Bool)

(assert (=> d!98734 m!427137))

(declare-fun m!427139 () Bool)

(assert (=> d!98734 m!427139))

(declare-fun m!427141 () Bool)

(assert (=> d!98734 m!427141))

(assert (=> b!291779 m!426851))

(declare-fun m!427143 () Bool)

(assert (=> b!291779 m!427143))

(assert (=> b!291779 m!427137))

(assert (=> b!291779 m!427139))

(assert (=> b!291779 m!427135))

(assert (=> b!291625 d!98734))

(declare-fun d!98746 () Bool)

(declare-fun e!207994 () Bool)

(assert (=> d!98746 e!207994))

(declare-fun res!241048 () Bool)

(assert (=> d!98746 (=> (not res!241048) (not e!207994))))

(declare-fun lt!424193 () (_ BitVec 32))

(assert (=> d!98746 (= res!241048 (and (bvsge lt!424193 #b00000000000000000000000000000000) (bvslt lt!424193 (size!7496 arr!273))))))

(declare-fun lt!424191 () (_ BitVec 8))

(declare-fun lt!424192 () Unit!20269)

(declare-fun lt!424194 () (_ BitVec 32))

(declare-fun choose!53 (array!17314 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20269)

(assert (=> d!98746 (= lt!424192 (choose!53 arr!273 from!505 (_1!12759 lt!423819) lt!424193 lt!424194 lt!424191))))

(assert (=> d!98746 (= lt!424191 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8516 arr!273) lt!424193)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424194)))) ((_ sign_extend 24) (ite (_1!12759 lt!423819) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424194) #b00000000)))))))

(assert (=> d!98746 (= lt!424194 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98746 (= lt!424193 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98746 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12759 lt!423819)) lt!424192)))

(declare-fun b!291787 () Bool)

(assert (=> b!291787 (= e!207994 (arrayBitRangesEq!0 arr!273 (array!17315 (store (arr!8516 arr!273) lt!424193 lt!424191) (size!7496 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98746 res!241048) b!291787))

(declare-fun m!427155 () Bool)

(assert (=> d!98746 m!427155))

(declare-fun m!427157 () Bool)

(assert (=> d!98746 m!427157))

(declare-fun m!427159 () Bool)

(assert (=> d!98746 m!427159))

(declare-fun m!427161 () Bool)

(assert (=> b!291787 m!427161))

(declare-fun m!427163 () Bool)

(assert (=> b!291787 m!427163))

(assert (=> b!291625 d!98746))

(declare-fun b!291831 () Bool)

(declare-fun res!241084 () Bool)

(declare-fun lt!424307 () (_ BitVec 32))

(assert (=> b!291831 (= res!241084 (= lt!424307 #b00000000000000000000000000000000))))

(declare-fun e!208023 () Bool)

(assert (=> b!291831 (=> res!241084 e!208023)))

(declare-fun e!208024 () Bool)

(assert (=> b!291831 (= e!208024 e!208023)))

(declare-fun b!291832 () Bool)

(declare-fun e!208022 () Bool)

(declare-fun call!4906 () Bool)

(assert (=> b!291832 (= e!208022 call!4906)))

(declare-fun c!13341 () Bool)

(declare-fun lt!424308 () (_ BitVec 32))

(declare-fun bm!4903 () Bool)

(declare-datatypes ((tuple4!850 0))(
  ( (tuple4!851 (_1!12766 (_ BitVec 32)) (_2!12766 (_ BitVec 32)) (_3!1295 (_ BitVec 32)) (_4!425 (_ BitVec 32))) )
))
(declare-fun lt!424306 () tuple4!850)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4903 (= call!4906 (byteRangesEq!0 (ite c!13341 (select (arr!8516 arr!273) (_3!1295 lt!424306)) (select (arr!8516 arr!273) (_4!425 lt!424306))) (ite c!13341 (select (arr!8516 (_3!1291 lt!423815)) (_3!1295 lt!424306)) (select (arr!8516 (_3!1291 lt!423815)) (_4!425 lt!424306))) (ite c!13341 lt!424308 #b00000000000000000000000000000000) lt!424307))))

(declare-fun d!98750 () Bool)

(declare-fun res!241088 () Bool)

(declare-fun e!208027 () Bool)

(assert (=> d!98750 (=> res!241088 e!208027)))

(assert (=> d!98750 (= res!241088 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98750 (= (arrayBitRangesEq!0 arr!273 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208027)))

(declare-fun b!291833 () Bool)

(assert (=> b!291833 (= e!208022 e!208024)))

(declare-fun res!241087 () Bool)

(assert (=> b!291833 (= res!241087 (byteRangesEq!0 (select (arr!8516 arr!273) (_3!1295 lt!424306)) (select (arr!8516 (_3!1291 lt!423815)) (_3!1295 lt!424306)) lt!424308 #b00000000000000000000000000001000))))

(assert (=> b!291833 (=> (not res!241087) (not e!208024))))

(declare-fun b!291834 () Bool)

(assert (=> b!291834 (= e!208023 call!4906)))

(declare-fun b!291835 () Bool)

(declare-fun e!208026 () Bool)

(assert (=> b!291835 (= e!208027 e!208026)))

(declare-fun res!241085 () Bool)

(assert (=> b!291835 (=> (not res!241085) (not e!208026))))

(declare-fun e!208025 () Bool)

(assert (=> b!291835 (= res!241085 e!208025)))

(declare-fun res!241086 () Bool)

(assert (=> b!291835 (=> res!241086 e!208025)))

(assert (=> b!291835 (= res!241086 (bvsge (_1!12766 lt!424306) (_2!12766 lt!424306)))))

(assert (=> b!291835 (= lt!424307 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291835 (= lt!424308 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!850)

(assert (=> b!291835 (= lt!424306 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!291836 () Bool)

(assert (=> b!291836 (= e!208026 e!208022)))

(assert (=> b!291836 (= c!13341 (= (_3!1295 lt!424306) (_4!425 lt!424306)))))

(declare-fun b!291837 () Bool)

(declare-fun arrayRangesEq!1483 (array!17314 array!17314 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291837 (= e!208025 (arrayRangesEq!1483 arr!273 (_3!1291 lt!423815) (_1!12766 lt!424306) (_2!12766 lt!424306)))))

(assert (= (and d!98750 (not res!241088)) b!291835))

(assert (= (and b!291835 (not res!241086)) b!291837))

(assert (= (and b!291835 res!241085) b!291836))

(assert (= (and b!291836 c!13341) b!291832))

(assert (= (and b!291836 (not c!13341)) b!291833))

(assert (= (and b!291833 res!241087) b!291831))

(assert (= (and b!291831 (not res!241084)) b!291834))

(assert (= (or b!291832 b!291834) bm!4903))

(declare-fun m!427171 () Bool)

(assert (=> bm!4903 m!427171))

(declare-fun m!427173 () Bool)

(assert (=> bm!4903 m!427173))

(declare-fun m!427175 () Bool)

(assert (=> bm!4903 m!427175))

(declare-fun m!427177 () Bool)

(assert (=> bm!4903 m!427177))

(declare-fun m!427179 () Bool)

(assert (=> bm!4903 m!427179))

(assert (=> b!291833 m!427173))

(assert (=> b!291833 m!427179))

(assert (=> b!291833 m!427173))

(assert (=> b!291833 m!427179))

(declare-fun m!427181 () Bool)

(assert (=> b!291833 m!427181))

(declare-fun m!427183 () Bool)

(assert (=> b!291835 m!427183))

(declare-fun m!427185 () Bool)

(assert (=> b!291837 m!427185))

(assert (=> b!291625 d!98750))

(declare-fun d!98762 () Bool)

(declare-fun e!208028 () Bool)

(assert (=> d!98762 e!208028))

(declare-fun res!241090 () Bool)

(assert (=> d!98762 (=> (not res!241090) (not e!208028))))

(declare-fun lt!424312 () (_ BitVec 64))

(declare-fun lt!424313 () (_ BitVec 64))

(declare-fun lt!424310 () (_ BitVec 64))

(assert (=> d!98762 (= res!241090 (= lt!424310 (bvsub lt!424312 lt!424313)))))

(assert (=> d!98762 (or (= (bvand lt!424312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!424313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!424312 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!424312 lt!424313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98762 (= lt!424313 (remainingBits!0 ((_ sign_extend 32) (size!7496 (buf!7562 (_2!12757 lt!423815)))) ((_ sign_extend 32) (currentByte!13996 (_2!12757 lt!423815))) ((_ sign_extend 32) (currentBit!13991 (_2!12757 lt!423815)))))))

(declare-fun lt!424314 () (_ BitVec 64))

(declare-fun lt!424311 () (_ BitVec 64))

(assert (=> d!98762 (= lt!424312 (bvmul lt!424314 lt!424311))))

(assert (=> d!98762 (or (= lt!424314 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!424311 (bvsdiv (bvmul lt!424314 lt!424311) lt!424314)))))

(assert (=> d!98762 (= lt!424311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98762 (= lt!424314 ((_ sign_extend 32) (size!7496 (buf!7562 (_2!12757 lt!423815)))))))

(assert (=> d!98762 (= lt!424310 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13996 (_2!12757 lt!423815))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13991 (_2!12757 lt!423815)))))))

(assert (=> d!98762 (invariant!0 (currentBit!13991 (_2!12757 lt!423815)) (currentByte!13996 (_2!12757 lt!423815)) (size!7496 (buf!7562 (_2!12757 lt!423815))))))

(assert (=> d!98762 (= (bitIndex!0 (size!7496 (buf!7562 (_2!12757 lt!423815))) (currentByte!13996 (_2!12757 lt!423815)) (currentBit!13991 (_2!12757 lt!423815))) lt!424310)))

(declare-fun b!291838 () Bool)

(declare-fun res!241089 () Bool)

(assert (=> b!291838 (=> (not res!241089) (not e!208028))))

(assert (=> b!291838 (= res!241089 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!424310))))

(declare-fun b!291839 () Bool)

(declare-fun lt!424309 () (_ BitVec 64))

(assert (=> b!291839 (= e!208028 (bvsle lt!424310 (bvmul lt!424309 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291839 (or (= lt!424309 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424309 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424309)))))

(assert (=> b!291839 (= lt!424309 ((_ sign_extend 32) (size!7496 (buf!7562 (_2!12757 lt!423815)))))))

(assert (= (and d!98762 res!241090) b!291838))

(assert (= (and b!291838 res!241089) b!291839))

(declare-fun m!427187 () Bool)

(assert (=> d!98762 m!427187))

(assert (=> d!98762 m!426843))

(assert (=> b!291625 d!98762))

(declare-fun d!98764 () Bool)

(assert (=> d!98764 (arrayBitRangesEq!0 arr!273 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424353 () Unit!20269)

(declare-fun choose!49 (array!17314 array!17314 array!17314 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20269)

(assert (=> d!98764 (= lt!424353 (choose!49 arr!273 lt!423817 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98764 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98764 (= (arrayBitRangesEqTransitive!0 arr!273 lt!423817 (_3!1291 lt!423815) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!424353)))

(declare-fun bs!25169 () Bool)

(assert (= bs!25169 d!98764))

(assert (=> bs!25169 m!426847))

(declare-fun m!427247 () Bool)

(assert (=> bs!25169 m!427247))

(assert (=> b!291625 d!98764))

(declare-fun b!291849 () Bool)

(declare-fun res!241098 () Bool)

(declare-fun lt!424355 () (_ BitVec 32))

(assert (=> b!291849 (= res!241098 (= lt!424355 #b00000000000000000000000000000000))))

(declare-fun e!208038 () Bool)

(assert (=> b!291849 (=> res!241098 e!208038)))

(declare-fun e!208039 () Bool)

(assert (=> b!291849 (= e!208039 e!208038)))

(declare-fun b!291850 () Bool)

(declare-fun e!208037 () Bool)

(declare-fun call!4909 () Bool)

(assert (=> b!291850 (= e!208037 call!4909)))

(declare-fun lt!424354 () tuple4!850)

(declare-fun bm!4906 () Bool)

(declare-fun lt!424356 () (_ BitVec 32))

(declare-fun c!13343 () Bool)

(assert (=> bm!4906 (= call!4909 (byteRangesEq!0 (ite c!13343 (select (arr!8516 arr!273) (_3!1295 lt!424354)) (select (arr!8516 arr!273) (_4!425 lt!424354))) (ite c!13343 (select (arr!8516 lt!423817) (_3!1295 lt!424354)) (select (arr!8516 lt!423817) (_4!425 lt!424354))) (ite c!13343 lt!424356 #b00000000000000000000000000000000) lt!424355))))

(declare-fun d!98768 () Bool)

(declare-fun res!241102 () Bool)

(declare-fun e!208042 () Bool)

(assert (=> d!98768 (=> res!241102 e!208042)))

(assert (=> d!98768 (= res!241102 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98768 (= (arrayBitRangesEq!0 arr!273 lt!423817 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!208042)))

(declare-fun b!291851 () Bool)

(assert (=> b!291851 (= e!208037 e!208039)))

(declare-fun res!241101 () Bool)

(assert (=> b!291851 (= res!241101 (byteRangesEq!0 (select (arr!8516 arr!273) (_3!1295 lt!424354)) (select (arr!8516 lt!423817) (_3!1295 lt!424354)) lt!424356 #b00000000000000000000000000001000))))

(assert (=> b!291851 (=> (not res!241101) (not e!208039))))

(declare-fun b!291852 () Bool)

(assert (=> b!291852 (= e!208038 call!4909)))

(declare-fun b!291853 () Bool)

(declare-fun e!208041 () Bool)

(assert (=> b!291853 (= e!208042 e!208041)))

(declare-fun res!241099 () Bool)

(assert (=> b!291853 (=> (not res!241099) (not e!208041))))

(declare-fun e!208040 () Bool)

(assert (=> b!291853 (= res!241099 e!208040)))

(declare-fun res!241100 () Bool)

(assert (=> b!291853 (=> res!241100 e!208040)))

(assert (=> b!291853 (= res!241100 (bvsge (_1!12766 lt!424354) (_2!12766 lt!424354)))))

(assert (=> b!291853 (= lt!424355 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291853 (= lt!424356 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291853 (= lt!424354 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun b!291854 () Bool)

(assert (=> b!291854 (= e!208041 e!208037)))

(assert (=> b!291854 (= c!13343 (= (_3!1295 lt!424354) (_4!425 lt!424354)))))

(declare-fun b!291855 () Bool)

(assert (=> b!291855 (= e!208040 (arrayRangesEq!1483 arr!273 lt!423817 (_1!12766 lt!424354) (_2!12766 lt!424354)))))

(assert (= (and d!98768 (not res!241102)) b!291853))

(assert (= (and b!291853 (not res!241100)) b!291855))

(assert (= (and b!291853 res!241099) b!291854))

(assert (= (and b!291854 c!13343) b!291850))

(assert (= (and b!291854 (not c!13343)) b!291851))

(assert (= (and b!291851 res!241101) b!291849))

(assert (= (and b!291849 (not res!241098)) b!291852))

(assert (= (or b!291850 b!291852) bm!4906))

(declare-fun m!427249 () Bool)

(assert (=> bm!4906 m!427249))

(declare-fun m!427251 () Bool)

(assert (=> bm!4906 m!427251))

(declare-fun m!427253 () Bool)

(assert (=> bm!4906 m!427253))

(declare-fun m!427255 () Bool)

(assert (=> bm!4906 m!427255))

(declare-fun m!427257 () Bool)

(assert (=> bm!4906 m!427257))

(assert (=> b!291851 m!427251))

(assert (=> b!291851 m!427257))

(assert (=> b!291851 m!427251))

(assert (=> b!291851 m!427257))

(declare-fun m!427259 () Bool)

(assert (=> b!291851 m!427259))

(assert (=> b!291853 m!427183))

(declare-fun m!427261 () Bool)

(assert (=> b!291855 m!427261))

(assert (=> b!291625 d!98768))

(declare-fun d!98770 () Bool)

(assert (=> d!98770 (= (array_inv!7108 (buf!7562 thiss!1728)) (bvsge (size!7496 (buf!7562 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!291626 d!98770))

(declare-fun d!98772 () Bool)

(assert (=> d!98772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))) ((_ sign_extend 32) (currentByte!13996 thiss!1728)) ((_ sign_extend 32) (currentBit!13991 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))) ((_ sign_extend 32) (currentByte!13996 thiss!1728)) ((_ sign_extend 32) (currentBit!13991 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25170 () Bool)

(assert (= bs!25170 d!98772))

(assert (=> bs!25170 m!427043))

(assert (=> b!291624 d!98772))

(declare-fun d!98774 () Bool)

(assert (=> d!98774 (= (invariant!0 (currentBit!13991 (_2!12757 lt!423815)) (currentByte!13996 (_2!12757 lt!423815)) (size!7496 (buf!7562 (_2!12757 lt!423815)))) (and (bvsge (currentBit!13991 (_2!12757 lt!423815)) #b00000000000000000000000000000000) (bvslt (currentBit!13991 (_2!12757 lt!423815)) #b00000000000000000000000000001000) (bvsge (currentByte!13996 (_2!12757 lt!423815)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13996 (_2!12757 lt!423815)) (size!7496 (buf!7562 (_2!12757 lt!423815)))) (and (= (currentBit!13991 (_2!12757 lt!423815)) #b00000000000000000000000000000000) (= (currentByte!13996 (_2!12757 lt!423815)) (size!7496 (buf!7562 (_2!12757 lt!423815))))))))))

(assert (=> b!291621 d!98774))

(declare-fun d!98780 () Bool)

(assert (=> d!98780 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13991 thiss!1728) (currentByte!13996 thiss!1728) (size!7496 (buf!7562 thiss!1728))))))

(declare-fun bs!25172 () Bool)

(assert (= bs!25172 d!98780))

(assert (=> bs!25172 m!427045))

(assert (=> start!64950 d!98780))

(declare-fun d!98782 () Bool)

(assert (=> d!98782 (= (array_inv!7108 arr!273) (bvsge (size!7496 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64950 d!98782))

(declare-fun d!98784 () Bool)

(assert (=> d!98784 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))) ((_ sign_extend 32) (currentByte!13996 thiss!1728)) ((_ sign_extend 32) (currentBit!13991 thiss!1728)) (bvsub to!474 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7496 (buf!7562 thiss!1728))) ((_ sign_extend 32) (currentByte!13996 thiss!1728)) ((_ sign_extend 32) (currentBit!13991 thiss!1728))) (bvsub to!474 from!505)))))

(declare-fun bs!25174 () Bool)

(assert (= bs!25174 d!98784))

(assert (=> bs!25174 m!427043))

(assert (=> b!291622 d!98784))

(check-sat (not d!98730) (not bm!4903) (not b!291837) (not bm!4906) (not b!291712) (not d!98746) (not b!291711) (not b!291851) (not b!291779) (not b!291715) (not d!98728) (not bm!4886) (not b!291835) (not d!98784) (not b!291853) (not b!291833) (not d!98724) (not d!98764) (not d!98762) (not b!291716) (not b!291714) (not d!98734) (not d!98772) (not d!98696) (not d!98692) (not d!98732) (not b!291855) (not b!291718) (not d!98780) (not bm!4887) (not b!291746) (not b!291787))
(check-sat)
