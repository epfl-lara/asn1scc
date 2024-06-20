; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58108 () Bool)

(assert start!58108)

(declare-fun b!266999 () Bool)

(declare-fun e!186898 () Bool)

(declare-datatypes ((array!14877 0))(
  ( (array!14878 (arr!7473 (Array (_ BitVec 32) (_ BitVec 8))) (size!6486 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11786 0))(
  ( (BitStream!11787 (buf!6954 array!14877) (currentByte!12851 (_ BitVec 32)) (currentBit!12846 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11786)

(declare-fun w1!584 () BitStream!11786)

(declare-fun arrayBitRangesEq!0 (array!14877 array!14877 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266999 (= e!186898 (not (arrayBitRangesEq!0 (buf!6954 w2!580) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)))))))

(declare-fun e!186894 () Bool)

(declare-fun lt!407659 () BitStream!11786)

(declare-fun b!267000 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!11786 (_ BitVec 64)) BitStream!11786)

(assert (=> b!267000 (= e!186894 (= lt!407659 (withMovedBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))))

(declare-datatypes ((Unit!18956 0))(
  ( (Unit!18957) )
))
(declare-fun lt!407654 () Unit!18956)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11786 BitStream!11786 BitStream!11786) Unit!18956)

(assert (=> b!267000 (= lt!407654 (lemmaIsPrefixTransitive!0 lt!407659 w2!580 w2!580))))

(declare-fun isPrefixOf!0 (BitStream!11786 BitStream!11786) Bool)

(assert (=> b!267000 (isPrefixOf!0 lt!407659 w2!580)))

(declare-fun lt!407655 () Unit!18956)

(assert (=> b!267000 (= lt!407655 (lemmaIsPrefixTransitive!0 lt!407659 w1!584 w2!580))))

(declare-fun b!267001 () Bool)

(declare-fun e!186900 () Bool)

(declare-fun array_inv!6210 (array!14877) Bool)

(assert (=> b!267001 (= e!186900 (array_inv!6210 (buf!6954 w1!584)))))

(declare-fun b!267002 () Bool)

(declare-fun e!186897 () Bool)

(assert (=> b!267002 (= e!186897 (array_inv!6210 (buf!6954 w2!580)))))

(declare-fun b!267003 () Bool)

(declare-fun e!186892 () Bool)

(assert (=> b!267003 (= e!186892 e!186894)))

(declare-fun res!222952 () Bool)

(assert (=> b!267003 (=> res!222952 e!186894)))

(assert (=> b!267003 (= res!222952 e!186898)))

(declare-fun res!222949 () Bool)

(assert (=> b!267003 (=> (not res!222949) (not e!186898))))

(assert (=> b!267003 (= res!222949 (not (= (size!6486 (buf!6954 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407653 () Unit!18956)

(declare-fun e!186896 () Unit!18956)

(assert (=> b!267003 (= lt!407653 e!186896)))

(declare-fun c!12312 () Bool)

(assert (=> b!267003 (= c!12312 (not (= (size!6486 (buf!6954 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun res!222950 () Bool)

(declare-fun e!186895 () Bool)

(assert (=> start!58108 (=> (not res!222950) (not e!186895))))

(assert (=> start!58108 (= res!222950 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58108 e!186895))

(declare-fun inv!12 (BitStream!11786) Bool)

(assert (=> start!58108 (and (inv!12 w1!584) e!186900)))

(assert (=> start!58108 (and (inv!12 w2!580) e!186897)))

(declare-fun b!267004 () Bool)

(declare-fun lt!407652 () Unit!18956)

(assert (=> b!267004 (= e!186896 lt!407652)))

(declare-fun lt!407660 () (_ BitVec 64))

(assert (=> b!267004 (= lt!407660 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14877 array!14877 (_ BitVec 64) (_ BitVec 64)) Unit!18956)

(assert (=> b!267004 (= lt!407652 (arrayBitRangesEqSymmetric!0 (buf!6954 w1!584) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660))))

(assert (=> b!267004 (arrayBitRangesEq!0 (buf!6954 w2!580) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660)))

(declare-fun b!267005 () Bool)

(assert (=> b!267005 (= e!186895 (not e!186892))))

(declare-fun res!222948 () Bool)

(assert (=> b!267005 (=> res!222948 e!186892)))

(declare-fun e!186899 () Bool)

(assert (=> b!267005 (= res!222948 e!186899)))

(declare-fun res!222951 () Bool)

(assert (=> b!267005 (=> (not res!222951) (not e!186899))))

(assert (=> b!267005 (= res!222951 (not (= (size!6486 (buf!6954 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!267005 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407656 () Unit!18956)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11786) Unit!18956)

(assert (=> b!267005 (= lt!407656 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!267005 (isPrefixOf!0 lt!407659 lt!407659)))

(declare-fun lt!407658 () Unit!18956)

(assert (=> b!267005 (= lt!407658 (lemmaIsPrefixRefl!0 lt!407659))))

(assert (=> b!267005 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407657 () Unit!18956)

(assert (=> b!267005 (= lt!407657 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!267005 (= lt!407659 (BitStream!11787 (buf!6954 w2!580) (currentByte!12851 w1!584) (currentBit!12846 w1!584)))))

(declare-fun b!267006 () Bool)

(assert (=> b!267006 (= e!186899 (not (arrayBitRangesEq!0 (buf!6954 w1!584) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)))))))

(declare-fun b!267007 () Bool)

(declare-fun Unit!18958 () Unit!18956)

(assert (=> b!267007 (= e!186896 Unit!18958)))

(declare-fun b!267008 () Bool)

(declare-fun res!222947 () Bool)

(assert (=> b!267008 (=> res!222947 e!186894)))

(assert (=> b!267008 (= res!222947 (not (isPrefixOf!0 lt!407659 w1!584)))))

(assert (= (and start!58108 res!222950) b!267005))

(assert (= (and b!267005 res!222951) b!267006))

(assert (= (and b!267005 (not res!222948)) b!267003))

(assert (= (and b!267003 c!12312) b!267004))

(assert (= (and b!267003 (not c!12312)) b!267007))

(assert (= (and b!267003 res!222949) b!266999))

(assert (= (and b!267003 (not res!222952)) b!267008))

(assert (= (and b!267008 (not res!222947)) b!267000))

(assert (= start!58108 b!267001))

(assert (= start!58108 b!267002))

(declare-fun m!397959 () Bool)

(assert (=> b!267006 m!397959))

(assert (=> b!267006 m!397959))

(declare-fun m!397961 () Bool)

(assert (=> b!267006 m!397961))

(declare-fun m!397963 () Bool)

(assert (=> b!267005 m!397963))

(declare-fun m!397965 () Bool)

(assert (=> b!267005 m!397965))

(declare-fun m!397967 () Bool)

(assert (=> b!267005 m!397967))

(declare-fun m!397969 () Bool)

(assert (=> b!267005 m!397969))

(declare-fun m!397971 () Bool)

(assert (=> b!267005 m!397971))

(declare-fun m!397973 () Bool)

(assert (=> b!267005 m!397973))

(declare-fun m!397975 () Bool)

(assert (=> b!267001 m!397975))

(declare-fun m!397977 () Bool)

(assert (=> b!267000 m!397977))

(assert (=> b!267000 m!397959))

(declare-fun m!397979 () Bool)

(assert (=> b!267000 m!397979))

(declare-fun m!397981 () Bool)

(assert (=> b!267000 m!397981))

(declare-fun m!397983 () Bool)

(assert (=> b!267000 m!397983))

(declare-fun m!397985 () Bool)

(assert (=> b!267000 m!397985))

(assert (=> b!267004 m!397959))

(declare-fun m!397987 () Bool)

(assert (=> b!267004 m!397987))

(declare-fun m!397989 () Bool)

(assert (=> b!267004 m!397989))

(declare-fun m!397991 () Bool)

(assert (=> b!267002 m!397991))

(declare-fun m!397993 () Bool)

(assert (=> b!267008 m!397993))

(assert (=> b!266999 m!397959))

(assert (=> b!266999 m!397959))

(declare-fun m!397995 () Bool)

(assert (=> b!266999 m!397995))

(declare-fun m!397997 () Bool)

(assert (=> start!58108 m!397997))

(declare-fun m!397999 () Bool)

(assert (=> start!58108 m!397999))

(declare-fun m!398001 () Bool)

(assert (=> start!58108 m!398001))

(push 1)

(assert (not b!267005))

(assert (not b!267002))

(assert (not b!267001))

(assert (not b!267004))

(assert (not b!266999))

(assert (not b!267006))

(assert (not start!58108))

(assert (not b!267008))

(assert (not b!267000))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!267055 () Bool)

(declare-fun e!186938 () Bool)

(declare-fun e!186935 () Bool)

(assert (=> b!267055 (= e!186938 e!186935)))

(declare-datatypes ((tuple4!396 0))(
  ( (tuple4!397 (_1!12178 (_ BitVec 32)) (_2!12178 (_ BitVec 32)) (_3!978 (_ BitVec 32)) (_4!198 (_ BitVec 32))) )
))
(declare-fun lt!407704 () tuple4!396)

(declare-fun res!222995 () Bool)

(declare-fun lt!407703 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267055 (= res!222995 (byteRangesEq!0 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407704)) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407704)) lt!407703 #b00000000000000000000000000001000))))

(assert (=> b!267055 (=> (not res!222995) (not e!186935))))

(declare-fun b!267056 () Bool)

(declare-fun e!186937 () Bool)

(declare-fun call!4184 () Bool)

(assert (=> b!267056 (= e!186937 call!4184)))

(declare-fun b!267057 () Bool)

(assert (=> b!267057 (= e!186938 call!4184)))

(declare-fun b!267058 () Bool)

(declare-fun res!222997 () Bool)

(declare-fun lt!407705 () (_ BitVec 32))

(assert (=> b!267058 (= res!222997 (= lt!407705 #b00000000000000000000000000000000))))

(assert (=> b!267058 (=> res!222997 e!186937)))

(assert (=> b!267058 (= e!186935 e!186937)))

(declare-fun e!186933 () Bool)

(declare-fun b!267059 () Bool)

(declare-fun arrayRangesEq!1034 (array!14877 array!14877 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267059 (= e!186933 (arrayRangesEq!1034 (buf!6954 w2!580) (buf!6954 w1!584) (_1!12178 lt!407704) (_2!12178 lt!407704)))))

(declare-fun bm!4181 () Bool)

(declare-fun c!12315 () Bool)

(assert (=> bm!4181 (= call!4184 (byteRangesEq!0 (ite c!12315 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407704)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407704))) (ite c!12315 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407704)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407704))) (ite c!12315 lt!407703 #b00000000000000000000000000000000) lt!407705))))

(declare-fun b!267060 () Bool)

(declare-fun e!186934 () Bool)

(declare-fun e!186936 () Bool)

(assert (=> b!267060 (= e!186934 e!186936)))

(declare-fun res!222998 () Bool)

(assert (=> b!267060 (=> (not res!222998) (not e!186936))))

(assert (=> b!267060 (= res!222998 e!186933)))

(declare-fun res!222996 () Bool)

(assert (=> b!267060 (=> res!222996 e!186933)))

(assert (=> b!267060 (= res!222996 (bvsge (_1!12178 lt!407704) (_2!12178 lt!407704)))))

(assert (=> b!267060 (= lt!407705 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267060 (= lt!407703 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!396)

(assert (=> b!267060 (= lt!407704 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(declare-fun d!90084 () Bool)

(declare-fun res!222999 () Bool)

(assert (=> d!90084 (=> res!222999 e!186934)))

(assert (=> d!90084 (= res!222999 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(assert (=> d!90084 (= (arrayBitRangesEq!0 (buf!6954 w2!580) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))) e!186934)))

(declare-fun b!267061 () Bool)

(assert (=> b!267061 (= e!186936 e!186938)))

(assert (=> b!267061 (= c!12315 (= (_3!978 lt!407704) (_4!198 lt!407704)))))

(assert (= (and d!90084 (not res!222999)) b!267060))

(assert (= (and b!267060 (not res!222996)) b!267059))

(assert (= (and b!267060 res!222998) b!267061))

(assert (= (and b!267061 c!12315) b!267057))

(assert (= (and b!267061 (not c!12315)) b!267055))

(assert (= (and b!267055 res!222995) b!267058))

(assert (= (and b!267058 (not res!222997)) b!267056))

(assert (= (or b!267057 b!267056) bm!4181))

(declare-fun m!398035 () Bool)

(assert (=> b!267055 m!398035))

(declare-fun m!398037 () Bool)

(assert (=> b!267055 m!398037))

(assert (=> b!267055 m!398035))

(assert (=> b!267055 m!398037))

(declare-fun m!398039 () Bool)

(assert (=> b!267055 m!398039))

(declare-fun m!398041 () Bool)

(assert (=> b!267059 m!398041))

(assert (=> bm!4181 m!398037))

(declare-fun m!398043 () Bool)

(assert (=> bm!4181 m!398043))

(declare-fun m!398045 () Bool)

(assert (=> bm!4181 m!398045))

(assert (=> bm!4181 m!398035))

(declare-fun m!398047 () Bool)

(assert (=> bm!4181 m!398047))

(assert (=> b!267060 m!397959))

(declare-fun m!398049 () Bool)

(assert (=> b!267060 m!398049))

(assert (=> b!266999 d!90084))

(declare-fun d!90110 () Bool)

(declare-fun e!186950 () Bool)

(assert (=> d!90110 e!186950))

(declare-fun res!223019 () Bool)

(assert (=> d!90110 (=> (not res!223019) (not e!186950))))

(declare-fun lt!407755 () (_ BitVec 64))

(declare-fun lt!407754 () (_ BitVec 64))

(declare-fun lt!407756 () (_ BitVec 64))

(assert (=> d!90110 (= res!223019 (= lt!407756 (bvsub lt!407754 lt!407755)))))

(assert (=> d!90110 (or (= (bvand lt!407754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407755 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407754 lt!407755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90110 (= lt!407755 (remainingBits!0 ((_ sign_extend 32) (size!6486 (buf!6954 w1!584))) ((_ sign_extend 32) (currentByte!12851 w1!584)) ((_ sign_extend 32) (currentBit!12846 w1!584))))))

(declare-fun lt!407751 () (_ BitVec 64))

(declare-fun lt!407752 () (_ BitVec 64))

(assert (=> d!90110 (= lt!407754 (bvmul lt!407751 lt!407752))))

(assert (=> d!90110 (or (= lt!407751 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407752 (bvsdiv (bvmul lt!407751 lt!407752) lt!407751)))))

(assert (=> d!90110 (= lt!407752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90110 (= lt!407751 ((_ sign_extend 32) (size!6486 (buf!6954 w1!584))))))

(assert (=> d!90110 (= lt!407756 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12851 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12846 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90110 (invariant!0 (currentBit!12846 w1!584) (currentByte!12851 w1!584) (size!6486 (buf!6954 w1!584)))))

(assert (=> d!90110 (= (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) lt!407756)))

(declare-fun b!267080 () Bool)

(declare-fun res!223018 () Bool)

(assert (=> b!267080 (=> (not res!223018) (not e!186950))))

(assert (=> b!267080 (= res!223018 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407756))))

(declare-fun b!267081 () Bool)

(declare-fun lt!407753 () (_ BitVec 64))

(assert (=> b!267081 (= e!186950 (bvsle lt!407756 (bvmul lt!407753 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267081 (or (= lt!407753 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407753 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407753)))))

(assert (=> b!267081 (= lt!407753 ((_ sign_extend 32) (size!6486 (buf!6954 w1!584))))))

(assert (= (and d!90110 res!223019) b!267080))

(assert (= (and b!267080 res!223018) b!267081))

(declare-fun m!398069 () Bool)

(assert (=> d!90110 m!398069))

(declare-fun m!398071 () Bool)

(assert (=> d!90110 m!398071))

(assert (=> b!266999 d!90110))

(assert (=> b!267004 d!90110))

(declare-fun d!90122 () Bool)

(assert (=> d!90122 (arrayBitRangesEq!0 (buf!6954 w2!580) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660)))

(declare-fun lt!407759 () Unit!18956)

(declare-fun choose!8 (array!14877 array!14877 (_ BitVec 64) (_ BitVec 64)) Unit!18956)

(assert (=> d!90122 (= lt!407759 (choose!8 (buf!6954 w1!584) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660))))

(assert (=> d!90122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660))))

(assert (=> d!90122 (= (arrayBitRangesEqSymmetric!0 (buf!6954 w1!584) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660) lt!407759)))

(declare-fun bs!22886 () Bool)

(assert (= bs!22886 d!90122))

(assert (=> bs!22886 m!397989))

(declare-fun m!398073 () Bool)

(assert (=> bs!22886 m!398073))

(assert (=> b!267004 d!90122))

(declare-fun b!267082 () Bool)

(declare-fun e!186956 () Bool)

(declare-fun e!186953 () Bool)

(assert (=> b!267082 (= e!186956 e!186953)))

(declare-fun lt!407760 () (_ BitVec 32))

(declare-fun res!223020 () Bool)

(declare-fun lt!407761 () tuple4!396)

(assert (=> b!267082 (= res!223020 (byteRangesEq!0 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407761)) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407761)) lt!407760 #b00000000000000000000000000001000))))

(assert (=> b!267082 (=> (not res!223020) (not e!186953))))

(declare-fun b!267083 () Bool)

(declare-fun e!186955 () Bool)

(declare-fun call!4185 () Bool)

(assert (=> b!267083 (= e!186955 call!4185)))

(declare-fun b!267084 () Bool)

(assert (=> b!267084 (= e!186956 call!4185)))

(declare-fun b!267085 () Bool)

(declare-fun res!223022 () Bool)

(declare-fun lt!407762 () (_ BitVec 32))

(assert (=> b!267085 (= res!223022 (= lt!407762 #b00000000000000000000000000000000))))

(assert (=> b!267085 (=> res!223022 e!186955)))

(assert (=> b!267085 (= e!186953 e!186955)))

(declare-fun e!186951 () Bool)

(declare-fun b!267086 () Bool)

(assert (=> b!267086 (= e!186951 (arrayRangesEq!1034 (buf!6954 w2!580) (buf!6954 w1!584) (_1!12178 lt!407761) (_2!12178 lt!407761)))))

(declare-fun c!12316 () Bool)

(declare-fun bm!4182 () Bool)

(assert (=> bm!4182 (= call!4185 (byteRangesEq!0 (ite c!12316 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407761)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407761))) (ite c!12316 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407761)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407761))) (ite c!12316 lt!407760 #b00000000000000000000000000000000) lt!407762))))

(declare-fun b!267087 () Bool)

(declare-fun e!186952 () Bool)

(declare-fun e!186954 () Bool)

(assert (=> b!267087 (= e!186952 e!186954)))

(declare-fun res!223023 () Bool)

(assert (=> b!267087 (=> (not res!223023) (not e!186954))))

(assert (=> b!267087 (= res!223023 e!186951)))

(declare-fun res!223021 () Bool)

(assert (=> b!267087 (=> res!223021 e!186951)))

(assert (=> b!267087 (= res!223021 (bvsge (_1!12178 lt!407761) (_2!12178 lt!407761)))))

(assert (=> b!267087 (= lt!407762 ((_ extract 31 0) (bvsrem lt!407660 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267087 (= lt!407760 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267087 (= lt!407761 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660))))

(declare-fun d!90124 () Bool)

(declare-fun res!223024 () Bool)

(assert (=> d!90124 (=> res!223024 e!186952)))

(assert (=> d!90124 (= res!223024 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660))))

(assert (=> d!90124 (= (arrayBitRangesEq!0 (buf!6954 w2!580) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660) e!186952)))

(declare-fun b!267088 () Bool)

(assert (=> b!267088 (= e!186954 e!186956)))

(assert (=> b!267088 (= c!12316 (= (_3!978 lt!407761) (_4!198 lt!407761)))))

(assert (= (and d!90124 (not res!223024)) b!267087))

(assert (= (and b!267087 (not res!223021)) b!267086))

(assert (= (and b!267087 res!223023) b!267088))

(assert (= (and b!267088 c!12316) b!267084))

(assert (= (and b!267088 (not c!12316)) b!267082))

(assert (= (and b!267082 res!223020) b!267085))

(assert (= (and b!267085 (not res!223022)) b!267083))

(assert (= (or b!267084 b!267083) bm!4182))

(declare-fun m!398075 () Bool)

(assert (=> b!267082 m!398075))

(declare-fun m!398077 () Bool)

(assert (=> b!267082 m!398077))

(assert (=> b!267082 m!398075))

(assert (=> b!267082 m!398077))

(declare-fun m!398079 () Bool)

(assert (=> b!267082 m!398079))

(declare-fun m!398081 () Bool)

(assert (=> b!267086 m!398081))

(assert (=> bm!4182 m!398077))

(declare-fun m!398083 () Bool)

(assert (=> bm!4182 m!398083))

(declare-fun m!398085 () Bool)

(assert (=> bm!4182 m!398085))

(assert (=> bm!4182 m!398075))

(declare-fun m!398087 () Bool)

(assert (=> bm!4182 m!398087))

(declare-fun m!398089 () Bool)

(assert (=> b!267087 m!398089))

(assert (=> b!267004 d!90124))

(declare-fun b!267089 () Bool)

(declare-fun e!186962 () Bool)

(declare-fun e!186959 () Bool)

(assert (=> b!267089 (= e!186962 e!186959)))

(declare-fun lt!407763 () (_ BitVec 32))

(declare-fun res!223025 () Bool)

(declare-fun lt!407764 () tuple4!396)

(assert (=> b!267089 (= res!223025 (byteRangesEq!0 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407764)) (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407764)) lt!407763 #b00000000000000000000000000001000))))

(assert (=> b!267089 (=> (not res!223025) (not e!186959))))

(declare-fun b!267090 () Bool)

(declare-fun e!186961 () Bool)

(declare-fun call!4186 () Bool)

(assert (=> b!267090 (= e!186961 call!4186)))

(declare-fun b!267091 () Bool)

(assert (=> b!267091 (= e!186962 call!4186)))

(declare-fun b!267092 () Bool)

(declare-fun res!223027 () Bool)

(declare-fun lt!407765 () (_ BitVec 32))

(assert (=> b!267092 (= res!223027 (= lt!407765 #b00000000000000000000000000000000))))

(assert (=> b!267092 (=> res!223027 e!186961)))

(assert (=> b!267092 (= e!186959 e!186961)))

(declare-fun b!267093 () Bool)

(declare-fun e!186957 () Bool)

(assert (=> b!267093 (= e!186957 (arrayRangesEq!1034 (buf!6954 w1!584) (buf!6954 w2!580) (_1!12178 lt!407764) (_2!12178 lt!407764)))))

(declare-fun c!12317 () Bool)

(declare-fun bm!4183 () Bool)

(assert (=> bm!4183 (= call!4186 (byteRangesEq!0 (ite c!12317 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407764)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407764))) (ite c!12317 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407764)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407764))) (ite c!12317 lt!407763 #b00000000000000000000000000000000) lt!407765))))

(declare-fun b!267094 () Bool)

(declare-fun e!186958 () Bool)

(declare-fun e!186960 () Bool)

(assert (=> b!267094 (= e!186958 e!186960)))

(declare-fun res!223028 () Bool)

(assert (=> b!267094 (=> (not res!223028) (not e!186960))))

(assert (=> b!267094 (= res!223028 e!186957)))

(declare-fun res!223026 () Bool)

(assert (=> b!267094 (=> res!223026 e!186957)))

(assert (=> b!267094 (= res!223026 (bvsge (_1!12178 lt!407764) (_2!12178 lt!407764)))))

(assert (=> b!267094 (= lt!407765 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267094 (= lt!407763 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267094 (= lt!407764 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(declare-fun d!90126 () Bool)

(declare-fun res!223029 () Bool)

(assert (=> d!90126 (=> res!223029 e!186958)))

(assert (=> d!90126 (= res!223029 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(assert (=> d!90126 (= (arrayBitRangesEq!0 (buf!6954 w1!584) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))) e!186958)))

(declare-fun b!267095 () Bool)

(assert (=> b!267095 (= e!186960 e!186962)))

(assert (=> b!267095 (= c!12317 (= (_3!978 lt!407764) (_4!198 lt!407764)))))

(assert (= (and d!90126 (not res!223029)) b!267094))

(assert (= (and b!267094 (not res!223026)) b!267093))

(assert (= (and b!267094 res!223028) b!267095))

(assert (= (and b!267095 c!12317) b!267091))

(assert (= (and b!267095 (not c!12317)) b!267089))

(assert (= (and b!267089 res!223025) b!267092))

(assert (= (and b!267092 (not res!223027)) b!267090))

(assert (= (or b!267091 b!267090) bm!4183))

(declare-fun m!398091 () Bool)

(assert (=> b!267089 m!398091))

(declare-fun m!398093 () Bool)

(assert (=> b!267089 m!398093))

(assert (=> b!267089 m!398091))

(assert (=> b!267089 m!398093))

(declare-fun m!398095 () Bool)

(assert (=> b!267089 m!398095))

(declare-fun m!398097 () Bool)

(assert (=> b!267093 m!398097))

(assert (=> bm!4183 m!398093))

(declare-fun m!398099 () Bool)

(assert (=> bm!4183 m!398099))

(declare-fun m!398101 () Bool)

(assert (=> bm!4183 m!398101))

(assert (=> bm!4183 m!398091))

(declare-fun m!398103 () Bool)

(assert (=> bm!4183 m!398103))

(assert (=> b!267094 m!397959))

(assert (=> b!267094 m!398049))

(assert (=> b!267006 d!90126))

(assert (=> b!267006 d!90110))

(declare-fun d!90128 () Bool)

(assert (=> d!90128 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407778 () Unit!18956)

(declare-fun choose!11 (BitStream!11786) Unit!18956)

(assert (=> d!90128 (= lt!407778 (choose!11 w2!580))))

(assert (=> d!90128 (= (lemmaIsPrefixRefl!0 w2!580) lt!407778)))

(declare-fun bs!22888 () Bool)

(assert (= bs!22888 d!90128))

(assert (=> bs!22888 m!397971))

(declare-fun m!398105 () Bool)

(assert (=> bs!22888 m!398105))

(assert (=> b!267005 d!90128))

(declare-fun d!90130 () Bool)

(assert (=> d!90130 (isPrefixOf!0 lt!407659 lt!407659)))

(declare-fun lt!407779 () Unit!18956)

(assert (=> d!90130 (= lt!407779 (choose!11 lt!407659))))

(assert (=> d!90130 (= (lemmaIsPrefixRefl!0 lt!407659) lt!407779)))

(declare-fun bs!22889 () Bool)

(assert (= bs!22889 d!90130))

(assert (=> bs!22889 m!397963))

(declare-fun m!398107 () Bool)

(assert (=> bs!22889 m!398107))

(assert (=> b!267005 d!90130))

(declare-fun d!90132 () Bool)

(assert (=> d!90132 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407780 () Unit!18956)

(assert (=> d!90132 (= lt!407780 (choose!11 w1!584))))

(assert (=> d!90132 (= (lemmaIsPrefixRefl!0 w1!584) lt!407780)))

(declare-fun bs!22890 () Bool)

(assert (= bs!22890 d!90132))

(assert (=> bs!22890 m!397969))

(declare-fun m!398109 () Bool)

(assert (=> bs!22890 m!398109))

(assert (=> b!267005 d!90132))

(declare-fun d!90134 () Bool)

(declare-fun res!223056 () Bool)

(declare-fun e!186988 () Bool)

(assert (=> d!90134 (=> (not res!223056) (not e!186988))))

(assert (=> d!90134 (= res!223056 (= (size!6486 (buf!6954 lt!407659)) (size!6486 (buf!6954 lt!407659))))))

(assert (=> d!90134 (= (isPrefixOf!0 lt!407659 lt!407659) e!186988)))

(declare-fun b!267126 () Bool)

(declare-fun res!223055 () Bool)

(assert (=> b!267126 (=> (not res!223055) (not e!186988))))

(assert (=> b!267126 (= res!223055 (bvsle (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659)) (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(declare-fun b!267127 () Bool)

(declare-fun e!186989 () Bool)

(assert (=> b!267127 (= e!186988 e!186989)))

(declare-fun res!223054 () Bool)

(assert (=> b!267127 (=> res!223054 e!186989)))

(assert (=> b!267127 (= res!223054 (= (size!6486 (buf!6954 lt!407659)) #b00000000000000000000000000000000))))

(declare-fun b!267128 () Bool)

(assert (=> b!267128 (= e!186989 (arrayBitRangesEq!0 (buf!6954 lt!407659) (buf!6954 lt!407659) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(assert (= (and d!90134 res!223056) b!267126))

(assert (= (and b!267126 res!223055) b!267127))

(assert (= (and b!267127 (not res!223054)) b!267128))

(declare-fun m!398135 () Bool)

(assert (=> b!267126 m!398135))

(assert (=> b!267126 m!398135))

(assert (=> b!267128 m!398135))

(assert (=> b!267128 m!398135))

(declare-fun m!398137 () Bool)

(assert (=> b!267128 m!398137))

(assert (=> b!267005 d!90134))

(declare-fun d!90142 () Bool)

(declare-fun res!223064 () Bool)

(declare-fun e!186996 () Bool)

(assert (=> d!90142 (=> (not res!223064) (not e!186996))))

(assert (=> d!90142 (= res!223064 (= (size!6486 (buf!6954 w1!584)) (size!6486 (buf!6954 w1!584))))))

(assert (=> d!90142 (= (isPrefixOf!0 w1!584 w1!584) e!186996)))

(declare-fun b!267136 () Bool)

(declare-fun res!223063 () Bool)

(assert (=> b!267136 (=> (not res!223063) (not e!186996))))

(assert (=> b!267136 (= res!223063 (bvsle (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(declare-fun b!267137 () Bool)

(declare-fun e!186997 () Bool)

(assert (=> b!267137 (= e!186996 e!186997)))

(declare-fun res!223062 () Bool)

(assert (=> b!267137 (=> res!223062 e!186997)))

(assert (=> b!267137 (= res!223062 (= (size!6486 (buf!6954 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!267138 () Bool)

(assert (=> b!267138 (= e!186997 (arrayBitRangesEq!0 (buf!6954 w1!584) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(assert (= (and d!90142 res!223064) b!267136))

(assert (= (and b!267136 res!223063) b!267137))

(assert (= (and b!267137 (not res!223062)) b!267138))

(assert (=> b!267136 m!397959))

(assert (=> b!267136 m!397959))

(assert (=> b!267138 m!397959))

(assert (=> b!267138 m!397959))

(declare-fun m!398145 () Bool)

(assert (=> b!267138 m!398145))

(assert (=> b!267005 d!90142))

(declare-fun d!90144 () Bool)

(declare-fun res!223067 () Bool)

(declare-fun e!186998 () Bool)

(assert (=> d!90144 (=> (not res!223067) (not e!186998))))

(assert (=> d!90144 (= res!223067 (= (size!6486 (buf!6954 w2!580)) (size!6486 (buf!6954 w2!580))))))

(assert (=> d!90144 (= (isPrefixOf!0 w2!580 w2!580) e!186998)))

(declare-fun b!267139 () Bool)

(declare-fun res!223066 () Bool)

(assert (=> b!267139 (=> (not res!223066) (not e!186998))))

(assert (=> b!267139 (= res!223066 (bvsle (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))

(declare-fun b!267140 () Bool)

(declare-fun e!186999 () Bool)

(assert (=> b!267140 (= e!186998 e!186999)))

(declare-fun res!223065 () Bool)

(assert (=> b!267140 (=> res!223065 e!186999)))

(assert (=> b!267140 (= res!223065 (= (size!6486 (buf!6954 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!267141 () Bool)

(assert (=> b!267141 (= e!186999 (arrayBitRangesEq!0 (buf!6954 w2!580) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))

(assert (= (and d!90144 res!223067) b!267139))

(assert (= (and b!267139 res!223066) b!267140))

(assert (= (and b!267140 (not res!223065)) b!267141))

(assert (=> b!267139 m!397981))

(assert (=> b!267139 m!397981))

(assert (=> b!267141 m!397981))

(assert (=> b!267141 m!397981))

(declare-fun m!398159 () Bool)

(assert (=> b!267141 m!398159))

(assert (=> b!267005 d!90144))

(declare-fun d!90150 () Bool)

(declare-fun e!187002 () Bool)

(assert (=> d!90150 e!187002))

(declare-fun res!223072 () Bool)

(assert (=> d!90150 (=> (not res!223072) (not e!187002))))

(declare-fun lt!407796 () (_ BitVec 64))

(declare-fun lt!407797 () (_ BitVec 64))

(declare-fun lt!407798 () (_ BitVec 64))

(assert (=> d!90150 (= res!223072 (= lt!407798 (bvsub lt!407796 lt!407797)))))

(assert (=> d!90150 (or (= (bvand lt!407796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407797 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407796 lt!407797) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90150 (= lt!407797 (remainingBits!0 ((_ sign_extend 32) (size!6486 (buf!6954 w2!580))) ((_ sign_extend 32) (currentByte!12851 w2!580)) ((_ sign_extend 32) (currentBit!12846 w2!580))))))

(declare-fun lt!407793 () (_ BitVec 64))

(declare-fun lt!407794 () (_ BitVec 64))

(assert (=> d!90150 (= lt!407796 (bvmul lt!407793 lt!407794))))

(assert (=> d!90150 (or (= lt!407793 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407794 (bvsdiv (bvmul lt!407793 lt!407794) lt!407793)))))

(assert (=> d!90150 (= lt!407794 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90150 (= lt!407793 ((_ sign_extend 32) (size!6486 (buf!6954 w2!580))))))

(assert (=> d!90150 (= lt!407798 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12851 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12846 w2!580))))))

(assert (=> d!90150 (invariant!0 (currentBit!12846 w2!580) (currentByte!12851 w2!580) (size!6486 (buf!6954 w2!580)))))

(assert (=> d!90150 (= (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)) lt!407798)))

(declare-fun b!267145 () Bool)

(declare-fun res!223071 () Bool)

(assert (=> b!267145 (=> (not res!223071) (not e!187002))))

(assert (=> b!267145 (= res!223071 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407798))))

(declare-fun b!267146 () Bool)

(declare-fun lt!407795 () (_ BitVec 64))

(assert (=> b!267146 (= e!187002 (bvsle lt!407798 (bvmul lt!407795 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267146 (or (= lt!407795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407795)))))

(assert (=> b!267146 (= lt!407795 ((_ sign_extend 32) (size!6486 (buf!6954 w2!580))))))

(assert (= (and d!90150 res!223072) b!267145))

(assert (= (and b!267145 res!223071) b!267146))

(declare-fun m!398163 () Bool)

(assert (=> d!90150 m!398163))

(declare-fun m!398165 () Bool)

(assert (=> d!90150 m!398165))

(assert (=> b!267000 d!90150))

(declare-fun d!90154 () Bool)

(assert (=> d!90154 (isPrefixOf!0 lt!407659 w2!580)))

(declare-fun lt!407806 () Unit!18956)

(declare-fun choose!30 (BitStream!11786 BitStream!11786 BitStream!11786) Unit!18956)

(assert (=> d!90154 (= lt!407806 (choose!30 lt!407659 w1!584 w2!580))))

(assert (=> d!90154 (isPrefixOf!0 lt!407659 w1!584)))

(assert (=> d!90154 (= (lemmaIsPrefixTransitive!0 lt!407659 w1!584 w2!580) lt!407806)))

(declare-fun bs!22897 () Bool)

(assert (= bs!22897 d!90154))

(assert (=> bs!22897 m!397983))

(declare-fun m!398173 () Bool)

(assert (=> bs!22897 m!398173))

(assert (=> bs!22897 m!397993))

(assert (=> b!267000 d!90154))

(assert (=> b!267000 d!90110))

(declare-fun d!90162 () Bool)

(declare-fun e!187019 () Bool)

(assert (=> d!90162 e!187019))

(declare-fun res!223092 () Bool)

(assert (=> d!90162 (=> (not res!223092) (not e!187019))))

(declare-fun lt!407815 () (_ BitVec 64))

(declare-fun lt!407814 () BitStream!11786)

(assert (=> d!90162 (= res!223092 (= (bvadd lt!407815 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))) (bitIndex!0 (size!6486 (buf!6954 lt!407814)) (currentByte!12851 lt!407814) (currentBit!12846 lt!407814))))))

(assert (=> d!90162 (or (not (= (bvand lt!407815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!407815 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!407815 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90162 (= lt!407815 (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))))

(declare-datatypes ((tuple2!22404 0))(
  ( (tuple2!22405 (_1!12183 Unit!18956) (_2!12183 BitStream!11786)) )
))
(declare-fun moveBitIndex!0 (BitStream!11786 (_ BitVec 64)) tuple2!22404)

(assert (=> d!90162 (= lt!407814 (_2!12183 (moveBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!11786 (_ BitVec 64)) Bool)

(assert (=> d!90162 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))

(assert (=> d!90162 (= (withMovedBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))) lt!407814)))

(declare-fun b!267168 () Bool)

(assert (=> b!267168 (= e!187019 (= (size!6486 (buf!6954 w2!580)) (size!6486 (buf!6954 lt!407814))))))

(assert (= (and d!90162 res!223092) b!267168))

(declare-fun m!398195 () Bool)

(assert (=> d!90162 m!398195))

(assert (=> d!90162 m!397981))

(declare-fun m!398197 () Bool)

(assert (=> d!90162 m!398197))

(declare-fun m!398199 () Bool)

(assert (=> d!90162 m!398199))

(assert (=> b!267000 d!90162))

(declare-fun d!90180 () Bool)

(assert (=> d!90180 (isPrefixOf!0 lt!407659 w2!580)))

(declare-fun lt!407816 () Unit!18956)

(assert (=> d!90180 (= lt!407816 (choose!30 lt!407659 w2!580 w2!580))))

(assert (=> d!90180 (isPrefixOf!0 lt!407659 w2!580)))

(assert (=> d!90180 (= (lemmaIsPrefixTransitive!0 lt!407659 w2!580 w2!580) lt!407816)))

(declare-fun bs!22900 () Bool)

(assert (= bs!22900 d!90180))

(assert (=> bs!22900 m!397983))

(declare-fun m!398201 () Bool)

(assert (=> bs!22900 m!398201))

(assert (=> bs!22900 m!397983))

(assert (=> b!267000 d!90180))

(declare-fun d!90182 () Bool)

(declare-fun res!223095 () Bool)

(declare-fun e!187020 () Bool)

(assert (=> d!90182 (=> (not res!223095) (not e!187020))))

(assert (=> d!90182 (= res!223095 (= (size!6486 (buf!6954 lt!407659)) (size!6486 (buf!6954 w2!580))))))

(assert (=> d!90182 (= (isPrefixOf!0 lt!407659 w2!580) e!187020)))

(declare-fun b!267169 () Bool)

(declare-fun res!223094 () Bool)

(assert (=> b!267169 (=> (not res!223094) (not e!187020))))

(assert (=> b!267169 (= res!223094 (bvsle (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))

(declare-fun b!267170 () Bool)

(declare-fun e!187021 () Bool)

(assert (=> b!267170 (= e!187020 e!187021)))

(declare-fun res!223093 () Bool)

(assert (=> b!267170 (=> res!223093 e!187021)))

(assert (=> b!267170 (= res!223093 (= (size!6486 (buf!6954 lt!407659)) #b00000000000000000000000000000000))))

(declare-fun b!267171 () Bool)

(assert (=> b!267171 (= e!187021 (arrayBitRangesEq!0 (buf!6954 lt!407659) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(assert (= (and d!90182 res!223095) b!267169))

(assert (= (and b!267169 res!223094) b!267170))

(assert (= (and b!267170 (not res!223093)) b!267171))

(assert (=> b!267169 m!398135))

(assert (=> b!267169 m!397981))

(assert (=> b!267171 m!398135))

(assert (=> b!267171 m!398135))

(declare-fun m!398203 () Bool)

(assert (=> b!267171 m!398203))

(assert (=> b!267000 d!90182))

(declare-fun d!90184 () Bool)

(assert (=> d!90184 (= (array_inv!6210 (buf!6954 w2!580)) (bvsge (size!6486 (buf!6954 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!267002 d!90184))

(declare-fun d!90186 () Bool)

(assert (=> d!90186 (= (array_inv!6210 (buf!6954 w1!584)) (bvsge (size!6486 (buf!6954 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!267001 d!90186))

(declare-fun d!90188 () Bool)

(declare-fun res!223098 () Bool)

(declare-fun e!187022 () Bool)

(assert (=> d!90188 (=> (not res!223098) (not e!187022))))

(assert (=> d!90188 (= res!223098 (= (size!6486 (buf!6954 w1!584)) (size!6486 (buf!6954 w2!580))))))

(assert (=> d!90188 (= (isPrefixOf!0 w1!584 w2!580) e!187022)))

(declare-fun b!267172 () Bool)

(declare-fun res!223097 () Bool)

(assert (=> b!267172 (=> (not res!223097) (not e!187022))))

(assert (=> b!267172 (= res!223097 (bvsle (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))

(declare-fun b!267173 () Bool)

(declare-fun e!187023 () Bool)

(assert (=> b!267173 (= e!187022 e!187023)))

(declare-fun res!223096 () Bool)

(assert (=> b!267173 (=> res!223096 e!187023)))

(assert (=> b!267173 (= res!223096 (= (size!6486 (buf!6954 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!267174 () Bool)

(assert (=> b!267174 (= e!187023 (arrayBitRangesEq!0 (buf!6954 w1!584) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(assert (= (and d!90188 res!223098) b!267172))

(assert (= (and b!267172 res!223097) b!267173))

(assert (= (and b!267173 (not res!223096)) b!267174))

(assert (=> b!267172 m!397959))

(assert (=> b!267172 m!397981))

(assert (=> b!267174 m!397959))

(assert (=> b!267174 m!397959))

(assert (=> b!267174 m!397961))

(assert (=> start!58108 d!90188))

(declare-fun d!90190 () Bool)

(assert (=> d!90190 (= (inv!12 w1!584) (invariant!0 (currentBit!12846 w1!584) (currentByte!12851 w1!584) (size!6486 (buf!6954 w1!584))))))

(declare-fun bs!22901 () Bool)

(assert (= bs!22901 d!90190))

(assert (=> bs!22901 m!398071))

(assert (=> start!58108 d!90190))

(declare-fun d!90192 () Bool)

(assert (=> d!90192 (= (inv!12 w2!580) (invariant!0 (currentBit!12846 w2!580) (currentByte!12851 w2!580) (size!6486 (buf!6954 w2!580))))))

(declare-fun bs!22902 () Bool)

(assert (= bs!22902 d!90192))

(assert (=> bs!22902 m!398165))

(assert (=> start!58108 d!90192))

(declare-fun d!90194 () Bool)

(declare-fun res!223101 () Bool)

(declare-fun e!187024 () Bool)

(assert (=> d!90194 (=> (not res!223101) (not e!187024))))

(assert (=> d!90194 (= res!223101 (= (size!6486 (buf!6954 lt!407659)) (size!6486 (buf!6954 w1!584))))))

(assert (=> d!90194 (= (isPrefixOf!0 lt!407659 w1!584) e!187024)))

(declare-fun b!267175 () Bool)

(declare-fun res!223100 () Bool)

(assert (=> b!267175 (=> (not res!223100) (not e!187024))))

(assert (=> b!267175 (= res!223100 (bvsle (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659)) (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(declare-fun b!267176 () Bool)

(declare-fun e!187025 () Bool)

(assert (=> b!267176 (= e!187024 e!187025)))

(declare-fun res!223099 () Bool)

(assert (=> b!267176 (=> res!223099 e!187025)))

(assert (=> b!267176 (= res!223099 (= (size!6486 (buf!6954 lt!407659)) #b00000000000000000000000000000000))))

(declare-fun b!267177 () Bool)

(assert (=> b!267177 (= e!187025 (arrayBitRangesEq!0 (buf!6954 lt!407659) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(assert (= (and d!90194 res!223101) b!267175))

(assert (= (and b!267175 res!223100) b!267176))

(assert (= (and b!267176 (not res!223099)) b!267177))

(assert (=> b!267175 m!398135))

(assert (=> b!267175 m!397959))

(assert (=> b!267177 m!398135))

(assert (=> b!267177 m!398135))

(declare-fun m!398205 () Bool)

(assert (=> b!267177 m!398205))

(assert (=> b!267008 d!90194))

(push 1)

(assert (not d!90162))

(assert (not b!267141))

(assert (not bm!4182))

(assert (not d!90130))

(assert (not b!267136))

(assert (not d!90110))

(assert (not b!267059))

(assert (not b!267174))

(assert (not b!267126))

(assert (not b!267055))

(assert (not d!90128))

(assert (not b!267171))

(assert (not d!90132))

(assert (not d!90150))

(assert (not d!90154))

(assert (not b!267128))

(assert (not d!90190))

(assert (not b!267086))

(assert (not b!267094))

(assert (not b!267138))

(assert (not d!90192))

(assert (not b!267177))

(assert (not b!267093))

(assert (not d!90180))

(assert (not b!267060))

(assert (not b!267139))

(assert (not b!267172))

(assert (not d!90122))

(assert (not b!267087))

(assert (not b!267082))

(assert (not b!267089))

(assert (not bm!4181))

(assert (not b!267169))

(assert (not bm!4183))

(assert (not b!267175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90336 () Bool)

(assert (=> d!90336 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))) (tuple4!397 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!267094 d!90336))

(declare-fun d!90338 () Bool)

(assert (=> d!90338 (= (byteRangesEq!0 (ite c!12316 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407761)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407761))) (ite c!12316 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407761)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407761))) (ite c!12316 lt!407760 #b00000000000000000000000000000000) lt!407762) (or (= (ite c!12316 lt!407760 #b00000000000000000000000000000000) lt!407762) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12316 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407761)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407761)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407762))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12316 lt!407760 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12316 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407761)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407761)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407762))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12316 lt!407760 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!22931 () Bool)

(assert (= bs!22931 d!90338))

(declare-fun m!398475 () Bool)

(assert (=> bs!22931 m!398475))

(declare-fun m!398477 () Bool)

(assert (=> bs!22931 m!398477))

(assert (=> bm!4182 d!90338))

(declare-fun d!90340 () Bool)

(assert (=> d!90340 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660) (tuple4!397 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!407660 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!407660 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!267087 d!90340))

(assert (=> b!267060 d!90336))

(declare-fun d!90342 () Bool)

(assert (=> d!90342 (= (remainingBits!0 ((_ sign_extend 32) (size!6486 (buf!6954 w1!584))) ((_ sign_extend 32) (currentByte!12851 w1!584)) ((_ sign_extend 32) (currentBit!12846 w1!584))) (bvsub (bvmul ((_ sign_extend 32) (size!6486 (buf!6954 w1!584))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12851 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12846 w1!584)))))))

(assert (=> d!90110 d!90342))

(declare-fun d!90344 () Bool)

(assert (=> d!90344 (= (invariant!0 (currentBit!12846 w1!584) (currentByte!12851 w1!584) (size!6486 (buf!6954 w1!584))) (and (bvsge (currentBit!12846 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12846 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12851 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12851 w1!584) (size!6486 (buf!6954 w1!584))) (and (= (currentBit!12846 w1!584) #b00000000000000000000000000000000) (= (currentByte!12851 w1!584) (size!6486 (buf!6954 w1!584)))))))))

(assert (=> d!90110 d!90344))

(declare-fun d!90346 () Bool)

(declare-fun res!223233 () Bool)

(declare-fun e!187166 () Bool)

(assert (=> d!90346 (=> res!223233 e!187166)))

(assert (=> d!90346 (= res!223233 (= (_1!12178 lt!407704) (_2!12178 lt!407704)))))

(assert (=> d!90346 (= (arrayRangesEq!1034 (buf!6954 w2!580) (buf!6954 w1!584) (_1!12178 lt!407704) (_2!12178 lt!407704)) e!187166)))

(declare-fun b!267341 () Bool)

(declare-fun e!187167 () Bool)

(assert (=> b!267341 (= e!187166 e!187167)))

(declare-fun res!223234 () Bool)

(assert (=> b!267341 (=> (not res!223234) (not e!187167))))

(assert (=> b!267341 (= res!223234 (= (select (arr!7473 (buf!6954 w2!580)) (_1!12178 lt!407704)) (select (arr!7473 (buf!6954 w1!584)) (_1!12178 lt!407704))))))

(declare-fun b!267342 () Bool)

(assert (=> b!267342 (= e!187167 (arrayRangesEq!1034 (buf!6954 w2!580) (buf!6954 w1!584) (bvadd (_1!12178 lt!407704) #b00000000000000000000000000000001) (_2!12178 lt!407704)))))

(assert (= (and d!90346 (not res!223233)) b!267341))

(assert (= (and b!267341 res!223234) b!267342))

(declare-fun m!398479 () Bool)

(assert (=> b!267341 m!398479))

(declare-fun m!398481 () Bool)

(assert (=> b!267341 m!398481))

(declare-fun m!398483 () Bool)

(assert (=> b!267342 m!398483))

(assert (=> b!267059 d!90346))

(declare-fun d!90348 () Bool)

(declare-fun e!187168 () Bool)

(assert (=> d!90348 e!187168))

(declare-fun res!223236 () Bool)

(assert (=> d!90348 (=> (not res!223236) (not e!187168))))

(declare-fun lt!407933 () (_ BitVec 64))

(declare-fun lt!407931 () (_ BitVec 64))

(declare-fun lt!407932 () (_ BitVec 64))

(assert (=> d!90348 (= res!223236 (= lt!407933 (bvsub lt!407931 lt!407932)))))

(assert (=> d!90348 (or (= (bvand lt!407931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407931 lt!407932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90348 (= lt!407932 (remainingBits!0 ((_ sign_extend 32) (size!6486 (buf!6954 lt!407659))) ((_ sign_extend 32) (currentByte!12851 lt!407659)) ((_ sign_extend 32) (currentBit!12846 lt!407659))))))

(declare-fun lt!407928 () (_ BitVec 64))

(declare-fun lt!407929 () (_ BitVec 64))

(assert (=> d!90348 (= lt!407931 (bvmul lt!407928 lt!407929))))

(assert (=> d!90348 (or (= lt!407928 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407929 (bvsdiv (bvmul lt!407928 lt!407929) lt!407928)))))

(assert (=> d!90348 (= lt!407929 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90348 (= lt!407928 ((_ sign_extend 32) (size!6486 (buf!6954 lt!407659))))))

(assert (=> d!90348 (= lt!407933 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12851 lt!407659)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12846 lt!407659))))))

(assert (=> d!90348 (invariant!0 (currentBit!12846 lt!407659) (currentByte!12851 lt!407659) (size!6486 (buf!6954 lt!407659)))))

(assert (=> d!90348 (= (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659)) lt!407933)))

(declare-fun b!267343 () Bool)

(declare-fun res!223235 () Bool)

(assert (=> b!267343 (=> (not res!223235) (not e!187168))))

(assert (=> b!267343 (= res!223235 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407933))))

(declare-fun b!267344 () Bool)

(declare-fun lt!407930 () (_ BitVec 64))

(assert (=> b!267344 (= e!187168 (bvsle lt!407933 (bvmul lt!407930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267344 (or (= lt!407930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407930)))))

(assert (=> b!267344 (= lt!407930 ((_ sign_extend 32) (size!6486 (buf!6954 lt!407659))))))

(assert (= (and d!90348 res!223236) b!267343))

(assert (= (and b!267343 res!223235) b!267344))

(declare-fun m!398485 () Bool)

(assert (=> d!90348 m!398485))

(declare-fun m!398487 () Bool)

(assert (=> d!90348 m!398487))

(assert (=> b!267126 d!90348))

(assert (=> d!90190 d!90344))

(declare-fun d!90350 () Bool)

(declare-fun res!223237 () Bool)

(declare-fun e!187169 () Bool)

(assert (=> d!90350 (=> res!223237 e!187169)))

(assert (=> d!90350 (= res!223237 (= (_1!12178 lt!407764) (_2!12178 lt!407764)))))

(assert (=> d!90350 (= (arrayRangesEq!1034 (buf!6954 w1!584) (buf!6954 w2!580) (_1!12178 lt!407764) (_2!12178 lt!407764)) e!187169)))

(declare-fun b!267345 () Bool)

(declare-fun e!187170 () Bool)

(assert (=> b!267345 (= e!187169 e!187170)))

(declare-fun res!223238 () Bool)

(assert (=> b!267345 (=> (not res!223238) (not e!187170))))

(assert (=> b!267345 (= res!223238 (= (select (arr!7473 (buf!6954 w1!584)) (_1!12178 lt!407764)) (select (arr!7473 (buf!6954 w2!580)) (_1!12178 lt!407764))))))

(declare-fun b!267346 () Bool)

(assert (=> b!267346 (= e!187170 (arrayRangesEq!1034 (buf!6954 w1!584) (buf!6954 w2!580) (bvadd (_1!12178 lt!407764) #b00000000000000000000000000000001) (_2!12178 lt!407764)))))

(assert (= (and d!90350 (not res!223237)) b!267345))

(assert (= (and b!267345 res!223238) b!267346))

(declare-fun m!398489 () Bool)

(assert (=> b!267345 m!398489))

(declare-fun m!398491 () Bool)

(assert (=> b!267345 m!398491))

(declare-fun m!398493 () Bool)

(assert (=> b!267346 m!398493))

(assert (=> b!267093 d!90350))

(declare-fun d!90352 () Bool)

(assert (=> d!90352 (= (byteRangesEq!0 (ite c!12315 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407704)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407704))) (ite c!12315 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407704)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407704))) (ite c!12315 lt!407703 #b00000000000000000000000000000000) lt!407705) (or (= (ite c!12315 lt!407703 #b00000000000000000000000000000000) lt!407705) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12315 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407704)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407704)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407705))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12315 lt!407703 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12315 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407704)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407704)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407705))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12315 lt!407703 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!22932 () Bool)

(assert (= bs!22932 d!90352))

(declare-fun m!398495 () Bool)

(assert (=> bs!22932 m!398495))

(declare-fun m!398497 () Bool)

(assert (=> bs!22932 m!398497))

(assert (=> bm!4181 d!90352))

(declare-fun d!90354 () Bool)

(declare-fun res!223239 () Bool)

(declare-fun e!187171 () Bool)

(assert (=> d!90354 (=> res!223239 e!187171)))

(assert (=> d!90354 (= res!223239 (= (_1!12178 lt!407761) (_2!12178 lt!407761)))))

(assert (=> d!90354 (= (arrayRangesEq!1034 (buf!6954 w2!580) (buf!6954 w1!584) (_1!12178 lt!407761) (_2!12178 lt!407761)) e!187171)))

(declare-fun b!267347 () Bool)

(declare-fun e!187172 () Bool)

(assert (=> b!267347 (= e!187171 e!187172)))

(declare-fun res!223240 () Bool)

(assert (=> b!267347 (=> (not res!223240) (not e!187172))))

(assert (=> b!267347 (= res!223240 (= (select (arr!7473 (buf!6954 w2!580)) (_1!12178 lt!407761)) (select (arr!7473 (buf!6954 w1!584)) (_1!12178 lt!407761))))))

(declare-fun b!267348 () Bool)

(assert (=> b!267348 (= e!187172 (arrayRangesEq!1034 (buf!6954 w2!580) (buf!6954 w1!584) (bvadd (_1!12178 lt!407761) #b00000000000000000000000000000001) (_2!12178 lt!407761)))))

(assert (= (and d!90354 (not res!223239)) b!267347))

(assert (= (and b!267347 res!223240) b!267348))

(declare-fun m!398499 () Bool)

(assert (=> b!267347 m!398499))

(declare-fun m!398501 () Bool)

(assert (=> b!267347 m!398501))

(declare-fun m!398503 () Bool)

(assert (=> b!267348 m!398503))

(assert (=> b!267086 d!90354))

(declare-fun b!267349 () Bool)

(declare-fun e!187178 () Bool)

(declare-fun e!187175 () Bool)

(assert (=> b!267349 (= e!187178 e!187175)))

(declare-fun lt!407935 () tuple4!396)

(declare-fun lt!407934 () (_ BitVec 32))

(declare-fun res!223241 () Bool)

(assert (=> b!267349 (= res!223241 (byteRangesEq!0 (select (arr!7473 (buf!6954 lt!407659)) (_3!978 lt!407935)) (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407935)) lt!407934 #b00000000000000000000000000001000))))

(assert (=> b!267349 (=> (not res!223241) (not e!187175))))

(declare-fun b!267350 () Bool)

(declare-fun e!187177 () Bool)

(declare-fun call!4207 () Bool)

(assert (=> b!267350 (= e!187177 call!4207)))

(declare-fun b!267351 () Bool)

(assert (=> b!267351 (= e!187178 call!4207)))

(declare-fun b!267352 () Bool)

(declare-fun res!223243 () Bool)

(declare-fun lt!407936 () (_ BitVec 32))

(assert (=> b!267352 (= res!223243 (= lt!407936 #b00000000000000000000000000000000))))

(assert (=> b!267352 (=> res!223243 e!187177)))

(assert (=> b!267352 (= e!187175 e!187177)))

(declare-fun e!187173 () Bool)

(declare-fun b!267353 () Bool)

(assert (=> b!267353 (= e!187173 (arrayRangesEq!1034 (buf!6954 lt!407659) (buf!6954 w2!580) (_1!12178 lt!407935) (_2!12178 lt!407935)))))

(declare-fun bm!4204 () Bool)

(declare-fun c!12338 () Bool)

(assert (=> bm!4204 (= call!4207 (byteRangesEq!0 (ite c!12338 (select (arr!7473 (buf!6954 lt!407659)) (_3!978 lt!407935)) (select (arr!7473 (buf!6954 lt!407659)) (_4!198 lt!407935))) (ite c!12338 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407935)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407935))) (ite c!12338 lt!407934 #b00000000000000000000000000000000) lt!407936))))

(declare-fun b!267354 () Bool)

(declare-fun e!187174 () Bool)

(declare-fun e!187176 () Bool)

(assert (=> b!267354 (= e!187174 e!187176)))

(declare-fun res!223244 () Bool)

(assert (=> b!267354 (=> (not res!223244) (not e!187176))))

(assert (=> b!267354 (= res!223244 e!187173)))

(declare-fun res!223242 () Bool)

(assert (=> b!267354 (=> res!223242 e!187173)))

(assert (=> b!267354 (= res!223242 (bvsge (_1!12178 lt!407935) (_2!12178 lt!407935)))))

(assert (=> b!267354 (= lt!407936 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267354 (= lt!407934 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267354 (= lt!407935 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(declare-fun d!90356 () Bool)

(declare-fun res!223245 () Bool)

(assert (=> d!90356 (=> res!223245 e!187174)))

(assert (=> d!90356 (= res!223245 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(assert (=> d!90356 (= (arrayBitRangesEq!0 (buf!6954 lt!407659) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))) e!187174)))

(declare-fun b!267355 () Bool)

(assert (=> b!267355 (= e!187176 e!187178)))

(assert (=> b!267355 (= c!12338 (= (_3!978 lt!407935) (_4!198 lt!407935)))))

(assert (= (and d!90356 (not res!223245)) b!267354))

(assert (= (and b!267354 (not res!223242)) b!267353))

(assert (= (and b!267354 res!223244) b!267355))

(assert (= (and b!267355 c!12338) b!267351))

(assert (= (and b!267355 (not c!12338)) b!267349))

(assert (= (and b!267349 res!223241) b!267352))

(assert (= (and b!267352 (not res!223243)) b!267350))

(assert (= (or b!267351 b!267350) bm!4204))

(declare-fun m!398505 () Bool)

(assert (=> b!267349 m!398505))

(declare-fun m!398507 () Bool)

(assert (=> b!267349 m!398507))

(assert (=> b!267349 m!398505))

(assert (=> b!267349 m!398507))

(declare-fun m!398509 () Bool)

(assert (=> b!267349 m!398509))

(declare-fun m!398511 () Bool)

(assert (=> b!267353 m!398511))

(assert (=> bm!4204 m!398507))

(declare-fun m!398513 () Bool)

(assert (=> bm!4204 m!398513))

(declare-fun m!398515 () Bool)

(assert (=> bm!4204 m!398515))

(assert (=> bm!4204 m!398505))

(declare-fun m!398517 () Bool)

(assert (=> bm!4204 m!398517))

(assert (=> b!267354 m!398135))

(declare-fun m!398519 () Bool)

(assert (=> b!267354 m!398519))

(assert (=> b!267171 d!90356))

(assert (=> b!267171 d!90348))

(declare-fun b!267356 () Bool)

(declare-fun e!187184 () Bool)

(declare-fun e!187181 () Bool)

(assert (=> b!267356 (= e!187184 e!187181)))

(declare-fun lt!407938 () tuple4!396)

(declare-fun res!223246 () Bool)

(declare-fun lt!407937 () (_ BitVec 32))

(assert (=> b!267356 (= res!223246 (byteRangesEq!0 (select (arr!7473 (buf!6954 lt!407659)) (_3!978 lt!407938)) (select (arr!7473 (buf!6954 lt!407659)) (_3!978 lt!407938)) lt!407937 #b00000000000000000000000000001000))))

(assert (=> b!267356 (=> (not res!223246) (not e!187181))))

(declare-fun b!267357 () Bool)

(declare-fun e!187183 () Bool)

(declare-fun call!4208 () Bool)

(assert (=> b!267357 (= e!187183 call!4208)))

(declare-fun b!267358 () Bool)

(assert (=> b!267358 (= e!187184 call!4208)))

(declare-fun b!267359 () Bool)

(declare-fun res!223248 () Bool)

(declare-fun lt!407939 () (_ BitVec 32))

(assert (=> b!267359 (= res!223248 (= lt!407939 #b00000000000000000000000000000000))))

(assert (=> b!267359 (=> res!223248 e!187183)))

(assert (=> b!267359 (= e!187181 e!187183)))

(declare-fun b!267360 () Bool)

(declare-fun e!187179 () Bool)

(assert (=> b!267360 (= e!187179 (arrayRangesEq!1034 (buf!6954 lt!407659) (buf!6954 lt!407659) (_1!12178 lt!407938) (_2!12178 lt!407938)))))

(declare-fun c!12339 () Bool)

(declare-fun bm!4205 () Bool)

(assert (=> bm!4205 (= call!4208 (byteRangesEq!0 (ite c!12339 (select (arr!7473 (buf!6954 lt!407659)) (_3!978 lt!407938)) (select (arr!7473 (buf!6954 lt!407659)) (_4!198 lt!407938))) (ite c!12339 (select (arr!7473 (buf!6954 lt!407659)) (_3!978 lt!407938)) (select (arr!7473 (buf!6954 lt!407659)) (_4!198 lt!407938))) (ite c!12339 lt!407937 #b00000000000000000000000000000000) lt!407939))))

(declare-fun b!267361 () Bool)

(declare-fun e!187180 () Bool)

(declare-fun e!187182 () Bool)

(assert (=> b!267361 (= e!187180 e!187182)))

(declare-fun res!223249 () Bool)

(assert (=> b!267361 (=> (not res!223249) (not e!187182))))

(assert (=> b!267361 (= res!223249 e!187179)))

(declare-fun res!223247 () Bool)

(assert (=> b!267361 (=> res!223247 e!187179)))

(assert (=> b!267361 (= res!223247 (bvsge (_1!12178 lt!407938) (_2!12178 lt!407938)))))

(assert (=> b!267361 (= lt!407939 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267361 (= lt!407937 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267361 (= lt!407938 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(declare-fun d!90358 () Bool)

(declare-fun res!223250 () Bool)

(assert (=> d!90358 (=> res!223250 e!187180)))

(assert (=> d!90358 (= res!223250 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(assert (=> d!90358 (= (arrayBitRangesEq!0 (buf!6954 lt!407659) (buf!6954 lt!407659) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))) e!187180)))

(declare-fun b!267362 () Bool)

(assert (=> b!267362 (= e!187182 e!187184)))

(assert (=> b!267362 (= c!12339 (= (_3!978 lt!407938) (_4!198 lt!407938)))))

(assert (= (and d!90358 (not res!223250)) b!267361))

(assert (= (and b!267361 (not res!223247)) b!267360))

(assert (= (and b!267361 res!223249) b!267362))

(assert (= (and b!267362 c!12339) b!267358))

(assert (= (and b!267362 (not c!12339)) b!267356))

(assert (= (and b!267356 res!223246) b!267359))

(assert (= (and b!267359 (not res!223248)) b!267357))

(assert (= (or b!267358 b!267357) bm!4205))

(declare-fun m!398521 () Bool)

(assert (=> b!267356 m!398521))

(assert (=> b!267356 m!398521))

(assert (=> b!267356 m!398521))

(assert (=> b!267356 m!398521))

(declare-fun m!398523 () Bool)

(assert (=> b!267356 m!398523))

(declare-fun m!398525 () Bool)

(assert (=> b!267360 m!398525))

(assert (=> bm!4205 m!398521))

(declare-fun m!398527 () Bool)

(assert (=> bm!4205 m!398527))

(declare-fun m!398529 () Bool)

(assert (=> bm!4205 m!398529))

(assert (=> bm!4205 m!398521))

(assert (=> bm!4205 m!398529))

(assert (=> b!267361 m!398135))

(assert (=> b!267361 m!398519))

(assert (=> b!267128 d!90358))

(assert (=> b!267128 d!90348))

(declare-fun d!90360 () Bool)

(assert (=> d!90360 (= (byteRangesEq!0 (ite c!12317 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407764)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407764))) (ite c!12317 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407764)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407764))) (ite c!12317 lt!407763 #b00000000000000000000000000000000) lt!407765) (or (= (ite c!12317 lt!407763 #b00000000000000000000000000000000) lt!407765) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12317 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407764)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407764)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407765))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12317 lt!407763 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!12317 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407764)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407764)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407765))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!12317 lt!407763 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!22933 () Bool)

(assert (= bs!22933 d!90360))

(declare-fun m!398531 () Bool)

(assert (=> bs!22933 m!398531))

(declare-fun m!398533 () Bool)

(assert (=> bs!22933 m!398533))

(assert (=> bm!4183 d!90360))

(declare-fun d!90362 () Bool)

(assert (=> d!90362 (= (byteRangesEq!0 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407761)) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407761)) lt!407760 #b00000000000000000000000000001000) (or (= lt!407760 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407761))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407760)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407761))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407760)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22934 () Bool)

(assert (= bs!22934 d!90362))

(declare-fun m!398535 () Bool)

(assert (=> bs!22934 m!398535))

(declare-fun m!398537 () Bool)

(assert (=> bs!22934 m!398537))

(assert (=> b!267082 d!90362))

(assert (=> b!267174 d!90126))

(assert (=> b!267174 d!90110))

(assert (=> d!90128 d!90144))

(declare-fun d!90364 () Bool)

(assert (=> d!90364 (isPrefixOf!0 w2!580 w2!580)))

(assert (=> d!90364 true))

(declare-fun _$14!341 () Unit!18956)

(assert (=> d!90364 (= (choose!11 w2!580) _$14!341)))

(declare-fun bs!22936 () Bool)

(assert (= bs!22936 d!90364))

(assert (=> bs!22936 m!397971))

(assert (=> d!90128 d!90364))

(assert (=> b!267169 d!90348))

(assert (=> b!267169 d!90150))

(assert (=> d!90154 d!90182))

(declare-fun d!90366 () Bool)

(assert (=> d!90366 (isPrefixOf!0 lt!407659 w2!580)))

(assert (=> d!90366 true))

(declare-fun _$15!350 () Unit!18956)

(assert (=> d!90366 (= (choose!30 lt!407659 w1!584 w2!580) _$15!350)))

(declare-fun bs!22937 () Bool)

(assert (= bs!22937 d!90366))

(assert (=> bs!22937 m!397983))

(assert (=> d!90154 d!90366))

(assert (=> d!90154 d!90194))

(assert (=> b!267175 d!90348))

(assert (=> b!267175 d!90110))

(declare-fun d!90368 () Bool)

(assert (=> d!90368 (= (remainingBits!0 ((_ sign_extend 32) (size!6486 (buf!6954 w2!580))) ((_ sign_extend 32) (currentByte!12851 w2!580)) ((_ sign_extend 32) (currentBit!12846 w2!580))) (bvsub (bvmul ((_ sign_extend 32) (size!6486 (buf!6954 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12851 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12846 w2!580)))))))

(assert (=> d!90150 d!90368))

(declare-fun d!90370 () Bool)

(assert (=> d!90370 (= (invariant!0 (currentBit!12846 w2!580) (currentByte!12851 w2!580) (size!6486 (buf!6954 w2!580))) (and (bvsge (currentBit!12846 w2!580) #b00000000000000000000000000000000) (bvslt (currentBit!12846 w2!580) #b00000000000000000000000000001000) (bvsge (currentByte!12851 w2!580) #b00000000000000000000000000000000) (or (bvslt (currentByte!12851 w2!580) (size!6486 (buf!6954 w2!580))) (and (= (currentBit!12846 w2!580) #b00000000000000000000000000000000) (= (currentByte!12851 w2!580) (size!6486 (buf!6954 w2!580)))))))))

(assert (=> d!90150 d!90370))

(declare-fun d!90372 () Bool)

(declare-fun e!187185 () Bool)

(assert (=> d!90372 e!187185))

(declare-fun res!223252 () Bool)

(assert (=> d!90372 (=> (not res!223252) (not e!187185))))

(declare-fun lt!407943 () (_ BitVec 64))

(declare-fun lt!407944 () (_ BitVec 64))

(declare-fun lt!407945 () (_ BitVec 64))

(assert (=> d!90372 (= res!223252 (= lt!407945 (bvsub lt!407943 lt!407944)))))

(assert (=> d!90372 (or (= (bvand lt!407943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407943 lt!407944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90372 (= lt!407944 (remainingBits!0 ((_ sign_extend 32) (size!6486 (buf!6954 lt!407814))) ((_ sign_extend 32) (currentByte!12851 lt!407814)) ((_ sign_extend 32) (currentBit!12846 lt!407814))))))

(declare-fun lt!407940 () (_ BitVec 64))

(declare-fun lt!407941 () (_ BitVec 64))

(assert (=> d!90372 (= lt!407943 (bvmul lt!407940 lt!407941))))

(assert (=> d!90372 (or (= lt!407940 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407941 (bvsdiv (bvmul lt!407940 lt!407941) lt!407940)))))

(assert (=> d!90372 (= lt!407941 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90372 (= lt!407940 ((_ sign_extend 32) (size!6486 (buf!6954 lt!407814))))))

(assert (=> d!90372 (= lt!407945 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12851 lt!407814)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12846 lt!407814))))))

(assert (=> d!90372 (invariant!0 (currentBit!12846 lt!407814) (currentByte!12851 lt!407814) (size!6486 (buf!6954 lt!407814)))))

(assert (=> d!90372 (= (bitIndex!0 (size!6486 (buf!6954 lt!407814)) (currentByte!12851 lt!407814) (currentBit!12846 lt!407814)) lt!407945)))

(declare-fun b!267363 () Bool)

(declare-fun res!223251 () Bool)

(assert (=> b!267363 (=> (not res!223251) (not e!187185))))

(assert (=> b!267363 (= res!223251 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407945))))

(declare-fun b!267364 () Bool)

(declare-fun lt!407942 () (_ BitVec 64))

(assert (=> b!267364 (= e!187185 (bvsle lt!407945 (bvmul lt!407942 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267364 (or (= lt!407942 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407942 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407942)))))

(assert (=> b!267364 (= lt!407942 ((_ sign_extend 32) (size!6486 (buf!6954 lt!407814))))))

(assert (= (and d!90372 res!223252) b!267363))

(assert (= (and b!267363 res!223251) b!267364))

(declare-fun m!398539 () Bool)

(assert (=> d!90372 m!398539))

(declare-fun m!398541 () Bool)

(assert (=> d!90372 m!398541))

(assert (=> d!90162 d!90372))

(assert (=> d!90162 d!90150))

(declare-fun d!90374 () Bool)

(declare-fun lt!407961 () (_ BitVec 32))

(assert (=> d!90374 (= lt!407961 ((_ extract 31 0) (bvsrem (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!407960 () (_ BitVec 32))

(assert (=> d!90374 (= lt!407960 ((_ extract 31 0) (bvsdiv (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!187190 () Bool)

(assert (=> d!90374 e!187190))

(declare-fun res!223258 () Bool)

(assert (=> d!90374 (=> (not res!223258) (not e!187190))))

(assert (=> d!90374 (= res!223258 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))))))

(declare-fun Unit!18971 () Unit!18956)

(declare-fun Unit!18972 () Unit!18956)

(declare-fun Unit!18973 () Unit!18956)

(assert (=> d!90374 (= (moveBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))) (ite (bvslt (bvadd (currentBit!12846 w2!580) lt!407961) #b00000000000000000000000000000000) (tuple2!22405 Unit!18971 (BitStream!11787 (buf!6954 w2!580) (bvsub (bvadd (currentByte!12851 w2!580) lt!407960) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!407961 (currentBit!12846 w2!580)))) (ite (bvsge (bvadd (currentBit!12846 w2!580) lt!407961) #b00000000000000000000000000001000) (tuple2!22405 Unit!18972 (BitStream!11787 (buf!6954 w2!580) (bvadd (currentByte!12851 w2!580) lt!407960 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!12846 w2!580) lt!407961) #b00000000000000000000000000001000))) (tuple2!22405 Unit!18973 (BitStream!11787 (buf!6954 w2!580) (bvadd (currentByte!12851 w2!580) lt!407960) (bvadd (currentBit!12846 w2!580) lt!407961))))))))

(declare-fun b!267369 () Bool)

(declare-fun e!187191 () Bool)

(assert (=> b!267369 (= e!187190 e!187191)))

(declare-fun res!223257 () Bool)

(assert (=> b!267369 (=> (not res!223257) (not e!187191))))

(declare-fun lt!407962 () (_ BitVec 64))

(declare-fun lt!407959 () tuple2!22404)

(assert (=> b!267369 (= res!223257 (= (bvadd lt!407962 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))) (bitIndex!0 (size!6486 (buf!6954 (_2!12183 lt!407959))) (currentByte!12851 (_2!12183 lt!407959)) (currentBit!12846 (_2!12183 lt!407959)))))))

(assert (=> b!267369 (or (not (= (bvand lt!407962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!407962 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!407962 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!267369 (= lt!407962 (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))))

(declare-fun lt!407963 () (_ BitVec 32))

(declare-fun lt!407958 () (_ BitVec 32))

(declare-fun Unit!18974 () Unit!18956)

(declare-fun Unit!18975 () Unit!18956)

(declare-fun Unit!18976 () Unit!18956)

(assert (=> b!267369 (= lt!407959 (ite (bvslt (bvadd (currentBit!12846 w2!580) lt!407963) #b00000000000000000000000000000000) (tuple2!22405 Unit!18974 (BitStream!11787 (buf!6954 w2!580) (bvsub (bvadd (currentByte!12851 w2!580) lt!407958) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!407963 (currentBit!12846 w2!580)))) (ite (bvsge (bvadd (currentBit!12846 w2!580) lt!407963) #b00000000000000000000000000001000) (tuple2!22405 Unit!18975 (BitStream!11787 (buf!6954 w2!580) (bvadd (currentByte!12851 w2!580) lt!407958 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!12846 w2!580) lt!407963) #b00000000000000000000000000001000))) (tuple2!22405 Unit!18976 (BitStream!11787 (buf!6954 w2!580) (bvadd (currentByte!12851 w2!580) lt!407958) (bvadd (currentBit!12846 w2!580) lt!407963))))))))

(assert (=> b!267369 (= lt!407963 ((_ extract 31 0) (bvsrem (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267369 (= lt!407958 ((_ extract 31 0) (bvsdiv (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!267370 () Bool)

(assert (=> b!267370 (= e!187191 (and (= (size!6486 (buf!6954 w2!580)) (size!6486 (buf!6954 (_2!12183 lt!407959)))) (= (buf!6954 w2!580) (buf!6954 (_2!12183 lt!407959)))))))

(assert (= (and d!90374 res!223258) b!267369))

(assert (= (and b!267369 res!223257) b!267370))

(assert (=> d!90374 m!398199))

(declare-fun m!398543 () Bool)

(assert (=> b!267369 m!398543))

(assert (=> b!267369 m!397981))

(assert (=> d!90162 d!90374))

(declare-fun d!90378 () Bool)

(declare-fun res!223261 () Bool)

(declare-fun e!187194 () Bool)

(assert (=> d!90378 (=> (not res!223261) (not e!187194))))

(assert (=> d!90378 (= res!223261 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6486 (buf!6954 w2!580)))) (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))) (bvsle (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6486 (buf!6954 w2!580)))))))))

(assert (=> d!90378 (= (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))) e!187194)))

(declare-fun b!267374 () Bool)

(declare-fun lt!407966 () (_ BitVec 64))

(assert (=> b!267374 (= e!187194 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407966) (bvsle lt!407966 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6486 (buf!6954 w2!580)))))))))

(assert (=> b!267374 (= lt!407966 (bvadd (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)) (bvsub (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)))))))

(assert (= (and d!90378 res!223261) b!267374))

(assert (=> b!267374 m!397981))

(assert (=> d!90162 d!90378))

(assert (=> d!90132 d!90142))

(declare-fun d!90380 () Bool)

(assert (=> d!90380 (isPrefixOf!0 w1!584 w1!584)))

(assert (=> d!90380 true))

(declare-fun _$14!342 () Unit!18956)

(assert (=> d!90380 (= (choose!11 w1!584) _$14!342)))

(declare-fun bs!22938 () Bool)

(assert (= bs!22938 d!90380))

(assert (=> bs!22938 m!397969))

(assert (=> d!90132 d!90380))

(declare-fun d!90382 () Bool)

(assert (=> d!90382 (= (byteRangesEq!0 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407704)) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407704)) lt!407703 #b00000000000000000000000000001000) (or (= lt!407703 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407704))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407703)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407704))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407703)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22939 () Bool)

(assert (= bs!22939 d!90382))

(assert (=> bs!22939 m!398535))

(declare-fun m!398545 () Bool)

(assert (=> bs!22939 m!398545))

(assert (=> b!267055 d!90382))

(assert (=> b!267172 d!90110))

(assert (=> b!267172 d!90150))

(declare-fun d!90384 () Bool)

(assert (=> d!90384 (= (byteRangesEq!0 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407764)) (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407764)) lt!407763 #b00000000000000000000000000001000) (or (= lt!407763 #b00000000000000000000000000001000) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407764))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407763)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407764))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000001000))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407763)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22940 () Bool)

(assert (= bs!22940 d!90384))

(assert (=> bs!22940 m!398535))

(declare-fun m!398547 () Bool)

(assert (=> bs!22940 m!398547))

(assert (=> b!267089 d!90384))

(declare-fun b!267375 () Bool)

(declare-fun e!187200 () Bool)

(declare-fun e!187197 () Bool)

(assert (=> b!267375 (= e!187200 e!187197)))

(declare-fun lt!407968 () tuple4!396)

(declare-fun lt!407967 () (_ BitVec 32))

(declare-fun res!223262 () Bool)

(assert (=> b!267375 (= res!223262 (byteRangesEq!0 (select (arr!7473 (buf!6954 lt!407659)) (_3!978 lt!407968)) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407968)) lt!407967 #b00000000000000000000000000001000))))

(assert (=> b!267375 (=> (not res!223262) (not e!187197))))

(declare-fun b!267376 () Bool)

(declare-fun e!187199 () Bool)

(declare-fun call!4209 () Bool)

(assert (=> b!267376 (= e!187199 call!4209)))

(declare-fun b!267377 () Bool)

(assert (=> b!267377 (= e!187200 call!4209)))

(declare-fun b!267378 () Bool)

(declare-fun res!223264 () Bool)

(declare-fun lt!407969 () (_ BitVec 32))

(assert (=> b!267378 (= res!223264 (= lt!407969 #b00000000000000000000000000000000))))

(assert (=> b!267378 (=> res!223264 e!187199)))

(assert (=> b!267378 (= e!187197 e!187199)))

(declare-fun b!267379 () Bool)

(declare-fun e!187195 () Bool)

(assert (=> b!267379 (= e!187195 (arrayRangesEq!1034 (buf!6954 lt!407659) (buf!6954 w1!584) (_1!12178 lt!407968) (_2!12178 lt!407968)))))

(declare-fun bm!4206 () Bool)

(declare-fun c!12340 () Bool)

(assert (=> bm!4206 (= call!4209 (byteRangesEq!0 (ite c!12340 (select (arr!7473 (buf!6954 lt!407659)) (_3!978 lt!407968)) (select (arr!7473 (buf!6954 lt!407659)) (_4!198 lt!407968))) (ite c!12340 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407968)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407968))) (ite c!12340 lt!407967 #b00000000000000000000000000000000) lt!407969))))

(declare-fun b!267380 () Bool)

(declare-fun e!187196 () Bool)

(declare-fun e!187198 () Bool)

(assert (=> b!267380 (= e!187196 e!187198)))

(declare-fun res!223265 () Bool)

(assert (=> b!267380 (=> (not res!223265) (not e!187198))))

(assert (=> b!267380 (= res!223265 e!187195)))

(declare-fun res!223263 () Bool)

(assert (=> b!267380 (=> res!223263 e!187195)))

(assert (=> b!267380 (= res!223263 (bvsge (_1!12178 lt!407968) (_2!12178 lt!407968)))))

(assert (=> b!267380 (= lt!407969 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267380 (= lt!407967 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267380 (= lt!407968 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(declare-fun d!90386 () Bool)

(declare-fun res!223266 () Bool)

(assert (=> d!90386 (=> res!223266 e!187196)))

(assert (=> d!90386 (= res!223266 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))))))

(assert (=> d!90386 (= (arrayBitRangesEq!0 (buf!6954 lt!407659) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 lt!407659)) (currentByte!12851 lt!407659) (currentBit!12846 lt!407659))) e!187196)))

(declare-fun b!267381 () Bool)

(assert (=> b!267381 (= e!187198 e!187200)))

(assert (=> b!267381 (= c!12340 (= (_3!978 lt!407968) (_4!198 lt!407968)))))

(assert (= (and d!90386 (not res!223266)) b!267380))

(assert (= (and b!267380 (not res!223263)) b!267379))

(assert (= (and b!267380 res!223265) b!267381))

(assert (= (and b!267381 c!12340) b!267377))

(assert (= (and b!267381 (not c!12340)) b!267375))

(assert (= (and b!267375 res!223262) b!267378))

(assert (= (and b!267378 (not res!223264)) b!267376))

(assert (= (or b!267377 b!267376) bm!4206))

(declare-fun m!398549 () Bool)

(assert (=> b!267375 m!398549))

(declare-fun m!398551 () Bool)

(assert (=> b!267375 m!398551))

(assert (=> b!267375 m!398549))

(assert (=> b!267375 m!398551))

(declare-fun m!398553 () Bool)

(assert (=> b!267375 m!398553))

(declare-fun m!398555 () Bool)

(assert (=> b!267379 m!398555))

(assert (=> bm!4206 m!398551))

(declare-fun m!398557 () Bool)

(assert (=> bm!4206 m!398557))

(declare-fun m!398559 () Bool)

(assert (=> bm!4206 m!398559))

(assert (=> bm!4206 m!398549))

(declare-fun m!398561 () Bool)

(assert (=> bm!4206 m!398561))

(assert (=> b!267380 m!398135))

(assert (=> b!267380 m!398519))

(assert (=> b!267177 d!90386))

(assert (=> b!267177 d!90348))

(declare-fun b!267382 () Bool)

(declare-fun e!187206 () Bool)

(declare-fun e!187203 () Bool)

(assert (=> b!267382 (= e!187206 e!187203)))

(declare-fun lt!407970 () (_ BitVec 32))

(declare-fun lt!407971 () tuple4!396)

(declare-fun res!223267 () Bool)

(assert (=> b!267382 (= res!223267 (byteRangesEq!0 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407971)) (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407971)) lt!407970 #b00000000000000000000000000001000))))

(assert (=> b!267382 (=> (not res!223267) (not e!187203))))

(declare-fun b!267383 () Bool)

(declare-fun e!187205 () Bool)

(declare-fun call!4210 () Bool)

(assert (=> b!267383 (= e!187205 call!4210)))

(declare-fun b!267384 () Bool)

(assert (=> b!267384 (= e!187206 call!4210)))

(declare-fun b!267385 () Bool)

(declare-fun res!223269 () Bool)

(declare-fun lt!407972 () (_ BitVec 32))

(assert (=> b!267385 (= res!223269 (= lt!407972 #b00000000000000000000000000000000))))

(assert (=> b!267385 (=> res!223269 e!187205)))

(assert (=> b!267385 (= e!187203 e!187205)))

(declare-fun b!267386 () Bool)

(declare-fun e!187201 () Bool)

(assert (=> b!267386 (= e!187201 (arrayRangesEq!1034 (buf!6954 w2!580) (buf!6954 w2!580) (_1!12178 lt!407971) (_2!12178 lt!407971)))))

(declare-fun c!12341 () Bool)

(declare-fun bm!4207 () Bool)

(assert (=> bm!4207 (= call!4210 (byteRangesEq!0 (ite c!12341 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407971)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407971))) (ite c!12341 (select (arr!7473 (buf!6954 w2!580)) (_3!978 lt!407971)) (select (arr!7473 (buf!6954 w2!580)) (_4!198 lt!407971))) (ite c!12341 lt!407970 #b00000000000000000000000000000000) lt!407972))))

(declare-fun b!267387 () Bool)

(declare-fun e!187202 () Bool)

(declare-fun e!187204 () Bool)

(assert (=> b!267387 (= e!187202 e!187204)))

(declare-fun res!223270 () Bool)

(assert (=> b!267387 (=> (not res!223270) (not e!187204))))

(assert (=> b!267387 (= res!223270 e!187201)))

(declare-fun res!223268 () Bool)

(assert (=> b!267387 (=> res!223268 e!187201)))

(assert (=> b!267387 (= res!223268 (bvsge (_1!12178 lt!407971) (_2!12178 lt!407971)))))

(assert (=> b!267387 (= lt!407972 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267387 (= lt!407970 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267387 (= lt!407971 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))

(declare-fun d!90388 () Bool)

(declare-fun res!223271 () Bool)

(assert (=> d!90388 (=> res!223271 e!187202)))

(assert (=> d!90388 (= res!223271 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))))))

(assert (=> d!90388 (= (arrayBitRangesEq!0 (buf!6954 w2!580) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w2!580)) (currentByte!12851 w2!580) (currentBit!12846 w2!580))) e!187202)))

(declare-fun b!267388 () Bool)

(assert (=> b!267388 (= e!187204 e!187206)))

(assert (=> b!267388 (= c!12341 (= (_3!978 lt!407971) (_4!198 lt!407971)))))

(assert (= (and d!90388 (not res!223271)) b!267387))

(assert (= (and b!267387 (not res!223268)) b!267386))

(assert (= (and b!267387 res!223270) b!267388))

(assert (= (and b!267388 c!12341) b!267384))

(assert (= (and b!267388 (not c!12341)) b!267382))

(assert (= (and b!267382 res!223267) b!267385))

(assert (= (and b!267385 (not res!223269)) b!267383))

(assert (= (or b!267384 b!267383) bm!4207))

(declare-fun m!398563 () Bool)

(assert (=> b!267382 m!398563))

(assert (=> b!267382 m!398563))

(assert (=> b!267382 m!398563))

(assert (=> b!267382 m!398563))

(declare-fun m!398565 () Bool)

(assert (=> b!267382 m!398565))

(declare-fun m!398567 () Bool)

(assert (=> b!267386 m!398567))

(assert (=> bm!4207 m!398563))

(declare-fun m!398569 () Bool)

(assert (=> bm!4207 m!398569))

(declare-fun m!398571 () Bool)

(assert (=> bm!4207 m!398571))

(assert (=> bm!4207 m!398563))

(assert (=> bm!4207 m!398571))

(assert (=> b!267387 m!397981))

(declare-fun m!398573 () Bool)

(assert (=> b!267387 m!398573))

(assert (=> b!267141 d!90388))

(assert (=> b!267141 d!90150))

(declare-fun b!267389 () Bool)

(declare-fun e!187212 () Bool)

(declare-fun e!187209 () Bool)

(assert (=> b!267389 (= e!187212 e!187209)))

(declare-fun res!223272 () Bool)

(declare-fun lt!407974 () tuple4!396)

(declare-fun lt!407973 () (_ BitVec 32))

(assert (=> b!267389 (= res!223272 (byteRangesEq!0 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407974)) (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407974)) lt!407973 #b00000000000000000000000000001000))))

(assert (=> b!267389 (=> (not res!223272) (not e!187209))))

(declare-fun b!267390 () Bool)

(declare-fun e!187211 () Bool)

(declare-fun call!4211 () Bool)

(assert (=> b!267390 (= e!187211 call!4211)))

(declare-fun b!267391 () Bool)

(assert (=> b!267391 (= e!187212 call!4211)))

(declare-fun b!267392 () Bool)

(declare-fun res!223274 () Bool)

(declare-fun lt!407975 () (_ BitVec 32))

(assert (=> b!267392 (= res!223274 (= lt!407975 #b00000000000000000000000000000000))))

(assert (=> b!267392 (=> res!223274 e!187211)))

(assert (=> b!267392 (= e!187209 e!187211)))

(declare-fun b!267393 () Bool)

(declare-fun e!187207 () Bool)

(assert (=> b!267393 (= e!187207 (arrayRangesEq!1034 (buf!6954 w1!584) (buf!6954 w1!584) (_1!12178 lt!407974) (_2!12178 lt!407974)))))

(declare-fun c!12342 () Bool)

(declare-fun bm!4208 () Bool)

(assert (=> bm!4208 (= call!4211 (byteRangesEq!0 (ite c!12342 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407974)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407974))) (ite c!12342 (select (arr!7473 (buf!6954 w1!584)) (_3!978 lt!407974)) (select (arr!7473 (buf!6954 w1!584)) (_4!198 lt!407974))) (ite c!12342 lt!407973 #b00000000000000000000000000000000) lt!407975))))

(declare-fun b!267394 () Bool)

(declare-fun e!187208 () Bool)

(declare-fun e!187210 () Bool)

(assert (=> b!267394 (= e!187208 e!187210)))

(declare-fun res!223275 () Bool)

(assert (=> b!267394 (=> (not res!223275) (not e!187210))))

(assert (=> b!267394 (= res!223275 e!187207)))

(declare-fun res!223273 () Bool)

(assert (=> b!267394 (=> res!223273 e!187207)))

(assert (=> b!267394 (= res!223273 (bvsge (_1!12178 lt!407974) (_2!12178 lt!407974)))))

(assert (=> b!267394 (= lt!407975 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267394 (= lt!407973 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267394 (= lt!407974 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(declare-fun d!90390 () Bool)

(declare-fun res!223276 () Bool)

(assert (=> d!90390 (=> res!223276 e!187208)))

(assert (=> d!90390 (= res!223276 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))))))

(assert (=> d!90390 (= (arrayBitRangesEq!0 (buf!6954 w1!584) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6486 (buf!6954 w1!584)) (currentByte!12851 w1!584) (currentBit!12846 w1!584))) e!187208)))

(declare-fun b!267395 () Bool)

(assert (=> b!267395 (= e!187210 e!187212)))

(assert (=> b!267395 (= c!12342 (= (_3!978 lt!407974) (_4!198 lt!407974)))))

(assert (= (and d!90390 (not res!223276)) b!267394))

(assert (= (and b!267394 (not res!223273)) b!267393))

(assert (= (and b!267394 res!223275) b!267395))

(assert (= (and b!267395 c!12342) b!267391))

(assert (= (and b!267395 (not c!12342)) b!267389))

(assert (= (and b!267389 res!223272) b!267392))

(assert (= (and b!267392 (not res!223274)) b!267390))

(assert (= (or b!267391 b!267390) bm!4208))

(declare-fun m!398575 () Bool)

(assert (=> b!267389 m!398575))

(assert (=> b!267389 m!398575))

(assert (=> b!267389 m!398575))

(assert (=> b!267389 m!398575))

(declare-fun m!398577 () Bool)

(assert (=> b!267389 m!398577))

(declare-fun m!398579 () Bool)

(assert (=> b!267393 m!398579))

(assert (=> bm!4208 m!398575))

(declare-fun m!398581 () Bool)

(assert (=> bm!4208 m!398581))

(declare-fun m!398583 () Bool)

(assert (=> bm!4208 m!398583))

(assert (=> bm!4208 m!398575))

(assert (=> bm!4208 m!398583))

(assert (=> b!267394 m!397959))

(assert (=> b!267394 m!398049))

(assert (=> b!267138 d!90390))

(assert (=> b!267138 d!90110))

(assert (=> b!267139 d!90150))

(assert (=> d!90180 d!90182))

(declare-fun d!90392 () Bool)

(assert (=> d!90392 (isPrefixOf!0 lt!407659 w2!580)))

(assert (=> d!90392 true))

(declare-fun _$15!351 () Unit!18956)

(assert (=> d!90392 (= (choose!30 lt!407659 w2!580 w2!580) _$15!351)))

(declare-fun bs!22941 () Bool)

(assert (= bs!22941 d!90392))

(assert (=> bs!22941 m!397983))

(assert (=> d!90180 d!90392))

(assert (=> d!90130 d!90134))

(declare-fun d!90394 () Bool)

(assert (=> d!90394 (isPrefixOf!0 lt!407659 lt!407659)))

(assert (=> d!90394 true))

(declare-fun _$14!343 () Unit!18956)

(assert (=> d!90394 (= (choose!11 lt!407659) _$14!343)))

(declare-fun bs!22942 () Bool)

(assert (= bs!22942 d!90394))

(assert (=> bs!22942 m!397963))

(assert (=> d!90130 d!90394))

(assert (=> b!267136 d!90110))

(assert (=> d!90122 d!90124))

(declare-fun d!90396 () Bool)

(assert (=> d!90396 (arrayBitRangesEq!0 (buf!6954 w2!580) (buf!6954 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660)))

(assert (=> d!90396 true))

(declare-fun _$19!213 () Unit!18956)

(assert (=> d!90396 (= (choose!8 (buf!6954 w1!584) (buf!6954 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407660) _$19!213)))

(declare-fun bs!22943 () Bool)

(assert (= bs!22943 d!90396))

(assert (=> bs!22943 m!397989))

(assert (=> d!90122 d!90396))

(assert (=> d!90192 d!90370))

(push 1)

(assert (not b!267394))

(assert (not b!267389))

(assert (not b!267379))

(assert (not b!267354))

(assert (not bm!4208))

(assert (not d!90392))

(assert (not b!267382))

(assert (not d!90374))

(assert (not bm!4206))

(assert (not d!90380))

(assert (not b!267353))

(assert (not b!267393))

(assert (not b!267346))

(assert (not b!267369))

(assert (not d!90364))

(assert (not b!267348))

(assert (not b!267361))

(assert (not d!90366))

(assert (not b!267375))

(assert (not d!90396))

(assert (not d!90394))

(assert (not bm!4207))

(assert (not bm!4204))

(assert (not bm!4205))

(assert (not b!267349))

(assert (not b!267387))

(assert (not b!267342))

(assert (not b!267380))

(assert (not d!90372))

(assert (not b!267374))

(assert (not b!267386))

(assert (not d!90348))

(assert (not b!267356))

(assert (not b!267360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

