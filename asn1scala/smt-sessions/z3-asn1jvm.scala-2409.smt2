; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61292 () Bool)

(assert start!61292)

(declare-fun b!275903 () Bool)

(declare-fun e!195863 () Bool)

(declare-datatypes ((array!15774 0))(
  ( (array!15775 (arr!7823 (Array (_ BitVec 32) (_ BitVec 8))) (size!6833 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12480 0))(
  ( (BitStream!12481 (buf!7301 array!15774) (currentByte!13485 (_ BitVec 32)) (currentBit!13480 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12480)

(declare-fun array_inv!6557 (array!15774) Bool)

(assert (=> b!275903 (= e!195863 (array_inv!6557 (buf!7301 bs2!19)))))

(declare-fun b!275904 () Bool)

(declare-fun e!195869 () Bool)

(declare-fun e!195864 () Bool)

(assert (=> b!275904 (= e!195869 e!195864)))

(declare-fun res!229300 () Bool)

(assert (=> b!275904 (=> (not res!229300) (not e!195864))))

(declare-fun lt!413979 () (_ BitVec 64))

(declare-fun bs1!11 () BitStream!12480)

(declare-fun arrayBitRangesEq!0 (array!15774 array!15774 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275904 (= res!229300 (arrayBitRangesEq!0 (buf!7301 bs1!11) (buf!7301 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413979))))

(declare-fun lt!413977 () (_ BitVec 64))

(assert (=> b!275904 (= lt!413979 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!413977))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275904 (= lt!413977 (bitIndex!0 (size!6833 (buf!7301 bs1!11)) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))

(declare-fun b!275905 () Bool)

(declare-fun e!195865 () Bool)

(assert (=> b!275905 (= e!195864 (not e!195865))))

(declare-fun res!229298 () Bool)

(assert (=> b!275905 (=> res!229298 e!195865)))

(assert (=> b!275905 (= res!229298 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413979) (bvsgt lt!413979 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413977) (bvsge lt!413977 lt!413979)))))

(declare-datatypes ((tuple2!22496 0))(
  ( (tuple2!22497 (_1!12283 BitStream!12480) (_2!12283 Bool)) )
))
(declare-fun lt!413981 () tuple2!22496)

(declare-fun readBitPure!0 (BitStream!12480) tuple2!22496)

(assert (=> b!275905 (= lt!413981 (readBitPure!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))

(declare-fun lt!413978 () tuple2!22496)

(assert (=> b!275905 (= lt!413978 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275905 (invariant!0 (currentBit!13480 bs1!11) (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs2!19)))))

(declare-fun b!275906 () Bool)

(declare-fun res!229301 () Bool)

(assert (=> b!275906 (=> (not res!229301) (not e!195869))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275906 (= res!229301 (validate_offset_bit!0 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) ((_ sign_extend 32) (currentByte!13485 bs1!11)) ((_ sign_extend 32) (currentBit!13480 bs1!11))))))

(declare-fun b!275907 () Bool)

(assert (=> b!275907 (= e!195865 (invariant!0 (currentBit!13480 (_1!12283 lt!413981)) (currentByte!13485 (_1!12283 lt!413981)) (size!6833 (buf!7301 (_1!12283 lt!413981)))))))

(declare-fun bitAt!0 (array!15774 (_ BitVec 64)) Bool)

(assert (=> b!275907 (= (bitAt!0 (buf!7301 bs1!11) lt!413977) (bitAt!0 (buf!7301 bs2!19) lt!413977))))

(declare-datatypes ((Unit!19371 0))(
  ( (Unit!19372) )
))
(declare-fun lt!413980 () Unit!19371)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15774 array!15774 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19371)

(assert (=> b!275907 (= lt!413980 (arrayBitRangesEqImpliesEq!0 (buf!7301 bs1!11) (buf!7301 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413977 lt!413979))))

(declare-fun b!275908 () Bool)

(declare-fun e!195866 () Bool)

(assert (=> b!275908 (= e!195866 (array_inv!6557 (buf!7301 bs1!11)))))

(declare-fun res!229299 () Bool)

(assert (=> start!61292 (=> (not res!229299) (not e!195869))))

(assert (=> start!61292 (= res!229299 (= (size!6833 (buf!7301 bs1!11)) (size!6833 (buf!7301 bs2!19))))))

(assert (=> start!61292 e!195869))

(declare-fun inv!12 (BitStream!12480) Bool)

(assert (=> start!61292 (and (inv!12 bs1!11) e!195866)))

(assert (=> start!61292 (and (inv!12 bs2!19) e!195863)))

(assert (= (and start!61292 res!229299) b!275906))

(assert (= (and b!275906 res!229301) b!275904))

(assert (= (and b!275904 res!229300) b!275905))

(assert (= (and b!275905 (not res!229298)) b!275907))

(assert (= start!61292 b!275908))

(assert (= start!61292 b!275903))

(declare-fun m!408749 () Bool)

(assert (=> b!275906 m!408749))

(declare-fun m!408751 () Bool)

(assert (=> b!275905 m!408751))

(declare-fun m!408753 () Bool)

(assert (=> b!275905 m!408753))

(declare-fun m!408755 () Bool)

(assert (=> b!275905 m!408755))

(declare-fun m!408757 () Bool)

(assert (=> start!61292 m!408757))

(declare-fun m!408759 () Bool)

(assert (=> start!61292 m!408759))

(declare-fun m!408761 () Bool)

(assert (=> b!275904 m!408761))

(declare-fun m!408763 () Bool)

(assert (=> b!275904 m!408763))

(declare-fun m!408765 () Bool)

(assert (=> b!275907 m!408765))

(declare-fun m!408767 () Bool)

(assert (=> b!275907 m!408767))

(declare-fun m!408769 () Bool)

(assert (=> b!275907 m!408769))

(declare-fun m!408771 () Bool)

(assert (=> b!275907 m!408771))

(declare-fun m!408773 () Bool)

(assert (=> b!275908 m!408773))

(declare-fun m!408775 () Bool)

(assert (=> b!275903 m!408775))

(check-sat (not b!275905) (not b!275903) (not b!275904) (not start!61292) (not b!275907) (not b!275906) (not b!275908))
(check-sat)
(get-model)

(declare-fun d!94870 () Bool)

(assert (=> d!94870 (= (array_inv!6557 (buf!7301 bs1!11)) (bvsge (size!6833 (buf!7301 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275908 d!94870))

(declare-fun d!94872 () Bool)

(assert (=> d!94872 (= (array_inv!6557 (buf!7301 bs2!19)) (bvsge (size!6833 (buf!7301 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275903 d!94872))

(declare-fun d!94874 () Bool)

(assert (=> d!94874 (= (invariant!0 (currentBit!13480 (_1!12283 lt!413981)) (currentByte!13485 (_1!12283 lt!413981)) (size!6833 (buf!7301 (_1!12283 lt!413981)))) (and (bvsge (currentBit!13480 (_1!12283 lt!413981)) #b00000000000000000000000000000000) (bvslt (currentBit!13480 (_1!12283 lt!413981)) #b00000000000000000000000000001000) (bvsge (currentByte!13485 (_1!12283 lt!413981)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13485 (_1!12283 lt!413981)) (size!6833 (buf!7301 (_1!12283 lt!413981)))) (and (= (currentBit!13480 (_1!12283 lt!413981)) #b00000000000000000000000000000000) (= (currentByte!13485 (_1!12283 lt!413981)) (size!6833 (buf!7301 (_1!12283 lt!413981))))))))))

(assert (=> b!275907 d!94874))

(declare-fun d!94876 () Bool)

(assert (=> d!94876 (= (bitAt!0 (buf!7301 bs1!11) lt!413977) (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs1!11)) ((_ extract 31 0) (bvsdiv lt!413977 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413977 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23920 () Bool)

(assert (= bs!23920 d!94876))

(declare-fun m!408805 () Bool)

(assert (=> bs!23920 m!408805))

(declare-fun m!408807 () Bool)

(assert (=> bs!23920 m!408807))

(assert (=> b!275907 d!94876))

(declare-fun d!94878 () Bool)

(assert (=> d!94878 (= (bitAt!0 (buf!7301 bs2!19) lt!413977) (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs2!19)) ((_ extract 31 0) (bvsdiv lt!413977 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413977 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23921 () Bool)

(assert (= bs!23921 d!94878))

(declare-fun m!408809 () Bool)

(assert (=> bs!23921 m!408809))

(assert (=> bs!23921 m!408807))

(assert (=> b!275907 d!94878))

(declare-fun d!94880 () Bool)

(assert (=> d!94880 (= (bitAt!0 (buf!7301 bs1!11) lt!413977) (bitAt!0 (buf!7301 bs2!19) lt!413977))))

(declare-fun lt!413999 () Unit!19371)

(declare-fun choose!31 (array!15774 array!15774 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19371)

(assert (=> d!94880 (= lt!413999 (choose!31 (buf!7301 bs1!11) (buf!7301 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413977 lt!413979))))

(assert (=> d!94880 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413979))))

(assert (=> d!94880 (= (arrayBitRangesEqImpliesEq!0 (buf!7301 bs1!11) (buf!7301 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413977 lt!413979) lt!413999)))

(declare-fun bs!23922 () Bool)

(assert (= bs!23922 d!94880))

(assert (=> bs!23922 m!408767))

(assert (=> bs!23922 m!408769))

(declare-fun m!408811 () Bool)

(assert (=> bs!23922 m!408811))

(assert (=> b!275907 d!94880))

(declare-fun d!94882 () Bool)

(declare-datatypes ((tuple2!22500 0))(
  ( (tuple2!22501 (_1!12285 Bool) (_2!12285 BitStream!12480)) )
))
(declare-fun lt!414002 () tuple2!22500)

(declare-fun readBit!0 (BitStream!12480) tuple2!22500)

(assert (=> d!94882 (= lt!414002 (readBit!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))

(assert (=> d!94882 (= (readBitPure!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (tuple2!22497 (_2!12285 lt!414002) (_1!12285 lt!414002)))))

(declare-fun bs!23923 () Bool)

(assert (= bs!23923 d!94882))

(declare-fun m!408813 () Bool)

(assert (=> bs!23923 m!408813))

(assert (=> b!275905 d!94882))

(declare-fun d!94884 () Bool)

(declare-fun lt!414003 () tuple2!22500)

(assert (=> d!94884 (= lt!414003 (readBit!0 bs1!11))))

(assert (=> d!94884 (= (readBitPure!0 bs1!11) (tuple2!22497 (_2!12285 lt!414003) (_1!12285 lt!414003)))))

(declare-fun bs!23924 () Bool)

(assert (= bs!23924 d!94884))

(declare-fun m!408815 () Bool)

(assert (=> bs!23924 m!408815))

(assert (=> b!275905 d!94884))

(declare-fun d!94886 () Bool)

(assert (=> d!94886 (= (invariant!0 (currentBit!13480 bs1!11) (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs2!19))) (and (bvsge (currentBit!13480 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13480 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13485 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs2!19))) (and (= (currentBit!13480 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs2!19)))))))))

(assert (=> b!275905 d!94886))

(declare-fun d!94888 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94888 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) ((_ sign_extend 32) (currentByte!13485 bs1!11)) ((_ sign_extend 32) (currentBit!13480 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) ((_ sign_extend 32) (currentByte!13485 bs1!11)) ((_ sign_extend 32) (currentBit!13480 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23925 () Bool)

(assert (= bs!23925 d!94888))

(declare-fun m!408817 () Bool)

(assert (=> bs!23925 m!408817))

(assert (=> b!275906 d!94888))

(declare-fun d!94890 () Bool)

(assert (=> d!94890 (= (inv!12 bs1!11) (invariant!0 (currentBit!13480 bs1!11) (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs1!11))))))

(declare-fun bs!23926 () Bool)

(assert (= bs!23926 d!94890))

(declare-fun m!408819 () Bool)

(assert (=> bs!23926 m!408819))

(assert (=> start!61292 d!94890))

(declare-fun d!94892 () Bool)

(assert (=> d!94892 (= (inv!12 bs2!19) (invariant!0 (currentBit!13480 bs2!19) (currentByte!13485 bs2!19) (size!6833 (buf!7301 bs2!19))))))

(declare-fun bs!23927 () Bool)

(assert (= bs!23927 d!94892))

(declare-fun m!408821 () Bool)

(assert (=> bs!23927 m!408821))

(assert (=> start!61292 d!94892))

(declare-fun b!275941 () Bool)

(declare-fun e!195903 () Bool)

(declare-fun e!195907 () Bool)

(assert (=> b!275941 (= e!195903 e!195907)))

(declare-fun lt!414011 () (_ BitVec 32))

(declare-datatypes ((tuple4!510 0))(
  ( (tuple4!511 (_1!12286 (_ BitVec 32)) (_2!12286 (_ BitVec 32)) (_3!1035 (_ BitVec 32)) (_4!255 (_ BitVec 32))) )
))
(declare-fun lt!414010 () tuple4!510)

(declare-fun res!229328 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275941 (= res!229328 (byteRangesEq!0 (select (arr!7823 (buf!7301 bs1!11)) (_3!1035 lt!414010)) (select (arr!7823 (buf!7301 bs2!19)) (_3!1035 lt!414010)) lt!414011 #b00000000000000000000000000001000))))

(assert (=> b!275941 (=> (not res!229328) (not e!195907))))

(declare-fun b!275942 () Bool)

(declare-fun e!195905 () Bool)

(assert (=> b!275942 (= e!195905 e!195903)))

(declare-fun c!12606 () Bool)

(assert (=> b!275942 (= c!12606 (= (_3!1035 lt!414010) (_4!255 lt!414010)))))

(declare-fun b!275943 () Bool)

(declare-fun e!195906 () Bool)

(assert (=> b!275943 (= e!195906 e!195905)))

(declare-fun res!229326 () Bool)

(assert (=> b!275943 (=> (not res!229326) (not e!195905))))

(declare-fun e!195904 () Bool)

(assert (=> b!275943 (= res!229326 e!195904)))

(declare-fun res!229327 () Bool)

(assert (=> b!275943 (=> res!229327 e!195904)))

(assert (=> b!275943 (= res!229327 (bvsge (_1!12286 lt!414010) (_2!12286 lt!414010)))))

(declare-fun lt!414012 () (_ BitVec 32))

(assert (=> b!275943 (= lt!414012 ((_ extract 31 0) (bvsrem lt!413979 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275943 (= lt!414011 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!510)

(assert (=> b!275943 (= lt!414010 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413979))))

(declare-fun b!275944 () Bool)

(declare-fun e!195908 () Bool)

(declare-fun call!4421 () Bool)

(assert (=> b!275944 (= e!195908 call!4421)))

(declare-fun b!275945 () Bool)

(declare-fun arrayRangesEq!1148 (array!15774 array!15774 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275945 (= e!195904 (arrayRangesEq!1148 (buf!7301 bs1!11) (buf!7301 bs2!19) (_1!12286 lt!414010) (_2!12286 lt!414010)))))

(declare-fun d!94894 () Bool)

(declare-fun res!229324 () Bool)

(assert (=> d!94894 (=> res!229324 e!195906)))

(assert (=> d!94894 (= res!229324 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!413979))))

(assert (=> d!94894 (= (arrayBitRangesEq!0 (buf!7301 bs1!11) (buf!7301 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413979) e!195906)))

(declare-fun b!275946 () Bool)

(declare-fun res!229325 () Bool)

(assert (=> b!275946 (= res!229325 (= lt!414012 #b00000000000000000000000000000000))))

(assert (=> b!275946 (=> res!229325 e!195908)))

(assert (=> b!275946 (= e!195907 e!195908)))

(declare-fun bm!4418 () Bool)

(assert (=> bm!4418 (= call!4421 (byteRangesEq!0 (ite c!12606 (select (arr!7823 (buf!7301 bs1!11)) (_3!1035 lt!414010)) (select (arr!7823 (buf!7301 bs1!11)) (_4!255 lt!414010))) (ite c!12606 (select (arr!7823 (buf!7301 bs2!19)) (_3!1035 lt!414010)) (select (arr!7823 (buf!7301 bs2!19)) (_4!255 lt!414010))) (ite c!12606 lt!414011 #b00000000000000000000000000000000) lt!414012))))

(declare-fun b!275947 () Bool)

(assert (=> b!275947 (= e!195903 call!4421)))

(assert (= (and d!94894 (not res!229324)) b!275943))

(assert (= (and b!275943 (not res!229327)) b!275945))

(assert (= (and b!275943 res!229326) b!275942))

(assert (= (and b!275942 c!12606) b!275947))

(assert (= (and b!275942 (not c!12606)) b!275941))

(assert (= (and b!275941 res!229328) b!275946))

(assert (= (and b!275946 (not res!229325)) b!275944))

(assert (= (or b!275947 b!275944) bm!4418))

(declare-fun m!408823 () Bool)

(assert (=> b!275941 m!408823))

(declare-fun m!408825 () Bool)

(assert (=> b!275941 m!408825))

(assert (=> b!275941 m!408823))

(assert (=> b!275941 m!408825))

(declare-fun m!408827 () Bool)

(assert (=> b!275941 m!408827))

(declare-fun m!408829 () Bool)

(assert (=> b!275943 m!408829))

(declare-fun m!408831 () Bool)

(assert (=> b!275945 m!408831))

(assert (=> bm!4418 m!408823))

(assert (=> bm!4418 m!408825))

(declare-fun m!408833 () Bool)

(assert (=> bm!4418 m!408833))

(declare-fun m!408835 () Bool)

(assert (=> bm!4418 m!408835))

(declare-fun m!408837 () Bool)

(assert (=> bm!4418 m!408837))

(assert (=> b!275904 d!94894))

(declare-fun d!94900 () Bool)

(declare-fun e!195941 () Bool)

(assert (=> d!94900 e!195941))

(declare-fun res!229359 () Bool)

(assert (=> d!94900 (=> (not res!229359) (not e!195941))))

(declare-fun lt!414041 () (_ BitVec 64))

(declare-fun lt!414042 () (_ BitVec 64))

(declare-fun lt!414043 () (_ BitVec 64))

(assert (=> d!94900 (= res!229359 (= lt!414042 (bvsub lt!414043 lt!414041)))))

(assert (=> d!94900 (or (= (bvand lt!414043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414041 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414043 lt!414041) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94900 (= lt!414041 (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) ((_ sign_extend 32) (currentByte!13485 bs1!11)) ((_ sign_extend 32) (currentBit!13480 bs1!11))))))

(declare-fun lt!414040 () (_ BitVec 64))

(declare-fun lt!414045 () (_ BitVec 64))

(assert (=> d!94900 (= lt!414043 (bvmul lt!414040 lt!414045))))

(assert (=> d!94900 (or (= lt!414040 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414045 (bvsdiv (bvmul lt!414040 lt!414045) lt!414040)))))

(assert (=> d!94900 (= lt!414045 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94900 (= lt!414040 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))))))

(assert (=> d!94900 (= lt!414042 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13485 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13480 bs1!11))))))

(assert (=> d!94900 (invariant!0 (currentBit!13480 bs1!11) (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs1!11)))))

(assert (=> d!94900 (= (bitIndex!0 (size!6833 (buf!7301 bs1!11)) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)) lt!414042)))

(declare-fun b!275987 () Bool)

(declare-fun res!229358 () Bool)

(assert (=> b!275987 (=> (not res!229358) (not e!195941))))

(assert (=> b!275987 (= res!229358 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414042))))

(declare-fun b!275988 () Bool)

(declare-fun lt!414044 () (_ BitVec 64))

(assert (=> b!275988 (= e!195941 (bvsle lt!414042 (bvmul lt!414044 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275988 (or (= lt!414044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414044)))))

(assert (=> b!275988 (= lt!414044 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))))))

(assert (= (and d!94900 res!229359) b!275987))

(assert (= (and b!275987 res!229358) b!275988))

(assert (=> d!94900 m!408817))

(assert (=> d!94900 m!408819))

(assert (=> b!275904 d!94900))

(check-sat (not bm!4418) (not b!275943) (not d!94888) (not b!275941) (not d!94880) (not b!275945) (not d!94884) (not d!94900) (not d!94890) (not d!94882) (not d!94892))
(check-sat)
(get-model)

(declare-fun d!94954 () Bool)

(assert (=> d!94954 (= (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) ((_ sign_extend 32) (currentByte!13485 bs1!11)) ((_ sign_extend 32) (currentBit!13480 bs1!11))) (bvsub (bvmul ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13485 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13480 bs1!11)))))))

(assert (=> d!94900 d!94954))

(declare-fun d!94956 () Bool)

(assert (=> d!94956 (= (invariant!0 (currentBit!13480 bs1!11) (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs1!11))) (and (bvsge (currentBit!13480 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13480 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13485 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs1!11))) (and (= (currentBit!13480 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13485 bs1!11) (size!6833 (buf!7301 bs1!11)))))))))

(assert (=> d!94900 d!94956))

(declare-fun d!94958 () Bool)

(declare-fun res!229381 () Bool)

(declare-fun e!195958 () Bool)

(assert (=> d!94958 (=> res!229381 e!195958)))

(assert (=> d!94958 (= res!229381 (= (_1!12286 lt!414010) (_2!12286 lt!414010)))))

(assert (=> d!94958 (= (arrayRangesEq!1148 (buf!7301 bs1!11) (buf!7301 bs2!19) (_1!12286 lt!414010) (_2!12286 lt!414010)) e!195958)))

(declare-fun b!276012 () Bool)

(declare-fun e!195959 () Bool)

(assert (=> b!276012 (= e!195958 e!195959)))

(declare-fun res!229382 () Bool)

(assert (=> b!276012 (=> (not res!229382) (not e!195959))))

(assert (=> b!276012 (= res!229382 (= (select (arr!7823 (buf!7301 bs1!11)) (_1!12286 lt!414010)) (select (arr!7823 (buf!7301 bs2!19)) (_1!12286 lt!414010))))))

(declare-fun b!276013 () Bool)

(assert (=> b!276013 (= e!195959 (arrayRangesEq!1148 (buf!7301 bs1!11) (buf!7301 bs2!19) (bvadd (_1!12286 lt!414010) #b00000000000000000000000000000001) (_2!12286 lt!414010)))))

(assert (= (and d!94958 (not res!229381)) b!276012))

(assert (= (and b!276012 res!229382) b!276013))

(declare-fun m!408907 () Bool)

(assert (=> b!276012 m!408907))

(declare-fun m!408909 () Bool)

(assert (=> b!276012 m!408909))

(declare-fun m!408911 () Bool)

(assert (=> b!276013 m!408911))

(assert (=> b!275945 d!94958))

(declare-fun d!94960 () Bool)

(assert (=> d!94960 (= (byteRangesEq!0 (ite c!12606 (select (arr!7823 (buf!7301 bs1!11)) (_3!1035 lt!414010)) (select (arr!7823 (buf!7301 bs1!11)) (_4!255 lt!414010))) (ite c!12606 (select (arr!7823 (buf!7301 bs2!19)) (_3!1035 lt!414010)) (select (arr!7823 (buf!7301 bs2!19)) (_4!255 lt!414010))) (ite c!12606 lt!414011 #b00000000000000000000000000000000) lt!414012) (or (= (ite c!12606 lt!414011 #b00000000000000000000000000000000) lt!414012) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12606 (select (arr!7823 (buf!7301 bs1!11)) (_3!1035 lt!414010)) (select (arr!7823 (buf!7301 bs1!11)) (_4!255 lt!414010)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!414012))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12606 lt!414011 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12606 (select (arr!7823 (buf!7301 bs2!19)) (_3!1035 lt!414010)) (select (arr!7823 (buf!7301 bs2!19)) (_4!255 lt!414010)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!414012))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12606 lt!414011 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!23944 () Bool)

(assert (= bs!23944 d!94960))

(declare-fun m!408913 () Bool)

(assert (=> bs!23944 m!408913))

(declare-fun m!408915 () Bool)

(assert (=> bs!23944 m!408915))

(assert (=> bm!4418 d!94960))

(declare-fun d!94962 () Bool)

(assert (=> d!94962 (= (invariant!0 (currentBit!13480 bs2!19) (currentByte!13485 bs2!19) (size!6833 (buf!7301 bs2!19))) (and (bvsge (currentBit!13480 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13480 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13485 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13485 bs2!19) (size!6833 (buf!7301 bs2!19))) (and (= (currentBit!13480 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13485 bs2!19) (size!6833 (buf!7301 bs2!19)))))))))

(assert (=> d!94892 d!94962))

(assert (=> d!94880 d!94876))

(assert (=> d!94880 d!94878))

(declare-fun d!94964 () Bool)

(assert (=> d!94964 (= (bitAt!0 (buf!7301 bs1!11) lt!413977) (bitAt!0 (buf!7301 bs2!19) lt!413977))))

(assert (=> d!94964 true))

(declare-fun _$31!38 () Unit!19371)

(assert (=> d!94964 (= (choose!31 (buf!7301 bs1!11) (buf!7301 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413977 lt!413979) _$31!38)))

(declare-fun bs!23945 () Bool)

(assert (= bs!23945 d!94964))

(assert (=> bs!23945 m!408767))

(assert (=> bs!23945 m!408769))

(assert (=> d!94880 d!94964))

(assert (=> d!94888 d!94954))

(assert (=> d!94890 d!94956))

(declare-fun d!94966 () Bool)

(declare-fun e!195966 () Bool)

(assert (=> d!94966 e!195966))

(declare-fun res!229385 () Bool)

(assert (=> d!94966 (=> (not res!229385) (not e!195966))))

(declare-datatypes ((tuple2!22506 0))(
  ( (tuple2!22507 (_1!12291 Unit!19371) (_2!12291 BitStream!12480)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12480) tuple2!22506)

(assert (=> d!94966 (= res!229385 (= (buf!7301 (_2!12291 (increaseBitIndex!0 bs1!11))) (buf!7301 bs1!11)))))

(declare-fun lt!414117 () Bool)

(assert (=> d!94966 (= lt!414117 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs1!11)) (currentByte!13485 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414114 () tuple2!22500)

(assert (=> d!94966 (= lt!414114 (tuple2!22501 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs1!11)) (currentByte!13485 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 bs1!11)))) #b00000000000000000000000000000000)) (_2!12291 (increaseBitIndex!0 bs1!11))))))

(assert (=> d!94966 (validate_offset_bit!0 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) ((_ sign_extend 32) (currentByte!13485 bs1!11)) ((_ sign_extend 32) (currentBit!13480 bs1!11)))))

(assert (=> d!94966 (= (readBit!0 bs1!11) lt!414114)))

(declare-fun lt!414115 () (_ BitVec 64))

(declare-fun lt!414113 () (_ BitVec 64))

(declare-fun b!276016 () Bool)

(assert (=> b!276016 (= e!195966 (= (bitIndex!0 (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 bs1!11)))) (currentByte!13485 (_2!12291 (increaseBitIndex!0 bs1!11))) (currentBit!13480 (_2!12291 (increaseBitIndex!0 bs1!11)))) (bvadd lt!414113 lt!414115)))))

(assert (=> b!276016 (or (not (= (bvand lt!414113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414115 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414113 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414113 lt!414115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276016 (= lt!414115 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276016 (= lt!414113 (bitIndex!0 (size!6833 (buf!7301 bs1!11)) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))

(declare-fun lt!414118 () Bool)

(assert (=> b!276016 (= lt!414118 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs1!11)) (currentByte!13485 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414119 () Bool)

(assert (=> b!276016 (= lt!414119 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs1!11)) (currentByte!13485 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414116 () Bool)

(assert (=> b!276016 (= lt!414116 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs1!11)) (currentByte!13485 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 bs1!11)))) #b00000000000000000000000000000000)))))

(assert (= (and d!94966 res!229385) b!276016))

(declare-fun m!408917 () Bool)

(assert (=> d!94966 m!408917))

(declare-fun m!408919 () Bool)

(assert (=> d!94966 m!408919))

(declare-fun m!408921 () Bool)

(assert (=> d!94966 m!408921))

(assert (=> d!94966 m!408749))

(assert (=> b!276016 m!408921))

(assert (=> b!276016 m!408917))

(assert (=> b!276016 m!408919))

(declare-fun m!408923 () Bool)

(assert (=> b!276016 m!408923))

(assert (=> b!276016 m!408763))

(assert (=> d!94884 d!94966))

(declare-fun d!94968 () Bool)

(declare-fun e!195967 () Bool)

(assert (=> d!94968 e!195967))

(declare-fun res!229386 () Bool)

(assert (=> d!94968 (=> (not res!229386) (not e!195967))))

(assert (=> d!94968 (= res!229386 (= (buf!7301 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))))

(declare-fun lt!414124 () Bool)

(assert (=> d!94968 (= lt!414124 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414121 () tuple2!22500)

(assert (=> d!94968 (= lt!414121 (tuple2!22501 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) #b00000000000000000000000000000000)) (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))

(assert (=> d!94968 (validate_offset_bit!0 ((_ sign_extend 32) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 32) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) ((_ sign_extend 32) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))))

(assert (=> d!94968 (= (readBit!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) lt!414121)))

(declare-fun lt!414122 () (_ BitVec 64))

(declare-fun lt!414120 () (_ BitVec 64))

(declare-fun b!276017 () Bool)

(assert (=> b!276017 (= e!195967 (= (bitIndex!0 (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) (currentByte!13485 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) (currentBit!13480 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) (bvadd lt!414120 lt!414122)))))

(assert (=> b!276017 (or (not (= (bvand lt!414120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414122 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414120 lt!414122) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276017 (= lt!414122 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276017 (= lt!414120 (bitIndex!0 (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))))

(declare-fun lt!414125 () Bool)

(assert (=> b!276017 (= lt!414125 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414126 () Bool)

(assert (=> b!276017 (= lt!414126 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414123 () Bool)

(assert (=> b!276017 (= lt!414123 (not (= (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!94968 res!229386) b!276017))

(declare-fun m!408925 () Bool)

(assert (=> d!94968 m!408925))

(declare-fun m!408927 () Bool)

(assert (=> d!94968 m!408927))

(declare-fun m!408929 () Bool)

(assert (=> d!94968 m!408929))

(declare-fun m!408931 () Bool)

(assert (=> d!94968 m!408931))

(assert (=> b!276017 m!408929))

(assert (=> b!276017 m!408925))

(assert (=> b!276017 m!408927))

(declare-fun m!408933 () Bool)

(assert (=> b!276017 m!408933))

(declare-fun m!408935 () Bool)

(assert (=> b!276017 m!408935))

(assert (=> d!94882 d!94968))

(declare-fun d!94970 () Bool)

(assert (=> d!94970 (= (byteRangesEq!0 (select (arr!7823 (buf!7301 bs1!11)) (_3!1035 lt!414010)) (select (arr!7823 (buf!7301 bs2!19)) (_3!1035 lt!414010)) lt!414011 #b00000000000000000000000000001000) (or (= lt!414011 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs1!11)) (_3!1035 lt!414010))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!414011)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7823 (buf!7301 bs2!19)) (_3!1035 lt!414010))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!414011)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23946 () Bool)

(assert (= bs!23946 d!94970))

(declare-fun m!408937 () Bool)

(assert (=> bs!23946 m!408937))

(declare-fun m!408939 () Bool)

(assert (=> bs!23946 m!408939))

(assert (=> b!275941 d!94970))

(declare-fun d!94972 () Bool)

(assert (=> d!94972 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413979) (tuple4!511 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!413979 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!413979 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!275943 d!94972))

(check-sat (not d!94968) (not d!94966) (not b!276017) (not b!276016) (not b!276013) (not d!94964))
(check-sat)
(get-model)

(declare-fun d!94994 () Bool)

(declare-fun e!195982 () Bool)

(assert (=> d!94994 e!195982))

(declare-fun res!229398 () Bool)

(assert (=> d!94994 (=> (not res!229398) (not e!195982))))

(declare-fun lt!414157 () (_ BitVec 64))

(declare-fun lt!414156 () (_ BitVec 64))

(declare-fun lt!414158 () (_ BitVec 64))

(assert (=> d!94994 (= res!229398 (= lt!414157 (bvsub lt!414158 lt!414156)))))

(assert (=> d!94994 (or (= (bvand lt!414158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414156 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414158 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414158 lt!414156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94994 (= lt!414156 (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))) ((_ sign_extend 32) (currentByte!13485 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) ((_ sign_extend 32) (currentBit!13480 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))))

(declare-fun lt!414155 () (_ BitVec 64))

(declare-fun lt!414160 () (_ BitVec 64))

(assert (=> d!94994 (= lt!414158 (bvmul lt!414155 lt!414160))))

(assert (=> d!94994 (or (= lt!414155 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414160 (bvsdiv (bvmul lt!414155 lt!414160) lt!414155)))))

(assert (=> d!94994 (= lt!414160 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94994 (= lt!414155 ((_ sign_extend 32) (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))))

(assert (=> d!94994 (= lt!414157 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13485 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13480 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))))

(assert (=> d!94994 (invariant!0 (currentBit!13480 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) (currentByte!13485 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))))))

(assert (=> d!94994 (= (bitIndex!0 (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) (currentByte!13485 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) (currentBit!13480 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))) lt!414157)))

(declare-fun b!276028 () Bool)

(declare-fun res!229397 () Bool)

(assert (=> b!276028 (=> (not res!229397) (not e!195982))))

(assert (=> b!276028 (= res!229397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414157))))

(declare-fun b!276029 () Bool)

(declare-fun lt!414159 () (_ BitVec 64))

(assert (=> b!276029 (= e!195982 (bvsle lt!414157 (bvmul lt!414159 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276029 (or (= lt!414159 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414159 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414159)))))

(assert (=> b!276029 (= lt!414159 ((_ sign_extend 32) (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))))

(assert (= (and d!94994 res!229398) b!276028))

(assert (= (and b!276028 res!229397) b!276029))

(declare-fun m!408975 () Bool)

(assert (=> d!94994 m!408975))

(declare-fun m!408977 () Bool)

(assert (=> d!94994 m!408977))

(assert (=> b!276017 d!94994))

(declare-fun d!94996 () Bool)

(declare-fun e!195985 () Bool)

(assert (=> d!94996 e!195985))

(declare-fun res!229404 () Bool)

(assert (=> d!94996 (=> (not res!229404) (not e!195985))))

(declare-fun lt!414171 () (_ BitVec 64))

(declare-fun lt!414173 () tuple2!22506)

(declare-fun lt!414174 () (_ BitVec 64))

(assert (=> d!94996 (= res!229404 (= (bvadd lt!414171 lt!414174) (bitIndex!0 (size!6833 (buf!7301 (_2!12291 lt!414173))) (currentByte!13485 (_2!12291 lt!414173)) (currentBit!13480 (_2!12291 lt!414173)))))))

(assert (=> d!94996 (or (not (= (bvand lt!414171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414174 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414171 lt!414174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94996 (= lt!414174 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!94996 (= lt!414171 (bitIndex!0 (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))))

(declare-fun Unit!19375 () Unit!19371)

(declare-fun Unit!19376 () Unit!19371)

(assert (=> d!94996 (= lt!414173 (ite (bvslt (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) #b00000000000000000000000000000111) (tuple2!22507 Unit!19375 (BitStream!12481 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (bvadd (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) #b00000000000000000000000000000001))) (tuple2!22507 Unit!19376 (BitStream!12481 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (bvadd (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!94996 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 32) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) ((_ sign_extend 32) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!94996 (= (increaseBitIndex!0 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) lt!414173)))

(declare-fun b!276034 () Bool)

(declare-fun res!229403 () Bool)

(assert (=> b!276034 (=> (not res!229403) (not e!195985))))

(declare-fun lt!414172 () (_ BitVec 64))

(declare-fun lt!414175 () (_ BitVec 64))

(assert (=> b!276034 (= res!229403 (= (bvsub lt!414172 lt!414175) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!276034 (or (= (bvand lt!414172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414175 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414172 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414172 lt!414175) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276034 (= lt!414175 (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 (_2!12291 lt!414173)))) ((_ sign_extend 32) (currentByte!13485 (_2!12291 lt!414173))) ((_ sign_extend 32) (currentBit!13480 (_2!12291 lt!414173)))))))

(assert (=> b!276034 (= lt!414172 (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 32) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) ((_ sign_extend 32) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))

(declare-fun b!276035 () Bool)

(assert (=> b!276035 (= e!195985 (= (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (size!6833 (buf!7301 (_2!12291 lt!414173)))))))

(assert (= (and d!94996 res!229404) b!276034))

(assert (= (and b!276034 res!229403) b!276035))

(declare-fun m!408979 () Bool)

(assert (=> d!94996 m!408979))

(assert (=> d!94996 m!408935))

(declare-fun m!408981 () Bool)

(assert (=> d!94996 m!408981))

(declare-fun m!408983 () Bool)

(assert (=> b!276034 m!408983))

(assert (=> b!276034 m!408981))

(assert (=> b!276017 d!94996))

(declare-fun d!94998 () Bool)

(declare-fun e!195986 () Bool)

(assert (=> d!94998 e!195986))

(declare-fun res!229406 () Bool)

(assert (=> d!94998 (=> (not res!229406) (not e!195986))))

(declare-fun lt!414177 () (_ BitVec 64))

(declare-fun lt!414178 () (_ BitVec 64))

(declare-fun lt!414179 () (_ BitVec 64))

(assert (=> d!94998 (= res!229406 (= lt!414178 (bvsub lt!414179 lt!414177)))))

(assert (=> d!94998 (or (= (bvand lt!414179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414177 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414179 lt!414177) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94998 (= lt!414177 (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 32) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) ((_ sign_extend 32) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))

(declare-fun lt!414176 () (_ BitVec 64))

(declare-fun lt!414181 () (_ BitVec 64))

(assert (=> d!94998 (= lt!414179 (bvmul lt!414176 lt!414181))))

(assert (=> d!94998 (or (= lt!414176 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414181 (bvsdiv (bvmul lt!414176 lt!414181) lt!414176)))))

(assert (=> d!94998 (= lt!414181 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94998 (= lt!414176 ((_ sign_extend 32) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))

(assert (=> d!94998 (= lt!414178 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))

(assert (=> d!94998 (invariant!0 (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))))

(assert (=> d!94998 (= (bitIndex!0 (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) lt!414178)))

(declare-fun b!276036 () Bool)

(declare-fun res!229405 () Bool)

(assert (=> b!276036 (=> (not res!229405) (not e!195986))))

(assert (=> b!276036 (= res!229405 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414178))))

(declare-fun b!276037 () Bool)

(declare-fun lt!414180 () (_ BitVec 64))

(assert (=> b!276037 (= e!195986 (bvsle lt!414178 (bvmul lt!414180 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276037 (or (= lt!414180 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414180 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414180)))))

(assert (=> b!276037 (= lt!414180 ((_ sign_extend 32) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))))))

(assert (= (and d!94998 res!229406) b!276036))

(assert (= (and b!276036 res!229405) b!276037))

(assert (=> d!94998 m!408981))

(declare-fun m!408985 () Bool)

(assert (=> d!94998 m!408985))

(assert (=> b!276017 d!94998))

(assert (=> d!94964 d!94876))

(assert (=> d!94964 d!94878))

(declare-fun d!95000 () Bool)

(declare-fun e!195987 () Bool)

(assert (=> d!95000 e!195987))

(declare-fun res!229408 () Bool)

(assert (=> d!95000 (=> (not res!229408) (not e!195987))))

(declare-fun lt!414183 () (_ BitVec 64))

(declare-fun lt!414185 () (_ BitVec 64))

(declare-fun lt!414184 () (_ BitVec 64))

(assert (=> d!95000 (= res!229408 (= lt!414184 (bvsub lt!414185 lt!414183)))))

(assert (=> d!95000 (or (= (bvand lt!414185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414183 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414185 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414185 lt!414183) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95000 (= lt!414183 (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 bs1!11))))) ((_ sign_extend 32) (currentByte!13485 (_2!12291 (increaseBitIndex!0 bs1!11)))) ((_ sign_extend 32) (currentBit!13480 (_2!12291 (increaseBitIndex!0 bs1!11))))))))

(declare-fun lt!414182 () (_ BitVec 64))

(declare-fun lt!414187 () (_ BitVec 64))

(assert (=> d!95000 (= lt!414185 (bvmul lt!414182 lt!414187))))

(assert (=> d!95000 (or (= lt!414182 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414187 (bvsdiv (bvmul lt!414182 lt!414187) lt!414182)))))

(assert (=> d!95000 (= lt!414187 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95000 (= lt!414182 ((_ sign_extend 32) (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 bs1!11))))))))

(assert (=> d!95000 (= lt!414184 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13485 (_2!12291 (increaseBitIndex!0 bs1!11)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13480 (_2!12291 (increaseBitIndex!0 bs1!11))))))))

(assert (=> d!95000 (invariant!0 (currentBit!13480 (_2!12291 (increaseBitIndex!0 bs1!11))) (currentByte!13485 (_2!12291 (increaseBitIndex!0 bs1!11))) (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 bs1!11)))))))

(assert (=> d!95000 (= (bitIndex!0 (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 bs1!11)))) (currentByte!13485 (_2!12291 (increaseBitIndex!0 bs1!11))) (currentBit!13480 (_2!12291 (increaseBitIndex!0 bs1!11)))) lt!414184)))

(declare-fun b!276038 () Bool)

(declare-fun res!229407 () Bool)

(assert (=> b!276038 (=> (not res!229407) (not e!195987))))

(assert (=> b!276038 (= res!229407 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414184))))

(declare-fun b!276039 () Bool)

(declare-fun lt!414186 () (_ BitVec 64))

(assert (=> b!276039 (= e!195987 (bvsle lt!414184 (bvmul lt!414186 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276039 (or (= lt!414186 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414186 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414186)))))

(assert (=> b!276039 (= lt!414186 ((_ sign_extend 32) (size!6833 (buf!7301 (_2!12291 (increaseBitIndex!0 bs1!11))))))))

(assert (= (and d!95000 res!229408) b!276038))

(assert (= (and b!276038 res!229407) b!276039))

(declare-fun m!408987 () Bool)

(assert (=> d!95000 m!408987))

(declare-fun m!408989 () Bool)

(assert (=> d!95000 m!408989))

(assert (=> b!276016 d!95000))

(declare-fun d!95002 () Bool)

(declare-fun e!195988 () Bool)

(assert (=> d!95002 e!195988))

(declare-fun res!229410 () Bool)

(assert (=> d!95002 (=> (not res!229410) (not e!195988))))

(declare-fun lt!414188 () (_ BitVec 64))

(declare-fun lt!414190 () tuple2!22506)

(declare-fun lt!414191 () (_ BitVec 64))

(assert (=> d!95002 (= res!229410 (= (bvadd lt!414188 lt!414191) (bitIndex!0 (size!6833 (buf!7301 (_2!12291 lt!414190))) (currentByte!13485 (_2!12291 lt!414190)) (currentBit!13480 (_2!12291 lt!414190)))))))

(assert (=> d!95002 (or (not (= (bvand lt!414188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414191 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414188 lt!414191) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95002 (= lt!414191 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!95002 (= lt!414188 (bitIndex!0 (size!6833 (buf!7301 bs1!11)) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))))

(declare-fun Unit!19377 () Unit!19371)

(declare-fun Unit!19378 () Unit!19371)

(assert (=> d!95002 (= lt!414190 (ite (bvslt (currentBit!13480 bs1!11) #b00000000000000000000000000000111) (tuple2!22507 Unit!19377 (BitStream!12481 (buf!7301 bs1!11) (currentByte!13485 bs1!11) (bvadd (currentBit!13480 bs1!11) #b00000000000000000000000000000001))) (tuple2!22507 Unit!19378 (BitStream!12481 (buf!7301 bs1!11) (bvadd (currentByte!13485 bs1!11) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!95002 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) ((_ sign_extend 32) (currentByte!13485 bs1!11)) ((_ sign_extend 32) (currentBit!13480 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!95002 (= (increaseBitIndex!0 bs1!11) lt!414190)))

(declare-fun b!276040 () Bool)

(declare-fun res!229409 () Bool)

(assert (=> b!276040 (=> (not res!229409) (not e!195988))))

(declare-fun lt!414189 () (_ BitVec 64))

(declare-fun lt!414192 () (_ BitVec 64))

(assert (=> b!276040 (= res!229409 (= (bvsub lt!414189 lt!414192) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!276040 (or (= (bvand lt!414189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414192 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414189 lt!414192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276040 (= lt!414192 (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 (_2!12291 lt!414190)))) ((_ sign_extend 32) (currentByte!13485 (_2!12291 lt!414190))) ((_ sign_extend 32) (currentBit!13480 (_2!12291 lt!414190)))))))

(assert (=> b!276040 (= lt!414189 (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 bs1!11))) ((_ sign_extend 32) (currentByte!13485 bs1!11)) ((_ sign_extend 32) (currentBit!13480 bs1!11))))))

(declare-fun b!276041 () Bool)

(assert (=> b!276041 (= e!195988 (= (size!6833 (buf!7301 bs1!11)) (size!6833 (buf!7301 (_2!12291 lt!414190)))))))

(assert (= (and d!95002 res!229410) b!276040))

(assert (= (and b!276040 res!229409) b!276041))

(declare-fun m!408991 () Bool)

(assert (=> d!95002 m!408991))

(assert (=> d!95002 m!408763))

(assert (=> d!95002 m!408817))

(declare-fun m!408993 () Bool)

(assert (=> b!276040 m!408993))

(assert (=> b!276040 m!408817))

(assert (=> b!276016 d!95002))

(assert (=> b!276016 d!94900))

(assert (=> d!94968 d!94996))

(declare-fun d!95004 () Bool)

(assert (=> d!95004 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 32) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) ((_ sign_extend 32) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6833 (buf!7301 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) ((_ sign_extend 32) (currentByte!13485 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11)))) ((_ sign_extend 32) (currentBit!13480 (BitStream!12481 (buf!7301 bs2!19) (currentByte!13485 bs1!11) (currentBit!13480 bs1!11))))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23950 () Bool)

(assert (= bs!23950 d!95004))

(assert (=> bs!23950 m!408981))

(assert (=> d!94968 d!95004))

(assert (=> d!94966 d!95002))

(assert (=> d!94966 d!94888))

(declare-fun d!95006 () Bool)

(declare-fun res!229411 () Bool)

(declare-fun e!195989 () Bool)

(assert (=> d!95006 (=> res!229411 e!195989)))

(assert (=> d!95006 (= res!229411 (= (bvadd (_1!12286 lt!414010) #b00000000000000000000000000000001) (_2!12286 lt!414010)))))

(assert (=> d!95006 (= (arrayRangesEq!1148 (buf!7301 bs1!11) (buf!7301 bs2!19) (bvadd (_1!12286 lt!414010) #b00000000000000000000000000000001) (_2!12286 lt!414010)) e!195989)))

(declare-fun b!276042 () Bool)

(declare-fun e!195990 () Bool)

(assert (=> b!276042 (= e!195989 e!195990)))

(declare-fun res!229412 () Bool)

(assert (=> b!276042 (=> (not res!229412) (not e!195990))))

(assert (=> b!276042 (= res!229412 (= (select (arr!7823 (buf!7301 bs1!11)) (bvadd (_1!12286 lt!414010) #b00000000000000000000000000000001)) (select (arr!7823 (buf!7301 bs2!19)) (bvadd (_1!12286 lt!414010) #b00000000000000000000000000000001))))))

(declare-fun b!276043 () Bool)

(assert (=> b!276043 (= e!195990 (arrayRangesEq!1148 (buf!7301 bs1!11) (buf!7301 bs2!19) (bvadd (_1!12286 lt!414010) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!12286 lt!414010)))))

(assert (= (and d!95006 (not res!229411)) b!276042))

(assert (= (and b!276042 res!229412) b!276043))

(declare-fun m!408995 () Bool)

(assert (=> b!276042 m!408995))

(declare-fun m!408997 () Bool)

(assert (=> b!276042 m!408997))

(declare-fun m!408999 () Bool)

(assert (=> b!276043 m!408999))

(assert (=> b!276013 d!95006))

(check-sat (not b!276040) (not d!94998) (not d!95002) (not b!276034) (not d!95004) (not d!94996) (not d!94994) (not b!276043) (not d!95000))
(check-sat)
