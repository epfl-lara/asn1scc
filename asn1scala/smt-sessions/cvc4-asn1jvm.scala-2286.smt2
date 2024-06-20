; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57982 () Bool)

(assert start!57982)

(declare-fun b!266082 () Bool)

(declare-fun e!186036 () Bool)

(declare-datatypes ((array!14829 0))(
  ( (array!14830 (arr!7452 (Array (_ BitVec 32) (_ BitVec 8))) (size!6465 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11744 0))(
  ( (BitStream!11745 (buf!6933 array!14829) (currentByte!12824 (_ BitVec 32)) (currentBit!12819 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11744)

(declare-fun array_inv!6189 (array!14829) Bool)

(assert (=> b!266082 (= e!186036 (array_inv!6189 (buf!6933 w2!580)))))

(declare-fun e!186034 () Bool)

(declare-fun b!266083 () Bool)

(declare-fun lt!406887 () (_ BitVec 64))

(declare-fun w1!584 () BitStream!11744)

(assert (=> b!266083 (= e!186034 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!406887) (not (= (size!6465 (buf!6933 w1!584)) (size!6465 (buf!6933 w2!580)))) (bvsle lt!406887 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6465 (buf!6933 w1!584)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266083 (= lt!406887 (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584)))))

(declare-fun b!266084 () Bool)

(declare-fun e!186033 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14829 array!14829 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266084 (= e!186033 (not (arrayBitRangesEq!0 (buf!6933 w1!584) (buf!6933 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584)))))))

(declare-fun res!222310 () Bool)

(declare-fun e!186038 () Bool)

(assert (=> start!57982 (=> (not res!222310) (not e!186038))))

(declare-fun isPrefixOf!0 (BitStream!11744 BitStream!11744) Bool)

(assert (=> start!57982 (= res!222310 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57982 e!186038))

(declare-fun e!186035 () Bool)

(declare-fun inv!12 (BitStream!11744) Bool)

(assert (=> start!57982 (and (inv!12 w1!584) e!186035)))

(assert (=> start!57982 (and (inv!12 w2!580) e!186036)))

(declare-fun b!266085 () Bool)

(assert (=> b!266085 (= e!186038 (not e!186034))))

(declare-fun res!222311 () Bool)

(assert (=> b!266085 (=> res!222311 e!186034)))

(assert (=> b!266085 (= res!222311 e!186033)))

(declare-fun res!222313 () Bool)

(assert (=> b!266085 (=> (not res!222313) (not e!186033))))

(assert (=> b!266085 (= res!222313 (not (= (size!6465 (buf!6933 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266085 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18897 0))(
  ( (Unit!18898) )
))
(declare-fun lt!406885 () Unit!18897)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11744) Unit!18897)

(assert (=> b!266085 (= lt!406885 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406889 () BitStream!11744)

(assert (=> b!266085 (isPrefixOf!0 lt!406889 lt!406889)))

(declare-fun lt!406886 () Unit!18897)

(assert (=> b!266085 (= lt!406886 (lemmaIsPrefixRefl!0 lt!406889))))

(assert (=> b!266085 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406888 () Unit!18897)

(assert (=> b!266085 (= lt!406888 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266085 (= lt!406889 (BitStream!11745 (buf!6933 w2!580) (currentByte!12824 w1!584) (currentBit!12819 w1!584)))))

(declare-fun b!266086 () Bool)

(declare-fun res!222312 () Bool)

(assert (=> b!266086 (=> res!222312 e!186034)))

(assert (=> b!266086 (= res!222312 (= (size!6465 (buf!6933 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266087 () Bool)

(assert (=> b!266087 (= e!186035 (array_inv!6189 (buf!6933 w1!584)))))

(assert (= (and start!57982 res!222310) b!266085))

(assert (= (and b!266085 res!222313) b!266084))

(assert (= (and b!266085 (not res!222311)) b!266086))

(assert (= (and b!266086 (not res!222312)) b!266083))

(assert (= start!57982 b!266087))

(assert (= start!57982 b!266082))

(declare-fun m!396855 () Bool)

(assert (=> b!266087 m!396855))

(declare-fun m!396857 () Bool)

(assert (=> b!266084 m!396857))

(assert (=> b!266084 m!396857))

(declare-fun m!396859 () Bool)

(assert (=> b!266084 m!396859))

(declare-fun m!396861 () Bool)

(assert (=> start!57982 m!396861))

(declare-fun m!396863 () Bool)

(assert (=> start!57982 m!396863))

(declare-fun m!396865 () Bool)

(assert (=> start!57982 m!396865))

(assert (=> b!266083 m!396857))

(declare-fun m!396867 () Bool)

(assert (=> b!266085 m!396867))

(declare-fun m!396869 () Bool)

(assert (=> b!266085 m!396869))

(declare-fun m!396871 () Bool)

(assert (=> b!266085 m!396871))

(declare-fun m!396873 () Bool)

(assert (=> b!266085 m!396873))

(declare-fun m!396875 () Bool)

(assert (=> b!266085 m!396875))

(declare-fun m!396877 () Bool)

(assert (=> b!266085 m!396877))

(declare-fun m!396879 () Bool)

(assert (=> b!266082 m!396879))

(push 1)

(assert (not b!266084))

(assert (not b!266083))

(assert (not b!266082))

(assert (not b!266087))

(assert (not b!266085))

(assert (not start!57982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89874 () Bool)

(assert (=> d!89874 (= (array_inv!6189 (buf!6933 w1!584)) (bvsge (size!6465 (buf!6933 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!266087 d!89874))

(declare-fun d!89876 () Bool)

(assert (=> d!89876 (= (array_inv!6189 (buf!6933 w2!580)) (bvsge (size!6465 (buf!6933 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!266082 d!89876))

(declare-fun d!89878 () Bool)

(declare-fun e!186072 () Bool)

(assert (=> d!89878 e!186072))

(declare-fun res!222355 () Bool)

(assert (=> d!89878 (=> (not res!222355) (not e!186072))))

(declare-fun lt!406918 () (_ BitVec 64))

(declare-fun lt!406914 () (_ BitVec 64))

(declare-fun lt!406917 () (_ BitVec 64))

(assert (=> d!89878 (= res!222355 (= lt!406917 (bvsub lt!406914 lt!406918)))))

(assert (=> d!89878 (or (= (bvand lt!406914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406918 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406914 lt!406918) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89878 (= lt!406918 (remainingBits!0 ((_ sign_extend 32) (size!6465 (buf!6933 w1!584))) ((_ sign_extend 32) (currentByte!12824 w1!584)) ((_ sign_extend 32) (currentBit!12819 w1!584))))))

(declare-fun lt!406915 () (_ BitVec 64))

(declare-fun lt!406916 () (_ BitVec 64))

(assert (=> d!89878 (= lt!406914 (bvmul lt!406915 lt!406916))))

(assert (=> d!89878 (or (= lt!406915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406916 (bvsdiv (bvmul lt!406915 lt!406916) lt!406915)))))

(assert (=> d!89878 (= lt!406916 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89878 (= lt!406915 ((_ sign_extend 32) (size!6465 (buf!6933 w1!584))))))

(assert (=> d!89878 (= lt!406917 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12824 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12819 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89878 (invariant!0 (currentBit!12819 w1!584) (currentByte!12824 w1!584) (size!6465 (buf!6933 w1!584)))))

(assert (=> d!89878 (= (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584)) lt!406917)))

(declare-fun b!266133 () Bool)

(declare-fun res!222356 () Bool)

(assert (=> b!266133 (=> (not res!222356) (not e!186072))))

(assert (=> b!266133 (= res!222356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406917))))

(declare-fun b!266134 () Bool)

(declare-fun lt!406913 () (_ BitVec 64))

(assert (=> b!266134 (= e!186072 (bvsle lt!406917 (bvmul lt!406913 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266134 (or (= lt!406913 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406913 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406913)))))

(assert (=> b!266134 (= lt!406913 ((_ sign_extend 32) (size!6465 (buf!6933 w1!584))))))

(assert (= (and d!89878 res!222355) b!266133))

(assert (= (and b!266133 res!222356) b!266134))

(declare-fun m!396907 () Bool)

(assert (=> d!89878 m!396907))

(declare-fun m!396909 () Bool)

(assert (=> d!89878 m!396909))

(assert (=> b!266083 d!89878))

(declare-fun b!266162 () Bool)

(declare-fun e!186097 () Bool)

(declare-fun call!4163 () Bool)

(assert (=> b!266162 (= e!186097 call!4163)))

(declare-fun c!12240 () Bool)

(declare-fun lt!406946 () (_ BitVec 32))

(declare-fun bm!4160 () Bool)

(declare-datatypes ((tuple4!386 0))(
  ( (tuple4!387 (_1!12173 (_ BitVec 32)) (_2!12173 (_ BitVec 32)) (_3!973 (_ BitVec 32)) (_4!193 (_ BitVec 32))) )
))
(declare-fun lt!406947 () tuple4!386)

(declare-fun lt!406948 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4160 (= call!4163 (byteRangesEq!0 (ite c!12240 (select (arr!7452 (buf!6933 w1!584)) (_3!973 lt!406947)) (select (arr!7452 (buf!6933 w1!584)) (_4!193 lt!406947))) (ite c!12240 (select (arr!7452 (buf!6933 w2!580)) (_3!973 lt!406947)) (select (arr!7452 (buf!6933 w2!580)) (_4!193 lt!406947))) (ite c!12240 lt!406946 #b00000000000000000000000000000000) lt!406948))))

(declare-fun b!266163 () Bool)

(declare-fun res!222381 () Bool)

(assert (=> b!266163 (= res!222381 (= lt!406948 #b00000000000000000000000000000000))))

(assert (=> b!266163 (=> res!222381 e!186097)))

(declare-fun e!186099 () Bool)

(assert (=> b!266163 (= e!186099 e!186097)))

(declare-fun d!89902 () Bool)

(declare-fun res!222379 () Bool)

(declare-fun e!186095 () Bool)

(assert (=> d!89902 (=> res!222379 e!186095)))

(assert (=> d!89902 (= res!222379 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584))))))

(assert (=> d!89902 (= (arrayBitRangesEq!0 (buf!6933 w1!584) (buf!6933 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584))) e!186095)))

(declare-fun b!266164 () Bool)

(declare-fun e!186096 () Bool)

(assert (=> b!266164 (= e!186096 call!4163)))

(declare-fun e!186098 () Bool)

(declare-fun b!266165 () Bool)

(declare-fun arrayRangesEq!1028 (array!14829 array!14829 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266165 (= e!186098 (arrayRangesEq!1028 (buf!6933 w1!584) (buf!6933 w2!580) (_1!12173 lt!406947) (_2!12173 lt!406947)))))

(declare-fun b!266166 () Bool)

(assert (=> b!266166 (= e!186096 e!186099)))

(declare-fun res!222382 () Bool)

(assert (=> b!266166 (= res!222382 (byteRangesEq!0 (select (arr!7452 (buf!6933 w1!584)) (_3!973 lt!406947)) (select (arr!7452 (buf!6933 w2!580)) (_3!973 lt!406947)) lt!406946 #b00000000000000000000000000001000))))

(assert (=> b!266166 (=> (not res!222382) (not e!186099))))

(declare-fun b!266167 () Bool)

(declare-fun e!186094 () Bool)

(assert (=> b!266167 (= e!186094 e!186096)))

(assert (=> b!266167 (= c!12240 (= (_3!973 lt!406947) (_4!193 lt!406947)))))

(declare-fun b!266168 () Bool)

(assert (=> b!266168 (= e!186095 e!186094)))

(declare-fun res!222378 () Bool)

(assert (=> b!266168 (=> (not res!222378) (not e!186094))))

(assert (=> b!266168 (= res!222378 e!186098)))

(declare-fun res!222380 () Bool)

(assert (=> b!266168 (=> res!222380 e!186098)))

(assert (=> b!266168 (= res!222380 (bvsge (_1!12173 lt!406947) (_2!12173 lt!406947)))))

(assert (=> b!266168 (= lt!406948 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266168 (= lt!406946 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!386)

(assert (=> b!266168 (= lt!406947 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584))))))

(assert (= (and d!89902 (not res!222379)) b!266168))

(assert (= (and b!266168 (not res!222380)) b!266165))

(assert (= (and b!266168 res!222378) b!266167))

(assert (= (and b!266167 c!12240) b!266164))

(assert (= (and b!266167 (not c!12240)) b!266166))

(assert (= (and b!266166 res!222382) b!266163))

(assert (= (and b!266163 (not res!222381)) b!266162))

(assert (= (or b!266164 b!266162) bm!4160))

(declare-fun m!396929 () Bool)

(assert (=> bm!4160 m!396929))

(declare-fun m!396931 () Bool)

(assert (=> bm!4160 m!396931))

(declare-fun m!396933 () Bool)

(assert (=> bm!4160 m!396933))

(declare-fun m!396935 () Bool)

(assert (=> bm!4160 m!396935))

(declare-fun m!396937 () Bool)

(assert (=> bm!4160 m!396937))

(declare-fun m!396939 () Bool)

(assert (=> b!266165 m!396939))

(assert (=> b!266166 m!396935))

(assert (=> b!266166 m!396937))

(assert (=> b!266166 m!396935))

(assert (=> b!266166 m!396937))

(declare-fun m!396941 () Bool)

(assert (=> b!266166 m!396941))

(assert (=> b!266168 m!396857))

(declare-fun m!396943 () Bool)

(assert (=> b!266168 m!396943))

(assert (=> b!266084 d!89902))

(assert (=> b!266084 d!89878))

(declare-fun d!89908 () Bool)

(declare-fun res!222405 () Bool)

(declare-fun e!186119 () Bool)

(assert (=> d!89908 (=> (not res!222405) (not e!186119))))

(assert (=> d!89908 (= res!222405 (= (size!6465 (buf!6933 w1!584)) (size!6465 (buf!6933 w2!580))))))

(assert (=> d!89908 (= (isPrefixOf!0 w1!584 w2!580) e!186119)))

(declare-fun b!266195 () Bool)

(declare-fun res!222406 () Bool)

(assert (=> b!266195 (=> (not res!222406) (not e!186119))))

(assert (=> b!266195 (= res!222406 (bvsle (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584)) (bitIndex!0 (size!6465 (buf!6933 w2!580)) (currentByte!12824 w2!580) (currentBit!12819 w2!580))))))

(declare-fun b!266196 () Bool)

(declare-fun e!186120 () Bool)

(assert (=> b!266196 (= e!186119 e!186120)))

(declare-fun res!222407 () Bool)

(assert (=> b!266196 (=> res!222407 e!186120)))

(assert (=> b!266196 (= res!222407 (= (size!6465 (buf!6933 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266197 () Bool)

(assert (=> b!266197 (= e!186120 (arrayBitRangesEq!0 (buf!6933 w1!584) (buf!6933 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584))))))

(assert (= (and d!89908 res!222405) b!266195))

(assert (= (and b!266195 res!222406) b!266196))

(assert (= (and b!266196 (not res!222407)) b!266197))

(assert (=> b!266195 m!396857))

(declare-fun m!396947 () Bool)

(assert (=> b!266195 m!396947))

(assert (=> b!266197 m!396857))

(assert (=> b!266197 m!396857))

(assert (=> b!266197 m!396859))

(assert (=> start!57982 d!89908))

(declare-fun d!89912 () Bool)

(assert (=> d!89912 (= (inv!12 w1!584) (invariant!0 (currentBit!12819 w1!584) (currentByte!12824 w1!584) (size!6465 (buf!6933 w1!584))))))

(declare-fun bs!22820 () Bool)

(assert (= bs!22820 d!89912))

(assert (=> bs!22820 m!396909))

(assert (=> start!57982 d!89912))

(declare-fun d!89914 () Bool)

(assert (=> d!89914 (= (inv!12 w2!580) (invariant!0 (currentBit!12819 w2!580) (currentByte!12824 w2!580) (size!6465 (buf!6933 w2!580))))))

(declare-fun bs!22821 () Bool)

(assert (= bs!22821 d!89914))

(declare-fun m!396965 () Bool)

(assert (=> bs!22821 m!396965))

(assert (=> start!57982 d!89914))

(declare-fun d!89916 () Bool)

(assert (=> d!89916 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406983 () Unit!18897)

(declare-fun choose!11 (BitStream!11744) Unit!18897)

(assert (=> d!89916 (= lt!406983 (choose!11 w2!580))))

(assert (=> d!89916 (= (lemmaIsPrefixRefl!0 w2!580) lt!406983)))

(declare-fun bs!22827 () Bool)

(assert (= bs!22827 d!89916))

(assert (=> bs!22827 m!396871))

(declare-fun m!396975 () Bool)

(assert (=> bs!22827 m!396975))

(assert (=> b!266085 d!89916))

(declare-fun d!89924 () Bool)

(assert (=> d!89924 (isPrefixOf!0 lt!406889 lt!406889)))

(declare-fun lt!406984 () Unit!18897)

(assert (=> d!89924 (= lt!406984 (choose!11 lt!406889))))

(assert (=> d!89924 (= (lemmaIsPrefixRefl!0 lt!406889) lt!406984)))

(declare-fun bs!22828 () Bool)

(assert (= bs!22828 d!89924))

(assert (=> bs!22828 m!396875))

(declare-fun m!396979 () Bool)

(assert (=> bs!22828 m!396979))

(assert (=> b!266085 d!89924))

(declare-fun d!89928 () Bool)

(assert (=> d!89928 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406985 () Unit!18897)

(assert (=> d!89928 (= lt!406985 (choose!11 w1!584))))

(assert (=> d!89928 (= (lemmaIsPrefixRefl!0 w1!584) lt!406985)))

(declare-fun bs!22829 () Bool)

(assert (= bs!22829 d!89928))

(assert (=> bs!22829 m!396869))

(declare-fun m!396981 () Bool)

(assert (=> bs!22829 m!396981))

(assert (=> b!266085 d!89928))

(declare-fun d!89930 () Bool)

(declare-fun res!222419 () Bool)

(declare-fun e!186131 () Bool)

(assert (=> d!89930 (=> (not res!222419) (not e!186131))))

(assert (=> d!89930 (= res!222419 (= (size!6465 (buf!6933 lt!406889)) (size!6465 (buf!6933 lt!406889))))))

(assert (=> d!89930 (= (isPrefixOf!0 lt!406889 lt!406889) e!186131)))

(declare-fun b!266211 () Bool)

(declare-fun res!222420 () Bool)

(assert (=> b!266211 (=> (not res!222420) (not e!186131))))

(assert (=> b!266211 (= res!222420 (bvsle (bitIndex!0 (size!6465 (buf!6933 lt!406889)) (currentByte!12824 lt!406889) (currentBit!12819 lt!406889)) (bitIndex!0 (size!6465 (buf!6933 lt!406889)) (currentByte!12824 lt!406889) (currentBit!12819 lt!406889))))))

(declare-fun b!266212 () Bool)

(declare-fun e!186132 () Bool)

(assert (=> b!266212 (= e!186131 e!186132)))

(declare-fun res!222421 () Bool)

(assert (=> b!266212 (=> res!222421 e!186132)))

(assert (=> b!266212 (= res!222421 (= (size!6465 (buf!6933 lt!406889)) #b00000000000000000000000000000000))))

(declare-fun b!266213 () Bool)

(assert (=> b!266213 (= e!186132 (arrayBitRangesEq!0 (buf!6933 lt!406889) (buf!6933 lt!406889) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6465 (buf!6933 lt!406889)) (currentByte!12824 lt!406889) (currentBit!12819 lt!406889))))))

(assert (= (and d!89930 res!222419) b!266211))

(assert (= (and b!266211 res!222420) b!266212))

(assert (= (and b!266212 (not res!222421)) b!266213))

(declare-fun m!396983 () Bool)

(assert (=> b!266211 m!396983))

(assert (=> b!266211 m!396983))

(assert (=> b!266213 m!396983))

(assert (=> b!266213 m!396983))

(declare-fun m!396987 () Bool)

(assert (=> b!266213 m!396987))

(assert (=> b!266085 d!89930))

(declare-fun d!89934 () Bool)

(declare-fun res!222425 () Bool)

(declare-fun e!186135 () Bool)

(assert (=> d!89934 (=> (not res!222425) (not e!186135))))

(assert (=> d!89934 (= res!222425 (= (size!6465 (buf!6933 w1!584)) (size!6465 (buf!6933 w1!584))))))

(assert (=> d!89934 (= (isPrefixOf!0 w1!584 w1!584) e!186135)))

(declare-fun b!266217 () Bool)

(declare-fun res!222426 () Bool)

(assert (=> b!266217 (=> (not res!222426) (not e!186135))))

(assert (=> b!266217 (= res!222426 (bvsle (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584)) (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584))))))

(declare-fun b!266218 () Bool)

(declare-fun e!186136 () Bool)

(assert (=> b!266218 (= e!186135 e!186136)))

(declare-fun res!222427 () Bool)

(assert (=> b!266218 (=> res!222427 e!186136)))

(assert (=> b!266218 (= res!222427 (= (size!6465 (buf!6933 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266219 () Bool)

(assert (=> b!266219 (= e!186136 (arrayBitRangesEq!0 (buf!6933 w1!584) (buf!6933 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6465 (buf!6933 w1!584)) (currentByte!12824 w1!584) (currentBit!12819 w1!584))))))

(assert (= (and d!89934 res!222425) b!266217))

(assert (= (and b!266217 res!222426) b!266218))

(assert (= (and b!266218 (not res!222427)) b!266219))

(assert (=> b!266217 m!396857))

(assert (=> b!266217 m!396857))

(assert (=> b!266219 m!396857))

(assert (=> b!266219 m!396857))

(declare-fun m!396989 () Bool)

(assert (=> b!266219 m!396989))

(assert (=> b!266085 d!89934))

(declare-fun d!89936 () Bool)

(declare-fun res!222428 () Bool)

(declare-fun e!186137 () Bool)

(assert (=> d!89936 (=> (not res!222428) (not e!186137))))

(assert (=> d!89936 (= res!222428 (= (size!6465 (buf!6933 w2!580)) (size!6465 (buf!6933 w2!580))))))

(assert (=> d!89936 (= (isPrefixOf!0 w2!580 w2!580) e!186137)))

(declare-fun b!266220 () Bool)

(declare-fun res!222429 () Bool)

(assert (=> b!266220 (=> (not res!222429) (not e!186137))))

(assert (=> b!266220 (= res!222429 (bvsle (bitIndex!0 (size!6465 (buf!6933 w2!580)) (currentByte!12824 w2!580) (currentBit!12819 w2!580)) (bitIndex!0 (size!6465 (buf!6933 w2!580)) (currentByte!12824 w2!580) (currentBit!12819 w2!580))))))

(declare-fun b!266221 () Bool)

(declare-fun e!186138 () Bool)

(assert (=> b!266221 (= e!186137 e!186138)))

(declare-fun res!222430 () Bool)

(assert (=> b!266221 (=> res!222430 e!186138)))

(assert (=> b!266221 (= res!222430 (= (size!6465 (buf!6933 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!266222 () Bool)

(assert (=> b!266222 (= e!186138 (arrayBitRangesEq!0 (buf!6933 w2!580) (buf!6933 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6465 (buf!6933 w2!580)) (currentByte!12824 w2!580) (currentBit!12819 w2!580))))))

(assert (= (and d!89936 res!222428) b!266220))

(assert (= (and b!266220 res!222429) b!266221))

(assert (= (and b!266221 (not res!222430)) b!266222))

(assert (=> b!266220 m!396947))

(assert (=> b!266220 m!396947))

(assert (=> b!266222 m!396947))

(assert (=> b!266222 m!396947))

(declare-fun m!396993 () Bool)

(assert (=> b!266222 m!396993))

(assert (=> b!266085 d!89936))

(push 1)

(assert (not bm!4160))

(assert (not b!266219))

(assert (not b!266197))

(assert (not b!266165))

(assert (not d!89878))

(assert (not b!266217))

(assert (not b!266211))

(assert (not d!89914))

(assert (not d!89912))

(assert (not b!266168))

(assert (not b!266222))

(assert (not b!266166))

(assert (not b!266213))

(assert (not b!266220))

(assert (not d!89928))

(assert (not d!89916))

(assert (not d!89924))

(assert (not b!266195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

