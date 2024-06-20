; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58106 () Bool)

(assert start!58106)

(declare-fun b!266969 () Bool)

(declare-datatypes ((Unit!18953 0))(
  ( (Unit!18954) )
))
(declare-fun e!186869 () Unit!18953)

(declare-fun Unit!18955 () Unit!18953)

(assert (=> b!266969 (= e!186869 Unit!18955)))

(declare-datatypes ((array!14875 0))(
  ( (array!14876 (arr!7472 (Array (_ BitVec 32) (_ BitVec 8))) (size!6485 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11784 0))(
  ( (BitStream!11785 (buf!6953 array!14875) (currentByte!12850 (_ BitVec 32)) (currentBit!12845 (_ BitVec 32))) )
))
(declare-fun lt!407625 () BitStream!11784)

(declare-fun b!266970 () Bool)

(declare-fun w2!580 () BitStream!11784)

(declare-fun e!186865 () Bool)

(declare-fun w1!584 () BitStream!11784)

(declare-fun withMovedBitIndex!0 (BitStream!11784 (_ BitVec 64)) BitStream!11784)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266970 (= e!186865 (= lt!407625 (withMovedBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))))

(declare-fun lt!407630 () Unit!18953)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11784 BitStream!11784 BitStream!11784) Unit!18953)

(assert (=> b!266970 (= lt!407630 (lemmaIsPrefixTransitive!0 lt!407625 w2!580 w2!580))))

(declare-fun isPrefixOf!0 (BitStream!11784 BitStream!11784) Bool)

(assert (=> b!266970 (isPrefixOf!0 lt!407625 w2!580)))

(declare-fun lt!407627 () Unit!18953)

(assert (=> b!266970 (= lt!407627 (lemmaIsPrefixTransitive!0 lt!407625 w1!584 w2!580))))

(declare-fun b!266971 () Bool)

(declare-fun e!186866 () Bool)

(declare-fun e!186867 () Bool)

(assert (=> b!266971 (= e!186866 (not e!186867))))

(declare-fun res!222929 () Bool)

(assert (=> b!266971 (=> res!222929 e!186867)))

(declare-fun e!186870 () Bool)

(assert (=> b!266971 (= res!222929 e!186870)))

(declare-fun res!222934 () Bool)

(assert (=> b!266971 (=> (not res!222934) (not e!186870))))

