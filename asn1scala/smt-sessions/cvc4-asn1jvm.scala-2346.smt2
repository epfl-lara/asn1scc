; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59820 () Bool)

(assert start!59820)

(declare-fun res!227278 () Bool)

(declare-fun e!192934 () Bool)

(assert (=> start!59820 (=> (not res!227278) (not e!192934))))

(declare-datatypes ((array!15282 0))(
  ( (array!15283 (arr!7632 (Array (_ BitVec 32) (_ BitVec 8))) (size!6645 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12104 0))(
  ( (BitStream!12105 (buf!7113 array!15282) (currentByte!13123 (_ BitVec 32)) (currentBit!13118 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12104)

(assert (=> start!59820 (= res!227278 (not (= (size!6645 (buf!7113 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59820 e!192934))

(declare-fun e!192937 () Bool)

(declare-fun inv!12 (BitStream!12104) Bool)

(assert (=> start!59820 (and (inv!12 bs!71) e!192937)))

(declare-fun b!273036 () Bool)

(declare-fun e!192936 () Bool)

(assert (=> b!273036 (= e!192934 (not e!192936))))

(declare-fun res!227277 () Bool)

(assert (=> b!273036 (=> res!227277 e!192936)))

(declare-fun lt!410931 () (_ BitVec 64))

(declare-fun lt!410933 () (_ BitVec 64))

(assert (=> b!273036 (= res!227277 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410931) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933) (bvsgt lt!410933 lt!410931)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!273036 (= lt!410933 (bitIndex!0 (size!6645 (buf!7113 bs!71)) (currentByte!13123 bs!71) (currentBit!13118 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15282 array!15282 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!273036 (arrayBitRangesEq!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410931)))

(assert (=> b!273036 (= lt!410931 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6645 (buf!7113 bs!71)))))))

(declare-datatypes ((Unit!19269 0))(
  ( (Unit!19270) )
))
(declare-fun lt!410932 () Unit!19269)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15282) Unit!19269)

(assert (=> b!273036 (= lt!410932 (arrayBitEqImpliesRangesEqLemma!0 (buf!7113 bs!71)))))

(declare-fun b!273037 () Bool)

(declare-fun isPrefixOf!0 (BitStream!12104 BitStream!12104) Bool)

(assert (=> b!273037 (= e!192936 (isPrefixOf!0 bs!71 bs!71))))

(assert (=> b!273037 (arrayBitRangesEq!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933)))

(declare-fun lt!410930 () Unit!19269)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!15282 array!15282 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19269)

(assert (=> b!273037 (= lt!410930 (arrayBitRangesEqSlicedLemma!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410931 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933))))

(declare-fun b!273038 () Bool)

(declare-fun array_inv!6369 (array!15282) Bool)

(assert (=> b!273038 (= e!192937 (array_inv!6369 (buf!7113 bs!71)))))

(assert (= (and start!59820 res!227278) b!273036))

(assert (= (and b!273036 (not res!227277)) b!273037))

(assert (= start!59820 b!273038))

(declare-fun m!405935 () Bool)

(assert (=> start!59820 m!405935))

(declare-fun m!405937 () Bool)

(assert (=> b!273036 m!405937))

(declare-fun m!405939 () Bool)

(assert (=> b!273036 m!405939))

(declare-fun m!405941 () Bool)

(assert (=> b!273036 m!405941))

(declare-fun m!405943 () Bool)

(assert (=> b!273037 m!405943))

(declare-fun m!405945 () Bool)

(assert (=> b!273037 m!405945))

(declare-fun m!405947 () Bool)

(assert (=> b!273037 m!405947))

(declare-fun m!405949 () Bool)

(assert (=> b!273038 m!405949))

(push 1)

(assert (not b!273038))

(assert (not b!273037))

(assert (not start!59820))

(assert (not b!273036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93374 () Bool)

(assert (=> d!93374 (= (array_inv!6369 (buf!7113 bs!71)) (bvsge (size!6645 (buf!7113 bs!71)) #b00000000000000000000000000000000))))

(assert (=> b!273038 d!93374))

(declare-fun d!93376 () Bool)

(declare-fun res!227302 () Bool)

(declare-fun e!192953 () Bool)

(assert (=> d!93376 (=> (not res!227302) (not e!192953))))

(assert (=> d!93376 (= res!227302 (= (size!6645 (buf!7113 bs!71)) (size!6645 (buf!7113 bs!71))))))

(assert (=> d!93376 (= (isPrefixOf!0 bs!71 bs!71) e!192953)))

(declare-fun b!273060 () Bool)

(declare-fun res!227300 () Bool)

(assert (=> b!273060 (=> (not res!227300) (not e!192953))))

(assert (=> b!273060 (= res!227300 (bvsle (bitIndex!0 (size!6645 (buf!7113 bs!71)) (currentByte!13123 bs!71) (currentBit!13118 bs!71)) (bitIndex!0 (size!6645 (buf!7113 bs!71)) (currentByte!13123 bs!71) (currentBit!13118 bs!71))))))

(declare-fun b!273061 () Bool)

(declare-fun e!192952 () Bool)

(assert (=> b!273061 (= e!192953 e!192952)))

(declare-fun res!227301 () Bool)

(assert (=> b!273061 (=> res!227301 e!192952)))

(assert (=> b!273061 (= res!227301 (= (size!6645 (buf!7113 bs!71)) #b00000000000000000000000000000000))))

(declare-fun b!273062 () Bool)

(assert (=> b!273062 (= e!192952 (arrayBitRangesEq!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6645 (buf!7113 bs!71)) (currentByte!13123 bs!71) (currentBit!13118 bs!71))))))

(assert (= (and d!93376 res!227302) b!273060))

(assert (= (and b!273060 res!227300) b!273061))

(assert (= (and b!273061 (not res!227301)) b!273062))

(assert (=> b!273060 m!405937))

(assert (=> b!273060 m!405937))

(assert (=> b!273062 m!405937))

(assert (=> b!273062 m!405937))

(declare-fun m!405953 () Bool)

(assert (=> b!273062 m!405953))

(assert (=> b!273037 d!93376))

(declare-fun b!273080 () Bool)

(declare-fun e!192971 () Bool)

(declare-fun e!192968 () Bool)

(assert (=> b!273080 (= e!192971 e!192968)))

(declare-fun res!227319 () Bool)

(assert (=> b!273080 (=> (not res!227319) (not e!192968))))

(declare-fun e!192970 () Bool)

(assert (=> b!273080 (= res!227319 e!192970)))

(declare-fun res!227318 () Bool)

(assert (=> b!273080 (=> res!227318 e!192970)))

(declare-datatypes ((tuple4!498 0))(
  ( (tuple4!499 (_1!12232 (_ BitVec 32)) (_2!12232 (_ BitVec 32)) (_3!1029 (_ BitVec 32)) (_4!249 (_ BitVec 32))) )
))
(declare-fun lt!410941 () tuple4!498)

(assert (=> b!273080 (= res!227318 (bvsge (_1!12232 lt!410941) (_2!12232 lt!410941)))))

(declare-fun lt!410940 () (_ BitVec 32))

(assert (=> b!273080 (= lt!410940 ((_ extract 31 0) (bvsrem lt!410933 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410942 () (_ BitVec 32))

(assert (=> b!273080 (= lt!410942 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!498)

(assert (=> b!273080 (= lt!410941 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933))))

(declare-fun b!273081 () Bool)

(declare-fun e!192972 () Bool)

(assert (=> b!273081 (= e!192968 e!192972)))

(declare-fun c!12585 () Bool)

(assert (=> b!273081 (= c!12585 (= (_3!1029 lt!410941) (_4!249 lt!410941)))))

(declare-fun call!4400 () Bool)

(declare-fun bm!4397 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4397 (= call!4400 (byteRangesEq!0 (ite c!12585 (select (arr!7632 (buf!7113 bs!71)) (_3!1029 lt!410941)) (select (arr!7632 (buf!7113 bs!71)) (_4!249 lt!410941))) (ite c!12585 (select (arr!7632 (buf!7113 bs!71)) (_3!1029 lt!410941)) (select (arr!7632 (buf!7113 bs!71)) (_4!249 lt!410941))) (ite c!12585 lt!410942 #b00000000000000000000000000000000) lt!410940))))

(declare-fun b!273083 () Bool)

(declare-fun e!192969 () Bool)

(assert (=> b!273083 (= e!192969 call!4400)))

(declare-fun b!273084 () Bool)

(declare-fun e!192973 () Bool)

(assert (=> b!273084 (= e!192972 e!192973)))

(declare-fun res!227316 () Bool)

(assert (=> b!273084 (= res!227316 (byteRangesEq!0 (select (arr!7632 (buf!7113 bs!71)) (_3!1029 lt!410941)) (select (arr!7632 (buf!7113 bs!71)) (_3!1029 lt!410941)) lt!410942 #b00000000000000000000000000001000))))

(assert (=> b!273084 (=> (not res!227316) (not e!192973))))

(declare-fun b!273085 () Bool)

(declare-fun arrayRangesEq!1142 (array!15282 array!15282 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!273085 (= e!192970 (arrayRangesEq!1142 (buf!7113 bs!71) (buf!7113 bs!71) (_1!12232 lt!410941) (_2!12232 lt!410941)))))

(declare-fun b!273086 () Bool)

(assert (=> b!273086 (= e!192972 call!4400)))

(declare-fun b!273082 () Bool)

(declare-fun res!227317 () Bool)

(assert (=> b!273082 (= res!227317 (= lt!410940 #b00000000000000000000000000000000))))

(assert (=> b!273082 (=> res!227317 e!192969)))

(assert (=> b!273082 (= e!192973 e!192969)))

(declare-fun d!93380 () Bool)

(declare-fun res!227320 () Bool)

(assert (=> d!93380 (=> res!227320 e!192971)))

(assert (=> d!93380 (= res!227320 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933))))

(assert (=> d!93380 (= (arrayBitRangesEq!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933) e!192971)))

(assert (= (and d!93380 (not res!227320)) b!273080))

(assert (= (and b!273080 (not res!227318)) b!273085))

(assert (= (and b!273080 res!227319) b!273081))

(assert (= (and b!273081 c!12585) b!273086))

(assert (= (and b!273081 (not c!12585)) b!273084))

(assert (= (and b!273084 res!227316) b!273082))

(assert (= (and b!273082 (not res!227317)) b!273083))

(assert (= (or b!273086 b!273083) bm!4397))

(declare-fun m!405957 () Bool)

(assert (=> b!273080 m!405957))

(declare-fun m!405959 () Bool)

(assert (=> bm!4397 m!405959))

(declare-fun m!405961 () Bool)

(assert (=> bm!4397 m!405961))

(declare-fun m!405963 () Bool)

(assert (=> bm!4397 m!405963))

(assert (=> bm!4397 m!405963))

(assert (=> bm!4397 m!405961))

(assert (=> b!273084 m!405963))

(assert (=> b!273084 m!405963))

(assert (=> b!273084 m!405963))

(assert (=> b!273084 m!405963))

(declare-fun m!405965 () Bool)

(assert (=> b!273084 m!405965))

(declare-fun m!405967 () Bool)

(assert (=> b!273085 m!405967))

(assert (=> b!273037 d!93380))

(declare-fun d!93384 () Bool)

(assert (=> d!93384 (arrayBitRangesEq!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933)))

(declare-fun lt!410951 () Unit!19269)

(declare-fun choose!4 (array!15282 array!15282 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19269)

(assert (=> d!93384 (= lt!410951 (choose!4 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410931 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933))))

(assert (=> d!93384 (bvsle (size!6645 (buf!7113 bs!71)) (size!6645 (buf!7113 bs!71)))))

(assert (=> d!93384 (= (arrayBitRangesEqSlicedLemma!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410931 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410933) lt!410951)))

(declare-fun bs!23554 () Bool)

(assert (= bs!23554 d!93384))

(assert (=> bs!23554 m!405945))

(declare-fun m!405969 () Bool)

(assert (=> bs!23554 m!405969))

(assert (=> b!273037 d!93384))

(declare-fun d!93386 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93386 (= (inv!12 bs!71) (invariant!0 (currentBit!13118 bs!71) (currentByte!13123 bs!71) (size!6645 (buf!7113 bs!71))))))

(declare-fun bs!23555 () Bool)

(assert (= bs!23555 d!93386))

(declare-fun m!405971 () Bool)

(assert (=> bs!23555 m!405971))

(assert (=> start!59820 d!93386))

(declare-fun d!93388 () Bool)

(declare-fun e!193012 () Bool)

(assert (=> d!93388 e!193012))

(declare-fun res!227355 () Bool)

(assert (=> d!93388 (=> (not res!227355) (not e!193012))))

(declare-fun lt!410981 () (_ BitVec 64))

(declare-fun lt!410979 () (_ BitVec 64))

(declare-fun lt!410984 () (_ BitVec 64))

(assert (=> d!93388 (= res!227355 (= lt!410984 (bvsub lt!410979 lt!410981)))))

(assert (=> d!93388 (or (= (bvand lt!410979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!410981 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!410979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!410979 lt!410981) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93388 (= lt!410981 (remainingBits!0 ((_ sign_extend 32) (size!6645 (buf!7113 bs!71))) ((_ sign_extend 32) (currentByte!13123 bs!71)) ((_ sign_extend 32) (currentBit!13118 bs!71))))))

(declare-fun lt!410980 () (_ BitVec 64))

(declare-fun lt!410982 () (_ BitVec 64))

(assert (=> d!93388 (= lt!410979 (bvmul lt!410980 lt!410982))))

(assert (=> d!93388 (or (= lt!410980 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410982 (bvsdiv (bvmul lt!410980 lt!410982) lt!410980)))))

(assert (=> d!93388 (= lt!410982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93388 (= lt!410980 ((_ sign_extend 32) (size!6645 (buf!7113 bs!71))))))

(assert (=> d!93388 (= lt!410984 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13123 bs!71)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13118 bs!71))))))

(assert (=> d!93388 (invariant!0 (currentBit!13118 bs!71) (currentByte!13123 bs!71) (size!6645 (buf!7113 bs!71)))))

(assert (=> d!93388 (= (bitIndex!0 (size!6645 (buf!7113 bs!71)) (currentByte!13123 bs!71) (currentBit!13118 bs!71)) lt!410984)))

(declare-fun b!273133 () Bool)

(declare-fun res!227356 () Bool)

(assert (=> b!273133 (=> (not res!227356) (not e!193012))))

(assert (=> b!273133 (= res!227356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410984))))

(declare-fun b!273134 () Bool)

(declare-fun lt!410983 () (_ BitVec 64))

(assert (=> b!273134 (= e!193012 (bvsle lt!410984 (bvmul lt!410983 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273134 (or (= lt!410983 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!410983 #b0000000000000000000000000000000000000000000000000000000000001000) lt!410983)))))

(assert (=> b!273134 (= lt!410983 ((_ sign_extend 32) (size!6645 (buf!7113 bs!71))))))

(assert (= (and d!93388 res!227355) b!273133))

(assert (= (and b!273133 res!227356) b!273134))

(declare-fun m!406001 () Bool)

(assert (=> d!93388 m!406001))

(assert (=> d!93388 m!405971))

(assert (=> b!273036 d!93388))

(declare-fun b!273135 () Bool)

(declare-fun e!193016 () Bool)

(declare-fun e!193013 () Bool)

(assert (=> b!273135 (= e!193016 e!193013)))

(declare-fun res!227360 () Bool)

(assert (=> b!273135 (=> (not res!227360) (not e!193013))))

(declare-fun e!193015 () Bool)

(assert (=> b!273135 (= res!227360 e!193015)))

(declare-fun res!227359 () Bool)

(assert (=> b!273135 (=> res!227359 e!193015)))

(declare-fun lt!410988 () tuple4!498)

(assert (=> b!273135 (= res!227359 (bvsge (_1!12232 lt!410988) (_2!12232 lt!410988)))))

(declare-fun lt!410987 () (_ BitVec 32))

(assert (=> b!273135 (= lt!410987 ((_ extract 31 0) (bvsrem lt!410931 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!410989 () (_ BitVec 32))

(assert (=> b!273135 (= lt!410989 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!273135 (= lt!410988 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!410931))))

(declare-fun b!273136 () Bool)

(declare-fun e!193017 () Bool)

(assert (=> b!273136 (= e!193013 e!193017)))

(declare-fun c!12592 () Bool)

(assert (=> b!273136 (= c!12592 (= (_3!1029 lt!410988) (_4!249 lt!410988)))))

(declare-fun call!4407 () Bool)

(declare-fun bm!4404 () Bool)

(assert (=> bm!4404 (= call!4407 (byteRangesEq!0 (ite c!12592 (select (arr!7632 (buf!7113 bs!71)) (_3!1029 lt!410988)) (select (arr!7632 (buf!7113 bs!71)) (_4!249 lt!410988))) (ite c!12592 (select (arr!7632 (buf!7113 bs!71)) (_3!1029 lt!410988)) (select (arr!7632 (buf!7113 bs!71)) (_4!249 lt!410988))) (ite c!12592 lt!410989 #b00000000000000000000000000000000) lt!410987))))

(declare-fun b!273138 () Bool)

(declare-fun e!193014 () Bool)

(assert (=> b!273138 (= e!193014 call!4407)))

(declare-fun b!273139 () Bool)

(declare-fun e!193018 () Bool)

(assert (=> b!273139 (= e!193017 e!193018)))

(declare-fun res!227357 () Bool)

(assert (=> b!273139 (= res!227357 (byteRangesEq!0 (select (arr!7632 (buf!7113 bs!71)) (_3!1029 lt!410988)) (select (arr!7632 (buf!7113 bs!71)) (_3!1029 lt!410988)) lt!410989 #b00000000000000000000000000001000))))

(assert (=> b!273139 (=> (not res!227357) (not e!193018))))

(declare-fun b!273140 () Bool)

(assert (=> b!273140 (= e!193015 (arrayRangesEq!1142 (buf!7113 bs!71) (buf!7113 bs!71) (_1!12232 lt!410988) (_2!12232 lt!410988)))))

(declare-fun b!273141 () Bool)

(assert (=> b!273141 (= e!193017 call!4407)))

(declare-fun b!273137 () Bool)

(declare-fun res!227358 () Bool)

(assert (=> b!273137 (= res!227358 (= lt!410987 #b00000000000000000000000000000000))))

(assert (=> b!273137 (=> res!227358 e!193014)))

(assert (=> b!273137 (= e!193018 e!193014)))

(declare-fun d!93398 () Bool)

(declare-fun res!227361 () Bool)

(assert (=> d!93398 (=> res!227361 e!193016)))

(assert (=> d!93398 (= res!227361 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!410931))))

(assert (=> d!93398 (= (arrayBitRangesEq!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 lt!410931) e!193016)))

(assert (= (and d!93398 (not res!227361)) b!273135))

(assert (= (and b!273135 (not res!227359)) b!273140))

(assert (= (and b!273135 res!227360) b!273136))

(assert (= (and b!273136 c!12592) b!273141))

(assert (= (and b!273136 (not c!12592)) b!273139))

(assert (= (and b!273139 res!227357) b!273137))

(assert (= (and b!273137 (not res!227358)) b!273138))

(assert (= (or b!273141 b!273138) bm!4404))

(declare-fun m!406005 () Bool)

(assert (=> b!273135 m!406005))

(declare-fun m!406007 () Bool)

(assert (=> bm!4404 m!406007))

(declare-fun m!406009 () Bool)

(assert (=> bm!4404 m!406009))

(declare-fun m!406011 () Bool)

(assert (=> bm!4404 m!406011))

(assert (=> bm!4404 m!406011))

(assert (=> bm!4404 m!406009))

(assert (=> b!273139 m!406011))

(assert (=> b!273139 m!406011))

(assert (=> b!273139 m!406011))

(assert (=> b!273139 m!406011))

(declare-fun m!406013 () Bool)

(assert (=> b!273139 m!406013))

(declare-fun m!406015 () Bool)

(assert (=> b!273140 m!406015))

(assert (=> b!273036 d!93398))

(declare-fun d!93402 () Bool)

(declare-fun e!193021 () Bool)

(assert (=> d!93402 e!193021))

(declare-fun res!227364 () Bool)

(assert (=> d!93402 (=> (not res!227364) (not e!193021))))

(declare-fun lt!410997 () (_ BitVec 64))

(declare-fun lt!410998 () (_ BitVec 64))

(assert (=> d!93402 (= res!227364 (or (= lt!410997 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!410998 (bvsdiv (bvmul lt!410997 lt!410998) lt!410997))))))

(assert (=> d!93402 (= lt!410998 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93402 (= lt!410997 ((_ sign_extend 32) (size!6645 (buf!7113 bs!71))))))

(declare-fun lt!410999 () Unit!19269)

(declare-fun choose!44 (array!15282) Unit!19269)

(assert (=> d!93402 (= lt!410999 (choose!44 (buf!7113 bs!71)))))

(assert (=> d!93402 (= (arrayBitEqImpliesRangesEqLemma!0 (buf!7113 bs!71)) lt!410999)))

(declare-fun b!273144 () Bool)

(assert (=> b!273144 (= e!193021 (arrayBitRangesEq!0 (buf!7113 bs!71) (buf!7113 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!6645 (buf!7113 bs!71))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and d!93402 res!227364) b!273144))

(declare-fun m!406019 () Bool)

(assert (=> d!93402 m!406019))

(declare-fun m!406021 () Bool)

(assert (=> b!273144 m!406021))

(assert (=> b!273036 d!93402))

(push 1)

(assert (not d!93388))

(assert (not b!273084))

(assert (not d!93386))

(assert (not b!273062))

(assert (not b!273060))

(assert (not bm!4404))

(assert (not b!273139))

(assert (not b!273135))

(assert (not b!273140))

(assert (not bm!4397))

(assert (not d!93402))

(assert (not d!93384))

(assert (not b!273144))

(assert (not b!273080))

(assert (not b!273085))

(check-sat)

(pop 1)

(push 1)

(check-sat)

