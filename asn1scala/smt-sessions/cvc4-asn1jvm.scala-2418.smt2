; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61634 () Bool)

(assert start!61634)

(declare-fun b!276810 () Bool)

(declare-fun e!196735 () Bool)

(declare-fun e!196741 () Bool)

(assert (=> b!276810 (= e!196735 e!196741)))

(declare-fun res!229949 () Bool)

(assert (=> b!276810 (=> (not res!229949) (not e!196741))))

(declare-datatypes ((array!15848 0))(
  ( (array!15849 (arr!7854 (Array (_ BitVec 32) (_ BitVec 8))) (size!6861 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12536 0))(
  ( (BitStream!12537 (buf!7329 array!15848) (currentByte!13567 (_ BitVec 32)) (currentBit!13562 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12536)

(declare-fun lt!414926 () (_ BitVec 64))

(declare-fun bs1!11 () BitStream!12536)

(declare-fun arrayBitRangesEq!0 (array!15848 array!15848 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276810 (= res!229949 (arrayBitRangesEq!0 (buf!7329 bs1!11) (buf!7329 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414926))))

(declare-fun lt!414927 () (_ BitVec 64))

(assert (=> b!276810 (= lt!414926 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!414927))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!276810 (= lt!414927 (bitIndex!0 (size!6861 (buf!7329 bs1!11)) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))

(declare-fun b!276811 () Bool)

(declare-fun e!196740 () Bool)

(declare-fun array_inv!6585 (array!15848) Bool)

(assert (=> b!276811 (= e!196740 (array_inv!6585 (buf!7329 bs2!19)))))

(declare-fun b!276812 () Bool)

(declare-fun e!196737 () Bool)

(assert (=> b!276812 (= e!196737 (array_inv!6585 (buf!7329 bs1!11)))))

(declare-fun b!276813 () Bool)

(declare-fun res!229948 () Bool)

(assert (=> b!276813 (=> (not res!229948) (not e!196735))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!276813 (= res!229948 (validate_offset_bit!0 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))) ((_ sign_extend 32) (currentByte!13567 bs1!11)) ((_ sign_extend 32) (currentBit!13562 bs1!11))))))

(declare-fun res!229950 () Bool)

(assert (=> start!61634 (=> (not res!229950) (not e!196735))))

(assert (=> start!61634 (= res!229950 (= (size!6861 (buf!7329 bs1!11)) (size!6861 (buf!7329 bs2!19))))))

(assert (=> start!61634 e!196735))

(declare-fun inv!12 (BitStream!12536) Bool)

(assert (=> start!61634 (and (inv!12 bs1!11) e!196737)))

(assert (=> start!61634 (and (inv!12 bs2!19) e!196740)))

(declare-fun b!276814 () Bool)

(declare-fun e!196736 () Bool)

(declare-fun e!196739 () Bool)

(assert (=> b!276814 (= e!196736 e!196739)))

(declare-fun res!229951 () Bool)

(assert (=> b!276814 (=> (not res!229951) (not e!196739))))

(declare-datatypes ((tuple2!22576 0))(
  ( (tuple2!22577 (_1!12338 BitStream!12536) (_2!12338 Bool)) )
))
(declare-fun lt!414923 () tuple2!22576)

(declare-fun lt!414925 () tuple2!22576)

(assert (=> b!276814 (= res!229951 (= (bitIndex!0 (size!6861 (buf!7329 (_1!12338 lt!414923))) (currentByte!13567 (_1!12338 lt!414923)) (currentBit!13562 (_1!12338 lt!414923))) (bitIndex!0 (size!6861 (buf!7329 (_1!12338 lt!414925))) (currentByte!13567 (_1!12338 lt!414925)) (currentBit!13562 (_1!12338 lt!414925)))))))

(declare-fun bitAt!0 (array!15848 (_ BitVec 64)) Bool)

(assert (=> b!276814 (= (bitAt!0 (buf!7329 bs1!11) lt!414927) (bitAt!0 (buf!7329 bs2!19) lt!414927))))

(declare-datatypes ((Unit!19387 0))(
  ( (Unit!19388) )
))
(declare-fun lt!414924 () Unit!19387)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15848 array!15848 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19387)

(assert (=> b!276814 (= lt!414924 (arrayBitRangesEqImpliesEq!0 (buf!7329 bs1!11) (buf!7329 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414927 lt!414926))))

(declare-fun b!276815 () Bool)

(assert (=> b!276815 (= e!196739 (= (_2!12338 lt!414923) (_2!12338 lt!414925)))))

(declare-fun b!276816 () Bool)

(assert (=> b!276816 (= e!196741 (not e!196736))))

(declare-fun res!229947 () Bool)

(assert (=> b!276816 (=> res!229947 e!196736)))

(assert (=> b!276816 (= res!229947 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414926) (bvsgt lt!414926 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!414927) (bvsge lt!414927 lt!414926)))))

(declare-fun readBitPure!0 (BitStream!12536) tuple2!22576)

(assert (=> b!276816 (= lt!414925 (readBitPure!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))))

(assert (=> b!276816 (= lt!414923 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276816 (invariant!0 (currentBit!13562 bs1!11) (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs2!19)))))

(assert (= (and start!61634 res!229950) b!276813))

(assert (= (and b!276813 res!229948) b!276810))

(assert (= (and b!276810 res!229949) b!276816))

(assert (= (and b!276816 (not res!229947)) b!276814))

(assert (= (and b!276814 res!229951) b!276815))

(assert (= start!61634 b!276812))

(assert (= start!61634 b!276811))

(declare-fun m!409883 () Bool)

(assert (=> b!276811 m!409883))

(declare-fun m!409885 () Bool)

(assert (=> b!276812 m!409885))

(declare-fun m!409887 () Bool)

(assert (=> b!276816 m!409887))

(declare-fun m!409889 () Bool)

(assert (=> b!276816 m!409889))

(declare-fun m!409891 () Bool)

(assert (=> b!276816 m!409891))

(declare-fun m!409893 () Bool)

(assert (=> b!276810 m!409893))

(declare-fun m!409895 () Bool)

(assert (=> b!276810 m!409895))

(declare-fun m!409897 () Bool)

(assert (=> b!276813 m!409897))

(declare-fun m!409899 () Bool)

(assert (=> start!61634 m!409899))

(declare-fun m!409901 () Bool)

(assert (=> start!61634 m!409901))

(declare-fun m!409903 () Bool)

(assert (=> b!276814 m!409903))

(declare-fun m!409905 () Bool)

(assert (=> b!276814 m!409905))

(declare-fun m!409907 () Bool)

(assert (=> b!276814 m!409907))

(declare-fun m!409909 () Bool)

(assert (=> b!276814 m!409909))

(declare-fun m!409911 () Bool)

(assert (=> b!276814 m!409911))

(push 1)

(assert (not b!276812))

(assert (not b!276814))

(assert (not b!276816))

(assert (not start!61634))

(assert (not b!276810))

(assert (not b!276813))

(assert (not b!276811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95358 () Bool)

(assert (=> d!95358 (= (inv!12 bs1!11) (invariant!0 (currentBit!13562 bs1!11) (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs1!11))))))

(declare-fun bs!24058 () Bool)

(assert (= bs!24058 d!95358))

(declare-fun m!409945 () Bool)

(assert (=> bs!24058 m!409945))

(assert (=> start!61634 d!95358))

(declare-fun d!95360 () Bool)

(assert (=> d!95360 (= (inv!12 bs2!19) (invariant!0 (currentBit!13562 bs2!19) (currentByte!13567 bs2!19) (size!6861 (buf!7329 bs2!19))))))

(declare-fun bs!24059 () Bool)

(assert (= bs!24059 d!95360))

(declare-fun m!409947 () Bool)

(assert (=> bs!24059 m!409947))

(assert (=> start!61634 d!95360))

(declare-fun b!276871 () Bool)

(declare-fun e!196786 () Bool)

(declare-fun lt!415009 () (_ BitVec 32))

(declare-datatypes ((tuple4!542 0))(
  ( (tuple4!543 (_1!12341 (_ BitVec 32)) (_2!12341 (_ BitVec 32)) (_3!1051 (_ BitVec 32)) (_4!271 (_ BitVec 32))) )
))
(declare-fun lt!415007 () tuple4!542)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276871 (= e!196786 (byteRangesEq!0 (select (arr!7854 (buf!7329 bs1!11)) (_4!271 lt!415007)) (select (arr!7854 (buf!7329 bs2!19)) (_4!271 lt!415007)) #b00000000000000000000000000000000 lt!415009))))

(declare-fun b!276872 () Bool)

(declare-fun res!229995 () Bool)

(assert (=> b!276872 (= res!229995 (= lt!415009 #b00000000000000000000000000000000))))

(assert (=> b!276872 (=> res!229995 e!196786)))

(declare-fun e!196787 () Bool)

(assert (=> b!276872 (= e!196787 e!196786)))

(declare-fun b!276873 () Bool)

(declare-fun e!196785 () Bool)

(declare-fun call!4469 () Bool)

(assert (=> b!276873 (= e!196785 call!4469)))

(declare-fun b!276874 () Bool)

(declare-fun e!196784 () Bool)

(declare-fun e!196783 () Bool)

(assert (=> b!276874 (= e!196784 e!196783)))

(declare-fun res!229997 () Bool)

(assert (=> b!276874 (=> (not res!229997) (not e!196783))))

(declare-fun e!196782 () Bool)

(assert (=> b!276874 (= res!229997 e!196782)))

(declare-fun res!229996 () Bool)

(assert (=> b!276874 (=> res!229996 e!196782)))

(assert (=> b!276874 (= res!229996 (bvsge (_1!12341 lt!415007) (_2!12341 lt!415007)))))

(assert (=> b!276874 (= lt!415009 ((_ extract 31 0) (bvsrem lt!414926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415008 () (_ BitVec 32))

(assert (=> b!276874 (= lt!415008 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!542)

(assert (=> b!276874 (= lt!415007 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414926))))

(declare-fun b!276875 () Bool)

(assert (=> b!276875 (= e!196783 e!196785)))

(declare-fun c!12654 () Bool)

(assert (=> b!276875 (= c!12654 (= (_3!1051 lt!415007) (_4!271 lt!415007)))))

(declare-fun d!95362 () Bool)

(declare-fun res!229999 () Bool)

(assert (=> d!95362 (=> res!229999 e!196784)))

(assert (=> d!95362 (= res!229999 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!414926))))

(assert (=> d!95362 (= (arrayBitRangesEq!0 (buf!7329 bs1!11) (buf!7329 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414926) e!196784)))

(declare-fun b!276870 () Bool)

(declare-fun arrayRangesEq!1164 (array!15848 array!15848 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276870 (= e!196782 (arrayRangesEq!1164 (buf!7329 bs1!11) (buf!7329 bs2!19) (_1!12341 lt!415007) (_2!12341 lt!415007)))))

(declare-fun b!276876 () Bool)

(assert (=> b!276876 (= e!196785 e!196787)))

(declare-fun res!229998 () Bool)

(assert (=> b!276876 (= res!229998 call!4469)))

(assert (=> b!276876 (=> (not res!229998) (not e!196787))))

(declare-fun bm!4466 () Bool)

(assert (=> bm!4466 (= call!4469 (byteRangesEq!0 (select (arr!7854 (buf!7329 bs1!11)) (_3!1051 lt!415007)) (select (arr!7854 (buf!7329 bs2!19)) (_3!1051 lt!415007)) lt!415008 (ite c!12654 lt!415009 #b00000000000000000000000000001000)))))

(assert (= (and d!95362 (not res!229999)) b!276874))

(assert (= (and b!276874 (not res!229996)) b!276870))

(assert (= (and b!276874 res!229997) b!276875))

(assert (= (and b!276875 c!12654) b!276873))

(assert (= (and b!276875 (not c!12654)) b!276876))

(assert (= (and b!276876 res!229998) b!276872))

(assert (= (and b!276872 (not res!229995)) b!276871))

(assert (= (or b!276873 b!276876) bm!4466))

(declare-fun m!409979 () Bool)

(assert (=> b!276871 m!409979))

(declare-fun m!409981 () Bool)

(assert (=> b!276871 m!409981))

(assert (=> b!276871 m!409979))

(assert (=> b!276871 m!409981))

(declare-fun m!409983 () Bool)

(assert (=> b!276871 m!409983))

(declare-fun m!409985 () Bool)

(assert (=> b!276874 m!409985))

(declare-fun m!409987 () Bool)

(assert (=> b!276870 m!409987))

(declare-fun m!409989 () Bool)

(assert (=> bm!4466 m!409989))

(declare-fun m!409991 () Bool)

(assert (=> bm!4466 m!409991))

(assert (=> bm!4466 m!409989))

(assert (=> bm!4466 m!409991))

(declare-fun m!409993 () Bool)

(assert (=> bm!4466 m!409993))

(assert (=> b!276810 d!95362))

(declare-fun d!95388 () Bool)

(declare-fun e!196790 () Bool)

(assert (=> d!95388 e!196790))

(declare-fun res!230004 () Bool)

(assert (=> d!95388 (=> (not res!230004) (not e!196790))))

(declare-fun lt!415026 () (_ BitVec 64))

(declare-fun lt!415030 () (_ BitVec 64))

(declare-fun lt!415028 () (_ BitVec 64))

(assert (=> d!95388 (= res!230004 (= lt!415030 (bvsub lt!415026 lt!415028)))))

(assert (=> d!95388 (or (= (bvand lt!415026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415028 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415026 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415026 lt!415028) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!95388 (= lt!415028 (remainingBits!0 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))) ((_ sign_extend 32) (currentByte!13567 bs1!11)) ((_ sign_extend 32) (currentBit!13562 bs1!11))))))

(declare-fun lt!415031 () (_ BitVec 64))

(declare-fun lt!415027 () (_ BitVec 64))

(assert (=> d!95388 (= lt!415026 (bvmul lt!415031 lt!415027))))

(assert (=> d!95388 (or (= lt!415031 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415027 (bvsdiv (bvmul lt!415031 lt!415027) lt!415031)))))

(assert (=> d!95388 (= lt!415027 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95388 (= lt!415031 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))))))

(assert (=> d!95388 (= lt!415030 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13567 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13562 bs1!11))))))

(assert (=> d!95388 (invariant!0 (currentBit!13562 bs1!11) (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs1!11)))))

(assert (=> d!95388 (= (bitIndex!0 (size!6861 (buf!7329 bs1!11)) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)) lt!415030)))

(declare-fun b!276881 () Bool)

(declare-fun res!230005 () Bool)

(assert (=> b!276881 (=> (not res!230005) (not e!196790))))

(assert (=> b!276881 (= res!230005 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415030))))

(declare-fun b!276882 () Bool)

(declare-fun lt!415029 () (_ BitVec 64))

(assert (=> b!276882 (= e!196790 (bvsle lt!415030 (bvmul lt!415029 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276882 (or (= lt!415029 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415029 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415029)))))

(assert (=> b!276882 (= lt!415029 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))))))

(assert (= (and d!95388 res!230004) b!276881))

(assert (= (and b!276881 res!230005) b!276882))

(declare-fun m!410001 () Bool)

(assert (=> d!95388 m!410001))

(assert (=> d!95388 m!409945))

(assert (=> b!276810 d!95388))

(declare-fun d!95402 () Bool)

(declare-fun e!196791 () Bool)

(assert (=> d!95402 e!196791))

(declare-fun res!230006 () Bool)

(assert (=> d!95402 (=> (not res!230006) (not e!196791))))

(declare-fun lt!415034 () (_ BitVec 64))

(declare-fun lt!415032 () (_ BitVec 64))

(declare-fun lt!415036 () (_ BitVec 64))

(assert (=> d!95402 (= res!230006 (= lt!415036 (bvsub lt!415032 lt!415034)))))

(assert (=> d!95402 (or (= (bvand lt!415032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415034 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415032 lt!415034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95402 (= lt!415034 (remainingBits!0 ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414923)))) ((_ sign_extend 32) (currentByte!13567 (_1!12338 lt!414923))) ((_ sign_extend 32) (currentBit!13562 (_1!12338 lt!414923)))))))

(declare-fun lt!415037 () (_ BitVec 64))

(declare-fun lt!415033 () (_ BitVec 64))

(assert (=> d!95402 (= lt!415032 (bvmul lt!415037 lt!415033))))

(assert (=> d!95402 (or (= lt!415037 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415033 (bvsdiv (bvmul lt!415037 lt!415033) lt!415037)))))

(assert (=> d!95402 (= lt!415033 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95402 (= lt!415037 ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414923)))))))

(assert (=> d!95402 (= lt!415036 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13567 (_1!12338 lt!414923))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13562 (_1!12338 lt!414923)))))))

(assert (=> d!95402 (invariant!0 (currentBit!13562 (_1!12338 lt!414923)) (currentByte!13567 (_1!12338 lt!414923)) (size!6861 (buf!7329 (_1!12338 lt!414923))))))

(assert (=> d!95402 (= (bitIndex!0 (size!6861 (buf!7329 (_1!12338 lt!414923))) (currentByte!13567 (_1!12338 lt!414923)) (currentBit!13562 (_1!12338 lt!414923))) lt!415036)))

(declare-fun b!276883 () Bool)

(declare-fun res!230007 () Bool)

(assert (=> b!276883 (=> (not res!230007) (not e!196791))))

(assert (=> b!276883 (= res!230007 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415036))))

