; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57978 () Bool)

(assert start!57978)

(declare-fun e!185995 () Bool)

(declare-fun b!266046 () Bool)

(declare-fun lt!406855 () (_ BitVec 64))

(declare-datatypes ((array!14825 0))(
  ( (array!14826 (arr!7450 (Array (_ BitVec 32) (_ BitVec 8))) (size!6463 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11740 0))(
  ( (BitStream!11741 (buf!6931 array!14825) (currentByte!12822 (_ BitVec 32)) (currentBit!12817 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11740)

(declare-fun w1!584 () BitStream!11740)

(assert (=> b!266046 (= e!185995 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!406855) (not (= (size!6463 (buf!6931 w1!584)) (size!6463 (buf!6931 w2!580)))) (bvsle lt!406855 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6463 (buf!6931 w1!584)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266046 (= lt!406855 (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584)))))

(declare-fun b!266048 () Bool)

(declare-fun res!222287 () Bool)

(assert (=> b!266048 (=> res!222287 e!185995)))

(assert (=> b!266048 (= res!222287 (= (size!6463 (buf!6931 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266049 () Bool)

(declare-fun e!185996 () Bool)

(declare-fun array_inv!6187 (array!14825) Bool)

(assert (=> b!266049 (= e!185996 (array_inv!6187 (buf!6931 w1!584)))))

(declare-fun b!266050 () Bool)

(declare-fun e!185992 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14825 array!14825 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266050 (= e!185992 (not (arrayBitRangesEq!0 (buf!6931 w1!584) (buf!6931 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584)))))))

(declare-fun b!266051 () Bool)

(declare-fun e!185994 () Bool)

(assert (=> b!266051 (= e!185994 (not e!185995))))

(declare-fun res!222288 () Bool)

(assert (=> b!266051 (=> res!222288 e!185995)))

(assert (=> b!266051 (= res!222288 e!185992)))

(declare-fun res!222286 () Bool)

(assert (=> b!266051 (=> (not res!222286) (not e!185992))))

(assert (=> b!266051 (= res!222286 (not (= (size!6463 (buf!6931 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11740 BitStream!11740) Bool)

(assert (=> b!266051 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18893 0))(
  ( (Unit!18894) )
))
(declare-fun lt!406859 () Unit!18893)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11740) Unit!18893)

(assert (=> b!266051 (= lt!406859 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!406857 () BitStream!11740)

(assert (=> b!266051 (isPrefixOf!0 lt!406857 lt!406857)))

(declare-fun lt!406856 () Unit!18893)

(assert (=> b!266051 (= lt!406856 (lemmaIsPrefixRefl!0 lt!406857))))

(assert (=> b!266051 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406858 () Unit!18893)

(assert (=> b!266051 (= lt!406858 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266051 (= lt!406857 (BitStream!11741 (buf!6931 w2!580) (currentByte!12822 w1!584) (currentBit!12817 w1!584)))))

(declare-fun res!222289 () Bool)

(assert (=> start!57978 (=> (not res!222289) (not e!185994))))

(assert (=> start!57978 (= res!222289 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57978 e!185994))

(declare-fun inv!12 (BitStream!11740) Bool)

(assert (=> start!57978 (and (inv!12 w1!584) e!185996)))

(declare-fun e!185997 () Bool)

(assert (=> start!57978 (and (inv!12 w2!580) e!185997)))

(declare-fun b!266047 () Bool)

(assert (=> b!266047 (= e!185997 (array_inv!6187 (buf!6931 w2!580)))))

(assert (= (and start!57978 res!222289) b!266051))

(assert (= (and b!266051 res!222286) b!266050))

(assert (= (and b!266051 (not res!222288)) b!266048))

(assert (= (and b!266048 (not res!222287)) b!266046))

(assert (= start!57978 b!266049))

(assert (= start!57978 b!266047))

(declare-fun m!396803 () Bool)

(assert (=> b!266051 m!396803))

(declare-fun m!396805 () Bool)

(assert (=> b!266051 m!396805))

(declare-fun m!396807 () Bool)

(assert (=> b!266051 m!396807))

(declare-fun m!396809 () Bool)

(assert (=> b!266051 m!396809))

(declare-fun m!396811 () Bool)

(assert (=> b!266051 m!396811))

(declare-fun m!396813 () Bool)

(assert (=> b!266051 m!396813))

(declare-fun m!396815 () Bool)

(assert (=> b!266049 m!396815))

(declare-fun m!396817 () Bool)

(assert (=> b!266050 m!396817))

(assert (=> b!266050 m!396817))

(declare-fun m!396819 () Bool)

(assert (=> b!266050 m!396819))

(assert (=> b!266046 m!396817))

(declare-fun m!396821 () Bool)

(assert (=> b!266047 m!396821))

(declare-fun m!396823 () Bool)

(assert (=> start!57978 m!396823))

(declare-fun m!396825 () Bool)

(assert (=> start!57978 m!396825))

(declare-fun m!396827 () Bool)

(assert (=> start!57978 m!396827))

(push 1)

(assert (not b!266046))

(assert (not b!266051))

(assert (not b!266049))

(assert (not b!266047))

(assert (not b!266050))

(assert (not start!57978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89862 () Bool)

(assert (=> d!89862 (= (array_inv!6187 (buf!6931 w1!584)) (bvsge (size!6463 (buf!6931 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!266049 d!89862))

(declare-fun d!89864 () Bool)

(declare-fun res!222321 () Bool)

(declare-fun e!186044 () Bool)

(assert (=> d!89864 (=> (not res!222321) (not e!186044))))

(assert (=> d!89864 (= res!222321 (= (size!6463 (buf!6931 w1!584)) (size!6463 (buf!6931 w2!580))))))

(assert (=> d!89864 (= (isPrefixOf!0 w1!584 w2!580) e!186044)))

(declare-fun b!266094 () Bool)

(declare-fun res!222322 () Bool)

(assert (=> b!266094 (=> (not res!222322) (not e!186044))))

(assert (=> b!266094 (= res!222322 (bvsle (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584)) (bitIndex!0 (size!6463 (buf!6931 w2!580)) (currentByte!12822 w2!580) (currentBit!12817 w2!580))))))

(declare-fun b!266095 () Bool)

(declare-fun e!186045 () Bool)

(assert (=> b!266095 (= e!186044 e!186045)))

(declare-fun res!222320 () Bool)

(assert (=> b!266095 (=> res!222320 e!186045)))

(assert (=> b!266095 (= res!222320 (= (size!6463 (buf!6931 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266096 () Bool)

(assert (=> b!266096 (= e!186045 (arrayBitRangesEq!0 (buf!6931 w1!584) (buf!6931 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584))))))

(assert (= (and d!89864 res!222321) b!266094))

(assert (= (and b!266094 res!222322) b!266095))

(assert (= (and b!266095 (not res!222320)) b!266096))

(assert (=> b!266094 m!396817))

(declare-fun m!396881 () Bool)

(assert (=> b!266094 m!396881))

(assert (=> b!266096 m!396817))

(assert (=> b!266096 m!396817))

(assert (=> b!266096 m!396819))

(assert (=> start!57978 d!89864))

(declare-fun d!89868 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89868 (= (inv!12 w1!584) (invariant!0 (currentBit!12817 w1!584) (currentByte!12822 w1!584) (size!6463 (buf!6931 w1!584))))))

(declare-fun bs!22812 () Bool)

(assert (= bs!22812 d!89868))

(declare-fun m!396883 () Bool)

(assert (=> bs!22812 m!396883))

(assert (=> start!57978 d!89868))

(declare-fun d!89870 () Bool)

(assert (=> d!89870 (= (inv!12 w2!580) (invariant!0 (currentBit!12817 w2!580) (currentByte!12822 w2!580) (size!6463 (buf!6931 w2!580))))))

(declare-fun bs!22813 () Bool)

(assert (= bs!22813 d!89870))

(declare-fun m!396885 () Bool)

(assert (=> bs!22813 m!396885))

(assert (=> start!57978 d!89870))

(declare-fun b!266135 () Bool)

(declare-fun e!186078 () Bool)

(declare-fun e!186080 () Bool)

(assert (=> b!266135 (= e!186078 e!186080)))

(declare-fun res!222363 () Bool)

(assert (=> b!266135 (=> (not res!222363) (not e!186080))))

(declare-fun e!186076 () Bool)

(assert (=> b!266135 (= res!222363 e!186076)))

(declare-fun res!222362 () Bool)

(assert (=> b!266135 (=> res!222362 e!186076)))

(declare-datatypes ((tuple4!384 0))(
  ( (tuple4!385 (_1!12172 (_ BitVec 32)) (_2!12172 (_ BitVec 32)) (_3!972 (_ BitVec 32)) (_4!192 (_ BitVec 32))) )
))
(declare-fun lt!406929 () tuple4!384)

(assert (=> b!266135 (= res!222362 (bvsge (_1!12172 lt!406929) (_2!12172 lt!406929)))))

(declare-fun lt!406927 () (_ BitVec 32))

(assert (=> b!266135 (= lt!406927 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!406928 () (_ BitVec 32))

(assert (=> b!266135 (= lt!406928 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!384)

(assert (=> b!266135 (= lt!406929 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584))))))

(declare-fun b!266136 () Bool)

(declare-fun e!186075 () Bool)

(declare-fun e!186077 () Bool)

(assert (=> b!266136 (= e!186075 e!186077)))

(declare-fun res!222360 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266136 (= res!222360 (byteRangesEq!0 (select (arr!7450 (buf!6931 w1!584)) (_3!972 lt!406929)) (select (arr!7450 (buf!6931 w2!580)) (_3!972 lt!406929)) lt!406928 #b00000000000000000000000000001000))))

(assert (=> b!266136 (=> (not res!222360) (not e!186077))))

(declare-fun b!266137 () Bool)

(declare-fun call!4160 () Bool)

(assert (=> b!266137 (= e!186075 call!4160)))

(declare-fun b!266138 () Bool)

(declare-fun e!186079 () Bool)

(assert (=> b!266138 (= e!186079 call!4160)))

(declare-fun d!89872 () Bool)

(declare-fun res!222359 () Bool)

(assert (=> d!89872 (=> res!222359 e!186078)))

(assert (=> d!89872 (= res!222359 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584))))))

(assert (=> d!89872 (= (arrayBitRangesEq!0 (buf!6931 w1!584) (buf!6931 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584))) e!186078)))

(declare-fun b!266139 () Bool)

(assert (=> b!266139 (= e!186080 e!186075)))

(declare-fun c!12237 () Bool)

(assert (=> b!266139 (= c!12237 (= (_3!972 lt!406929) (_4!192 lt!406929)))))

(declare-fun b!266140 () Bool)

(declare-fun res!222361 () Bool)

(assert (=> b!266140 (= res!222361 (= lt!406927 #b00000000000000000000000000000000))))

(assert (=> b!266140 (=> res!222361 e!186079)))

(assert (=> b!266140 (= e!186077 e!186079)))

(declare-fun b!266141 () Bool)

(declare-fun arrayRangesEq!1029 (array!14825 array!14825 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!266141 (= e!186076 (arrayRangesEq!1029 (buf!6931 w1!584) (buf!6931 w2!580) (_1!12172 lt!406929) (_2!12172 lt!406929)))))

(declare-fun bm!4157 () Bool)

(assert (=> bm!4157 (= call!4160 (byteRangesEq!0 (ite c!12237 (select (arr!7450 (buf!6931 w1!584)) (_3!972 lt!406929)) (select (arr!7450 (buf!6931 w1!584)) (_4!192 lt!406929))) (ite c!12237 (select (arr!7450 (buf!6931 w2!580)) (_3!972 lt!406929)) (select (arr!7450 (buf!6931 w2!580)) (_4!192 lt!406929))) (ite c!12237 lt!406928 #b00000000000000000000000000000000) lt!406927))))

(assert (= (and d!89872 (not res!222359)) b!266135))

(assert (= (and b!266135 (not res!222362)) b!266141))

(assert (= (and b!266135 res!222363) b!266139))

(assert (= (and b!266139 c!12237) b!266137))

(assert (= (and b!266139 (not c!12237)) b!266136))

(assert (= (and b!266136 res!222360) b!266140))

(assert (= (and b!266140 (not res!222361)) b!266138))

(assert (= (or b!266137 b!266138) bm!4157))

(assert (=> b!266135 m!396817))

(declare-fun m!396911 () Bool)

(assert (=> b!266135 m!396911))

(declare-fun m!396913 () Bool)

(assert (=> b!266136 m!396913))

(declare-fun m!396915 () Bool)

(assert (=> b!266136 m!396915))

(assert (=> b!266136 m!396913))

(assert (=> b!266136 m!396915))

(declare-fun m!396917 () Bool)

(assert (=> b!266136 m!396917))

(declare-fun m!396919 () Bool)

(assert (=> b!266141 m!396919))

(declare-fun m!396921 () Bool)

(assert (=> bm!4157 m!396921))

(declare-fun m!396923 () Bool)

(assert (=> bm!4157 m!396923))

(declare-fun m!396925 () Bool)

(assert (=> bm!4157 m!396925))

(assert (=> bm!4157 m!396915))

(assert (=> bm!4157 m!396913))

(assert (=> b!266050 d!89872))

(declare-fun d!89904 () Bool)

(declare-fun e!186118 () Bool)

(assert (=> d!89904 e!186118))

(declare-fun res!222403 () Bool)

(assert (=> d!89904 (=> (not res!222403) (not e!186118))))

(declare-fun lt!406970 () (_ BitVec 64))

(declare-fun lt!406967 () (_ BitVec 64))

(declare-fun lt!406971 () (_ BitVec 64))

(assert (=> d!89904 (= res!222403 (= lt!406971 (bvsub lt!406967 lt!406970)))))

(assert (=> d!89904 (or (= (bvand lt!406967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!406970 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!406967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!406967 lt!406970) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89904 (= lt!406970 (remainingBits!0 ((_ sign_extend 32) (size!6463 (buf!6931 w1!584))) ((_ sign_extend 32) (currentByte!12822 w1!584)) ((_ sign_extend 32) (currentBit!12817 w1!584))))))

(declare-fun lt!406968 () (_ BitVec 64))

(declare-fun lt!406972 () (_ BitVec 64))

(assert (=> d!89904 (= lt!406967 (bvmul lt!406968 lt!406972))))

(assert (=> d!89904 (or (= lt!406968 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406972 (bvsdiv (bvmul lt!406968 lt!406972) lt!406968)))))

(assert (=> d!89904 (= lt!406972 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89904 (= lt!406968 ((_ sign_extend 32) (size!6463 (buf!6931 w1!584))))))

(assert (=> d!89904 (= lt!406971 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12822 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12817 w1!584))))))

(assert (=> d!89904 (invariant!0 (currentBit!12817 w1!584) (currentByte!12822 w1!584) (size!6463 (buf!6931 w1!584)))))

(assert (=> d!89904 (= (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584)) lt!406971)))

(declare-fun b!266193 () Bool)

(declare-fun res!222404 () Bool)

(assert (=> b!266193 (=> (not res!222404) (not e!186118))))

(assert (=> b!266193 (= res!222404 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!406971))))

(declare-fun b!266194 () Bool)

(declare-fun lt!406969 () (_ BitVec 64))

(assert (=> b!266194 (= e!186118 (bvsle lt!406971 (bvmul lt!406969 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!266194 (or (= lt!406969 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!406969 #b0000000000000000000000000000000000000000000000000000000000001000) lt!406969)))))

(assert (=> b!266194 (= lt!406969 ((_ sign_extend 32) (size!6463 (buf!6931 w1!584))))))

(assert (= (and d!89904 res!222403) b!266193))

(assert (= (and b!266193 res!222404) b!266194))

(declare-fun m!396945 () Bool)

(assert (=> d!89904 m!396945))

(assert (=> d!89904 m!396883))

(assert (=> b!266050 d!89904))

(declare-fun d!89910 () Bool)

(assert (=> d!89910 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!406978 () Unit!18893)

(declare-fun choose!11 (BitStream!11740) Unit!18893)

(assert (=> d!89910 (= lt!406978 (choose!11 w2!580))))

(assert (=> d!89910 (= (lemmaIsPrefixRefl!0 w2!580) lt!406978)))

(declare-fun bs!22823 () Bool)

(assert (= bs!22823 d!89910))

(assert (=> bs!22823 m!396807))

(declare-fun m!396967 () Bool)

(assert (=> bs!22823 m!396967))

(assert (=> b!266051 d!89910))

(declare-fun d!89918 () Bool)

(assert (=> d!89918 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!406979 () Unit!18893)

(assert (=> d!89918 (= lt!406979 (choose!11 w1!584))))

(assert (=> d!89918 (= (lemmaIsPrefixRefl!0 w1!584) lt!406979)))

(declare-fun bs!22824 () Bool)

(assert (= bs!22824 d!89918))

(assert (=> bs!22824 m!396805))

(declare-fun m!396969 () Bool)

(assert (=> bs!22824 m!396969))

(assert (=> b!266051 d!89918))

(declare-fun d!89920 () Bool)

(assert (=> d!89920 (isPrefixOf!0 lt!406857 lt!406857)))

(declare-fun lt!406980 () Unit!18893)

(assert (=> d!89920 (= lt!406980 (choose!11 lt!406857))))

(assert (=> d!89920 (= (lemmaIsPrefixRefl!0 lt!406857) lt!406980)))

(declare-fun bs!22825 () Bool)

(assert (= bs!22825 d!89920))

(assert (=> bs!22825 m!396811))

(declare-fun m!396971 () Bool)

(assert (=> bs!22825 m!396971))

(assert (=> b!266051 d!89920))

(declare-fun d!89922 () Bool)

(declare-fun res!222414 () Bool)

(declare-fun e!186127 () Bool)

(assert (=> d!89922 (=> (not res!222414) (not e!186127))))

(assert (=> d!89922 (= res!222414 (= (size!6463 (buf!6931 lt!406857)) (size!6463 (buf!6931 lt!406857))))))

(assert (=> d!89922 (= (isPrefixOf!0 lt!406857 lt!406857) e!186127)))

(declare-fun b!266205 () Bool)

(declare-fun res!222415 () Bool)

(assert (=> b!266205 (=> (not res!222415) (not e!186127))))

(assert (=> b!266205 (= res!222415 (bvsle (bitIndex!0 (size!6463 (buf!6931 lt!406857)) (currentByte!12822 lt!406857) (currentBit!12817 lt!406857)) (bitIndex!0 (size!6463 (buf!6931 lt!406857)) (currentByte!12822 lt!406857) (currentBit!12817 lt!406857))))))

(declare-fun b!266206 () Bool)

(declare-fun e!186128 () Bool)

(assert (=> b!266206 (= e!186127 e!186128)))

(declare-fun res!222413 () Bool)

(assert (=> b!266206 (=> res!222413 e!186128)))

(assert (=> b!266206 (= res!222413 (= (size!6463 (buf!6931 lt!406857)) #b00000000000000000000000000000000))))

(declare-fun b!266207 () Bool)

(assert (=> b!266207 (= e!186128 (arrayBitRangesEq!0 (buf!6931 lt!406857) (buf!6931 lt!406857) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6463 (buf!6931 lt!406857)) (currentByte!12822 lt!406857) (currentBit!12817 lt!406857))))))

(assert (= (and d!89922 res!222414) b!266205))

(assert (= (and b!266205 res!222415) b!266206))

(assert (= (and b!266206 (not res!222413)) b!266207))

(declare-fun m!396973 () Bool)

(assert (=> b!266205 m!396973))

(assert (=> b!266205 m!396973))

(assert (=> b!266207 m!396973))

(assert (=> b!266207 m!396973))

(declare-fun m!396977 () Bool)

(assert (=> b!266207 m!396977))

(assert (=> b!266051 d!89922))

(declare-fun d!89926 () Bool)

(declare-fun res!222417 () Bool)

(declare-fun e!186129 () Bool)

(assert (=> d!89926 (=> (not res!222417) (not e!186129))))

(assert (=> d!89926 (= res!222417 (= (size!6463 (buf!6931 w1!584)) (size!6463 (buf!6931 w1!584))))))

(assert (=> d!89926 (= (isPrefixOf!0 w1!584 w1!584) e!186129)))

(declare-fun b!266208 () Bool)

(declare-fun res!222418 () Bool)

(assert (=> b!266208 (=> (not res!222418) (not e!186129))))

(assert (=> b!266208 (= res!222418 (bvsle (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584)) (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584))))))

(declare-fun b!266209 () Bool)

(declare-fun e!186130 () Bool)

(assert (=> b!266209 (= e!186129 e!186130)))

(declare-fun res!222416 () Bool)

(assert (=> b!266209 (=> res!222416 e!186130)))

(assert (=> b!266209 (= res!222416 (= (size!6463 (buf!6931 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266210 () Bool)

(assert (=> b!266210 (= e!186130 (arrayBitRangesEq!0 (buf!6931 w1!584) (buf!6931 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6463 (buf!6931 w1!584)) (currentByte!12822 w1!584) (currentBit!12817 w1!584))))))

(assert (= (and d!89926 res!222417) b!266208))

(assert (= (and b!266208 res!222418) b!266209))

(assert (= (and b!266209 (not res!222416)) b!266210))

(assert (=> b!266208 m!396817))

(assert (=> b!266208 m!396817))

(assert (=> b!266210 m!396817))

(assert (=> b!266210 m!396817))

(declare-fun m!396985 () Bool)

(assert (=> b!266210 m!396985))

(assert (=> b!266051 d!89926))

(declare-fun d!89932 () Bool)

(declare-fun res!222423 () Bool)

(declare-fun e!186133 () Bool)

(assert (=> d!89932 (=> (not res!222423) (not e!186133))))

(assert (=> d!89932 (= res!222423 (= (size!6463 (buf!6931 w2!580)) (size!6463 (buf!6931 w2!580))))))

(assert (=> d!89932 (= (isPrefixOf!0 w2!580 w2!580) e!186133)))

(declare-fun b!266214 () Bool)

(declare-fun res!222424 () Bool)

(assert (=> b!266214 (=> (not res!222424) (not e!186133))))

(assert (=> b!266214 (= res!222424 (bvsle (bitIndex!0 (size!6463 (buf!6931 w2!580)) (currentByte!12822 w2!580) (currentBit!12817 w2!580)) (bitIndex!0 (size!6463 (buf!6931 w2!580)) (currentByte!12822 w2!580) (currentBit!12817 w2!580))))))

(declare-fun b!266215 () Bool)

(declare-fun e!186134 () Bool)

(assert (=> b!266215 (= e!186133 e!186134)))

(declare-fun res!222422 () Bool)

(assert (=> b!266215 (=> res!222422 e!186134)))

(assert (=> b!266215 (= res!222422 (= (size!6463 (buf!6931 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!266216 () Bool)

(assert (=> b!266216 (= e!186134 (arrayBitRangesEq!0 (buf!6931 w2!580) (buf!6931 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6463 (buf!6931 w2!580)) (currentByte!12822 w2!580) (currentBit!12817 w2!580))))))

(assert (= (and d!89932 res!222423) b!266214))

(assert (= (and b!266214 res!222424) b!266215))

(assert (= (and b!266215 (not res!222422)) b!266216))

(assert (=> b!266214 m!396881))

(assert (=> b!266214 m!396881))

(assert (=> b!266216 m!396881))

(assert (=> b!266216 m!396881))

(declare-fun m!396991 () Bool)

(assert (=> b!266216 m!396991))

(assert (=> b!266051 d!89932))

(assert (=> b!266046 d!89904))

(declare-fun d!89938 () Bool)

(assert (=> d!89938 (= (array_inv!6187 (buf!6931 w2!580)) (bvsge (size!6463 (buf!6931 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!266047 d!89938))

(push 1)

(assert (not d!89904))

(assert (not b!266207))

(assert (not b!266208))

(assert (not d!89920))

(assert (not b!266214))

(assert (not b!266216))

(assert (not d!89910))

(assert (not d!89870))

(assert (not b!266094))

(assert (not b!266210))

(assert (not b!266205))

(assert (not d!89918))

(assert (not b!266096))

(assert (not d!89868))

(assert (not bm!4157))

(assert (not b!266136))

(assert (not b!266141))

(assert (not b!266135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