(assert (=> b!266971 (= res!222934 (not (= (size!6485 (buf!6953 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!266971 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407628 () Unit!18953)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11784) Unit!18953)

(assert (=> b!266971 (= lt!407628 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!266971 (isPrefixOf!0 lt!407625 lt!407625)))

(declare-fun lt!407633 () Unit!18953)

(assert (=> b!266971 (= lt!407633 (lemmaIsPrefixRefl!0 lt!407625))))

(assert (=> b!266971 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407632 () Unit!18953)

(assert (=> b!266971 (= lt!407632 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266971 (= lt!407625 (BitStream!11785 (buf!6953 w2!580) (currentByte!12850 w1!584) (currentBit!12845 w1!584)))))

(declare-fun b!266972 () Bool)

(declare-fun lt!407629 () Unit!18953)

(assert (=> b!266972 (= e!186869 lt!407629)))

(declare-fun lt!407631 () (_ BitVec 64))

(assert (=> b!266972 (= lt!407631 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14875 array!14875 (_ BitVec 64) (_ BitVec 64)) Unit!18953)

(assert (=> b!266972 (= lt!407629 (arrayBitRangesEqSymmetric!0 (buf!6953 w1!584) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631))))

(declare-fun arrayBitRangesEq!0 (array!14875 array!14875 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266972 (arrayBitRangesEq!0 (buf!6953 w2!580) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631)))

(declare-fun b!266973 () Bool)

(declare-fun e!186864 () Bool)

(assert (=> b!266973 (= e!186864 (not (arrayBitRangesEq!0 (buf!6953 w2!580) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)))))))

(declare-fun b!266974 () Bool)

(declare-fun res!222932 () Bool)

(assert (=> b!266974 (=> res!222932 e!186865)))

(assert (=> b!266974 (= res!222932 (not (isPrefixOf!0 lt!407625 w1!584)))))

(declare-fun b!266975 () Bool)

(declare-fun e!186863 () Bool)

(declare-fun array_inv!6209 (array!14875) Bool)

(assert (=> b!266975 (= e!186863 (array_inv!6209 (buf!6953 w2!580)))))

(declare-fun b!266976 () Bool)

(assert (=> b!266976 (= e!186867 e!186865)))

(declare-fun res!222933 () Bool)

(assert (=> b!266976 (=> res!222933 e!186865)))

(assert (=> b!266976 (= res!222933 e!186864)))

(declare-fun res!222930 () Bool)

(assert (=> b!266976 (=> (not res!222930) (not e!186864))))

(assert (=> b!266976 (= res!222930 (not (= (size!6485 (buf!6953 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!407626 () Unit!18953)

(assert (=> b!266976 (= lt!407626 e!186869)))

(declare-fun c!12309 () Bool)

(assert (=> b!266976 (= c!12309 (not (= (size!6485 (buf!6953 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun res!222931 () Bool)

(assert (=> start!58106 (=> (not res!222931) (not e!186866))))

(assert (=> start!58106 (= res!222931 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58106 e!186866))

(declare-fun e!186861 () Bool)

(declare-fun inv!12 (BitStream!11784) Bool)

(assert (=> start!58106 (and (inv!12 w1!584) e!186861)))

(assert (=> start!58106 (and (inv!12 w2!580) e!186863)))

(declare-fun b!266977 () Bool)

(assert (=> b!266977 (= e!186870 (not (arrayBitRangesEq!0 (buf!6953 w1!584) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)))))))

(declare-fun b!266978 () Bool)

(assert (=> b!266978 (= e!186861 (array_inv!6209 (buf!6953 w1!584)))))

(assert (= (and start!58106 res!222931) b!266971))

(assert (= (and b!266971 res!222934) b!266977))

(assert (= (and b!266971 (not res!222929)) b!266976))

(assert (= (and b!266976 c!12309) b!266972))

(assert (= (and b!266976 (not c!12309)) b!266969))

(assert (= (and b!266976 res!222930) b!266973))

(assert (= (and b!266976 (not res!222933)) b!266974))

(assert (= (and b!266974 (not res!222932)) b!266970))

(assert (= start!58106 b!266978))

(assert (= start!58106 b!266975))

(declare-fun m!397915 () Bool)

(assert (=> b!266970 m!397915))

(declare-fun m!397917 () Bool)

(assert (=> b!266970 m!397917))

(declare-fun m!397919 () Bool)

(assert (=> b!266970 m!397919))

(declare-fun m!397921 () Bool)

(assert (=> b!266970 m!397921))

(declare-fun m!397923 () Bool)

(assert (=> b!266970 m!397923))

(declare-fun m!397925 () Bool)

(assert (=> b!266970 m!397925))

(assert (=> b!266977 m!397917))

(assert (=> b!266977 m!397917))

(declare-fun m!397927 () Bool)

(assert (=> b!266977 m!397927))

(declare-fun m!397929 () Bool)

(assert (=> b!266975 m!397929))

(declare-fun m!397931 () Bool)

(assert (=> b!266978 m!397931))

(declare-fun m!397933 () Bool)

(assert (=> b!266971 m!397933))

(declare-fun m!397935 () Bool)

(assert (=> b!266971 m!397935))

(declare-fun m!397937 () Bool)

(assert (=> b!266971 m!397937))

(declare-fun m!397939 () Bool)

(assert (=> b!266971 m!397939))

(declare-fun m!397941 () Bool)

(assert (=> b!266971 m!397941))

(declare-fun m!397943 () Bool)

(assert (=> b!266971 m!397943))

(declare-fun m!397945 () Bool)

(assert (=> start!58106 m!397945))

(declare-fun m!397947 () Bool)

(assert (=> start!58106 m!397947))

(declare-fun m!397949 () Bool)

(assert (=> start!58106 m!397949))

(declare-fun m!397951 () Bool)

(assert (=> b!266974 m!397951))

(assert (=> b!266973 m!397917))

(assert (=> b!266973 m!397917))

(declare-fun m!397953 () Bool)

(assert (=> b!266973 m!397953))

(assert (=> b!266972 m!397917))

(declare-fun m!397955 () Bool)

(assert (=> b!266972 m!397955))

(declare-fun m!397957 () Bool)

(assert (=> b!266972 m!397957))

(check-sat (not b!266978) (not start!58106) (not b!266970) (not b!266971) (not b!266975) (not b!266974) (not b!266977) (not b!266973) (not b!266972))
(check-sat)
(get-model)

(declare-fun d!90082 () Bool)

(assert (=> d!90082 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!407663 () Unit!18953)

(declare-fun choose!11 (BitStream!11784) Unit!18953)

(assert (=> d!90082 (= lt!407663 (choose!11 w2!580))))

(assert (=> d!90082 (= (lemmaIsPrefixRefl!0 w2!580) lt!407663)))

(declare-fun bs!22879 () Bool)

(assert (= bs!22879 d!90082))

(assert (=> bs!22879 m!397941))

(declare-fun m!398003 () Bool)

(assert (=> bs!22879 m!398003))

(assert (=> b!266971 d!90082))

(declare-fun d!90086 () Bool)

(assert (=> d!90086 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407664 () Unit!18953)

(assert (=> d!90086 (= lt!407664 (choose!11 w1!584))))

(assert (=> d!90086 (= (lemmaIsPrefixRefl!0 w1!584) lt!407664)))

(declare-fun bs!22880 () Bool)

(assert (= bs!22880 d!90086))

(assert (=> bs!22880 m!397939))

(declare-fun m!398005 () Bool)

(assert (=> bs!22880 m!398005))

(assert (=> b!266971 d!90086))

(declare-fun d!90088 () Bool)

(declare-fun res!222966 () Bool)

(declare-fun e!186908 () Bool)

(assert (=> d!90088 (=> (not res!222966) (not e!186908))))

(assert (=> d!90088 (= res!222966 (= (size!6485 (buf!6953 lt!407625)) (size!6485 (buf!6953 lt!407625))))))

(assert (=> d!90088 (= (isPrefixOf!0 lt!407625 lt!407625) e!186908)))

(declare-fun b!267021 () Bool)

(declare-fun res!222967 () Bool)

(assert (=> b!267021 (=> (not res!222967) (not e!186908))))

(assert (=> b!267021 (= res!222967 (bvsle (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625)) (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(declare-fun b!267022 () Bool)

(declare-fun e!186909 () Bool)

(assert (=> b!267022 (= e!186908 e!186909)))

(declare-fun res!222965 () Bool)

(assert (=> b!267022 (=> res!222965 e!186909)))

(assert (=> b!267022 (= res!222965 (= (size!6485 (buf!6953 lt!407625)) #b00000000000000000000000000000000))))

(declare-fun b!267023 () Bool)

(assert (=> b!267023 (= e!186909 (arrayBitRangesEq!0 (buf!6953 lt!407625) (buf!6953 lt!407625) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(assert (= (and d!90088 res!222966) b!267021))

(assert (= (and b!267021 res!222967) b!267022))

(assert (= (and b!267022 (not res!222965)) b!267023))

(declare-fun m!398011 () Bool)

(assert (=> b!267021 m!398011))

(assert (=> b!267021 m!398011))

(assert (=> b!267023 m!398011))

(assert (=> b!267023 m!398011))

(declare-fun m!398013 () Bool)

(assert (=> b!267023 m!398013))

(assert (=> b!266971 d!90088))

(declare-fun d!90092 () Bool)

(assert (=> d!90092 (isPrefixOf!0 lt!407625 lt!407625)))

(declare-fun lt!407683 () Unit!18953)

(assert (=> d!90092 (= lt!407683 (choose!11 lt!407625))))

(assert (=> d!90092 (= (lemmaIsPrefixRefl!0 lt!407625) lt!407683)))

(declare-fun bs!22881 () Bool)

(assert (= bs!22881 d!90092))

(assert (=> bs!22881 m!397937))

(declare-fun m!398015 () Bool)

(assert (=> bs!22881 m!398015))

(assert (=> b!266971 d!90092))

(declare-fun d!90094 () Bool)

(declare-fun res!222969 () Bool)

(declare-fun e!186910 () Bool)

(assert (=> d!90094 (=> (not res!222969) (not e!186910))))

(assert (=> d!90094 (= res!222969 (= (size!6485 (buf!6953 w1!584)) (size!6485 (buf!6953 w1!584))))))

(assert (=> d!90094 (= (isPrefixOf!0 w1!584 w1!584) e!186910)))

(declare-fun b!267024 () Bool)

(declare-fun res!222970 () Bool)

(assert (=> b!267024 (=> (not res!222970) (not e!186910))))

(assert (=> b!267024 (= res!222970 (bvsle (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(declare-fun b!267025 () Bool)

(declare-fun e!186911 () Bool)

(assert (=> b!267025 (= e!186910 e!186911)))

(declare-fun res!222968 () Bool)

(assert (=> b!267025 (=> res!222968 e!186911)))

(assert (=> b!267025 (= res!222968 (= (size!6485 (buf!6953 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!267026 () Bool)

(assert (=> b!267026 (= e!186911 (arrayBitRangesEq!0 (buf!6953 w1!584) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(assert (= (and d!90094 res!222969) b!267024))

(assert (= (and b!267024 res!222970) b!267025))

(assert (= (and b!267025 (not res!222968)) b!267026))

(assert (=> b!267024 m!397917))

(assert (=> b!267024 m!397917))

(assert (=> b!267026 m!397917))

(assert (=> b!267026 m!397917))

(declare-fun m!398017 () Bool)

(assert (=> b!267026 m!398017))

(assert (=> b!266971 d!90094))

(declare-fun d!90096 () Bool)

(declare-fun res!222972 () Bool)

(declare-fun e!186912 () Bool)

(assert (=> d!90096 (=> (not res!222972) (not e!186912))))

(assert (=> d!90096 (= res!222972 (= (size!6485 (buf!6953 w2!580)) (size!6485 (buf!6953 w2!580))))))

(assert (=> d!90096 (= (isPrefixOf!0 w2!580 w2!580) e!186912)))

(declare-fun b!267027 () Bool)

(declare-fun res!222973 () Bool)

(assert (=> b!267027 (=> (not res!222973) (not e!186912))))

(assert (=> b!267027 (= res!222973 (bvsle (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))

(declare-fun b!267028 () Bool)

(declare-fun e!186913 () Bool)

(assert (=> b!267028 (= e!186912 e!186913)))

(declare-fun res!222971 () Bool)

(assert (=> b!267028 (=> res!222971 e!186913)))

(assert (=> b!267028 (= res!222971 (= (size!6485 (buf!6953 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!267029 () Bool)

(assert (=> b!267029 (= e!186913 (arrayBitRangesEq!0 (buf!6953 w2!580) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))

(assert (= (and d!90096 res!222972) b!267027))

(assert (= (and b!267027 res!222973) b!267028))

(assert (= (and b!267028 (not res!222971)) b!267029))

(assert (=> b!267027 m!397921))

(assert (=> b!267027 m!397921))

(assert (=> b!267029 m!397921))

(assert (=> b!267029 m!397921))

(declare-fun m!398019 () Bool)

(assert (=> b!267029 m!398019))

(assert (=> b!266971 d!90096))

(declare-fun d!90098 () Bool)

(assert (=> d!90098 (isPrefixOf!0 lt!407625 w2!580)))

(declare-fun lt!407694 () Unit!18953)

(declare-fun choose!30 (BitStream!11784 BitStream!11784 BitStream!11784) Unit!18953)

(assert (=> d!90098 (= lt!407694 (choose!30 lt!407625 w2!580 w2!580))))

(assert (=> d!90098 (isPrefixOf!0 lt!407625 w2!580)))

(assert (=> d!90098 (= (lemmaIsPrefixTransitive!0 lt!407625 w2!580 w2!580) lt!407694)))

(declare-fun bs!22884 () Bool)

(assert (= bs!22884 d!90098))

(assert (=> bs!22884 m!397919))

(declare-fun m!398025 () Bool)

(assert (=> bs!22884 m!398025))

(assert (=> bs!22884 m!397919))

(assert (=> b!266970 d!90098))

(declare-fun d!90104 () Bool)

(declare-fun e!186946 () Bool)

(assert (=> d!90104 e!186946))

(declare-fun res!223009 () Bool)

(assert (=> d!90104 (=> (not res!223009) (not e!186946))))

(declare-fun lt!407739 () (_ BitVec 64))

(declare-fun lt!407737 () (_ BitVec 64))

(declare-fun lt!407735 () (_ BitVec 64))

(assert (=> d!90104 (= res!223009 (= lt!407737 (bvsub lt!407739 lt!407735)))))

(assert (=> d!90104 (or (= (bvand lt!407739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407739 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407739 lt!407735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90104 (= lt!407735 (remainingBits!0 ((_ sign_extend 32) (size!6485 (buf!6953 w2!580))) ((_ sign_extend 32) (currentByte!12850 w2!580)) ((_ sign_extend 32) (currentBit!12845 w2!580))))))

(declare-fun lt!407736 () (_ BitVec 64))

(declare-fun lt!407738 () (_ BitVec 64))

(assert (=> d!90104 (= lt!407739 (bvmul lt!407736 lt!407738))))

(assert (=> d!90104 (or (= lt!407736 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407738 (bvsdiv (bvmul lt!407736 lt!407738) lt!407736)))))

(assert (=> d!90104 (= lt!407738 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90104 (= lt!407736 ((_ sign_extend 32) (size!6485 (buf!6953 w2!580))))))

(assert (=> d!90104 (= lt!407737 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12850 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12845 w2!580))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90104 (invariant!0 (currentBit!12845 w2!580) (currentByte!12850 w2!580) (size!6485 (buf!6953 w2!580)))))

(assert (=> d!90104 (= (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)) lt!407737)))

(declare-fun b!267069 () Bool)

(declare-fun res!223010 () Bool)

(assert (=> b!267069 (=> (not res!223010) (not e!186946))))

(assert (=> b!267069 (= res!223010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407737))))

(declare-fun b!267070 () Bool)

(declare-fun lt!407740 () (_ BitVec 64))

(assert (=> b!267070 (= e!186946 (bvsle lt!407737 (bvmul lt!407740 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267070 (or (= lt!407740 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407740 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407740)))))

(assert (=> b!267070 (= lt!407740 ((_ sign_extend 32) (size!6485 (buf!6953 w2!580))))))

(assert (= (and d!90104 res!223009) b!267069))

(assert (= (and b!267069 res!223010) b!267070))

(declare-fun m!398059 () Bool)

(assert (=> d!90104 m!398059))

(declare-fun m!398061 () Bool)

(assert (=> d!90104 m!398061))

(assert (=> b!266970 d!90104))

(declare-fun d!90116 () Bool)

(declare-fun res!223014 () Bool)

(declare-fun e!186947 () Bool)

(assert (=> d!90116 (=> (not res!223014) (not e!186947))))

(assert (=> d!90116 (= res!223014 (= (size!6485 (buf!6953 lt!407625)) (size!6485 (buf!6953 w2!580))))))

(assert (=> d!90116 (= (isPrefixOf!0 lt!407625 w2!580) e!186947)))

(declare-fun b!267075 () Bool)

(declare-fun res!223015 () Bool)

(assert (=> b!267075 (=> (not res!223015) (not e!186947))))

(assert (=> b!267075 (= res!223015 (bvsle (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))

(declare-fun b!267076 () Bool)

(declare-fun e!186948 () Bool)

(assert (=> b!267076 (= e!186947 e!186948)))

(declare-fun res!223013 () Bool)

(assert (=> b!267076 (=> res!223013 e!186948)))

(assert (=> b!267076 (= res!223013 (= (size!6485 (buf!6953 lt!407625)) #b00000000000000000000000000000000))))

(declare-fun b!267077 () Bool)

(assert (=> b!267077 (= e!186948 (arrayBitRangesEq!0 (buf!6953 lt!407625) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(assert (= (and d!90116 res!223014) b!267075))

(assert (= (and b!267075 res!223015) b!267076))

(assert (= (and b!267076 (not res!223013)) b!267077))

(assert (=> b!267075 m!398011))

(assert (=> b!267075 m!397921))

(assert (=> b!267077 m!398011))

(assert (=> b!267077 m!398011))

(declare-fun m!398063 () Bool)

(assert (=> b!267077 m!398063))

(assert (=> b!266970 d!90116))

(declare-fun d!90118 () Bool)

(declare-fun e!186949 () Bool)

(assert (=> d!90118 e!186949))

(declare-fun res!223016 () Bool)

(assert (=> d!90118 (=> (not res!223016) (not e!186949))))

(declare-fun lt!407745 () (_ BitVec 64))

(declare-fun lt!407749 () (_ BitVec 64))

(declare-fun lt!407747 () (_ BitVec 64))

(assert (=> d!90118 (= res!223016 (= lt!407747 (bvsub lt!407749 lt!407745)))))

(assert (=> d!90118 (or (= (bvand lt!407749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407749 lt!407745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90118 (= lt!407745 (remainingBits!0 ((_ sign_extend 32) (size!6485 (buf!6953 w1!584))) ((_ sign_extend 32) (currentByte!12850 w1!584)) ((_ sign_extend 32) (currentBit!12845 w1!584))))))

(declare-fun lt!407746 () (_ BitVec 64))

(declare-fun lt!407748 () (_ BitVec 64))

(assert (=> d!90118 (= lt!407749 (bvmul lt!407746 lt!407748))))

(assert (=> d!90118 (or (= lt!407746 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407748 (bvsdiv (bvmul lt!407746 lt!407748) lt!407746)))))

(assert (=> d!90118 (= lt!407748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90118 (= lt!407746 ((_ sign_extend 32) (size!6485 (buf!6953 w1!584))))))

(assert (=> d!90118 (= lt!407747 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12850 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12845 w1!584))))))

(assert (=> d!90118 (invariant!0 (currentBit!12845 w1!584) (currentByte!12850 w1!584) (size!6485 (buf!6953 w1!584)))))

(assert (=> d!90118 (= (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) lt!407747)))

(declare-fun b!267078 () Bool)

(declare-fun res!223017 () Bool)

(assert (=> b!267078 (=> (not res!223017) (not e!186949))))

(assert (=> b!267078 (= res!223017 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407747))))

(declare-fun b!267079 () Bool)

(declare-fun lt!407750 () (_ BitVec 64))

(assert (=> b!267079 (= e!186949 (bvsle lt!407747 (bvmul lt!407750 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267079 (or (= lt!407750 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407750 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407750)))))

(assert (=> b!267079 (= lt!407750 ((_ sign_extend 32) (size!6485 (buf!6953 w1!584))))))

(assert (= (and d!90118 res!223016) b!267078))

(assert (= (and b!267078 res!223017) b!267079))

(declare-fun m!398065 () Bool)

(assert (=> d!90118 m!398065))

(declare-fun m!398067 () Bool)

(assert (=> d!90118 m!398067))

(assert (=> b!266970 d!90118))

(declare-fun d!90120 () Bool)

(declare-fun e!186977 () Bool)

(assert (=> d!90120 e!186977))

(declare-fun res!223042 () Bool)

(assert (=> d!90120 (=> (not res!223042) (not e!186977))))

(declare-fun lt!407782 () (_ BitVec 64))

(declare-fun lt!407781 () BitStream!11784)

(assert (=> d!90120 (= res!223042 (= (bvadd lt!407782 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))) (bitIndex!0 (size!6485 (buf!6953 lt!407781)) (currentByte!12850 lt!407781) (currentBit!12845 lt!407781))))))

(assert (=> d!90120 (or (not (= (bvand lt!407782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!407782 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!407782 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90120 (= lt!407782 (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))))

(declare-datatypes ((tuple2!22402 0))(
  ( (tuple2!22403 (_1!12181 Unit!18953) (_2!12181 BitStream!11784)) )
))
(declare-fun moveBitIndex!0 (BitStream!11784 (_ BitVec 64)) tuple2!22402)

(assert (=> d!90120 (= lt!407781 (_2!12181 (moveBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!11784 (_ BitVec 64)) Bool)

(assert (=> d!90120 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))

(assert (=> d!90120 (= (withMovedBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))) lt!407781)))

(declare-fun b!267112 () Bool)

(assert (=> b!267112 (= e!186977 (= (size!6485 (buf!6953 w2!580)) (size!6485 (buf!6953 lt!407781))))))

(assert (= (and d!90120 res!223042) b!267112))

(declare-fun m!398111 () Bool)

(assert (=> d!90120 m!398111))

(assert (=> d!90120 m!397921))

(declare-fun m!398113 () Bool)

(assert (=> d!90120 m!398113))

(declare-fun m!398115 () Bool)

(assert (=> d!90120 m!398115))

(assert (=> b!266970 d!90120))

(declare-fun d!90136 () Bool)

(assert (=> d!90136 (isPrefixOf!0 lt!407625 w2!580)))

(declare-fun lt!407783 () Unit!18953)

(assert (=> d!90136 (= lt!407783 (choose!30 lt!407625 w1!584 w2!580))))

(assert (=> d!90136 (isPrefixOf!0 lt!407625 w1!584)))

(assert (=> d!90136 (= (lemmaIsPrefixTransitive!0 lt!407625 w1!584 w2!580) lt!407783)))

(declare-fun bs!22891 () Bool)

(assert (= bs!22891 d!90136))

(assert (=> bs!22891 m!397919))

(declare-fun m!398117 () Bool)

(assert (=> bs!22891 m!398117))

(assert (=> bs!22891 m!397951))

(assert (=> b!266970 d!90136))

(assert (=> b!266972 d!90118))

(declare-fun d!90138 () Bool)

(assert (=> d!90138 (arrayBitRangesEq!0 (buf!6953 w2!580) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631)))

(declare-fun lt!407792 () Unit!18953)

(declare-fun choose!8 (array!14875 array!14875 (_ BitVec 64) (_ BitVec 64)) Unit!18953)

(assert (=> d!90138 (= lt!407792 (choose!8 (buf!6953 w1!584) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631))))

(assert (=> d!90138 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631))))

(assert (=> d!90138 (= (arrayBitRangesEqSymmetric!0 (buf!6953 w1!584) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631) lt!407792)))

(declare-fun bs!22892 () Bool)

(assert (= bs!22892 d!90138))

(assert (=> bs!22892 m!397957))

(declare-fun m!398153 () Bool)

(assert (=> bs!22892 m!398153))

(assert (=> b!266972 d!90138))

(declare-fun b!267192 () Bool)

(declare-fun res!223112 () Bool)

(declare-fun lt!407824 () (_ BitVec 32))

(assert (=> b!267192 (= res!223112 (= lt!407824 #b00000000000000000000000000000000))))

(declare-fun e!187040 () Bool)

(assert (=> b!267192 (=> res!223112 e!187040)))

(declare-fun e!187042 () Bool)

(assert (=> b!267192 (= e!187042 e!187040)))

(declare-datatypes ((tuple4!400 0))(
  ( (tuple4!401 (_1!12182 (_ BitVec 32)) (_2!12182 (_ BitVec 32)) (_3!980 (_ BitVec 32)) (_4!200 (_ BitVec 32))) )
))
(declare-fun lt!407825 () tuple4!400)

(declare-fun b!267193 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267193 (= e!187040 (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407825)) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407825)) #b00000000000000000000000000000000 lt!407824))))

(declare-fun bm!4191 () Bool)

(declare-fun lt!407823 () (_ BitVec 32))

(declare-fun c!12325 () Bool)

(declare-fun call!4194 () Bool)

(assert (=> bm!4191 (= call!4194 (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407825)) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407825)) lt!407823 (ite c!12325 lt!407824 #b00000000000000000000000000001000)))))

(declare-fun d!90146 () Bool)

(declare-fun res!223113 () Bool)

(declare-fun e!187043 () Bool)

(assert (=> d!90146 (=> res!223113 e!187043)))

(assert (=> d!90146 (= res!223113 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631))))

(assert (=> d!90146 (= (arrayBitRangesEq!0 (buf!6953 w2!580) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631) e!187043)))

(declare-fun e!187038 () Bool)

(declare-fun b!267194 () Bool)

(declare-fun arrayRangesEq!1036 (array!14875 array!14875 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267194 (= e!187038 (arrayRangesEq!1036 (buf!6953 w2!580) (buf!6953 w1!584) (_1!12182 lt!407825) (_2!12182 lt!407825)))))

(declare-fun b!267195 () Bool)

(declare-fun e!187039 () Bool)

(declare-fun e!187041 () Bool)

(assert (=> b!267195 (= e!187039 e!187041)))

(assert (=> b!267195 (= c!12325 (= (_3!980 lt!407825) (_4!200 lt!407825)))))

(declare-fun b!267196 () Bool)

(assert (=> b!267196 (= e!187041 call!4194)))

(declare-fun b!267197 () Bool)

(assert (=> b!267197 (= e!187043 e!187039)))

(declare-fun res!223115 () Bool)

(assert (=> b!267197 (=> (not res!223115) (not e!187039))))

(assert (=> b!267197 (= res!223115 e!187038)))

(declare-fun res!223116 () Bool)

(assert (=> b!267197 (=> res!223116 e!187038)))

(assert (=> b!267197 (= res!223116 (bvsge (_1!12182 lt!407825) (_2!12182 lt!407825)))))

(assert (=> b!267197 (= lt!407824 ((_ extract 31 0) (bvsrem lt!407631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267197 (= lt!407823 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!400)

(assert (=> b!267197 (= lt!407825 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631))))

(declare-fun b!267198 () Bool)

(assert (=> b!267198 (= e!187041 e!187042)))

(declare-fun res!223114 () Bool)

(assert (=> b!267198 (= res!223114 call!4194)))

(assert (=> b!267198 (=> (not res!223114) (not e!187042))))

(assert (= (and d!90146 (not res!223113)) b!267197))

(assert (= (and b!267197 (not res!223116)) b!267194))

(assert (= (and b!267197 res!223115) b!267195))

(assert (= (and b!267195 c!12325) b!267196))

(assert (= (and b!267195 (not c!12325)) b!267198))

(assert (= (and b!267198 res!223114) b!267192))

(assert (= (and b!267192 (not res!223112)) b!267193))

(assert (= (or b!267196 b!267198) bm!4191))

(declare-fun m!398207 () Bool)

(assert (=> b!267193 m!398207))

(declare-fun m!398209 () Bool)

(assert (=> b!267193 m!398209))

(assert (=> b!267193 m!398207))

(assert (=> b!267193 m!398209))

(declare-fun m!398211 () Bool)

(assert (=> b!267193 m!398211))

(declare-fun m!398213 () Bool)

(assert (=> bm!4191 m!398213))

(declare-fun m!398215 () Bool)

(assert (=> bm!4191 m!398215))

(assert (=> bm!4191 m!398213))

(assert (=> bm!4191 m!398215))

(declare-fun m!398217 () Bool)

(assert (=> bm!4191 m!398217))

(declare-fun m!398219 () Bool)

(assert (=> b!267194 m!398219))

(declare-fun m!398221 () Bool)

(assert (=> b!267197 m!398221))

(assert (=> b!266972 d!90146))

(declare-fun d!90196 () Bool)

(declare-fun res!223118 () Bool)

(declare-fun e!187044 () Bool)

(assert (=> d!90196 (=> (not res!223118) (not e!187044))))

(assert (=> d!90196 (= res!223118 (= (size!6485 (buf!6953 w1!584)) (size!6485 (buf!6953 w2!580))))))

(assert (=> d!90196 (= (isPrefixOf!0 w1!584 w2!580) e!187044)))

(declare-fun b!267199 () Bool)

(declare-fun res!223119 () Bool)

(assert (=> b!267199 (=> (not res!223119) (not e!187044))))

(assert (=> b!267199 (= res!223119 (bvsle (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))

(declare-fun b!267200 () Bool)

(declare-fun e!187045 () Bool)

(assert (=> b!267200 (= e!187044 e!187045)))

(declare-fun res!223117 () Bool)

(assert (=> b!267200 (=> res!223117 e!187045)))

(assert (=> b!267200 (= res!223117 (= (size!6485 (buf!6953 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!267201 () Bool)

(assert (=> b!267201 (= e!187045 (arrayBitRangesEq!0 (buf!6953 w1!584) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(assert (= (and d!90196 res!223118) b!267199))

(assert (= (and b!267199 res!223119) b!267200))

(assert (= (and b!267200 (not res!223117)) b!267201))

(assert (=> b!267199 m!397917))

(assert (=> b!267199 m!397921))

(assert (=> b!267201 m!397917))

(assert (=> b!267201 m!397917))

(assert (=> b!267201 m!397927))

(assert (=> start!58106 d!90196))

(declare-fun d!90198 () Bool)

(assert (=> d!90198 (= (inv!12 w1!584) (invariant!0 (currentBit!12845 w1!584) (currentByte!12850 w1!584) (size!6485 (buf!6953 w1!584))))))

(declare-fun bs!22903 () Bool)

(assert (= bs!22903 d!90198))

(assert (=> bs!22903 m!398067))

(assert (=> start!58106 d!90198))

(declare-fun d!90200 () Bool)

(assert (=> d!90200 (= (inv!12 w2!580) (invariant!0 (currentBit!12845 w2!580) (currentByte!12850 w2!580) (size!6485 (buf!6953 w2!580))))))

(declare-fun bs!22904 () Bool)

(assert (= bs!22904 d!90200))

(assert (=> bs!22904 m!398061))

(assert (=> start!58106 d!90200))

(declare-fun b!267202 () Bool)

(declare-fun res!223120 () Bool)

(declare-fun lt!407827 () (_ BitVec 32))

(assert (=> b!267202 (= res!223120 (= lt!407827 #b00000000000000000000000000000000))))

(declare-fun e!187048 () Bool)

(assert (=> b!267202 (=> res!223120 e!187048)))

(declare-fun e!187050 () Bool)

(assert (=> b!267202 (= e!187050 e!187048)))

(declare-fun lt!407828 () tuple4!400)

(declare-fun b!267203 () Bool)

(assert (=> b!267203 (= e!187048 (byteRangesEq!0 (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407828)) (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407828)) #b00000000000000000000000000000000 lt!407827))))

(declare-fun lt!407826 () (_ BitVec 32))

(declare-fun call!4195 () Bool)

(declare-fun bm!4192 () Bool)

(declare-fun c!12326 () Bool)

(assert (=> bm!4192 (= call!4195 (byteRangesEq!0 (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407828)) (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407828)) lt!407826 (ite c!12326 lt!407827 #b00000000000000000000000000001000)))))

(declare-fun d!90202 () Bool)

(declare-fun res!223121 () Bool)

(declare-fun e!187051 () Bool)

(assert (=> d!90202 (=> res!223121 e!187051)))

(assert (=> d!90202 (= res!223121 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(assert (=> d!90202 (= (arrayBitRangesEq!0 (buf!6953 w1!584) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))) e!187051)))

(declare-fun b!267204 () Bool)

(declare-fun e!187046 () Bool)

(assert (=> b!267204 (= e!187046 (arrayRangesEq!1036 (buf!6953 w1!584) (buf!6953 w2!580) (_1!12182 lt!407828) (_2!12182 lt!407828)))))

(declare-fun b!267205 () Bool)

(declare-fun e!187047 () Bool)

(declare-fun e!187049 () Bool)

(assert (=> b!267205 (= e!187047 e!187049)))

(assert (=> b!267205 (= c!12326 (= (_3!980 lt!407828) (_4!200 lt!407828)))))

(declare-fun b!267206 () Bool)

(assert (=> b!267206 (= e!187049 call!4195)))

(declare-fun b!267207 () Bool)

(assert (=> b!267207 (= e!187051 e!187047)))

(declare-fun res!223123 () Bool)

(assert (=> b!267207 (=> (not res!223123) (not e!187047))))

(assert (=> b!267207 (= res!223123 e!187046)))

(declare-fun res!223124 () Bool)

(assert (=> b!267207 (=> res!223124 e!187046)))

(assert (=> b!267207 (= res!223124 (bvsge (_1!12182 lt!407828) (_2!12182 lt!407828)))))

(assert (=> b!267207 (= lt!407827 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267207 (= lt!407826 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267207 (= lt!407828 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(declare-fun b!267208 () Bool)

(assert (=> b!267208 (= e!187049 e!187050)))

(declare-fun res!223122 () Bool)

(assert (=> b!267208 (= res!223122 call!4195)))

(assert (=> b!267208 (=> (not res!223122) (not e!187050))))

(assert (= (and d!90202 (not res!223121)) b!267207))

(assert (= (and b!267207 (not res!223124)) b!267204))

(assert (= (and b!267207 res!223123) b!267205))

(assert (= (and b!267205 c!12326) b!267206))

(assert (= (and b!267205 (not c!12326)) b!267208))

(assert (= (and b!267208 res!223122) b!267202))

(assert (= (and b!267202 (not res!223120)) b!267203))

(assert (= (or b!267206 b!267208) bm!4192))

(declare-fun m!398223 () Bool)

(assert (=> b!267203 m!398223))

(declare-fun m!398225 () Bool)

(assert (=> b!267203 m!398225))

(assert (=> b!267203 m!398223))

(assert (=> b!267203 m!398225))

(declare-fun m!398227 () Bool)

(assert (=> b!267203 m!398227))

(declare-fun m!398229 () Bool)

(assert (=> bm!4192 m!398229))

(declare-fun m!398231 () Bool)

(assert (=> bm!4192 m!398231))

(assert (=> bm!4192 m!398229))

(assert (=> bm!4192 m!398231))

(declare-fun m!398233 () Bool)

(assert (=> bm!4192 m!398233))

(declare-fun m!398235 () Bool)

(assert (=> b!267204 m!398235))

(assert (=> b!267207 m!397917))

(declare-fun m!398237 () Bool)

(assert (=> b!267207 m!398237))

(assert (=> b!266977 d!90202))

(assert (=> b!266977 d!90118))

(declare-fun d!90204 () Bool)

(assert (=> d!90204 (= (array_inv!6209 (buf!6953 w1!584)) (bvsge (size!6485 (buf!6953 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!266978 d!90204))

(declare-fun b!267209 () Bool)

(declare-fun res!223125 () Bool)

(declare-fun lt!407830 () (_ BitVec 32))

(assert (=> b!267209 (= res!223125 (= lt!407830 #b00000000000000000000000000000000))))

(declare-fun e!187054 () Bool)

(assert (=> b!267209 (=> res!223125 e!187054)))

(declare-fun e!187056 () Bool)

(assert (=> b!267209 (= e!187056 e!187054)))

(declare-fun lt!407831 () tuple4!400)

(declare-fun b!267210 () Bool)

(assert (=> b!267210 (= e!187054 (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407831)) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407831)) #b00000000000000000000000000000000 lt!407830))))

(declare-fun call!4196 () Bool)

(declare-fun c!12327 () Bool)

(declare-fun bm!4193 () Bool)

(declare-fun lt!407829 () (_ BitVec 32))

(assert (=> bm!4193 (= call!4196 (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407831)) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407831)) lt!407829 (ite c!12327 lt!407830 #b00000000000000000000000000001000)))))

(declare-fun d!90206 () Bool)

(declare-fun res!223126 () Bool)

(declare-fun e!187057 () Bool)

(assert (=> d!90206 (=> res!223126 e!187057)))

(assert (=> d!90206 (= res!223126 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(assert (=> d!90206 (= (arrayBitRangesEq!0 (buf!6953 w2!580) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))) e!187057)))

(declare-fun b!267211 () Bool)

(declare-fun e!187052 () Bool)

(assert (=> b!267211 (= e!187052 (arrayRangesEq!1036 (buf!6953 w2!580) (buf!6953 w1!584) (_1!12182 lt!407831) (_2!12182 lt!407831)))))

(declare-fun b!267212 () Bool)

(declare-fun e!187053 () Bool)

(declare-fun e!187055 () Bool)

(assert (=> b!267212 (= e!187053 e!187055)))

(assert (=> b!267212 (= c!12327 (= (_3!980 lt!407831) (_4!200 lt!407831)))))

(declare-fun b!267213 () Bool)

(assert (=> b!267213 (= e!187055 call!4196)))

(declare-fun b!267214 () Bool)

(assert (=> b!267214 (= e!187057 e!187053)))

(declare-fun res!223128 () Bool)

(assert (=> b!267214 (=> (not res!223128) (not e!187053))))

(assert (=> b!267214 (= res!223128 e!187052)))

(declare-fun res!223129 () Bool)

(assert (=> b!267214 (=> res!223129 e!187052)))

(assert (=> b!267214 (= res!223129 (bvsge (_1!12182 lt!407831) (_2!12182 lt!407831)))))

(assert (=> b!267214 (= lt!407830 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267214 (= lt!407829 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267214 (= lt!407831 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(declare-fun b!267215 () Bool)

(assert (=> b!267215 (= e!187055 e!187056)))

(declare-fun res!223127 () Bool)

(assert (=> b!267215 (= res!223127 call!4196)))

(assert (=> b!267215 (=> (not res!223127) (not e!187056))))

(assert (= (and d!90206 (not res!223126)) b!267214))

(assert (= (and b!267214 (not res!223129)) b!267211))

(assert (= (and b!267214 res!223128) b!267212))

(assert (= (and b!267212 c!12327) b!267213))

(assert (= (and b!267212 (not c!12327)) b!267215))

(assert (= (and b!267215 res!223127) b!267209))

(assert (= (and b!267209 (not res!223125)) b!267210))

(assert (= (or b!267213 b!267215) bm!4193))

(declare-fun m!398239 () Bool)

(assert (=> b!267210 m!398239))

(declare-fun m!398241 () Bool)

(assert (=> b!267210 m!398241))

(assert (=> b!267210 m!398239))

(assert (=> b!267210 m!398241))

(declare-fun m!398243 () Bool)

(assert (=> b!267210 m!398243))

(declare-fun m!398245 () Bool)

(assert (=> bm!4193 m!398245))

(declare-fun m!398247 () Bool)

(assert (=> bm!4193 m!398247))

(assert (=> bm!4193 m!398245))

(assert (=> bm!4193 m!398247))

(declare-fun m!398249 () Bool)

(assert (=> bm!4193 m!398249))

(declare-fun m!398251 () Bool)

(assert (=> b!267211 m!398251))

(assert (=> b!267214 m!397917))

(assert (=> b!267214 m!398237))

(assert (=> b!266973 d!90206))

(assert (=> b!266973 d!90118))

(declare-fun d!90208 () Bool)

(assert (=> d!90208 (= (array_inv!6209 (buf!6953 w2!580)) (bvsge (size!6485 (buf!6953 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!266975 d!90208))

(declare-fun d!90210 () Bool)

(declare-fun res!223131 () Bool)

(declare-fun e!187058 () Bool)

(assert (=> d!90210 (=> (not res!223131) (not e!187058))))

(assert (=> d!90210 (= res!223131 (= (size!6485 (buf!6953 lt!407625)) (size!6485 (buf!6953 w1!584))))))

(assert (=> d!90210 (= (isPrefixOf!0 lt!407625 w1!584) e!187058)))

(declare-fun b!267216 () Bool)

(declare-fun res!223132 () Bool)

(assert (=> b!267216 (=> (not res!223132) (not e!187058))))

(assert (=> b!267216 (= res!223132 (bvsle (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625)) (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(declare-fun b!267217 () Bool)

(declare-fun e!187059 () Bool)

(assert (=> b!267217 (= e!187058 e!187059)))

(declare-fun res!223130 () Bool)

(assert (=> b!267217 (=> res!223130 e!187059)))

(assert (=> b!267217 (= res!223130 (= (size!6485 (buf!6953 lt!407625)) #b00000000000000000000000000000000))))

(declare-fun b!267218 () Bool)

(assert (=> b!267218 (= e!187059 (arrayBitRangesEq!0 (buf!6953 lt!407625) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(assert (= (and d!90210 res!223131) b!267216))

(assert (= (and b!267216 res!223132) b!267217))

(assert (= (and b!267217 (not res!223130)) b!267218))

(assert (=> b!267216 m!398011))

(assert (=> b!267216 m!397917))

(assert (=> b!267218 m!398011))

(assert (=> b!267218 m!398011))

(declare-fun m!398253 () Bool)

(assert (=> b!267218 m!398253))

(assert (=> b!266974 d!90210))

(check-sat (not b!267214) (not b!267199) (not b!267075) (not b!267203) (not bm!4193) (not b!267197) (not bm!4191) (not b!267193) (not d!90200) (not b!267027) (not b!267207) (not b!267216) (not b!267077) (not b!267211) (not d!90138) (not d!90092) (not b!267194) (not b!267201) (not b!267218) (not b!267021) (not bm!4192) (not d!90198) (not d!90098) (not b!267210) (not d!90120) (not d!90104) (not d!90086) (not d!90082) (not b!267026) (not b!267023) (not b!267204) (not d!90118) (not b!267024) (not d!90136) (not b!267029))
(check-sat)
(get-model)

(assert (=> b!267201 d!90202))

(assert (=> b!267201 d!90118))

(declare-fun d!90274 () Bool)

(assert (=> d!90274 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))) (tuple4!401 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!267214 d!90274))

(declare-fun d!90276 () Bool)

(declare-fun e!187111 () Bool)

(assert (=> d!90276 e!187111))

(declare-fun res!223181 () Bool)

(assert (=> d!90276 (=> (not res!223181) (not e!187111))))

(declare-fun lt!407880 () (_ BitVec 64))

(declare-fun lt!407884 () (_ BitVec 64))

(declare-fun lt!407882 () (_ BitVec 64))

(assert (=> d!90276 (= res!223181 (= lt!407882 (bvsub lt!407884 lt!407880)))))

(assert (=> d!90276 (or (= (bvand lt!407884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407880 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407884 lt!407880) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90276 (= lt!407880 (remainingBits!0 ((_ sign_extend 32) (size!6485 (buf!6953 lt!407781))) ((_ sign_extend 32) (currentByte!12850 lt!407781)) ((_ sign_extend 32) (currentBit!12845 lt!407781))))))

(declare-fun lt!407881 () (_ BitVec 64))

(declare-fun lt!407883 () (_ BitVec 64))

(assert (=> d!90276 (= lt!407884 (bvmul lt!407881 lt!407883))))

(assert (=> d!90276 (or (= lt!407881 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407883 (bvsdiv (bvmul lt!407881 lt!407883) lt!407881)))))

(assert (=> d!90276 (= lt!407883 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90276 (= lt!407881 ((_ sign_extend 32) (size!6485 (buf!6953 lt!407781))))))

(assert (=> d!90276 (= lt!407882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12850 lt!407781)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12845 lt!407781))))))

(assert (=> d!90276 (invariant!0 (currentBit!12845 lt!407781) (currentByte!12850 lt!407781) (size!6485 (buf!6953 lt!407781)))))

(assert (=> d!90276 (= (bitIndex!0 (size!6485 (buf!6953 lt!407781)) (currentByte!12850 lt!407781) (currentBit!12845 lt!407781)) lt!407882)))

(declare-fun b!267278 () Bool)

(declare-fun res!223182 () Bool)

(assert (=> b!267278 (=> (not res!223182) (not e!187111))))

(assert (=> b!267278 (= res!223182 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407882))))

(declare-fun b!267279 () Bool)

(declare-fun lt!407885 () (_ BitVec 64))

(assert (=> b!267279 (= e!187111 (bvsle lt!407882 (bvmul lt!407885 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267279 (or (= lt!407885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407885)))))

(assert (=> b!267279 (= lt!407885 ((_ sign_extend 32) (size!6485 (buf!6953 lt!407781))))))

(assert (= (and d!90276 res!223181) b!267278))

(assert (= (and b!267278 res!223182) b!267279))

(declare-fun m!398365 () Bool)

(assert (=> d!90276 m!398365))

(declare-fun m!398367 () Bool)

(assert (=> d!90276 m!398367))

(assert (=> d!90120 d!90276))

(assert (=> d!90120 d!90104))

(declare-fun d!90278 () Bool)

(declare-fun lt!407900 () (_ BitVec 32))

(assert (=> d!90278 (= lt!407900 ((_ extract 31 0) (bvsrem (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!407902 () (_ BitVec 32))

(assert (=> d!90278 (= lt!407902 ((_ extract 31 0) (bvsdiv (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!187116 () Bool)

(assert (=> d!90278 e!187116))

(declare-fun res!223187 () Bool)

(assert (=> d!90278 (=> (not res!223187) (not e!187116))))

(assert (=> d!90278 (= res!223187 (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))))))

(declare-fun Unit!18965 () Unit!18953)

(declare-fun Unit!18966 () Unit!18953)

(declare-fun Unit!18967 () Unit!18953)

(assert (=> d!90278 (= (moveBitIndex!0 w2!580 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))) (ite (bvslt (bvadd (currentBit!12845 w2!580) lt!407900) #b00000000000000000000000000000000) (tuple2!22403 Unit!18965 (BitStream!11785 (buf!6953 w2!580) (bvsub (bvadd (currentByte!12850 w2!580) lt!407902) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!407900 (currentBit!12845 w2!580)))) (ite (bvsge (bvadd (currentBit!12845 w2!580) lt!407900) #b00000000000000000000000000001000) (tuple2!22403 Unit!18966 (BitStream!11785 (buf!6953 w2!580) (bvadd (currentByte!12850 w2!580) lt!407902 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!12845 w2!580) lt!407900) #b00000000000000000000000000001000))) (tuple2!22403 Unit!18967 (BitStream!11785 (buf!6953 w2!580) (bvadd (currentByte!12850 w2!580) lt!407902) (bvadd (currentBit!12845 w2!580) lt!407900))))))))

(declare-fun b!267284 () Bool)

(declare-fun e!187117 () Bool)

(assert (=> b!267284 (= e!187116 e!187117)))

(declare-fun res!223188 () Bool)

(assert (=> b!267284 (=> (not res!223188) (not e!187117))))

(declare-fun lt!407903 () tuple2!22402)

(declare-fun lt!407898 () (_ BitVec 64))

(assert (=> b!267284 (= res!223188 (= (bvadd lt!407898 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))) (bitIndex!0 (size!6485 (buf!6953 (_2!12181 lt!407903))) (currentByte!12850 (_2!12181 lt!407903)) (currentBit!12845 (_2!12181 lt!407903)))))))

(assert (=> b!267284 (or (not (= (bvand lt!407898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!407898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!407898 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!267284 (= lt!407898 (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))))

(declare-fun lt!407899 () (_ BitVec 32))

(declare-fun lt!407901 () (_ BitVec 32))

(declare-fun Unit!18968 () Unit!18953)

(declare-fun Unit!18969 () Unit!18953)

(declare-fun Unit!18970 () Unit!18953)

(assert (=> b!267284 (= lt!407903 (ite (bvslt (bvadd (currentBit!12845 w2!580) lt!407899) #b00000000000000000000000000000000) (tuple2!22403 Unit!18968 (BitStream!11785 (buf!6953 w2!580) (bvsub (bvadd (currentByte!12850 w2!580) lt!407901) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!407899 (currentBit!12845 w2!580)))) (ite (bvsge (bvadd (currentBit!12845 w2!580) lt!407899) #b00000000000000000000000000001000) (tuple2!22403 Unit!18969 (BitStream!11785 (buf!6953 w2!580) (bvadd (currentByte!12850 w2!580) lt!407901 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!12845 w2!580) lt!407899) #b00000000000000000000000000001000))) (tuple2!22403 Unit!18970 (BitStream!11785 (buf!6953 w2!580) (bvadd (currentByte!12850 w2!580) lt!407901) (bvadd (currentBit!12845 w2!580) lt!407899))))))))

(assert (=> b!267284 (= lt!407899 ((_ extract 31 0) (bvsrem (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267284 (= lt!407901 ((_ extract 31 0) (bvsdiv (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!267285 () Bool)

(assert (=> b!267285 (= e!187117 (and (= (size!6485 (buf!6953 w2!580)) (size!6485 (buf!6953 (_2!12181 lt!407903)))) (= (buf!6953 w2!580) (buf!6953 (_2!12181 lt!407903)))))))

(assert (= (and d!90278 res!223187) b!267284))

(assert (= (and b!267284 res!223188) b!267285))

(assert (=> d!90278 m!398115))

(declare-fun m!398369 () Bool)

(assert (=> b!267284 m!398369))

(assert (=> b!267284 m!397921))

(assert (=> d!90120 d!90278))

(declare-fun d!90282 () Bool)

(declare-fun res!223191 () Bool)

(declare-fun e!187120 () Bool)

(assert (=> d!90282 (=> (not res!223191) (not e!187120))))

(assert (=> d!90282 (= res!223191 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6485 (buf!6953 w2!580)))) (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))) (bvsle (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6485 (buf!6953 w2!580)))))))))

(assert (=> d!90282 (= (moveBitIndexPrecond!0 w2!580 (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))) e!187120)))

(declare-fun b!267289 () Bool)

(declare-fun lt!407906 () (_ BitVec 64))

(assert (=> b!267289 (= e!187120 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407906) (bvsle lt!407906 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6485 (buf!6953 w2!580)))))))))

(assert (=> b!267289 (= lt!407906 (bvadd (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)) (bvsub (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)))))))

(assert (= (and d!90282 res!223191) b!267289))

(assert (=> b!267289 m!397921))

(assert (=> d!90120 d!90282))

(assert (=> d!90092 d!90088))

(declare-fun d!90284 () Bool)

(assert (=> d!90284 (isPrefixOf!0 lt!407625 lt!407625)))

(assert (=> d!90284 true))

(declare-fun _$14!336 () Unit!18953)

(assert (=> d!90284 (= (choose!11 lt!407625) _$14!336)))

(declare-fun bs!22919 () Bool)

(assert (= bs!22919 d!90284))

(assert (=> bs!22919 m!397937))

(assert (=> d!90092 d!90284))

(declare-fun d!90286 () Bool)

(assert (=> d!90286 (= (invariant!0 (currentBit!12845 w1!584) (currentByte!12850 w1!584) (size!6485 (buf!6953 w1!584))) (and (bvsge (currentBit!12845 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12845 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12850 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12850 w1!584) (size!6485 (buf!6953 w1!584))) (and (= (currentBit!12845 w1!584) #b00000000000000000000000000000000) (= (currentByte!12850 w1!584) (size!6485 (buf!6953 w1!584)))))))))

(assert (=> d!90198 d!90286))

(assert (=> b!267199 d!90118))

(assert (=> b!267199 d!90104))

(assert (=> d!90098 d!90116))

(declare-fun d!90288 () Bool)

(assert (=> d!90288 (isPrefixOf!0 lt!407625 w2!580)))

(assert (=> d!90288 true))

(declare-fun _$15!346 () Unit!18953)

(assert (=> d!90288 (= (choose!30 lt!407625 w2!580 w2!580) _$15!346)))

(declare-fun bs!22920 () Bool)

(assert (= bs!22920 d!90288))

(assert (=> bs!22920 m!397919))

(assert (=> d!90098 d!90288))

(assert (=> d!90138 d!90146))

(declare-fun d!90290 () Bool)

(assert (=> d!90290 (arrayBitRangesEq!0 (buf!6953 w2!580) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631)))

(assert (=> d!90290 true))

(declare-fun _$19!210 () Unit!18953)

(assert (=> d!90290 (= (choose!8 (buf!6953 w1!584) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631) _$19!210)))

(declare-fun bs!22921 () Bool)

(assert (= bs!22921 d!90290))

(assert (=> bs!22921 m!397957))

(assert (=> d!90138 d!90290))

(declare-fun d!90292 () Bool)

(assert (=> d!90292 (= (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407831)) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407831)) #b00000000000000000000000000000000 lt!407830) (or (= #b00000000000000000000000000000000 lt!407830) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407831))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407831))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407830))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22922 () Bool)

(assert (= bs!22922 d!90292))

(declare-fun m!398371 () Bool)

(assert (=> bs!22922 m!398371))

(declare-fun m!398373 () Bool)

(assert (=> bs!22922 m!398373))

(assert (=> b!267210 d!90292))

(declare-fun d!90294 () Bool)

(assert (=> d!90294 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!407631) (tuple4!401 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!407631 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!407631 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!267197 d!90294))

(assert (=> b!267207 d!90274))

(declare-fun b!267290 () Bool)

(declare-fun res!223192 () Bool)

(declare-fun lt!407908 () (_ BitVec 32))

(assert (=> b!267290 (= res!223192 (= lt!407908 #b00000000000000000000000000000000))))

(declare-fun e!187123 () Bool)

(assert (=> b!267290 (=> res!223192 e!187123)))

(declare-fun e!187125 () Bool)

(assert (=> b!267290 (= e!187125 e!187123)))

(declare-fun lt!407909 () tuple4!400)

(declare-fun b!267291 () Bool)

(assert (=> b!267291 (= e!187123 (byteRangesEq!0 (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407909)) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407909)) #b00000000000000000000000000000000 lt!407908))))

(declare-fun lt!407907 () (_ BitVec 32))

(declare-fun c!12333 () Bool)

(declare-fun call!4202 () Bool)

(declare-fun bm!4199 () Bool)

(assert (=> bm!4199 (= call!4202 (byteRangesEq!0 (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407909)) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407909)) lt!407907 (ite c!12333 lt!407908 #b00000000000000000000000000001000)))))

(declare-fun d!90296 () Bool)

(declare-fun res!223193 () Bool)

(declare-fun e!187126 () Bool)

(assert (=> d!90296 (=> res!223193 e!187126)))

(assert (=> d!90296 (= res!223193 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(assert (=> d!90296 (= (arrayBitRangesEq!0 (buf!6953 w1!584) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))) e!187126)))

(declare-fun b!267292 () Bool)

(declare-fun e!187121 () Bool)

(assert (=> b!267292 (= e!187121 (arrayRangesEq!1036 (buf!6953 w1!584) (buf!6953 w1!584) (_1!12182 lt!407909) (_2!12182 lt!407909)))))

(declare-fun b!267293 () Bool)

(declare-fun e!187122 () Bool)

(declare-fun e!187124 () Bool)

(assert (=> b!267293 (= e!187122 e!187124)))

(assert (=> b!267293 (= c!12333 (= (_3!980 lt!407909) (_4!200 lt!407909)))))

(declare-fun b!267294 () Bool)

(assert (=> b!267294 (= e!187124 call!4202)))

(declare-fun b!267295 () Bool)

(assert (=> b!267295 (= e!187126 e!187122)))

(declare-fun res!223195 () Bool)

(assert (=> b!267295 (=> (not res!223195) (not e!187122))))

(assert (=> b!267295 (= res!223195 e!187121)))

(declare-fun res!223196 () Bool)

(assert (=> b!267295 (=> res!223196 e!187121)))

(assert (=> b!267295 (= res!223196 (bvsge (_1!12182 lt!407909) (_2!12182 lt!407909)))))

(assert (=> b!267295 (= lt!407908 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267295 (= lt!407907 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267295 (= lt!407909 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w1!584)) (currentByte!12850 w1!584) (currentBit!12845 w1!584))))))

(declare-fun b!267296 () Bool)

(assert (=> b!267296 (= e!187124 e!187125)))

(declare-fun res!223194 () Bool)

(assert (=> b!267296 (= res!223194 call!4202)))

(assert (=> b!267296 (=> (not res!223194) (not e!187125))))

(assert (= (and d!90296 (not res!223193)) b!267295))

(assert (= (and b!267295 (not res!223196)) b!267292))

(assert (= (and b!267295 res!223195) b!267293))

(assert (= (and b!267293 c!12333) b!267294))

(assert (= (and b!267293 (not c!12333)) b!267296))

(assert (= (and b!267296 res!223194) b!267290))

(assert (= (and b!267290 (not res!223192)) b!267291))

(assert (= (or b!267294 b!267296) bm!4199))

(declare-fun m!398375 () Bool)

(assert (=> b!267291 m!398375))

(assert (=> b!267291 m!398375))

(assert (=> b!267291 m!398375))

(assert (=> b!267291 m!398375))

(declare-fun m!398377 () Bool)

(assert (=> b!267291 m!398377))

(declare-fun m!398379 () Bool)

(assert (=> bm!4199 m!398379))

(assert (=> bm!4199 m!398379))

(assert (=> bm!4199 m!398379))

(assert (=> bm!4199 m!398379))

(declare-fun m!398381 () Bool)

(assert (=> bm!4199 m!398381))

(declare-fun m!398383 () Bool)

(assert (=> b!267292 m!398383))

(assert (=> b!267295 m!397917))

(assert (=> b!267295 m!398237))

(assert (=> b!267026 d!90296))

(assert (=> b!267026 d!90118))

(declare-fun d!90298 () Bool)

(assert (=> d!90298 (= (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407831)) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407831)) lt!407829 (ite c!12327 lt!407830 #b00000000000000000000000000001000)) (or (= lt!407829 (ite c!12327 lt!407830 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407831))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12327 lt!407830 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407829)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407831))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12327 lt!407830 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407829)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22923 () Bool)

(assert (= bs!22923 d!90298))

(declare-fun m!398385 () Bool)

(assert (=> bs!22923 m!398385))

(declare-fun m!398387 () Bool)

(assert (=> bs!22923 m!398387))

(assert (=> bm!4193 d!90298))

(declare-fun d!90300 () Bool)

(declare-fun res!223201 () Bool)

(declare-fun e!187131 () Bool)

(assert (=> d!90300 (=> res!223201 e!187131)))

(assert (=> d!90300 (= res!223201 (= (_1!12182 lt!407831) (_2!12182 lt!407831)))))

(assert (=> d!90300 (= (arrayRangesEq!1036 (buf!6953 w2!580) (buf!6953 w1!584) (_1!12182 lt!407831) (_2!12182 lt!407831)) e!187131)))

(declare-fun b!267301 () Bool)

(declare-fun e!187132 () Bool)

(assert (=> b!267301 (= e!187131 e!187132)))

(declare-fun res!223202 () Bool)

(assert (=> b!267301 (=> (not res!223202) (not e!187132))))

(assert (=> b!267301 (= res!223202 (= (select (arr!7472 (buf!6953 w2!580)) (_1!12182 lt!407831)) (select (arr!7472 (buf!6953 w1!584)) (_1!12182 lt!407831))))))

(declare-fun b!267302 () Bool)

(assert (=> b!267302 (= e!187132 (arrayRangesEq!1036 (buf!6953 w2!580) (buf!6953 w1!584) (bvadd (_1!12182 lt!407831) #b00000000000000000000000000000001) (_2!12182 lt!407831)))))

(assert (= (and d!90300 (not res!223201)) b!267301))

(assert (= (and b!267301 res!223202) b!267302))

(declare-fun m!398389 () Bool)

(assert (=> b!267301 m!398389))

(declare-fun m!398391 () Bool)

(assert (=> b!267301 m!398391))

(declare-fun m!398393 () Bool)

(assert (=> b!267302 m!398393))

(assert (=> b!267211 d!90300))

(declare-fun b!267303 () Bool)

(declare-fun res!223203 () Bool)

(declare-fun lt!407911 () (_ BitVec 32))

(assert (=> b!267303 (= res!223203 (= lt!407911 #b00000000000000000000000000000000))))

(declare-fun e!187135 () Bool)

(assert (=> b!267303 (=> res!223203 e!187135)))

(declare-fun e!187137 () Bool)

(assert (=> b!267303 (= e!187137 e!187135)))

(declare-fun lt!407912 () tuple4!400)

(declare-fun b!267304 () Bool)

(assert (=> b!267304 (= e!187135 (byteRangesEq!0 (select (arr!7472 (buf!6953 lt!407625)) (_4!200 lt!407912)) (select (arr!7472 (buf!6953 lt!407625)) (_4!200 lt!407912)) #b00000000000000000000000000000000 lt!407911))))

(declare-fun lt!407910 () (_ BitVec 32))

(declare-fun bm!4200 () Bool)

(declare-fun c!12334 () Bool)

(declare-fun call!4203 () Bool)

(assert (=> bm!4200 (= call!4203 (byteRangesEq!0 (select (arr!7472 (buf!6953 lt!407625)) (_3!980 lt!407912)) (select (arr!7472 (buf!6953 lt!407625)) (_3!980 lt!407912)) lt!407910 (ite c!12334 lt!407911 #b00000000000000000000000000001000)))))

(declare-fun d!90302 () Bool)

(declare-fun res!223204 () Bool)

(declare-fun e!187138 () Bool)

(assert (=> d!90302 (=> res!223204 e!187138)))

(assert (=> d!90302 (= res!223204 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(assert (=> d!90302 (= (arrayBitRangesEq!0 (buf!6953 lt!407625) (buf!6953 lt!407625) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))) e!187138)))

(declare-fun b!267305 () Bool)

(declare-fun e!187133 () Bool)

(assert (=> b!267305 (= e!187133 (arrayRangesEq!1036 (buf!6953 lt!407625) (buf!6953 lt!407625) (_1!12182 lt!407912) (_2!12182 lt!407912)))))

(declare-fun b!267306 () Bool)

(declare-fun e!187134 () Bool)

(declare-fun e!187136 () Bool)

(assert (=> b!267306 (= e!187134 e!187136)))

(assert (=> b!267306 (= c!12334 (= (_3!980 lt!407912) (_4!200 lt!407912)))))

(declare-fun b!267307 () Bool)

(assert (=> b!267307 (= e!187136 call!4203)))

(declare-fun b!267308 () Bool)

(assert (=> b!267308 (= e!187138 e!187134)))

(declare-fun res!223206 () Bool)

(assert (=> b!267308 (=> (not res!223206) (not e!187134))))

(assert (=> b!267308 (= res!223206 e!187133)))

(declare-fun res!223207 () Bool)

(assert (=> b!267308 (=> res!223207 e!187133)))

(assert (=> b!267308 (= res!223207 (bvsge (_1!12182 lt!407912) (_2!12182 lt!407912)))))

(assert (=> b!267308 (= lt!407911 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267308 (= lt!407910 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267308 (= lt!407912 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(declare-fun b!267309 () Bool)

(assert (=> b!267309 (= e!187136 e!187137)))

(declare-fun res!223205 () Bool)

(assert (=> b!267309 (= res!223205 call!4203)))

(assert (=> b!267309 (=> (not res!223205) (not e!187137))))

(assert (= (and d!90302 (not res!223204)) b!267308))

(assert (= (and b!267308 (not res!223207)) b!267305))

(assert (= (and b!267308 res!223206) b!267306))

(assert (= (and b!267306 c!12334) b!267307))

(assert (= (and b!267306 (not c!12334)) b!267309))

(assert (= (and b!267309 res!223205) b!267303))

(assert (= (and b!267303 (not res!223203)) b!267304))

(assert (= (or b!267307 b!267309) bm!4200))

(declare-fun m!398395 () Bool)

(assert (=> b!267304 m!398395))

(assert (=> b!267304 m!398395))

(assert (=> b!267304 m!398395))

(assert (=> b!267304 m!398395))

(declare-fun m!398397 () Bool)

(assert (=> b!267304 m!398397))

(declare-fun m!398399 () Bool)

(assert (=> bm!4200 m!398399))

(assert (=> bm!4200 m!398399))

(assert (=> bm!4200 m!398399))

(assert (=> bm!4200 m!398399))

(declare-fun m!398401 () Bool)

(assert (=> bm!4200 m!398401))

(declare-fun m!398403 () Bool)

(assert (=> b!267305 m!398403))

(assert (=> b!267308 m!398011))

(declare-fun m!398405 () Bool)

(assert (=> b!267308 m!398405))

(assert (=> b!267023 d!90302))

(declare-fun d!90304 () Bool)

(declare-fun e!187139 () Bool)

(assert (=> d!90304 e!187139))

(declare-fun res!223208 () Bool)

(assert (=> d!90304 (=> (not res!223208) (not e!187139))))

(declare-fun lt!407913 () (_ BitVec 64))

(declare-fun lt!407915 () (_ BitVec 64))

(declare-fun lt!407917 () (_ BitVec 64))

(assert (=> d!90304 (= res!223208 (= lt!407915 (bvsub lt!407917 lt!407913)))))

(assert (=> d!90304 (or (= (bvand lt!407917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!407917 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!407917 lt!407913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90304 (= lt!407913 (remainingBits!0 ((_ sign_extend 32) (size!6485 (buf!6953 lt!407625))) ((_ sign_extend 32) (currentByte!12850 lt!407625)) ((_ sign_extend 32) (currentBit!12845 lt!407625))))))

(declare-fun lt!407914 () (_ BitVec 64))

(declare-fun lt!407916 () (_ BitVec 64))

(assert (=> d!90304 (= lt!407917 (bvmul lt!407914 lt!407916))))

(assert (=> d!90304 (or (= lt!407914 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!407916 (bvsdiv (bvmul lt!407914 lt!407916) lt!407914)))))

(assert (=> d!90304 (= lt!407916 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90304 (= lt!407914 ((_ sign_extend 32) (size!6485 (buf!6953 lt!407625))))))

(assert (=> d!90304 (= lt!407915 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12850 lt!407625)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12845 lt!407625))))))

(assert (=> d!90304 (invariant!0 (currentBit!12845 lt!407625) (currentByte!12850 lt!407625) (size!6485 (buf!6953 lt!407625)))))

(assert (=> d!90304 (= (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625)) lt!407915)))

(declare-fun b!267310 () Bool)

(declare-fun res!223209 () Bool)

(assert (=> b!267310 (=> (not res!223209) (not e!187139))))

(assert (=> b!267310 (= res!223209 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!407915))))

(declare-fun b!267311 () Bool)

(declare-fun lt!407918 () (_ BitVec 64))

(assert (=> b!267311 (= e!187139 (bvsle lt!407915 (bvmul lt!407918 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267311 (or (= lt!407918 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!407918 #b0000000000000000000000000000000000000000000000000000000000001000) lt!407918)))))

(assert (=> b!267311 (= lt!407918 ((_ sign_extend 32) (size!6485 (buf!6953 lt!407625))))))

(assert (= (and d!90304 res!223208) b!267310))

(assert (= (and b!267310 res!223209) b!267311))

(declare-fun m!398407 () Bool)

(assert (=> d!90304 m!398407))

(declare-fun m!398409 () Bool)

(assert (=> d!90304 m!398409))

(assert (=> b!267023 d!90304))

(assert (=> b!267024 d!90118))

(declare-fun d!90306 () Bool)

(declare-fun res!223210 () Bool)

(declare-fun e!187140 () Bool)

(assert (=> d!90306 (=> res!223210 e!187140)))

(assert (=> d!90306 (= res!223210 (= (_1!12182 lt!407828) (_2!12182 lt!407828)))))

(assert (=> d!90306 (= (arrayRangesEq!1036 (buf!6953 w1!584) (buf!6953 w2!580) (_1!12182 lt!407828) (_2!12182 lt!407828)) e!187140)))

(declare-fun b!267312 () Bool)

(declare-fun e!187141 () Bool)

(assert (=> b!267312 (= e!187140 e!187141)))

(declare-fun res!223211 () Bool)

(assert (=> b!267312 (=> (not res!223211) (not e!187141))))

(assert (=> b!267312 (= res!223211 (= (select (arr!7472 (buf!6953 w1!584)) (_1!12182 lt!407828)) (select (arr!7472 (buf!6953 w2!580)) (_1!12182 lt!407828))))))

(declare-fun b!267313 () Bool)

(assert (=> b!267313 (= e!187141 (arrayRangesEq!1036 (buf!6953 w1!584) (buf!6953 w2!580) (bvadd (_1!12182 lt!407828) #b00000000000000000000000000000001) (_2!12182 lt!407828)))))

(assert (= (and d!90306 (not res!223210)) b!267312))

(assert (= (and b!267312 res!223211) b!267313))

(declare-fun m!398411 () Bool)

(assert (=> b!267312 m!398411))

(declare-fun m!398413 () Bool)

(assert (=> b!267312 m!398413))

(declare-fun m!398415 () Bool)

(assert (=> b!267313 m!398415))

(assert (=> b!267204 d!90306))

(assert (=> b!267021 d!90304))

(assert (=> d!90136 d!90116))

(declare-fun d!90308 () Bool)

(assert (=> d!90308 (isPrefixOf!0 lt!407625 w2!580)))

(assert (=> d!90308 true))

(declare-fun _$15!347 () Unit!18953)

(assert (=> d!90308 (= (choose!30 lt!407625 w1!584 w2!580) _$15!347)))

(declare-fun bs!22924 () Bool)

(assert (= bs!22924 d!90308))

(assert (=> bs!22924 m!397919))

(assert (=> d!90136 d!90308))

(assert (=> d!90136 d!90210))

(declare-fun d!90310 () Bool)

(assert (=> d!90310 (= (remainingBits!0 ((_ sign_extend 32) (size!6485 (buf!6953 w1!584))) ((_ sign_extend 32) (currentByte!12850 w1!584)) ((_ sign_extend 32) (currentBit!12845 w1!584))) (bvsub (bvmul ((_ sign_extend 32) (size!6485 (buf!6953 w1!584))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12850 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12845 w1!584)))))))

(assert (=> d!90118 d!90310))

(assert (=> d!90118 d!90286))

(declare-fun d!90312 () Bool)

(assert (=> d!90312 (= (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407825)) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407825)) #b00000000000000000000000000000000 lt!407824) (or (= #b00000000000000000000000000000000 lt!407824) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407825))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407824))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407825))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407824))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22925 () Bool)

(assert (= bs!22925 d!90312))

(declare-fun m!398417 () Bool)

(assert (=> bs!22925 m!398417))

(assert (=> bs!22925 m!398373))

(assert (=> b!267193 d!90312))

(assert (=> b!267216 d!90304))

(assert (=> b!267216 d!90118))

(declare-fun b!267314 () Bool)

(declare-fun res!223212 () Bool)

(declare-fun lt!407920 () (_ BitVec 32))

(assert (=> b!267314 (= res!223212 (= lt!407920 #b00000000000000000000000000000000))))

(declare-fun e!187144 () Bool)

(assert (=> b!267314 (=> res!223212 e!187144)))

(declare-fun e!187146 () Bool)

(assert (=> b!267314 (= e!187146 e!187144)))

(declare-fun lt!407921 () tuple4!400)

(declare-fun b!267315 () Bool)

(assert (=> b!267315 (= e!187144 (byteRangesEq!0 (select (arr!7472 (buf!6953 lt!407625)) (_4!200 lt!407921)) (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407921)) #b00000000000000000000000000000000 lt!407920))))

(declare-fun lt!407919 () (_ BitVec 32))

(declare-fun bm!4201 () Bool)

(declare-fun c!12335 () Bool)

(declare-fun call!4204 () Bool)

(assert (=> bm!4201 (= call!4204 (byteRangesEq!0 (select (arr!7472 (buf!6953 lt!407625)) (_3!980 lt!407921)) (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407921)) lt!407919 (ite c!12335 lt!407920 #b00000000000000000000000000001000)))))

(declare-fun d!90314 () Bool)

(declare-fun res!223213 () Bool)

(declare-fun e!187147 () Bool)

(assert (=> d!90314 (=> res!223213 e!187147)))

(assert (=> d!90314 (= res!223213 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(assert (=> d!90314 (= (arrayBitRangesEq!0 (buf!6953 lt!407625) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))) e!187147)))

(declare-fun e!187142 () Bool)

(declare-fun b!267316 () Bool)

(assert (=> b!267316 (= e!187142 (arrayRangesEq!1036 (buf!6953 lt!407625) (buf!6953 w2!580) (_1!12182 lt!407921) (_2!12182 lt!407921)))))

(declare-fun b!267317 () Bool)

(declare-fun e!187143 () Bool)

(declare-fun e!187145 () Bool)

(assert (=> b!267317 (= e!187143 e!187145)))

(assert (=> b!267317 (= c!12335 (= (_3!980 lt!407921) (_4!200 lt!407921)))))

(declare-fun b!267318 () Bool)

(assert (=> b!267318 (= e!187145 call!4204)))

(declare-fun b!267319 () Bool)

(assert (=> b!267319 (= e!187147 e!187143)))

(declare-fun res!223215 () Bool)

(assert (=> b!267319 (=> (not res!223215) (not e!187143))))

(assert (=> b!267319 (= res!223215 e!187142)))

(declare-fun res!223216 () Bool)

(assert (=> b!267319 (=> res!223216 e!187142)))

(assert (=> b!267319 (= res!223216 (bvsge (_1!12182 lt!407921) (_2!12182 lt!407921)))))

(assert (=> b!267319 (= lt!407920 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267319 (= lt!407919 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267319 (= lt!407921 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(declare-fun b!267320 () Bool)

(assert (=> b!267320 (= e!187145 e!187146)))

(declare-fun res!223214 () Bool)

(assert (=> b!267320 (= res!223214 call!4204)))

(assert (=> b!267320 (=> (not res!223214) (not e!187146))))

(assert (= (and d!90314 (not res!223213)) b!267319))

(assert (= (and b!267319 (not res!223216)) b!267316))

(assert (= (and b!267319 res!223215) b!267317))

(assert (= (and b!267317 c!12335) b!267318))

(assert (= (and b!267317 (not c!12335)) b!267320))

(assert (= (and b!267320 res!223214) b!267314))

(assert (= (and b!267314 (not res!223212)) b!267315))

(assert (= (or b!267318 b!267320) bm!4201))

(declare-fun m!398419 () Bool)

(assert (=> b!267315 m!398419))

(declare-fun m!398421 () Bool)

(assert (=> b!267315 m!398421))

(assert (=> b!267315 m!398419))

(assert (=> b!267315 m!398421))

(declare-fun m!398423 () Bool)

(assert (=> b!267315 m!398423))

(declare-fun m!398425 () Bool)

(assert (=> bm!4201 m!398425))

(declare-fun m!398427 () Bool)

(assert (=> bm!4201 m!398427))

(assert (=> bm!4201 m!398425))

(assert (=> bm!4201 m!398427))

(declare-fun m!398429 () Bool)

(assert (=> bm!4201 m!398429))

(declare-fun m!398431 () Bool)

(assert (=> b!267316 m!398431))

(assert (=> b!267319 m!398011))

(assert (=> b!267319 m!398405))

(assert (=> b!267077 d!90314))

(assert (=> b!267077 d!90304))

(declare-fun d!90316 () Bool)

(assert (=> d!90316 (= (invariant!0 (currentBit!12845 w2!580) (currentByte!12850 w2!580) (size!6485 (buf!6953 w2!580))) (and (bvsge (currentBit!12845 w2!580) #b00000000000000000000000000000000) (bvslt (currentBit!12845 w2!580) #b00000000000000000000000000001000) (bvsge (currentByte!12850 w2!580) #b00000000000000000000000000000000) (or (bvslt (currentByte!12850 w2!580) (size!6485 (buf!6953 w2!580))) (and (= (currentBit!12845 w2!580) #b00000000000000000000000000000000) (= (currentByte!12850 w2!580) (size!6485 (buf!6953 w2!580)))))))))

(assert (=> d!90200 d!90316))

(declare-fun d!90318 () Bool)

(assert (=> d!90318 (= (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407825)) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407825)) lt!407823 (ite c!12325 lt!407824 #b00000000000000000000000000001000)) (or (= lt!407823 (ite c!12325 lt!407824 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407825))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12325 lt!407824 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407823)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407825))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12325 lt!407824 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407823)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22926 () Bool)

(assert (= bs!22926 d!90318))

(declare-fun m!398433 () Bool)

(assert (=> bs!22926 m!398433))

(declare-fun m!398435 () Bool)

(assert (=> bs!22926 m!398435))

(assert (=> bm!4191 d!90318))

(declare-fun d!90320 () Bool)

(assert (=> d!90320 (= (byteRangesEq!0 (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407828)) (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407828)) #b00000000000000000000000000000000 lt!407827) (or (= #b00000000000000000000000000000000 lt!407827) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407828))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407827))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407828))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!407827))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22927 () Bool)

(assert (= bs!22927 d!90320))

(declare-fun m!398437 () Bool)

(assert (=> bs!22927 m!398437))

(assert (=> bs!22927 m!398373))

(assert (=> b!267203 d!90320))

(assert (=> d!90082 d!90096))

(declare-fun d!90322 () Bool)

(assert (=> d!90322 (isPrefixOf!0 w2!580 w2!580)))

(assert (=> d!90322 true))

(declare-fun _$14!337 () Unit!18953)

(assert (=> d!90322 (= (choose!11 w2!580) _$14!337)))

(declare-fun bs!22928 () Bool)

(assert (= bs!22928 d!90322))

(assert (=> bs!22928 m!397941))

(assert (=> d!90082 d!90322))

(declare-fun d!90324 () Bool)

(declare-fun res!223217 () Bool)

(declare-fun e!187148 () Bool)

(assert (=> d!90324 (=> res!223217 e!187148)))

(assert (=> d!90324 (= res!223217 (= (_1!12182 lt!407825) (_2!12182 lt!407825)))))

(assert (=> d!90324 (= (arrayRangesEq!1036 (buf!6953 w2!580) (buf!6953 w1!584) (_1!12182 lt!407825) (_2!12182 lt!407825)) e!187148)))

(declare-fun b!267321 () Bool)

(declare-fun e!187149 () Bool)

(assert (=> b!267321 (= e!187148 e!187149)))

(declare-fun res!223218 () Bool)

(assert (=> b!267321 (=> (not res!223218) (not e!187149))))

(assert (=> b!267321 (= res!223218 (= (select (arr!7472 (buf!6953 w2!580)) (_1!12182 lt!407825)) (select (arr!7472 (buf!6953 w1!584)) (_1!12182 lt!407825))))))

(declare-fun b!267322 () Bool)

(assert (=> b!267322 (= e!187149 (arrayRangesEq!1036 (buf!6953 w2!580) (buf!6953 w1!584) (bvadd (_1!12182 lt!407825) #b00000000000000000000000000000001) (_2!12182 lt!407825)))))

(assert (= (and d!90324 (not res!223217)) b!267321))

(assert (= (and b!267321 res!223218) b!267322))

(declare-fun m!398439 () Bool)

(assert (=> b!267321 m!398439))

(declare-fun m!398441 () Bool)

(assert (=> b!267321 m!398441))

(declare-fun m!398443 () Bool)

(assert (=> b!267322 m!398443))

(assert (=> b!267194 d!90324))

(declare-fun d!90326 () Bool)

(assert (=> d!90326 (= (byteRangesEq!0 (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407828)) (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407828)) lt!407826 (ite c!12326 lt!407827 #b00000000000000000000000000001000)) (or (= lt!407826 (ite c!12326 lt!407827 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407828))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12326 lt!407827 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407826)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407828))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12326 lt!407827 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!407826)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22929 () Bool)

(assert (= bs!22929 d!90326))

(declare-fun m!398445 () Bool)

(assert (=> bs!22929 m!398445))

(declare-fun m!398447 () Bool)

(assert (=> bs!22929 m!398447))

(assert (=> bm!4192 d!90326))

(declare-fun b!267323 () Bool)

(declare-fun res!223219 () Bool)

(declare-fun lt!407923 () (_ BitVec 32))

(assert (=> b!267323 (= res!223219 (= lt!407923 #b00000000000000000000000000000000))))

(declare-fun e!187152 () Bool)

(assert (=> b!267323 (=> res!223219 e!187152)))

(declare-fun e!187154 () Bool)

(assert (=> b!267323 (= e!187154 e!187152)))

(declare-fun lt!407924 () tuple4!400)

(declare-fun b!267324 () Bool)

(assert (=> b!267324 (= e!187152 (byteRangesEq!0 (select (arr!7472 (buf!6953 lt!407625)) (_4!200 lt!407924)) (select (arr!7472 (buf!6953 w1!584)) (_4!200 lt!407924)) #b00000000000000000000000000000000 lt!407923))))

(declare-fun c!12336 () Bool)

(declare-fun lt!407922 () (_ BitVec 32))

(declare-fun call!4205 () Bool)

(declare-fun bm!4202 () Bool)

(assert (=> bm!4202 (= call!4205 (byteRangesEq!0 (select (arr!7472 (buf!6953 lt!407625)) (_3!980 lt!407924)) (select (arr!7472 (buf!6953 w1!584)) (_3!980 lt!407924)) lt!407922 (ite c!12336 lt!407923 #b00000000000000000000000000001000)))))

(declare-fun d!90328 () Bool)

(declare-fun res!223220 () Bool)

(declare-fun e!187155 () Bool)

(assert (=> d!90328 (=> res!223220 e!187155)))

(assert (=> d!90328 (= res!223220 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(assert (=> d!90328 (= (arrayBitRangesEq!0 (buf!6953 lt!407625) (buf!6953 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))) e!187155)))

(declare-fun b!267325 () Bool)

(declare-fun e!187150 () Bool)

(assert (=> b!267325 (= e!187150 (arrayRangesEq!1036 (buf!6953 lt!407625) (buf!6953 w1!584) (_1!12182 lt!407924) (_2!12182 lt!407924)))))

(declare-fun b!267326 () Bool)

(declare-fun e!187151 () Bool)

(declare-fun e!187153 () Bool)

(assert (=> b!267326 (= e!187151 e!187153)))

(assert (=> b!267326 (= c!12336 (= (_3!980 lt!407924) (_4!200 lt!407924)))))

(declare-fun b!267327 () Bool)

(assert (=> b!267327 (= e!187153 call!4205)))

(declare-fun b!267328 () Bool)

(assert (=> b!267328 (= e!187155 e!187151)))

(declare-fun res!223222 () Bool)

(assert (=> b!267328 (=> (not res!223222) (not e!187151))))

(assert (=> b!267328 (= res!223222 e!187150)))

(declare-fun res!223223 () Bool)

(assert (=> b!267328 (=> res!223223 e!187150)))

(assert (=> b!267328 (= res!223223 (bvsge (_1!12182 lt!407924) (_2!12182 lt!407924)))))

(assert (=> b!267328 (= lt!407923 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267328 (= lt!407922 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267328 (= lt!407924 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 lt!407625)) (currentByte!12850 lt!407625) (currentBit!12845 lt!407625))))))

(declare-fun b!267329 () Bool)

(assert (=> b!267329 (= e!187153 e!187154)))

(declare-fun res!223221 () Bool)

(assert (=> b!267329 (= res!223221 call!4205)))

(assert (=> b!267329 (=> (not res!223221) (not e!187154))))

(assert (= (and d!90328 (not res!223220)) b!267328))

(assert (= (and b!267328 (not res!223223)) b!267325))

(assert (= (and b!267328 res!223222) b!267326))

(assert (= (and b!267326 c!12336) b!267327))

(assert (= (and b!267326 (not c!12336)) b!267329))

(assert (= (and b!267329 res!223221) b!267323))

(assert (= (and b!267323 (not res!223219)) b!267324))

(assert (= (or b!267327 b!267329) bm!4202))

(declare-fun m!398449 () Bool)

(assert (=> b!267324 m!398449))

(declare-fun m!398451 () Bool)

(assert (=> b!267324 m!398451))

(assert (=> b!267324 m!398449))

(assert (=> b!267324 m!398451))

(declare-fun m!398453 () Bool)

(assert (=> b!267324 m!398453))

(declare-fun m!398455 () Bool)

(assert (=> bm!4202 m!398455))

(declare-fun m!398457 () Bool)

(assert (=> bm!4202 m!398457))

(assert (=> bm!4202 m!398455))

(assert (=> bm!4202 m!398457))

(declare-fun m!398459 () Bool)

(assert (=> bm!4202 m!398459))

(declare-fun m!398461 () Bool)

(assert (=> b!267325 m!398461))

(assert (=> b!267328 m!398011))

(assert (=> b!267328 m!398405))

(assert (=> b!267218 d!90328))

(assert (=> b!267218 d!90304))

(assert (=> b!267075 d!90304))

(assert (=> b!267075 d!90104))

(declare-fun d!90330 () Bool)

(assert (=> d!90330 (= (remainingBits!0 ((_ sign_extend 32) (size!6485 (buf!6953 w2!580))) ((_ sign_extend 32) (currentByte!12850 w2!580)) ((_ sign_extend 32) (currentBit!12845 w2!580))) (bvsub (bvmul ((_ sign_extend 32) (size!6485 (buf!6953 w2!580))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12850 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12845 w2!580)))))))

(assert (=> d!90104 d!90330))

(assert (=> d!90104 d!90316))

(declare-fun b!267330 () Bool)

(declare-fun res!223224 () Bool)

(declare-fun lt!407926 () (_ BitVec 32))

(assert (=> b!267330 (= res!223224 (= lt!407926 #b00000000000000000000000000000000))))

(declare-fun e!187158 () Bool)

(assert (=> b!267330 (=> res!223224 e!187158)))

(declare-fun e!187160 () Bool)

(assert (=> b!267330 (= e!187160 e!187158)))

(declare-fun lt!407927 () tuple4!400)

(declare-fun b!267331 () Bool)

(assert (=> b!267331 (= e!187158 (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407927)) (select (arr!7472 (buf!6953 w2!580)) (_4!200 lt!407927)) #b00000000000000000000000000000000 lt!407926))))

(declare-fun call!4206 () Bool)

(declare-fun lt!407925 () (_ BitVec 32))

(declare-fun bm!4203 () Bool)

(declare-fun c!12337 () Bool)

(assert (=> bm!4203 (= call!4206 (byteRangesEq!0 (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407927)) (select (arr!7472 (buf!6953 w2!580)) (_3!980 lt!407927)) lt!407925 (ite c!12337 lt!407926 #b00000000000000000000000000001000)))))

(declare-fun d!90332 () Bool)

(declare-fun res!223225 () Bool)

(declare-fun e!187161 () Bool)

(assert (=> d!90332 (=> res!223225 e!187161)))

(assert (=> d!90332 (= res!223225 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))

(assert (=> d!90332 (= (arrayBitRangesEq!0 (buf!6953 w2!580) (buf!6953 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))) e!187161)))

(declare-fun b!267332 () Bool)

(declare-fun e!187156 () Bool)

(assert (=> b!267332 (= e!187156 (arrayRangesEq!1036 (buf!6953 w2!580) (buf!6953 w2!580) (_1!12182 lt!407927) (_2!12182 lt!407927)))))

(declare-fun b!267333 () Bool)

(declare-fun e!187157 () Bool)

(declare-fun e!187159 () Bool)

(assert (=> b!267333 (= e!187157 e!187159)))

(assert (=> b!267333 (= c!12337 (= (_3!980 lt!407927) (_4!200 lt!407927)))))

(declare-fun b!267334 () Bool)

(assert (=> b!267334 (= e!187159 call!4206)))

(declare-fun b!267335 () Bool)

(assert (=> b!267335 (= e!187161 e!187157)))

(declare-fun res!223227 () Bool)

(assert (=> b!267335 (=> (not res!223227) (not e!187157))))

(assert (=> b!267335 (= res!223227 e!187156)))

(declare-fun res!223228 () Bool)

(assert (=> b!267335 (=> res!223228 e!187156)))

(assert (=> b!267335 (= res!223228 (bvsge (_1!12182 lt!407927) (_2!12182 lt!407927)))))

(assert (=> b!267335 (= lt!407926 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267335 (= lt!407925 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267335 (= lt!407927 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6485 (buf!6953 w2!580)) (currentByte!12850 w2!580) (currentBit!12845 w2!580))))))

(declare-fun b!267336 () Bool)

(assert (=> b!267336 (= e!187159 e!187160)))

(declare-fun res!223226 () Bool)

(assert (=> b!267336 (= res!223226 call!4206)))

(assert (=> b!267336 (=> (not res!223226) (not e!187160))))

(assert (= (and d!90332 (not res!223225)) b!267335))

(assert (= (and b!267335 (not res!223228)) b!267332))

(assert (= (and b!267335 res!223227) b!267333))

(assert (= (and b!267333 c!12337) b!267334))

(assert (= (and b!267333 (not c!12337)) b!267336))

(assert (= (and b!267336 res!223226) b!267330))

(assert (= (and b!267330 (not res!223224)) b!267331))

(assert (= (or b!267334 b!267336) bm!4203))

(declare-fun m!398463 () Bool)

(assert (=> b!267331 m!398463))

(assert (=> b!267331 m!398463))

(assert (=> b!267331 m!398463))

(assert (=> b!267331 m!398463))

(declare-fun m!398465 () Bool)

(assert (=> b!267331 m!398465))

(declare-fun m!398467 () Bool)

(assert (=> bm!4203 m!398467))

(assert (=> bm!4203 m!398467))

(assert (=> bm!4203 m!398467))

(assert (=> bm!4203 m!398467))

(declare-fun m!398469 () Bool)

(assert (=> bm!4203 m!398469))

(declare-fun m!398471 () Bool)

(assert (=> b!267332 m!398471))

(assert (=> b!267335 m!397921))

(declare-fun m!398473 () Bool)

(assert (=> b!267335 m!398473))

(assert (=> b!267029 d!90332))

(assert (=> b!267029 d!90104))

(assert (=> d!90086 d!90094))

(declare-fun d!90334 () Bool)

(assert (=> d!90334 (isPrefixOf!0 w1!584 w1!584)))

(assert (=> d!90334 true))

(declare-fun _$14!338 () Unit!18953)

(assert (=> d!90334 (= (choose!11 w1!584) _$14!338)))

(declare-fun bs!22930 () Bool)

(assert (= bs!22930 d!90334))

(assert (=> bs!22930 m!397939))

(assert (=> d!90086 d!90334))

(assert (=> b!267027 d!90104))

(check-sat (not b!267316) (not bm!4202) (not b!267319) (not b!267304) (not b!267289) (not d!90288) (not bm!4199) (not b!267302) (not d!90284) (not d!90276) (not bm!4201) (not d!90304) (not b!267295) (not d!90322) (not bm!4200) (not d!90278) (not b!267322) (not b!267313) (not b!267324) (not b!267308) (not b!267332) (not b!267291) (not bm!4203) (not b!267335) (not b!267315) (not b!267305) (not d!90308) (not b!267331) (not b!267284) (not b!267292) (not d!90334) (not d!90290) (not b!267328) (not b!267325))
(check-sat)