(declare-fun b!276884 () Bool)

(declare-fun lt!415035 () (_ BitVec 64))

(assert (=> b!276884 (= e!196791 (bvsle lt!415036 (bvmul lt!415035 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276884 (or (= lt!415035 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415035 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415035)))))

(assert (=> b!276884 (= lt!415035 ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414923)))))))

(assert (= (and d!95402 res!230006) b!276883))

(assert (= (and b!276883 res!230007) b!276884))

(declare-fun m!410003 () Bool)

(assert (=> d!95402 m!410003))

(declare-fun m!410005 () Bool)

(assert (=> d!95402 m!410005))

(assert (=> b!276814 d!95402))

(declare-fun d!95404 () Bool)

(declare-fun e!196792 () Bool)

(assert (=> d!95404 e!196792))

(declare-fun res!230008 () Bool)

(assert (=> d!95404 (=> (not res!230008) (not e!196792))))

(declare-fun lt!415042 () (_ BitVec 64))

(declare-fun lt!415040 () (_ BitVec 64))

(declare-fun lt!415038 () (_ BitVec 64))

(assert (=> d!95404 (= res!230008 (= lt!415042 (bvsub lt!415038 lt!415040)))))

(assert (=> d!95404 (or (= (bvand lt!415038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415040 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!415038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!415038 lt!415040) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95404 (= lt!415040 (remainingBits!0 ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414925)))) ((_ sign_extend 32) (currentByte!13567 (_1!12338 lt!414925))) ((_ sign_extend 32) (currentBit!13562 (_1!12338 lt!414925)))))))

