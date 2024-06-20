; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64948 () Bool)

(assert start!64948)

(declare-fun b!291596 () Bool)

(declare-fun res!240893 () Bool)

(declare-fun e!207857 () Bool)

(assert (=> b!291596 (=> (not res!240893) (not e!207857))))

(declare-datatypes ((array!17312 0))(
  ( (array!17313 (arr!8515 (Array (_ BitVec 32) (_ BitVec 8))) (size!7495 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13000 0))(
  ( (BitStream!13001 (buf!7561 array!17312) (currentByte!13995 (_ BitVec 32)) (currentBit!13990 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13000)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291596 (= res!240893 (validate_offset_bits!1 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))) ((_ sign_extend 32) (currentByte!13995 thiss!1728)) ((_ sign_extend 32) (currentBit!13990 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun e!207853 () Bool)

(declare-fun to!474 () (_ BitVec 64))

(declare-fun b!291597 () Bool)

(assert (=> b!291597 (= e!207853 (validate_offset_bits!1 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))) ((_ sign_extend 32) (currentByte!13995 thiss!1728)) ((_ sign_extend 32) (currentBit!13990 thiss!1728)) (bvsub to!474 from!505)))))

(declare-fun b!291598 () Bool)

(assert (=> b!291598 (= e!207857 (not e!207853))))

(declare-fun res!240897 () Bool)

(assert (=> b!291598 (=> res!240897 e!207853)))

(declare-fun lt!423789 () Bool)

(declare-datatypes ((tuple2!22928 0))(
  ( (tuple2!22929 (_1!12754 BitStream!13000) (_2!12754 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13000) tuple2!22928)

(assert (=> b!291598 (= res!240897 (not (= lt!423789 (_2!12754 (readBitPure!0 thiss!1728)))))))

(declare-fun e!207855 () Bool)

(assert (=> b!291598 e!207855))

(declare-fun res!240896 () Bool)

(assert (=> b!291598 (=> (not res!240896) (not e!207855))))

(declare-fun lt!423790 () array!17312)

(declare-fun bitAt!0 (array!17312 (_ BitVec 64)) Bool)

(assert (=> b!291598 (= res!240896 (= (bitAt!0 lt!423790 from!505) lt!423789))))

(declare-datatypes ((Unit!20267 0))(
  ( (Unit!20268) )
))
(declare-datatypes ((tuple3!1734 0))(
  ( (tuple3!1735 (_1!12755 Unit!20267) (_2!12755 BitStream!13000) (_3!1290 array!17312)) )
))
(declare-fun lt!423791 () tuple3!1734)

(assert (=> b!291598 (= lt!423789 (bitAt!0 (_3!1290 lt!423791) from!505))))

(declare-fun lt!423786 () Unit!20267)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!17312 array!17312 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20267)

(assert (=> b!291598 (= lt!423786 (arrayBitRangesEqImpliesEq!0 lt!423790 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun arr!273 () array!17312)

(declare-fun arrayBitRangesEq!0 (array!17312 array!17312 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291598 (arrayBitRangesEq!0 arr!273 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!423788 () Unit!20267)

(declare-fun arrayBitRangesEqTransitive!0 (array!17312 array!17312 array!17312 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20267)

(assert (=> b!291598 (= lt!423788 (arrayBitRangesEqTransitive!0 arr!273 lt!423790 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> b!291598 (arrayBitRangesEq!0 arr!273 lt!423790 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((tuple2!22930 0))(
  ( (tuple2!22931 (_1!12756 Bool) (_2!12756 BitStream!13000)) )
))
(declare-fun lt!423787 () tuple2!22930)

(declare-fun lt!423784 () Unit!20267)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!17312 (_ BitVec 64) Bool) Unit!20267)

(assert (=> b!291598 (= lt!423784 (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12756 lt!423787)))))

(declare-fun e!207858 () Bool)

(assert (=> b!291598 e!207858))

(declare-fun res!240898 () Bool)

(assert (=> b!291598 (=> (not res!240898) (not e!207858))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!291598 (= res!240898 (= (bvsub (bvadd (bitIndex!0 (size!7495 (buf!7561 thiss!1728)) (currentByte!13995 thiss!1728) (currentBit!13990 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7495 (buf!7561 (_2!12755 lt!423791))) (currentByte!13995 (_2!12755 lt!423791)) (currentBit!13990 (_2!12755 lt!423791)))))))

(declare-fun readBitsLoop!0 (BitStream!13000 (_ BitVec 64) array!17312 (_ BitVec 64) (_ BitVec 64)) tuple3!1734)

(assert (=> b!291598 (= lt!423791 (readBitsLoop!0 (_2!12756 lt!423787) nBits!523 lt!423790 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!291598 (validate_offset_bits!1 ((_ sign_extend 32) (size!7495 (buf!7561 (_2!12756 lt!423787)))) ((_ sign_extend 32) (currentByte!13995 (_2!12756 lt!423787))) ((_ sign_extend 32) (currentBit!13990 (_2!12756 lt!423787))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423785 () Unit!20267)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13000 BitStream!13000 (_ BitVec 64) (_ BitVec 64)) Unit!20267)

(assert (=> b!291598 (= lt!423785 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12756 lt!423787) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!423792 () (_ BitVec 32))

(declare-fun lt!423783 () (_ BitVec 32))

(assert (=> b!291598 (= lt!423790 (array!17313 (store (arr!8515 arr!273) lt!423792 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8515 arr!273) lt!423792)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423783)))) ((_ sign_extend 24) (ite (_1!12756 lt!423787) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423783) #b00000000))))) (size!7495 arr!273)))))

(assert (=> b!291598 (= lt!423783 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291598 (= lt!423792 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13000) tuple2!22930)

(assert (=> b!291598 (= lt!423787 (readBit!0 thiss!1728))))

(declare-fun b!291600 () Bool)

(declare-fun e!207854 () Bool)

(declare-fun array_inv!7107 (array!17312) Bool)

(assert (=> b!291600 (= e!207854 (array_inv!7107 (buf!7561 thiss!1728)))))

(declare-fun b!291601 () Bool)

(declare-fun res!240899 () Bool)

(assert (=> b!291601 (=> res!240899 e!207853)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291601 (= res!240899 (not (invariant!0 (currentBit!13990 (_2!12755 lt!423791)) (currentByte!13995 (_2!12755 lt!423791)) (size!7495 (buf!7561 (_2!12755 lt!423791))))))))

(declare-fun b!291602 () Bool)

(declare-fun res!240894 () Bool)

(assert (=> b!291602 (=> (not res!240894) (not e!207857))))

(assert (=> b!291602 (= res!240894 (bvslt from!505 to!474))))

(declare-fun b!291603 () Bool)

(assert (=> b!291603 (= e!207855 (= lt!423789 (_1!12756 lt!423787)))))

(declare-fun b!291599 () Bool)

(assert (=> b!291599 (= e!207858 (and (= (buf!7561 thiss!1728) (buf!7561 (_2!12755 lt!423791))) (= (size!7495 arr!273) (size!7495 (_3!1290 lt!423791)))))))

(declare-fun res!240895 () Bool)

(assert (=> start!64948 (=> (not res!240895) (not e!207857))))

(assert (=> start!64948 (= res!240895 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7495 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64948 e!207857))

(declare-fun inv!12 (BitStream!13000) Bool)

(assert (=> start!64948 (and (inv!12 thiss!1728) e!207854)))

(assert (=> start!64948 true))

(assert (=> start!64948 (array_inv!7107 arr!273)))

(assert (= (and start!64948 res!240895) b!291596))

(assert (= (and b!291596 res!240893) b!291602))

(assert (= (and b!291602 res!240894) b!291598))

(assert (= (and b!291598 res!240898) b!291599))

(assert (= (and b!291598 res!240896) b!291603))

(assert (= (and b!291598 (not res!240897)) b!291601))

(assert (= (and b!291601 (not res!240899)) b!291597))

(assert (= start!64948 b!291600))

(declare-fun m!426787 () Bool)

(assert (=> b!291597 m!426787))

(declare-fun m!426789 () Bool)

(assert (=> b!291601 m!426789))

(declare-fun m!426791 () Bool)

(assert (=> start!64948 m!426791))

(declare-fun m!426793 () Bool)

(assert (=> start!64948 m!426793))

(declare-fun m!426795 () Bool)

(assert (=> b!291596 m!426795))

(declare-fun m!426797 () Bool)

(assert (=> b!291600 m!426797))

(declare-fun m!426799 () Bool)

(assert (=> b!291598 m!426799))

(declare-fun m!426801 () Bool)

(assert (=> b!291598 m!426801))

(declare-fun m!426803 () Bool)

(assert (=> b!291598 m!426803))

(declare-fun m!426805 () Bool)

(assert (=> b!291598 m!426805))

(declare-fun m!426807 () Bool)

(assert (=> b!291598 m!426807))

(declare-fun m!426809 () Bool)

(assert (=> b!291598 m!426809))

(declare-fun m!426811 () Bool)

(assert (=> b!291598 m!426811))

(declare-fun m!426813 () Bool)

(assert (=> b!291598 m!426813))

(declare-fun m!426815 () Bool)

(assert (=> b!291598 m!426815))

(declare-fun m!426817 () Bool)

(assert (=> b!291598 m!426817))

(declare-fun m!426819 () Bool)

(assert (=> b!291598 m!426819))

(declare-fun m!426821 () Bool)

(assert (=> b!291598 m!426821))

(declare-fun m!426823 () Bool)

(assert (=> b!291598 m!426823))

(declare-fun m!426825 () Bool)

(assert (=> b!291598 m!426825))

(declare-fun m!426827 () Bool)

(assert (=> b!291598 m!426827))

(declare-fun m!426829 () Bool)

(assert (=> b!291598 m!426829))

(declare-fun m!426831 () Bool)

(assert (=> b!291598 m!426831))

(push 1)

(assert (not b!291597))

(assert (not b!291596))

(assert (not b!291598))

(assert (not start!64948))

(assert (not b!291600))

(assert (not b!291601))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98698 () Bool)

(assert (=> d!98698 (= (array_inv!7107 (buf!7561 thiss!1728)) (bvsge (size!7495 (buf!7561 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!291600 d!98698))

(declare-fun d!98700 () Bool)

(declare-fun e!207903 () Bool)

(assert (=> d!98700 e!207903))

(declare-fun res!240944 () Bool)

(assert (=> d!98700 (=> (not res!240944) (not e!207903))))

(assert (=> d!98700 (= res!240944 (or (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!523 from!505) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423855 () Unit!20267)

(declare-fun choose!27 (BitStream!13000 BitStream!13000 (_ BitVec 64) (_ BitVec 64)) Unit!20267)

(assert (=> d!98700 (= lt!423855 (choose!27 thiss!1728 (_2!12756 lt!423787) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!98700 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)))))

(assert (=> d!98700 (= (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12756 lt!423787) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001) lt!423855)))

(declare-fun b!291654 () Bool)

(assert (=> b!291654 (= e!207903 (validate_offset_bits!1 ((_ sign_extend 32) (size!7495 (buf!7561 (_2!12756 lt!423787)))) ((_ sign_extend 32) (currentByte!13995 (_2!12756 lt!423787))) ((_ sign_extend 32) (currentBit!13990 (_2!12756 lt!423787))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!98700 res!240944) b!291654))

(declare-fun m!426931 () Bool)

(assert (=> d!98700 m!426931))

(assert (=> b!291654 m!426821))

(assert (=> b!291598 d!98700))

(declare-fun d!98702 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!98702 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7495 (buf!7561 (_2!12756 lt!423787)))) ((_ sign_extend 32) (currentByte!13995 (_2!12756 lt!423787))) ((_ sign_extend 32) (currentBit!13990 (_2!12756 lt!423787))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7495 (buf!7561 (_2!12756 lt!423787)))) ((_ sign_extend 32) (currentByte!13995 (_2!12756 lt!423787))) ((_ sign_extend 32) (currentBit!13990 (_2!12756 lt!423787)))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!25157 () Bool)

(assert (= bs!25157 d!98702))

(declare-fun m!426933 () Bool)

(assert (=> bs!25157 m!426933))

(assert (=> b!291598 d!98702))

(declare-fun d!98704 () Bool)

(declare-fun e!207906 () Bool)

(assert (=> d!98704 e!207906))

(declare-fun res!240947 () Bool)

(assert (=> d!98704 (=> (not res!240947) (not e!207906))))

(declare-fun lt!423865 () (_ BitVec 32))

(assert (=> d!98704 (= res!240947 (and (bvsge lt!423865 #b00000000000000000000000000000000) (bvslt lt!423865 (size!7495 arr!273))))))

(declare-fun lt!423864 () (_ BitVec 8))

(declare-fun lt!423867 () (_ BitVec 32))

(declare-fun lt!423866 () Unit!20267)

(declare-fun choose!53 (array!17312 (_ BitVec 64) Bool (_ BitVec 32) (_ BitVec 32) (_ BitVec 8)) Unit!20267)

(assert (=> d!98704 (= lt!423866 (choose!53 arr!273 from!505 (_1!12756 lt!423787) lt!423865 lt!423867 lt!423864))))

(assert (=> d!98704 (= lt!423864 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8515 arr!273) lt!423865)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423867)))) ((_ sign_extend 24) (ite (_1!12756 lt!423787) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!423867) #b00000000)))))))

(assert (=> d!98704 (= lt!423867 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98704 (= lt!423865 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> d!98704 (= (arrayBitRangesUpdatedAtLemma!0 arr!273 from!505 (_1!12756 lt!423787)) lt!423866)))

(declare-fun b!291658 () Bool)

(assert (=> b!291658 (= e!207906 (arrayBitRangesEq!0 arr!273 (array!17313 (store (arr!8515 arr!273) lt!423865 lt!423864) (size!7495 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (= (and d!98704 res!240947) b!291658))

(declare-fun m!426935 () Bool)

(assert (=> d!98704 m!426935))

(declare-fun m!426937 () Bool)

(assert (=> d!98704 m!426937))

(declare-fun m!426939 () Bool)

(assert (=> d!98704 m!426939))

(declare-fun m!426941 () Bool)

(assert (=> b!291658 m!426941))

(declare-fun m!426943 () Bool)

(assert (=> b!291658 m!426943))

(assert (=> b!291598 d!98704))

(declare-fun lt!423876 () (_ BitVec 32))

(declare-datatypes ((tuple4!846 0))(
  ( (tuple4!847 (_1!12763 (_ BitVec 32)) (_2!12763 (_ BitVec 32)) (_3!1293 (_ BitVec 32)) (_4!423 (_ BitVec 32))) )
))
(declare-fun lt!423875 () tuple4!846)

(declare-fun lt!423874 () (_ BitVec 32))

(declare-fun c!13326 () Bool)

(declare-fun call!4883 () Bool)

(declare-fun bm!4880 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4880 (= call!4883 (byteRangesEq!0 (ite c!13326 (select (arr!8515 arr!273) (_3!1293 lt!423875)) (select (arr!8515 arr!273) (_4!423 lt!423875))) (ite c!13326 (select (arr!8515 (_3!1290 lt!423791)) (_3!1293 lt!423875)) (select (arr!8515 (_3!1290 lt!423791)) (_4!423 lt!423875))) (ite c!13326 lt!423876 #b00000000000000000000000000000000) lt!423874))))

(declare-fun b!291674 () Bool)

(declare-fun e!207923 () Bool)

(assert (=> b!291674 (= e!207923 call!4883)))

(declare-fun b!291675 () Bool)

(declare-fun e!207920 () Bool)

(assert (=> b!291675 (= e!207920 e!207923)))

(assert (=> b!291675 (= c!13326 (= (_3!1293 lt!423875) (_4!423 lt!423875)))))

(declare-fun b!291676 () Bool)

(declare-fun res!240960 () Bool)

(assert (=> b!291676 (= res!240960 (= lt!423874 #b00000000000000000000000000000000))))

(declare-fun e!207924 () Bool)

(assert (=> b!291676 (=> res!240960 e!207924)))

(declare-fun e!207919 () Bool)

(assert (=> b!291676 (= e!207919 e!207924)))

(declare-fun b!291677 () Bool)

(declare-fun e!207922 () Bool)

(declare-fun arrayRangesEq!1481 (array!17312 array!17312 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!291677 (= e!207922 (arrayRangesEq!1481 arr!273 (_3!1290 lt!423791) (_1!12763 lt!423875) (_2!12763 lt!423875)))))

(declare-fun b!291678 () Bool)

(assert (=> b!291678 (= e!207923 e!207919)))

(declare-fun res!240959 () Bool)

(assert (=> b!291678 (= res!240959 (byteRangesEq!0 (select (arr!8515 arr!273) (_3!1293 lt!423875)) (select (arr!8515 (_3!1290 lt!423791)) (_3!1293 lt!423875)) lt!423876 #b00000000000000000000000000001000))))

(assert (=> b!291678 (=> (not res!240959) (not e!207919))))

(declare-fun b!291679 () Bool)

(declare-fun e!207921 () Bool)

(assert (=> b!291679 (= e!207921 e!207920)))

(declare-fun res!240962 () Bool)

(assert (=> b!291679 (=> (not res!240962) (not e!207920))))

(assert (=> b!291679 (= res!240962 e!207922)))

(declare-fun res!240958 () Bool)

(assert (=> b!291679 (=> res!240958 e!207922)))

(assert (=> b!291679 (= res!240958 (bvsge (_1!12763 lt!423875) (_2!12763 lt!423875)))))

(assert (=> b!291679 (= lt!423874 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291679 (= lt!423876 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!846)

(assert (=> b!291679 (= lt!423875 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!98706 () Bool)

(declare-fun res!240961 () Bool)

(assert (=> d!98706 (=> res!240961 e!207921)))

(assert (=> d!98706 (= res!240961 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98706 (= (arrayBitRangesEq!0 arr!273 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207921)))

(declare-fun b!291673 () Bool)

(assert (=> b!291673 (= e!207924 call!4883)))

(assert (= (and d!98706 (not res!240961)) b!291679))

(assert (= (and b!291679 (not res!240958)) b!291677))

(assert (= (and b!291679 res!240962) b!291675))

(assert (= (and b!291675 c!13326) b!291674))

(assert (= (and b!291675 (not c!13326)) b!291678))

(assert (= (and b!291678 res!240959) b!291676))

(assert (= (and b!291676 (not res!240960)) b!291673))

(assert (= (or b!291674 b!291673) bm!4880))

(declare-fun m!426949 () Bool)

(assert (=> bm!4880 m!426949))

(declare-fun m!426951 () Bool)

(assert (=> bm!4880 m!426951))

(declare-fun m!426953 () Bool)

(assert (=> bm!4880 m!426953))

(declare-fun m!426955 () Bool)

(assert (=> bm!4880 m!426955))

(declare-fun m!426957 () Bool)

(assert (=> bm!4880 m!426957))

(declare-fun m!426959 () Bool)

(assert (=> b!291677 m!426959))

(assert (=> b!291678 m!426951))

(assert (=> b!291678 m!426953))

(assert (=> b!291678 m!426951))

(assert (=> b!291678 m!426953))

(declare-fun m!426961 () Bool)

(assert (=> b!291678 m!426961))

(declare-fun m!426963 () Bool)

(assert (=> b!291679 m!426963))

(assert (=> b!291598 d!98706))

(declare-fun d!98716 () Bool)

(assert (=> d!98716 (= (bitAt!0 lt!423790 from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8515 lt!423790) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25160 () Bool)

(assert (= bs!25160 d!98716))

(declare-fun m!426965 () Bool)

(assert (=> bs!25160 m!426965))

(declare-fun m!426967 () Bool)

(assert (=> bs!25160 m!426967))

(assert (=> b!291598 d!98716))

(declare-fun lt!423878 () tuple4!846)

(declare-fun lt!423879 () (_ BitVec 32))

(declare-fun bm!4881 () Bool)

(declare-fun call!4884 () Bool)

(declare-fun c!13327 () Bool)

(declare-fun lt!423877 () (_ BitVec 32))

(assert (=> bm!4881 (= call!4884 (byteRangesEq!0 (ite c!13327 (select (arr!8515 arr!273) (_3!1293 lt!423878)) (select (arr!8515 arr!273) (_4!423 lt!423878))) (ite c!13327 (select (arr!8515 lt!423790) (_3!1293 lt!423878)) (select (arr!8515 lt!423790) (_4!423 lt!423878))) (ite c!13327 lt!423879 #b00000000000000000000000000000000) lt!423877))))

(declare-fun b!291681 () Bool)

(declare-fun e!207929 () Bool)

(assert (=> b!291681 (= e!207929 call!4884)))

(declare-fun b!291682 () Bool)

(declare-fun e!207926 () Bool)

(assert (=> b!291682 (= e!207926 e!207929)))

(assert (=> b!291682 (= c!13327 (= (_3!1293 lt!423878) (_4!423 lt!423878)))))

(declare-fun b!291683 () Bool)

(declare-fun res!240965 () Bool)

(assert (=> b!291683 (= res!240965 (= lt!423877 #b00000000000000000000000000000000))))

(declare-fun e!207930 () Bool)

(assert (=> b!291683 (=> res!240965 e!207930)))

(declare-fun e!207925 () Bool)

(assert (=> b!291683 (= e!207925 e!207930)))

(declare-fun e!207928 () Bool)

(declare-fun b!291684 () Bool)

(assert (=> b!291684 (= e!207928 (arrayRangesEq!1481 arr!273 lt!423790 (_1!12763 lt!423878) (_2!12763 lt!423878)))))

(declare-fun b!291685 () Bool)

(assert (=> b!291685 (= e!207929 e!207925)))

(declare-fun res!240964 () Bool)

(assert (=> b!291685 (= res!240964 (byteRangesEq!0 (select (arr!8515 arr!273) (_3!1293 lt!423878)) (select (arr!8515 lt!423790) (_3!1293 lt!423878)) lt!423879 #b00000000000000000000000000001000))))

(assert (=> b!291685 (=> (not res!240964) (not e!207925))))

(declare-fun b!291686 () Bool)

(declare-fun e!207927 () Bool)

(assert (=> b!291686 (= e!207927 e!207926)))

(declare-fun res!240967 () Bool)

(assert (=> b!291686 (=> (not res!240967) (not e!207926))))

(assert (=> b!291686 (= res!240967 e!207928)))

(declare-fun res!240963 () Bool)

(assert (=> b!291686 (=> res!240963 e!207928)))

(assert (=> b!291686 (= res!240963 (bvsge (_1!12763 lt!423878) (_2!12763 lt!423878)))))

(assert (=> b!291686 (= lt!423877 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291686 (= lt!423879 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291686 (= lt!423878 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(declare-fun d!98718 () Bool)

(declare-fun res!240966 () Bool)

(assert (=> d!98718 (=> res!240966 e!207927)))

(assert (=> d!98718 (= res!240966 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> d!98718 (= (arrayBitRangesEq!0 arr!273 lt!423790 #b0000000000000000000000000000000000000000000000000000000000000000 from!505) e!207927)))

(declare-fun b!291680 () Bool)

(assert (=> b!291680 (= e!207930 call!4884)))

(assert (= (and d!98718 (not res!240966)) b!291686))

(assert (= (and b!291686 (not res!240963)) b!291684))

(assert (= (and b!291686 res!240967) b!291682))

(assert (= (and b!291682 c!13327) b!291681))

(assert (= (and b!291682 (not c!13327)) b!291685))

(assert (= (and b!291685 res!240964) b!291683))

(assert (= (and b!291683 (not res!240965)) b!291680))

(assert (= (or b!291681 b!291680) bm!4881))

(declare-fun m!426969 () Bool)

(assert (=> bm!4881 m!426969))

(declare-fun m!426971 () Bool)

(assert (=> bm!4881 m!426971))

(declare-fun m!426973 () Bool)

(assert (=> bm!4881 m!426973))

(declare-fun m!426975 () Bool)

(assert (=> bm!4881 m!426975))

(declare-fun m!426977 () Bool)

(assert (=> bm!4881 m!426977))

(declare-fun m!426979 () Bool)

(assert (=> b!291684 m!426979))

(assert (=> b!291685 m!426971))

(assert (=> b!291685 m!426973))

(assert (=> b!291685 m!426971))

(assert (=> b!291685 m!426973))

(declare-fun m!426981 () Bool)

(assert (=> b!291685 m!426981))

(assert (=> b!291686 m!426963))

(assert (=> b!291598 d!98718))

(declare-fun d!98720 () Bool)

(declare-fun e!207933 () Bool)

(assert (=> d!98720 e!207933))

(declare-fun res!240972 () Bool)

(assert (=> d!98720 (=> (not res!240972) (not e!207933))))

(declare-fun lt!423895 () (_ BitVec 64))

(declare-fun lt!423892 () (_ BitVec 64))

(declare-fun lt!423897 () (_ BitVec 64))

(assert (=> d!98720 (= res!240972 (= lt!423892 (bvsub lt!423897 lt!423895)))))

(assert (=> d!98720 (or (= (bvand lt!423897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!423895 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!423897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!423897 lt!423895) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98720 (= lt!423895 (remainingBits!0 ((_ sign_extend 32) (size!7495 (buf!7561 (_2!12755 lt!423791)))) ((_ sign_extend 32) (currentByte!13995 (_2!12755 lt!423791))) ((_ sign_extend 32) (currentBit!13990 (_2!12755 lt!423791)))))))

(declare-fun lt!423894 () (_ BitVec 64))

(declare-fun lt!423893 () (_ BitVec 64))

(assert (=> d!98720 (= lt!423897 (bvmul lt!423894 lt!423893))))

(assert (=> d!98720 (or (= lt!423894 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!423893 (bvsdiv (bvmul lt!423894 lt!423893) lt!423894)))))

(assert (=> d!98720 (= lt!423893 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98720 (= lt!423894 ((_ sign_extend 32) (size!7495 (buf!7561 (_2!12755 lt!423791)))))))

(assert (=> d!98720 (= lt!423892 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13995 (_2!12755 lt!423791))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13990 (_2!12755 lt!423791)))))))

(assert (=> d!98720 (invariant!0 (currentBit!13990 (_2!12755 lt!423791)) (currentByte!13995 (_2!12755 lt!423791)) (size!7495 (buf!7561 (_2!12755 lt!423791))))))

(assert (=> d!98720 (= (bitIndex!0 (size!7495 (buf!7561 (_2!12755 lt!423791))) (currentByte!13995 (_2!12755 lt!423791)) (currentBit!13990 (_2!12755 lt!423791))) lt!423892)))

(declare-fun b!291691 () Bool)

(declare-fun res!240973 () Bool)

(assert (=> b!291691 (=> (not res!240973) (not e!207933))))

(assert (=> b!291691 (= res!240973 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!423892))))

(declare-fun b!291692 () Bool)

(declare-fun lt!423896 () (_ BitVec 64))

(assert (=> b!291692 (= e!207933 (bvsle lt!423892 (bvmul lt!423896 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291692 (or (= lt!423896 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!423896 #b0000000000000000000000000000000000000000000000000000000000001000) lt!423896)))))

(assert (=> b!291692 (= lt!423896 ((_ sign_extend 32) (size!7495 (buf!7561 (_2!12755 lt!423791)))))))

(assert (= (and d!98720 res!240972) b!291691))

(assert (= (and b!291691 res!240973) b!291692))

(declare-fun m!426983 () Bool)

(assert (=> d!98720 m!426983))

(assert (=> d!98720 m!426789))

(assert (=> b!291598 d!98720))

(declare-fun b!291840 () Bool)

(declare-fun res!241095 () Bool)

(declare-fun e!208029 () Bool)

(assert (=> b!291840 (=> (not res!241095) (not e!208029))))

(declare-fun lt!424343 () tuple3!1734)

(assert (=> b!291840 (= res!241095 (and (= (buf!7561 (_2!12756 lt!423787)) (buf!7561 (_2!12755 lt!424343))) (= (size!7495 lt!423790) (size!7495 (_3!1290 lt!424343)))))))

(declare-fun b!291841 () Bool)

(declare-fun res!241093 () Bool)

(assert (=> b!291841 (=> (not res!241093) (not e!208029))))

(declare-fun e!208030 () Bool)

(assert (=> b!291841 (= res!241093 e!208030)))

(declare-fun res!241094 () Bool)

(assert (=> b!291841 (=> res!241094 e!208030)))

(assert (=> b!291841 (= res!241094 (not (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474)))))

(declare-fun lt!424317 () (_ BitVec 64))

(declare-fun bm!4904 () Bool)

(declare-fun lt!424339 () (_ BitVec 64))

(declare-fun lt!424346 () array!17312)

(declare-fun call!4908 () Bool)

(declare-fun c!13342 () Bool)

(declare-fun lt!424337 () (_ BitVec 64))

(declare-fun lt!424332 () array!17312)

(declare-fun lt!424338 () tuple3!1734)

(assert (=> bm!4904 (= call!4908 (arrayBitRangesEq!0 (ite c!13342 lt!423790 lt!424346) (ite c!13342 (_3!1290 lt!424338) lt!424332) (ite c!13342 lt!424339 lt!424337) (ite c!13342 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) lt!424317)))))

(declare-fun b!291842 () Bool)

(declare-fun res!241097 () Bool)

(assert (=> b!291842 (=> (not res!241097) (not e!208029))))

(assert (=> b!291842 (= res!241097 (arrayBitRangesEq!0 lt!423790 (_3!1290 lt!424343) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!424349 () Unit!20267)

(declare-fun b!291843 () Bool)

(declare-fun e!208032 () tuple3!1734)

(assert (=> b!291843 (= e!208032 (tuple3!1735 lt!424349 (_2!12756 lt!423787) lt!423790))))

(declare-fun lt!424316 () Unit!20267)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17312) Unit!20267)

(assert (=> b!291843 (= lt!424316 (arrayBitRangesEqReflexiveLemma!0 lt!423790))))

(declare-fun call!4907 () Bool)

(assert (=> b!291843 call!4907))

(declare-fun lt!424328 () Unit!20267)

(assert (=> b!291843 (= lt!424328 lt!424316)))

(assert (=> b!291843 (= lt!424346 lt!423790)))

(assert (=> b!291843 (= lt!424332 lt!423790)))

(declare-fun lt!424344 () (_ BitVec 64))

(assert (=> b!291843 (= lt!424344 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424341 () (_ BitVec 64))

(assert (=> b!291843 (= lt!424341 ((_ sign_extend 32) (size!7495 lt!423790)))))

(declare-fun lt!424330 () (_ BitVec 64))

(assert (=> b!291843 (= lt!424330 (bvmul lt!424341 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!291843 (= lt!424337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!291843 (= lt!424317 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17312 array!17312 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20267)

(assert (=> b!291843 (= lt!424349 (arrayBitRangesEqSlicedLemma!0 lt!424346 lt!424332 lt!424344 lt!424330 lt!424337 lt!424317))))

(assert (=> b!291843 call!4908))

(declare-fun b!291844 () Bool)

(declare-datatypes ((List!965 0))(
  ( (Nil!962) (Cons!961 (h!1080 Bool) (t!1850 List!965)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!13000 array!17312 (_ BitVec 64) (_ BitVec 64)) List!965)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!13000 BitStream!13000 (_ BitVec 64)) List!965)

(assert (=> b!291844 (= e!208029 (= (byteArrayBitContentToList!0 (_2!12755 lt!424343) (_3!1290 lt!424343) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))) (bitStreamReadBitsIntoList!0 (_2!12755 lt!424343) (_2!12756 lt!423787) (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))))

(assert (=> b!291844 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291844 (or (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!474 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!98722 () Bool)

(assert (=> d!98722 e!208029))

(declare-fun res!241092 () Bool)

(assert (=> d!98722 (=> (not res!241092) (not e!208029))))

(declare-fun lt!424335 () (_ BitVec 64))

(assert (=> d!98722 (= res!241092 (= (bvsub lt!424335 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7495 (buf!7561 (_2!12755 lt!424343))) (currentByte!13995 (_2!12755 lt!424343)) (currentBit!13990 (_2!12755 lt!424343)))))))

(assert (=> d!98722 (or (= (bvand lt!424335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!424335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!424335 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424336 () (_ BitVec 64))

(assert (=> d!98722 (= lt!424335 (bvadd lt!424336 to!474))))

(assert (=> d!98722 (or (not (= (bvand lt!424336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!474 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!424336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!424336 to!474) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98722 (= lt!424336 (bitIndex!0 (size!7495 (buf!7561 (_2!12756 lt!423787))) (currentByte!13995 (_2!12756 lt!423787)) (currentBit!13990 (_2!12756 lt!423787))))))

(assert (=> d!98722 (= lt!424343 e!208032)))

(assert (=> d!98722 (= c!13342 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> d!98722 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!98722 (= (readBitsLoop!0 (_2!12756 lt!423787) nBits!523 lt!423790 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474) lt!424343)))

(declare-fun lt!424321 () tuple2!22930)

(declare-fun lt!424323 () (_ BitVec 32))

(declare-fun lt!424315 () (_ BitVec 32))

(declare-fun bm!4905 () Bool)

(assert (=> bm!4905 (= call!4907 (arrayBitRangesEq!0 lt!423790 (ite c!13342 (array!17313 (store (arr!8515 lt!423790) lt!424315 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8515 lt!423790) lt!424315)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424323)))) ((_ sign_extend 24) (ite (_1!12756 lt!424321) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424323) #b00000000))))) (size!7495 lt!423790)) lt!423790) #b0000000000000000000000000000000000000000000000000000000000000000 (ite c!13342 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvmul ((_ sign_extend 32) (size!7495 lt!423790)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!291845 () Bool)

(declare-fun res!241096 () Bool)

(assert (=> b!291845 (=> (not res!241096) (not e!208029))))

(assert (=> b!291845 (= res!241096 (invariant!0 (currentBit!13990 (_2!12755 lt!424343)) (currentByte!13995 (_2!12755 lt!424343)) (size!7495 (buf!7561 (_2!12755 lt!424343)))))))

(declare-fun b!291846 () Bool)

(assert (=> b!291846 (= e!208030 (= (bitAt!0 (_3!1290 lt!424343) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_2!12754 (readBitPure!0 (_2!12756 lt!423787)))))))

(declare-fun b!291847 () Bool)

(declare-fun lt!424334 () Unit!20267)

(assert (=> b!291847 (= e!208032 (tuple3!1735 lt!424334 (_2!12755 lt!424338) (_3!1290 lt!424338)))))

(assert (=> b!291847 (= lt!424321 (readBit!0 (_2!12756 lt!423787)))))

(declare-fun lt!424329 () (_ BitVec 32))

(assert (=> b!291847 (= lt!424329 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424327 () (_ BitVec 32))

(assert (=> b!291847 (= lt!424327 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424325 () array!17312)

(assert (=> b!291847 (= lt!424325 (array!17313 (store (arr!8515 lt!423790) lt!424329 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8515 lt!423790) lt!424329)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424327)))) ((_ sign_extend 24) (ite (_1!12756 lt!424321) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!424327) #b00000000))))) (size!7495 lt!423790)))))

(declare-fun lt!424324 () (_ BitVec 64))

(assert (=> b!291847 (= lt!424324 (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!424345 () (_ BitVec 64))

(assert (=> b!291847 (= lt!424345 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!424347 () Unit!20267)

(assert (=> b!291847 (= lt!424347 (validateOffsetBitsIneqLemma!0 (_2!12756 lt!423787) (_2!12756 lt!424321) lt!424324 lt!424345))))

(assert (=> b!291847 (validate_offset_bits!1 ((_ sign_extend 32) (size!7495 (buf!7561 (_2!12756 lt!424321)))) ((_ sign_extend 32) (currentByte!13995 (_2!12756 lt!424321))) ((_ sign_extend 32) (currentBit!13990 (_2!12756 lt!424321))) (bvsub lt!424324 lt!424345))))

(declare-fun lt!424326 () Unit!20267)

(assert (=> b!291847 (= lt!424326 lt!424347)))

(assert (=> b!291847 (= lt!424338 (readBitsLoop!0 (_2!12756 lt!424321) nBits!523 lt!424325 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001) to!474))))

(declare-fun res!241091 () Bool)

(assert (=> b!291847 (= res!241091 (= (bvsub (bvadd (bitIndex!0 (size!7495 (buf!7561 (_2!12756 lt!423787))) (currentByte!13995 (_2!12756 lt!423787)) (currentBit!13990 (_2!12756 lt!423787))) to!474) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitIndex!0 (size!7495 (buf!7561 (_2!12755 lt!424338))) (currentByte!13995 (_2!12755 lt!424338)) (currentBit!13990 (_2!12755 lt!424338)))))))

(declare-fun e!208031 () Bool)

(assert (=> b!291847 (=> (not res!241091) (not e!208031))))

(assert (=> b!291847 e!208031))

(declare-fun lt!424342 () Unit!20267)

(declare-fun Unit!20281 () Unit!20267)

(assert (=> b!291847 (= lt!424342 Unit!20281)))

(assert (=> b!291847 (= lt!424315 ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291847 (= lt!424323 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!424333 () Unit!20267)

(assert (=> b!291847 (= lt!424333 (arrayBitRangesUpdatedAtLemma!0 lt!423790 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (_1!12756 lt!424321)))))

(assert (=> b!291847 call!4907))

(declare-fun lt!424322 () Unit!20267)

(assert (=> b!291847 (= lt!424322 lt!424333)))

(assert (=> b!291847 (= lt!424339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!424318 () Unit!20267)

(assert (=> b!291847 (= lt!424318 (arrayBitRangesEqTransitive!0 lt!423790 lt!424325 (_3!1290 lt!424338) lt!424339 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291847 call!4908))

(declare-fun lt!424331 () Unit!20267)

(assert (=> b!291847 (= lt!424331 lt!424318)))

(assert (=> b!291847 (arrayBitRangesEq!0 lt!423790 (_3!1290 lt!424338) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))

(declare-fun lt!424340 () Unit!20267)

(declare-fun Unit!20282 () Unit!20267)

(assert (=> b!291847 (= lt!424340 Unit!20282)))

(declare-fun lt!424319 () Unit!20267)

(assert (=> b!291847 (= lt!424319 (arrayBitRangesEqImpliesEq!0 lt!424325 (_3!1290 lt!424338) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!291847 (= (bitAt!0 lt!424325 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (bitAt!0 (_3!1290 lt!424338) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-fun lt!424320 () Unit!20267)

(assert (=> b!291847 (= lt!424320 lt!424319)))

(declare-fun lt!424350 () Unit!20267)

(declare-fun Unit!20283 () Unit!20267)

(assert (=> b!291847 (= lt!424350 Unit!20283)))

(declare-fun lt!424348 () Bool)

(assert (=> b!291847 (= lt!424348 (= (bitAt!0 (_3!1290 lt!424338) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) (_1!12756 lt!424321)))))

(declare-fun Unit!20284 () Unit!20267)

(assert (=> b!291847 (= lt!424334 Unit!20284)))

(assert (=> b!291847 lt!424348))

(declare-fun b!291848 () Bool)

(assert (=> b!291848 (= e!208031 (and (= (buf!7561 (_2!12756 lt!423787)) (buf!7561 (_2!12755 lt!424338))) (= (size!7495 lt!423790) (size!7495 (_3!1290 lt!424338)))))))

(assert (= (and d!98722 c!13342) b!291847))

(assert (= (and d!98722 (not c!13342)) b!291843))

(assert (= (and b!291847 res!241091) b!291848))

(assert (= (or b!291847 b!291843) bm!4904))

(assert (= (or b!291847 b!291843) bm!4905))

(assert (= (and d!98722 res!241092) b!291840))

(assert (= (and b!291840 res!241095) b!291842))

(assert (= (and b!291842 res!241097) b!291841))

(assert (= (and b!291841 (not res!241094)) b!291846))

(assert (= (and b!291841 res!241093) b!291845))

(assert (= (and b!291845 res!241096) b!291844))

(declare-fun m!427189 () Bool)

(assert (=> b!291847 m!427189))

(declare-fun m!427191 () Bool)

(assert (=> b!291847 m!427191))

(declare-fun m!427193 () Bool)

(assert (=> b!291847 m!427193))

(declare-fun m!427195 () Bool)

(assert (=> b!291847 m!427195))

(declare-fun m!427197 () Bool)

(assert (=> b!291847 m!427197))

(declare-fun m!427199 () Bool)

(assert (=> b!291847 m!427199))

(declare-fun m!427201 () Bool)

(assert (=> b!291847 m!427201))

(declare-fun m!427203 () Bool)

(assert (=> b!291847 m!427203))

(declare-fun m!427205 () Bool)

(assert (=> b!291847 m!427205))

(declare-fun m!427207 () Bool)

(assert (=> b!291847 m!427207))

(declare-fun m!427209 () Bool)

(assert (=> b!291847 m!427209))

(declare-fun m!427211 () Bool)

(assert (=> b!291847 m!427211))

(declare-fun m!427213 () Bool)

(assert (=> b!291847 m!427213))

(declare-fun m!427215 () Bool)

(assert (=> b!291847 m!427215))

(declare-fun m!427217 () Bool)

(assert (=> b!291847 m!427217))

(declare-fun m!427219 () Bool)

(assert (=> b!291846 m!427219))

(declare-fun m!427221 () Bool)

(assert (=> b!291846 m!427221))

(declare-fun m!427223 () Bool)

(assert (=> bm!4904 m!427223))

(declare-fun m!427225 () Bool)

(assert (=> b!291845 m!427225))

(declare-fun m!427227 () Bool)

(assert (=> d!98722 m!427227))

(assert (=> d!98722 m!427195))

(declare-fun m!427229 () Bool)

(assert (=> bm!4905 m!427229))

(declare-fun m!427231 () Bool)

(assert (=> bm!4905 m!427231))

(declare-fun m!427233 () Bool)

(assert (=> bm!4905 m!427233))

(declare-fun m!427235 () Bool)

(assert (=> bm!4905 m!427235))

(declare-fun m!427237 () Bool)

(assert (=> b!291843 m!427237))

(declare-fun m!427239 () Bool)

(assert (=> b!291843 m!427239))

(declare-fun m!427241 () Bool)

(assert (=> b!291844 m!427241))

(declare-fun m!427243 () Bool)

(assert (=> b!291844 m!427243))

(declare-fun m!427245 () Bool)

(assert (=> b!291842 m!427245))

(assert (=> b!291598 d!98722))

(declare-fun d!98766 () Bool)

(declare-fun lt!424359 () tuple2!22930)

(assert (=> d!98766 (= lt!424359 (readBit!0 thiss!1728))))

(assert (=> d!98766 (= (readBitPure!0 thiss!1728) (tuple2!22929 (_2!12756 lt!424359) (_1!12756 lt!424359)))))

(declare-fun bs!25171 () Bool)

(assert (= bs!25171 d!98766))

(assert (=> bs!25171 m!426811))

(assert (=> b!291598 d!98766))

(declare-fun d!98776 () Bool)

(declare-fun e!208043 () Bool)

(assert (=> d!98776 e!208043))

(declare-fun res!241103 () Bool)

(assert (=> d!98776 (=> (not res!241103) (not e!208043))))

(declare-fun lt!424363 () (_ BitVec 64))

(declare-fun lt!424365 () (_ BitVec 64))

(declare-fun lt!424360 () (_ BitVec 64))

(assert (=> d!98776 (= res!241103 (= lt!424360 (bvsub lt!424365 lt!424363)))))

(assert (=> d!98776 (or (= (bvand lt!424365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!424363 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!424365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!424365 lt!424363) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!98776 (= lt!424363 (remainingBits!0 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))) ((_ sign_extend 32) (currentByte!13995 thiss!1728)) ((_ sign_extend 32) (currentBit!13990 thiss!1728))))))

(declare-fun lt!424362 () (_ BitVec 64))

(declare-fun lt!424361 () (_ BitVec 64))

(assert (=> d!98776 (= lt!424365 (bvmul lt!424362 lt!424361))))

(assert (=> d!98776 (or (= lt!424362 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!424361 (bvsdiv (bvmul lt!424362 lt!424361) lt!424362)))))

(assert (=> d!98776 (= lt!424361 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!98776 (= lt!424362 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))))))

(assert (=> d!98776 (= lt!424360 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13995 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13990 thiss!1728))))))

(assert (=> d!98776 (invariant!0 (currentBit!13990 thiss!1728) (currentByte!13995 thiss!1728) (size!7495 (buf!7561 thiss!1728)))))

(assert (=> d!98776 (= (bitIndex!0 (size!7495 (buf!7561 thiss!1728)) (currentByte!13995 thiss!1728) (currentBit!13990 thiss!1728)) lt!424360)))

(declare-fun b!291856 () Bool)

(declare-fun res!241104 () Bool)

(assert (=> b!291856 (=> (not res!241104) (not e!208043))))

(assert (=> b!291856 (= res!241104 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!424360))))

(declare-fun b!291857 () Bool)

(declare-fun lt!424364 () (_ BitVec 64))

(assert (=> b!291857 (= e!208043 (bvsle lt!424360 (bvmul lt!424364 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!291857 (or (= lt!424364 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!424364 #b0000000000000000000000000000000000000000000000000000000000001000) lt!424364)))))

(assert (=> b!291857 (= lt!424364 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))))))

(assert (= (and d!98776 res!241103) b!291856))

(assert (= (and b!291856 res!241104) b!291857))

(declare-fun m!427263 () Bool)

(assert (=> d!98776 m!427263))

(declare-fun m!427265 () Bool)

(assert (=> d!98776 m!427265))

(assert (=> b!291598 d!98776))

(declare-fun d!98778 () Bool)

(assert (=> d!98778 (= (bitAt!0 lt!423790 from!505) (bitAt!0 (_3!1290 lt!423791) from!505))))

(declare-fun lt!424382 () Unit!20267)

(declare-fun choose!31 (array!17312 array!17312 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20267)

(assert (=> d!98778 (= lt!424382 (choose!31 lt!423790 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98778 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98778 (= (arrayBitRangesEqImpliesEq!0 lt!423790 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!424382)))

(declare-fun bs!25173 () Bool)

(assert (= bs!25173 d!98778))

(assert (=> bs!25173 m!426815))

(assert (=> bs!25173 m!426801))

(declare-fun m!427267 () Bool)

(assert (=> bs!25173 m!427267))

(assert (=> b!291598 d!98778))

(declare-fun d!98786 () Bool)

(assert (=> d!98786 (= (bitAt!0 (_3!1290 lt!423791) from!505) (not (= (bvand ((_ sign_extend 24) (select (arr!8515 (_3!1290 lt!423791)) ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!25175 () Bool)

(assert (= bs!25175 d!98786))

(declare-fun m!427269 () Bool)

(assert (=> bs!25175 m!427269))

(assert (=> bs!25175 m!426967))

(assert (=> b!291598 d!98786))

(declare-fun d!98788 () Bool)

(declare-fun e!208059 () Bool)

(assert (=> d!98788 e!208059))

(declare-fun res!241115 () Bool)

(assert (=> d!98788 (=> (not res!241115) (not e!208059))))

(declare-datatypes ((tuple2!22942 0))(
  ( (tuple2!22943 (_1!12767 Unit!20267) (_2!12767 BitStream!13000)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13000) tuple2!22942)

(assert (=> d!98788 (= res!241115 (= (buf!7561 (_2!12767 (increaseBitIndex!0 thiss!1728))) (buf!7561 thiss!1728)))))

(declare-fun lt!424416 () Bool)

(assert (=> d!98788 (= lt!424416 (not (= (bvand ((_ sign_extend 24) (select (arr!8515 (buf!7561 thiss!1728)) (currentByte!13995 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13990 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424415 () tuple2!22930)

(assert (=> d!98788 (= lt!424415 (tuple2!22931 (not (= (bvand ((_ sign_extend 24) (select (arr!8515 (buf!7561 thiss!1728)) (currentByte!13995 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13990 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12767 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!98788 (validate_offset_bit!0 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))) ((_ sign_extend 32) (currentByte!13995 thiss!1728)) ((_ sign_extend 32) (currentBit!13990 thiss!1728)))))

(assert (=> d!98788 (= (readBit!0 thiss!1728) lt!424415)))

(declare-fun b!291870 () Bool)

(declare-fun lt!424410 () (_ BitVec 64))

(declare-fun lt!424413 () (_ BitVec 64))

(assert (=> b!291870 (= e!208059 (= (bitIndex!0 (size!7495 (buf!7561 (_2!12767 (increaseBitIndex!0 thiss!1728)))) (currentByte!13995 (_2!12767 (increaseBitIndex!0 thiss!1728))) (currentBit!13990 (_2!12767 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!424413 lt!424410)))))

(assert (=> b!291870 (or (not (= (bvand lt!424413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!424410 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!424413 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!424413 lt!424410) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!291870 (= lt!424410 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!291870 (= lt!424413 (bitIndex!0 (size!7495 (buf!7561 thiss!1728)) (currentByte!13995 thiss!1728) (currentBit!13990 thiss!1728)))))

(declare-fun lt!424411 () Bool)

(assert (=> b!291870 (= lt!424411 (not (= (bvand ((_ sign_extend 24) (select (arr!8515 (buf!7561 thiss!1728)) (currentByte!13995 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13990 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424412 () Bool)

(assert (=> b!291870 (= lt!424412 (not (= (bvand ((_ sign_extend 24) (select (arr!8515 (buf!7561 thiss!1728)) (currentByte!13995 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13990 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!424414 () Bool)

(assert (=> b!291870 (= lt!424414 (not (= (bvand ((_ sign_extend 24) (select (arr!8515 (buf!7561 thiss!1728)) (currentByte!13995 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13990 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!98788 res!241115) b!291870))

(declare-fun m!427297 () Bool)

(assert (=> d!98788 m!427297))

(declare-fun m!427299 () Bool)

(assert (=> d!98788 m!427299))

(declare-fun m!427301 () Bool)

(assert (=> d!98788 m!427301))

(declare-fun m!427303 () Bool)

(assert (=> d!98788 m!427303))

(assert (=> b!291870 m!427299))

(assert (=> b!291870 m!427301))

(assert (=> b!291870 m!427297))

(assert (=> b!291870 m!426823))

(declare-fun m!427305 () Bool)

(assert (=> b!291870 m!427305))

(assert (=> b!291598 d!98788))

(declare-fun d!98800 () Bool)

(assert (=> d!98800 (arrayBitRangesEq!0 arr!273 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424419 () Unit!20267)

(declare-fun choose!49 (array!17312 array!17312 array!17312 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20267)

(assert (=> d!98800 (= lt!424419 (choose!49 arr!273 lt!423790 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98800 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(assert (=> d!98800 (= (arrayBitRangesEqTransitive!0 arr!273 lt!423790 (_3!1290 lt!423791) #b0000000000000000000000000000000000000000000000000000000000000000 from!505 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)) lt!424419)))

(declare-fun bs!25178 () Bool)

(assert (= bs!25178 d!98800))

(assert (=> bs!25178 m!426809))

(declare-fun m!427307 () Bool)

(assert (=> bs!25178 m!427307))

(assert (=> b!291598 d!98800))

(declare-fun d!98802 () Bool)

(assert (=> d!98802 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))) ((_ sign_extend 32) (currentByte!13995 thiss!1728)) ((_ sign_extend 32) (currentBit!13990 thiss!1728)) (bvsub to!474 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))) ((_ sign_extend 32) (currentByte!13995 thiss!1728)) ((_ sign_extend 32) (currentBit!13990 thiss!1728))) (bvsub to!474 from!505)))))

(declare-fun bs!25179 () Bool)

(assert (= bs!25179 d!98802))

(assert (=> bs!25179 m!427263))

(assert (=> b!291597 d!98802))

(declare-fun d!98804 () Bool)

(assert (=> d!98804 (= (inv!12 thiss!1728) (invariant!0 (currentBit!13990 thiss!1728) (currentByte!13995 thiss!1728) (size!7495 (buf!7561 thiss!1728))))))

(declare-fun bs!25180 () Bool)

(assert (= bs!25180 d!98804))

(assert (=> bs!25180 m!427265))

(assert (=> start!64948 d!98804))

(declare-fun d!98806 () Bool)

(assert (=> d!98806 (= (array_inv!7107 arr!273) (bvsge (size!7495 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!64948 d!98806))

(declare-fun d!98808 () Bool)

(assert (=> d!98808 (= (invariant!0 (currentBit!13990 (_2!12755 lt!423791)) (currentByte!13995 (_2!12755 lt!423791)) (size!7495 (buf!7561 (_2!12755 lt!423791)))) (and (bvsge (currentBit!13990 (_2!12755 lt!423791)) #b00000000000000000000000000000000) (bvslt (currentBit!13990 (_2!12755 lt!423791)) #b00000000000000000000000000001000) (bvsge (currentByte!13995 (_2!12755 lt!423791)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13995 (_2!12755 lt!423791)) (size!7495 (buf!7561 (_2!12755 lt!423791)))) (and (= (currentBit!13990 (_2!12755 lt!423791)) #b00000000000000000000000000000000) (= (currentByte!13995 (_2!12755 lt!423791)) (size!7495 (buf!7561 (_2!12755 lt!423791))))))))))

(assert (=> b!291601 d!98808))

(declare-fun d!98810 () Bool)

(assert (=> d!98810 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))) ((_ sign_extend 32) (currentByte!13995 thiss!1728)) ((_ sign_extend 32) (currentBit!13990 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7495 (buf!7561 thiss!1728))) ((_ sign_extend 32) (currentByte!13995 thiss!1728)) ((_ sign_extend 32) (currentBit!13990 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25181 () Bool)

(assert (= bs!25181 d!98810))

(assert (=> bs!25181 m!427263))

(assert (=> b!291596 d!98810))

(push 1)

(assert (not b!291685))

(assert (not d!98704))

(assert (not b!291870))

(assert (not d!98804))

(assert (not b!291843))

(assert (not b!291845))

(assert (not b!291679))

(assert (not b!291654))

(assert (not b!291842))

(assert (not d!98776))

(assert (not b!291678))

(assert (not bm!4881))

(assert (not b!291844))

(assert (not b!291677))

(assert (not d!98802))

(assert (not d!98722))

(assert (not bm!4905))

(assert (not d!98702))

(assert (not d!98778))

(assert (not d!98720))

(assert (not d!98788))

(assert (not b!291684))

(assert (not b!291658))

(assert (not d!98800))

(assert (not bm!4904))

(assert (not bm!4880))

(assert (not b!291846))

(assert (not d!98810))

(assert (not b!291847))

(assert (not d!98700))

(assert (not d!98766))

(assert (not b!291686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

