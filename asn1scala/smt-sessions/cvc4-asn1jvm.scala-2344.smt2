; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59778 () Bool)

(assert start!59778)

(declare-fun res!227179 () Bool)

(declare-fun e!192801 () Bool)

(assert (=> start!59778 (=> (not res!227179) (not e!192801))))

(declare-datatypes ((array!15267 0))(
  ( (array!15268 (arr!7626 (Array (_ BitVec 32) (_ BitVec 8))) (size!6639 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12092 0))(
  ( (BitStream!12093 (buf!7107 array!15267) (currentByte!13114 (_ BitVec 32)) (currentBit!13109 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12092)

(assert (=> start!59778 (= res!227179 (not (= (size!6639 (buf!7107 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59778 e!192801))

(declare-fun e!192802 () Bool)

(declare-fun inv!12 (BitStream!12092) Bool)

(assert (=> start!59778 (and (inv!12 bs!71) e!192802)))

(declare-fun b!272902 () Bool)

(declare-fun lt!410770 () (_ BitVec 64))

(declare-fun lt!410771 () (_ BitVec 64))

(assert (=> b!272902 (= e!192801 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410770) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410771) (bvsle lt!410771 lt!410770)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272902 (= lt!410771 (bitIndex!0 (size!6639 (buf!7107 bs!71)) (currentByte!13114 bs!71) (currentBit!13109 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15267 array!15267 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272902 (arrayBitRangesEq!0 (buf!7107 bs!71) (buf!7107 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410770)))

(assert (=> b!272902 (= lt!410770 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6639 (buf!7107 bs!71)))))))

(declare-datatypes ((Unit!19257 0))(
  ( (Unit!19258) )
))
(declare-fun lt!410769 () Unit!19257)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15267) Unit!19257)

(assert (=> b!272902 (= lt!410769 (arrayBitEqImpliesRangesEqLemma!0 (buf!7107 bs!71)))))

(declare-fun b!272903 () Bool)

(declare-fun array_inv!6363 (array!15267) Bool)

(assert (=> b!272903 (= e!192802 (array_inv!6363 (buf!7107 bs!71)))))

(assert (= (and start!59778 res!227179) b!272902))

(assert (= start!59778 b!272903))

(declare-fun m!405803 () Bool)

(assert (=> start!59778 m!405803))

(declare-fun m!405805 () Bool)

(assert (=> b!272902 m!405805))

(declare-fun m!405807 () Bool)

(assert (=> b!272902 m!405807))

(declare-fun m!405809 () Bool)

(assert (=> b!272902 m!405809))

(declare-fun m!405811 () Bool)

(assert (=> b!272903 m!405811))

(push 1)

(assert (not b!272902))

(assert (not start!59778))

(assert (not b!272903))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93340 () Bool)

(declare-fun e!192811 () Bool)

(assert (=> d!93340 e!192811))

(declare-fun res!227197 () Bool)

(assert (=> d!93340 (=> (not res!227197) (not e!192811))))

(declare-fun lt!410825 () (_ BitVec 64))

(declare-fun lt!410820 () (_ BitVec 64))

(declare-fun lt!410823 () (_ BitVec 64))

(assert (=> d!93340 (= res!227197 (= lt!410820 (bvsub lt!410825 lt!410823)))))

(assert (=> d!93340 (or (= (bvand lt!410825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410825 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410825 lt!410823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93340 (= lt!410823 (remainingBits!0 ((_ sign_extend 32) (size!6639 (buf!7107 bs!71))) ((_ sign_extend 32) (currentByte!13114 bs!71)) ((_ sign_extend 32) (currentBit!13109 bs!71))))))

(declare-fun lt!410821 () (_ BitVec 64))

(declare-fun lt!410824 () (_ BitVec 64))

(assert (=> d!93340 (= lt!410825 (bvmul lt!410821 lt!410824))))

(assert (=> d!93340 (or (= lt!410821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410824 (bvsdiv (bvmul lt!410821 lt!410824) lt!410821)))))

(assert (=> d!93340 (= lt!410824 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93340 (= lt!410821 ((_ sign_extend 32) (size!6639 (buf!7107 bs!71))))))

(assert (=> d!93340 (= lt!410820 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13114 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13109 bs!71))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93340 (invariant!0 (currentBit!13109 bs!71) (currentByte!13114 bs!71) (size!6639 (buf!7107 bs!71)))))

(assert (=> d!93340 (= (bitIndex!0 (size!6639 (buf!7107 bs!71)) (currentByte!13114 bs!71) (currentBit!13109 bs!71)) lt!410820)))

(declare-fun b!272920 () Bool)

(declare-fun res!227196 () Bool)

(assert (=> b!272920 (=> (not res!227196) (not e!192811))))

(assert (=> b!272920 (= res!227196 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410820))))

(declare-fun b!272921 () Bool)

(declare-fun lt!410822 () (_ BitVec 64))

(assert (=> b!272921 (= e!192811 (bvsle lt!410820 (bvmul lt!410822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272921 (or (= lt!410822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410822)))))

(assert (=> b!272921 (= lt!410822 ((_ sign_extend 32) (size!6639 (buf!7107 bs!71))))))

(assert (= (and d!93340 res!227197) b!272920))

(assert (= (and b!272920 res!227196) b!272921))

(declare-fun m!405821 () Bool)

(assert (=> d!93340 m!405821))

(declare-fun m!405823 () Bool)

(assert (=> d!93340 m!405823))

(assert (=> b!272902 d!93340))

(declare-fun b!272984 () Bool)

(declare-fun e!192869 () Bool)

(declare-fun call!4397 () Bool)

(assert (=> b!272984 (= e!192869 call!4397)))

(declare-fun b!272986 () Bool)

(declare-fun e!192868 () Bool)

(assert (=> b!272986 (= e!192869 e!192868)))

(declare-fun lt!410869 () (_ BitVec 32))

(declare-fun res!227248 () Bool)

(declare-datatypes ((tuple4!496 0))(
  ( (tuple4!497 (_1!12231 (_ BitVec 32)) (_2!12231 (_ BitVec 32)) (_3!1028 (_ BitVec 32)) (_4!248 (_ BitVec 32))) )
))
(declare-fun lt!410868 () tuple4!496)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272986 (= res!227248 (byteRangesEq!0 (select (arr!7626 (buf!7107 bs!71)) (_3!1028 lt!410868)) (select (arr!7626 (buf!7107 bs!71)) (_3!1028 lt!410868)) lt!410869 #b00000000000000000000000000001000))))

(assert (=> b!272986 (=> (not res!227248) (not e!192868))))

(declare-fun b!272987 () Bool)

(declare-fun e!192867 () Bool)

(assert (=> b!272987 (= e!192867 e!192869)))

(declare-fun c!12582 () Bool)

(assert (=> b!272987 (= c!12582 (= (_3!1028 lt!410868) (_4!248 lt!410868)))))

(declare-fun b!272988 () Bool)

(declare-fun e!192871 () Bool)

(assert (=> b!272988 (= e!192871 call!4397)))

(declare-fun lt!410870 () (_ BitVec 32))

(declare-fun bm!4394 () Bool)

(assert (=> bm!4394 (= call!4397 (byteRangesEq!0 (ite c!12582 (select (arr!7626 (buf!7107 bs!71)) (_3!1028 lt!410868)) (select (arr!7626 (buf!7107 bs!71)) (_4!248 lt!410868))) (ite c!12582 (select (arr!7626 (buf!7107 bs!71)) (_3!1028 lt!410868)) (select (arr!7626 (buf!7107 bs!71)) (_4!248 lt!410868))) (ite c!12582 lt!410869 #b00000000000000000000000000000000) lt!410870))))

(declare-fun b!272989 () Bool)

(declare-fun res!227247 () Bool)

(assert (=> b!272989 (= res!227247 (= lt!410870 #b00000000000000000000000000000000))))

(assert (=> b!272989 (=> res!227247 e!192871)))

(assert (=> b!272989 (= e!192868 e!192871)))

(declare-fun b!272990 () Bool)

(declare-fun e!192870 () Bool)

(assert (=> b!272990 (= e!192870 e!192867)))

(declare-fun res!227244 () Bool)

(assert (=> b!272990 (=> (not res!227244) (not e!192867))))

(declare-fun e!192866 () Bool)

(assert (=> b!272990 (= res!227244 e!192866)))

(declare-fun res!227246 () Bool)

(assert (=> b!272990 (=> res!227246 e!192866)))

(assert (=> b!272990 (= res!227246 (bvsge (_1!12231 lt!410868) (_2!12231 lt!410868)))))

(assert (=> b!272990 (= lt!410870 ((_ extract 31 0) (bvsrem lt!410770 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!272990 (= lt!410869 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!496)

(assert (=> b!272990 (= lt!410868 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410770))))

(declare-fun b!272985 () Bool)

(declare-fun arrayRangesEq!1141 (array!15267 array!15267 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!272985 (= e!192866 (arrayRangesEq!1141 (buf!7107 bs!71) (buf!7107 bs!71) (_1!12231 lt!410868) (_2!12231 lt!410868)))))

(declare-fun d!93346 () Bool)

(declare-fun res!227245 () Bool)

(assert (=> d!93346 (=> res!227245 e!192870)))

(assert (=> d!93346 (= res!227245 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410770))))

(assert (=> d!93346 (= (arrayBitRangesEq!0 (buf!7107 bs!71) (buf!7107 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410770) e!192870)))

(assert (= (and d!93346 (not res!227245)) b!272990))

(assert (= (and b!272990 (not res!227246)) b!272985))

(assert (= (and b!272990 res!227244) b!272987))

(assert (= (and b!272987 c!12582) b!272984))

(assert (= (and b!272987 (not c!12582)) b!272986))

(assert (= (and b!272986 res!227248) b!272989))

(assert (= (and b!272989 (not res!227247)) b!272988))

(assert (= (or b!272984 b!272988) bm!4394))

(declare-fun m!405857 () Bool)

(assert (=> b!272986 m!405857))

(assert (=> b!272986 m!405857))

(assert (=> b!272986 m!405857))

(assert (=> b!272986 m!405857))

(declare-fun m!405859 () Bool)

(assert (=> b!272986 m!405859))

(declare-fun m!405861 () Bool)

(assert (=> bm!4394 m!405861))

(assert (=> bm!4394 m!405861))

(assert (=> bm!4394 m!405857))

(declare-fun m!405863 () Bool)

(assert (=> bm!4394 m!405863))

(assert (=> bm!4394 m!405857))

(declare-fun m!405865 () Bool)

(assert (=> b!272990 m!405865))

(declare-fun m!405867 () Bool)

(assert (=> b!272985 m!405867))

(assert (=> b!272902 d!93346))

(declare-fun d!93360 () Bool)

(declare-fun e!192874 () Bool)

(assert (=> d!93360 e!192874))

(declare-fun res!227251 () Bool)

(assert (=> d!93360 (=> (not res!227251) (not e!192874))))

(declare-fun lt!410878 () (_ BitVec 64))

(declare-fun lt!410877 () (_ BitVec 64))

(assert (=> d!93360 (= res!227251 (or (= lt!410878 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410877 (bvsdiv (bvmul lt!410878 lt!410877) lt!410878))))))

(assert (=> d!93360 (= lt!410877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93360 (= lt!410878 ((_ sign_extend 32) (size!6639 (buf!7107 bs!71))))))

(declare-fun lt!410879 () Unit!19257)

(declare-fun choose!44 (array!15267) Unit!19257)

(assert (=> d!93360 (= lt!410879 (choose!44 (buf!7107 bs!71)))))

(assert (=> d!93360 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7107 bs!71)) lt!410879)))

(declare-fun b!272993 () Bool)

(assert (=> b!272993 (= e!192874 (arrayBitRangesEq!0 (buf!7107 bs!71) (buf!7107 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6639 (buf!7107 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93360 res!227251) b!272993))

(declare-fun m!405869 () Bool)

(assert (=> d!93360 m!405869))

(declare-fun m!405871 () Bool)

(assert (=> b!272993 m!405871))

(assert (=> b!272902 d!93360))

(declare-fun d!93362 () Bool)

(assert (=> d!93362 (= (inv!12 bs!71) (invariant!0 (currentBit!13109 bs!71) (currentByte!13114 bs!71) (size!6639 (buf!7107 bs!71))))))

(declare-fun bs!23547 () Bool)

(assert (= bs!23547 d!93362))

(assert (=> bs!23547 m!405823))

(assert (=> start!59778 d!93362))

(declare-fun d!93364 () Bool)

(assert (=> d!93364 (= (array_inv!6363 (buf!7107 bs!71)) (bvsge (size!6639 (buf!7107 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!272903 d!93364))

(push 1)

(assert (not b!272993))

(assert (not b!272985))

(assert (not b!272986))

(assert (not bm!4394))

(assert (not d!93362))

(assert (not b!272990))

(assert (not d!93360))

(assert (not d!93340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