(declare-fun lt!415043 () (_ BitVec 64))

(declare-fun lt!415039 () (_ BitVec 64))

(assert (=> d!95404 (= lt!415038 (bvmul lt!415043 lt!415039))))

(assert (=> d!95404 (or (= lt!415043 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!415039 (bvsdiv (bvmul lt!415043 lt!415039) lt!415043)))))

(assert (=> d!95404 (= lt!415039 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95404 (= lt!415043 ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414925)))))))

(assert (=> d!95404 (= lt!415042 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13567 (_1!12338 lt!414925))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13562 (_1!12338 lt!414925)))))))

(assert (=> d!95404 (invariant!0 (currentBit!13562 (_1!12338 lt!414925)) (currentByte!13567 (_1!12338 lt!414925)) (size!6861 (buf!7329 (_1!12338 lt!414925))))))

(assert (=> d!95404 (= (bitIndex!0 (size!6861 (buf!7329 (_1!12338 lt!414925))) (currentByte!13567 (_1!12338 lt!414925)) (currentBit!13562 (_1!12338 lt!414925))) lt!415042)))

(declare-fun b!276885 () Bool)

(declare-fun res!230009 () Bool)

(assert (=> b!276885 (=> (not res!230009) (not e!196792))))

(assert (=> b!276885 (= res!230009 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!415042))))

(declare-fun b!276886 () Bool)

(declare-fun lt!415041 () (_ BitVec 64))

(assert (=> b!276886 (= e!196792 (bvsle lt!415042 (bvmul lt!415041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276886 (or (= lt!415041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!415041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!415041)))))

(assert (=> b!276886 (= lt!415041 ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414925)))))))

(assert (= (and d!95404 res!230008) b!276885))

(assert (= (and b!276885 res!230009) b!276886))

(declare-fun m!410007 () Bool)

(assert (=> d!95404 m!410007))

(declare-fun m!410009 () Bool)

(assert (=> d!95404 m!410009))

(assert (=> b!276814 d!95404))

(declare-fun d!95406 () Bool)

(assert (=> d!95406 (= (bitAt!0 (buf!7329 bs1!11) lt!414927) (bitAt!0 (buf!7329 bs2!19) lt!414927))))

(declare-fun lt!415046 () Unit!19387)

(declare-fun choose!31 (array!15848 array!15848 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19387)

(assert (=> d!95406 (= lt!415046 (choose!31 (buf!7329 bs1!11) (buf!7329 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414927 lt!414926))))

(assert (=> d!95406 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414926))))

(assert (=> d!95406 (= (arrayBitRangesEqImpliesEq!0 (buf!7329 bs1!11) (buf!7329 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414927 lt!414926) lt!415046)))

(declare-fun bs!24069 () Bool)

(assert (= bs!24069 d!95406))

(assert (=> bs!24069 m!409905))

(assert (=> bs!24069 m!409907))

(declare-fun m!410011 () Bool)

(assert (=> bs!24069 m!410011))

(assert (=> b!276814 d!95406))

(declare-fun d!95408 () Bool)

(assert (=> d!95408 (= (bitAt!0 (buf!7329 bs2!19) lt!414927) (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs2!19)) ((_ extract 31 0) (bvsdiv lt!414927 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!414927 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!24070 () Bool)

(assert (= bs!24070 d!95408))

(declare-fun m!410013 () Bool)

(assert (=> bs!24070 m!410013))

(declare-fun m!410015 () Bool)

(assert (=> bs!24070 m!410015))

(assert (=> b!276814 d!95408))

(declare-fun d!95410 () Bool)

(assert (=> d!95410 (= (bitAt!0 (buf!7329 bs1!11) lt!414927) (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs1!11)) ((_ extract 31 0) (bvsdiv lt!414927 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!414927 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!24071 () Bool)

(assert (= bs!24071 d!95410))

(declare-fun m!410017 () Bool)

(assert (=> bs!24071 m!410017))

(assert (=> bs!24071 m!410015))

(assert (=> b!276814 d!95410))

(declare-fun d!95412 () Bool)

(assert (=> d!95412 (= (array_inv!6585 (buf!7329 bs1!11)) (bvsge (size!6861 (buf!7329 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!276812 d!95412))

(declare-fun d!95414 () Bool)

(assert (=> d!95414 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))) ((_ sign_extend 32) (currentByte!13567 bs1!11)) ((_ sign_extend 32) (currentBit!13562 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))) ((_ sign_extend 32) (currentByte!13567 bs1!11)) ((_ sign_extend 32) (currentBit!13562 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!24072 () Bool)

(assert (= bs!24072 d!95414))

(assert (=> bs!24072 m!410001))

(assert (=> b!276813 d!95414))

(declare-fun d!95416 () Bool)

(declare-datatypes ((tuple2!22582 0))(
  ( (tuple2!22583 (_1!12344 Bool) (_2!12344 BitStream!12536)) )
))
(declare-fun lt!415055 () tuple2!22582)

(declare-fun readBit!0 (BitStream!12536) tuple2!22582)

(assert (=> d!95416 (= lt!415055 (readBit!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))))

(assert (=> d!95416 (= (readBitPure!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))) (tuple2!22577 (_2!12344 lt!415055) (_1!12344 lt!415055)))))

(declare-fun bs!24073 () Bool)

(assert (= bs!24073 d!95416))

(declare-fun m!410019 () Bool)

(assert (=> bs!24073 m!410019))

(assert (=> b!276816 d!95416))

(declare-fun d!95418 () Bool)

(declare-fun lt!415056 () tuple2!22582)

(assert (=> d!95418 (= lt!415056 (readBit!0 bs1!11))))

(assert (=> d!95418 (= (readBitPure!0 bs1!11) (tuple2!22577 (_2!12344 lt!415056) (_1!12344 lt!415056)))))

(declare-fun bs!24074 () Bool)

(assert (= bs!24074 d!95418))

(declare-fun m!410021 () Bool)

(assert (=> bs!24074 m!410021))

(assert (=> b!276816 d!95418))

(declare-fun d!95420 () Bool)

(assert (=> d!95420 (= (invariant!0 (currentBit!13562 bs1!11) (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs2!19))) (and (bvsge (currentBit!13562 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13562 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13567 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs2!19))) (and (= (currentBit!13562 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs2!19)))))))))

(assert (=> b!276816 d!95420))

(declare-fun d!95422 () Bool)

(assert (=> d!95422 (= (array_inv!6585 (buf!7329 bs2!19)) (bvsge (size!6861 (buf!7329 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!276811 d!95422))

(push 1)

(assert (not d!95402))

(assert (not d!95414))

(assert (not b!276871))

(assert (not d!95406))

(assert (not d!95388))

(assert (not b!276870))

(assert (not bm!4466))

(assert (not d!95360))

(assert (not b!276874))

(assert (not d!95416))

(assert (not d!95404))

(assert (not d!95358))

(assert (not d!95418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95482 () Bool)

(declare-fun e!196846 () Bool)

(assert (=> d!95482 e!196846))

(declare-fun res!230049 () Bool)

(assert (=> d!95482 (=> (not res!230049) (not e!196846))))

(declare-datatypes ((tuple2!22588 0))(
  ( (tuple2!22589 (_1!12347 Unit!19387) (_2!12347 BitStream!12536)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12536) tuple2!22588)

(assert (=> d!95482 (= res!230049 (= (buf!7329 (_2!12347 (increaseBitIndex!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))) (buf!7329 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))))

(declare-fun lt!415138 () Bool)

(assert (=> d!95482 (= lt!415138 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))) (currentByte!13567 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415141 () tuple2!22582)

(assert (=> d!95482 (= lt!415141 (tuple2!22583 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))) (currentByte!13567 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))) #b00000000000000000000000000000000)) (_2!12347 (increaseBitIndex!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))))))

(assert (=> d!95482 (validate_offset_bit!0 ((_ sign_extend 32) (size!6861 (buf!7329 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))) ((_ sign_extend 32) (currentByte!13567 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))) ((_ sign_extend 32) (currentBit!13562 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))))

(assert (=> d!95482 (= (readBit!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))) lt!415141)))

(declare-fun b!276932 () Bool)

(declare-fun lt!415139 () (_ BitVec 64))

(declare-fun lt!415140 () (_ BitVec 64))

(assert (=> b!276932 (= e!196846 (= (bitIndex!0 (size!6861 (buf!7329 (_2!12347 (increaseBitIndex!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))) (currentByte!13567 (_2!12347 (increaseBitIndex!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))) (currentBit!13562 (_2!12347 (increaseBitIndex!0 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))) (bvadd lt!415139 lt!415140)))))

(assert (=> b!276932 (or (not (= (bvand lt!415139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415140 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!415139 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!415139 lt!415140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276932 (= lt!415140 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276932 (= lt!415139 (bitIndex!0 (size!6861 (buf!7329 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))) (currentByte!13567 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))) (currentBit!13562 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))))

(declare-fun lt!415142 () Bool)

(assert (=> b!276932 (= lt!415142 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))) (currentByte!13567 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415137 () Bool)

(assert (=> b!276932 (= lt!415137 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))) (currentByte!13567 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!415136 () Bool)

(assert (=> b!276932 (= lt!415136 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))) (currentByte!13567 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 (BitStream!12537 (buf!7329 bs2!19) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!95482 res!230049) b!276932))

(declare-fun m!410107 () Bool)

(assert (=> d!95482 m!410107))

(declare-fun m!410109 () Bool)

(assert (=> d!95482 m!410109))

(declare-fun m!410111 () Bool)

(assert (=> d!95482 m!410111))

(declare-fun m!410113 () Bool)

(assert (=> d!95482 m!410113))

(assert (=> b!276932 m!410109))

(declare-fun m!410115 () Bool)

(assert (=> b!276932 m!410115))

(declare-fun m!410117 () Bool)

(assert (=> b!276932 m!410117))

(assert (=> b!276932 m!410107))

(assert (=> b!276932 m!410111))

(assert (=> d!95416 d!95482))

(declare-fun d!95484 () Bool)

(assert (=> d!95484 (= (remainingBits!0 ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414925)))) ((_ sign_extend 32) (currentByte!13567 (_1!12338 lt!414925))) ((_ sign_extend 32) (currentBit!13562 (_1!12338 lt!414925)))) (bvsub (bvmul ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414925)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13567 (_1!12338 lt!414925))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13562 (_1!12338 lt!414925))))))))

(assert (=> d!95404 d!95484))

(declare-fun d!95486 () Bool)

(assert (=> d!95486 (= (invariant!0 (currentBit!13562 (_1!12338 lt!414925)) (currentByte!13567 (_1!12338 lt!414925)) (size!6861 (buf!7329 (_1!12338 lt!414925)))) (and (bvsge (currentBit!13562 (_1!12338 lt!414925)) #b00000000000000000000000000000000) (bvslt (currentBit!13562 (_1!12338 lt!414925)) #b00000000000000000000000000001000) (bvsge (currentByte!13567 (_1!12338 lt!414925)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13567 (_1!12338 lt!414925)) (size!6861 (buf!7329 (_1!12338 lt!414925)))) (and (= (currentBit!13562 (_1!12338 lt!414925)) #b00000000000000000000000000000000) (= (currentByte!13567 (_1!12338 lt!414925)) (size!6861 (buf!7329 (_1!12338 lt!414925))))))))))

(assert (=> d!95404 d!95486))

(declare-fun d!95488 () Bool)

(assert (=> d!95488 (= (remainingBits!0 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))) ((_ sign_extend 32) (currentByte!13567 bs1!11)) ((_ sign_extend 32) (currentBit!13562 bs1!11))) (bvsub (bvmul ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13567 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13562 bs1!11)))))))

(assert (=> d!95414 d!95488))

(declare-fun d!95490 () Bool)

(assert (=> d!95490 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!414926) (tuple4!543 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!414926 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!414926 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!276874 d!95490))

(declare-fun d!95492 () Bool)

(assert (=> d!95492 (= (invariant!0 (currentBit!13562 bs1!11) (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs1!11))) (and (bvsge (currentBit!13562 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13562 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13567 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs1!11))) (and (= (currentBit!13562 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13567 bs1!11) (size!6861 (buf!7329 bs1!11)))))))))

(assert (=> d!95358 d!95492))

(declare-fun d!95494 () Bool)

(declare-fun e!196847 () Bool)

(assert (=> d!95494 e!196847))

(declare-fun res!230050 () Bool)

(assert (=> d!95494 (=> (not res!230050) (not e!196847))))

(assert (=> d!95494 (= res!230050 (= (buf!7329 (_2!12347 (increaseBitIndex!0 bs1!11))) (buf!7329 bs1!11)))))

(declare-fun lt!415145 () Bool)

(assert (=> d!95494 (= lt!415145 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs1!11)) (currentByte!13567 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415148 () tuple2!22582)

(assert (=> d!95494 (= lt!415148 (tuple2!22583 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs1!11)) (currentByte!13567 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 bs1!11)))) #b00000000000000000000000000000000)) (_2!12347 (increaseBitIndex!0 bs1!11))))))

(assert (=> d!95494 (validate_offset_bit!0 ((_ sign_extend 32) (size!6861 (buf!7329 bs1!11))) ((_ sign_extend 32) (currentByte!13567 bs1!11)) ((_ sign_extend 32) (currentBit!13562 bs1!11)))))

(assert (=> d!95494 (= (readBit!0 bs1!11) lt!415148)))

(declare-fun lt!415147 () (_ BitVec 64))

(declare-fun lt!415146 () (_ BitVec 64))

(declare-fun b!276933 () Bool)

(assert (=> b!276933 (= e!196847 (= (bitIndex!0 (size!6861 (buf!7329 (_2!12347 (increaseBitIndex!0 bs1!11)))) (currentByte!13567 (_2!12347 (increaseBitIndex!0 bs1!11))) (currentBit!13562 (_2!12347 (increaseBitIndex!0 bs1!11)))) (bvadd lt!415146 lt!415147)))))

(assert (=> b!276933 (or (not (= (bvand lt!415146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!415147 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!415146 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!415146 lt!415147) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276933 (= lt!415147 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276933 (= lt!415146 (bitIndex!0 (size!6861 (buf!7329 bs1!11)) (currentByte!13567 bs1!11) (currentBit!13562 bs1!11)))))

(declare-fun lt!415149 () Bool)

(assert (=> b!276933 (= lt!415149 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs1!11)) (currentByte!13567 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415144 () Bool)

(assert (=> b!276933 (= lt!415144 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs1!11)) (currentByte!13567 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!415143 () Bool)

(assert (=> b!276933 (= lt!415143 (not (= (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs1!11)) (currentByte!13567 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13562 bs1!11)))) #b00000000000000000000000000000000)))))

(assert (= (and d!95494 res!230050) b!276933))

(declare-fun m!410119 () Bool)

(assert (=> d!95494 m!410119))

(declare-fun m!410121 () Bool)

(assert (=> d!95494 m!410121))

(declare-fun m!410123 () Bool)

(assert (=> d!95494 m!410123))

(assert (=> d!95494 m!409897))

(assert (=> b!276933 m!410121))

(declare-fun m!410125 () Bool)

(assert (=> b!276933 m!410125))

(assert (=> b!276933 m!409895))

(assert (=> b!276933 m!410119))

(assert (=> b!276933 m!410123))

(assert (=> d!95418 d!95494))

(assert (=> d!95388 d!95488))

(assert (=> d!95388 d!95492))

(declare-fun d!95496 () Bool)

(assert (=> d!95496 (= (byteRangesEq!0 (select (arr!7854 (buf!7329 bs1!11)) (_4!271 lt!415007)) (select (arr!7854 (buf!7329 bs2!19)) (_4!271 lt!415007)) #b00000000000000000000000000000000 lt!415009) (or (= #b00000000000000000000000000000000 lt!415009) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs1!11)) (_4!271 lt!415007))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415009))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs2!19)) (_4!271 lt!415007))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415009))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24081 () Bool)

(assert (= bs!24081 d!95496))

(declare-fun m!410127 () Bool)

(assert (=> bs!24081 m!410127))

(declare-fun m!410129 () Bool)

(assert (=> bs!24081 m!410129))

(assert (=> b!276871 d!95496))

(declare-fun d!95498 () Bool)

(assert (=> d!95498 (= (invariant!0 (currentBit!13562 bs2!19) (currentByte!13567 bs2!19) (size!6861 (buf!7329 bs2!19))) (and (bvsge (currentBit!13562 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13562 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13567 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13567 bs2!19) (size!6861 (buf!7329 bs2!19))) (and (= (currentBit!13562 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13567 bs2!19) (size!6861 (buf!7329 bs2!19)))))))))

(assert (=> d!95360 d!95498))

(declare-fun d!95500 () Bool)

(declare-fun res!230055 () Bool)

(declare-fun e!196852 () Bool)

(assert (=> d!95500 (=> res!230055 e!196852)))

(assert (=> d!95500 (= res!230055 (= (_1!12341 lt!415007) (_2!12341 lt!415007)))))

(assert (=> d!95500 (= (arrayRangesEq!1164 (buf!7329 bs1!11) (buf!7329 bs2!19) (_1!12341 lt!415007) (_2!12341 lt!415007)) e!196852)))

(declare-fun b!276938 () Bool)

(declare-fun e!196853 () Bool)

(assert (=> b!276938 (= e!196852 e!196853)))

(declare-fun res!230056 () Bool)

(assert (=> b!276938 (=> (not res!230056) (not e!196853))))

(assert (=> b!276938 (= res!230056 (= (select (arr!7854 (buf!7329 bs1!11)) (_1!12341 lt!415007)) (select (arr!7854 (buf!7329 bs2!19)) (_1!12341 lt!415007))))))

(declare-fun b!276939 () Bool)

(assert (=> b!276939 (= e!196853 (arrayRangesEq!1164 (buf!7329 bs1!11) (buf!7329 bs2!19) (bvadd (_1!12341 lt!415007) #b00000000000000000000000000000001) (_2!12341 lt!415007)))))

(assert (= (and d!95500 (not res!230055)) b!276938))

(assert (= (and b!276938 res!230056) b!276939))

(declare-fun m!410131 () Bool)

(assert (=> b!276938 m!410131))

(declare-fun m!410133 () Bool)

(assert (=> b!276938 m!410133))

(declare-fun m!410135 () Bool)

(assert (=> b!276939 m!410135))

(assert (=> b!276870 d!95500))

(assert (=> d!95406 d!95410))

(assert (=> d!95406 d!95408))

(declare-fun d!95502 () Bool)

(assert (=> d!95502 (= (bitAt!0 (buf!7329 bs1!11) lt!414927) (bitAt!0 (buf!7329 bs2!19) lt!414927))))

(assert (=> d!95502 true))

(declare-fun _$31!53 () Unit!19387)

(assert (=> d!95502 (= (choose!31 (buf!7329 bs1!11) (buf!7329 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!414927 lt!414926) _$31!53)))

(declare-fun bs!24082 () Bool)

(assert (= bs!24082 d!95502))

(assert (=> bs!24082 m!409905))

(assert (=> bs!24082 m!409907))

(assert (=> d!95406 d!95502))

(declare-fun d!95504 () Bool)

(assert (=> d!95504 (= (remainingBits!0 ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414923)))) ((_ sign_extend 32) (currentByte!13567 (_1!12338 lt!414923))) ((_ sign_extend 32) (currentBit!13562 (_1!12338 lt!414923)))) (bvsub (bvmul ((_ sign_extend 32) (size!6861 (buf!7329 (_1!12338 lt!414923)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13567 (_1!12338 lt!414923))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13562 (_1!12338 lt!414923))))))))

(assert (=> d!95402 d!95504))

(declare-fun d!95506 () Bool)

(assert (=> d!95506 (= (invariant!0 (currentBit!13562 (_1!12338 lt!414923)) (currentByte!13567 (_1!12338 lt!414923)) (size!6861 (buf!7329 (_1!12338 lt!414923)))) (and (bvsge (currentBit!13562 (_1!12338 lt!414923)) #b00000000000000000000000000000000) (bvslt (currentBit!13562 (_1!12338 lt!414923)) #b00000000000000000000000000001000) (bvsge (currentByte!13567 (_1!12338 lt!414923)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13567 (_1!12338 lt!414923)) (size!6861 (buf!7329 (_1!12338 lt!414923)))) (and (= (currentBit!13562 (_1!12338 lt!414923)) #b00000000000000000000000000000000) (= (currentByte!13567 (_1!12338 lt!414923)) (size!6861 (buf!7329 (_1!12338 lt!414923))))))))))

(assert (=> d!95402 d!95506))

(declare-fun d!95508 () Bool)

(assert (=> d!95508 (= (byteRangesEq!0 (select (arr!7854 (buf!7329 bs1!11)) (_3!1051 lt!415007)) (select (arr!7854 (buf!7329 bs2!19)) (_3!1051 lt!415007)) lt!415008 (ite c!12654 lt!415009 #b00000000000000000000000000001000)) (or (= lt!415008 (ite c!12654 lt!415009 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs1!11)) (_3!1051 lt!415007))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12654 lt!415009 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415008)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7854 (buf!7329 bs2!19)) (_3!1051 lt!415007))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12654 lt!415009 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415008)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24083 () Bool)

(assert (= bs!24083 d!95508))

(declare-fun m!410137 () Bool)

(assert (=> bs!24083 m!410137))

(declare-fun m!410139 () Bool)

(assert (=> bs!24083 m!410139))

(assert (=> bm!4466 d!95508))

(push 1)

(assert (not d!95482))

(assert (not b!276939))

(assert (not b!276932))

(assert (not b!276933))

(assert (not d!95502))

(assert (not d!95494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

