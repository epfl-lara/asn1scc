; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57346 () Bool)

(assert start!57346)

(declare-fun b!262800 () Bool)

(declare-fun e!183046 () Bool)

(declare-datatypes ((array!14661 0))(
  ( (array!14662 (arr!7386 (Array (_ BitVec 32) (_ BitVec 8))) (size!6399 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11612 0))(
  ( (BitStream!11613 (buf!6867 array!14661) (currentByte!12713 (_ BitVec 32)) (currentBit!12708 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11612)

(declare-fun array_inv!6123 (array!14661) Bool)

(assert (=> b!262800 (= e!183046 (array_inv!6123 (buf!6867 w2!580)))))

(declare-fun b!262801 () Bool)

(declare-fun e!183050 () Bool)

(declare-fun w1!584 () BitStream!11612)

(declare-fun arrayBitRangesEq!0 (array!14661 array!14661 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262801 (= e!183050 (not (arrayBitRangesEq!0 (buf!6867 w1!584) (buf!6867 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584)))))))

(declare-fun b!262802 () Bool)

(declare-fun e!183049 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262802 (= e!183049 (invariant!0 (currentBit!12708 w1!584) (currentByte!12713 w1!584) (size!6399 (buf!6867 w1!584))))))

(declare-fun b!262803 () Bool)

(declare-fun e!183047 () Bool)

(assert (=> b!262803 (= e!183047 (array_inv!6123 (buf!6867 w1!584)))))

(declare-fun b!262804 () Bool)

(declare-fun res!219908 () Bool)

(assert (=> b!262804 (=> res!219908 e!183049)))

(assert (=> b!262804 (= res!219908 (= (size!6399 (buf!6867 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262805 () Bool)

(declare-fun e!183048 () Bool)

(assert (=> b!262805 (= e!183048 (not e!183049))))

(declare-fun res!219907 () Bool)

(assert (=> b!262805 (=> res!219907 e!183049)))

(assert (=> b!262805 (= res!219907 e!183050)))

(declare-fun res!219909 () Bool)

(assert (=> b!262805 (=> (not res!219909) (not e!183050))))

(assert (=> b!262805 (= res!219909 (not (= (size!6399 (buf!6867 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11612 BitStream!11612) Bool)

(assert (=> b!262805 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18741 0))(
  ( (Unit!18742) )
))
(declare-fun lt!404401 () Unit!18741)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11612) Unit!18741)

(assert (=> b!262805 (= lt!404401 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404399 () BitStream!11612)

(assert (=> b!262805 (isPrefixOf!0 lt!404399 lt!404399)))

(declare-fun lt!404402 () Unit!18741)

(assert (=> b!262805 (= lt!404402 (lemmaIsPrefixRefl!0 lt!404399))))

(assert (=> b!262805 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404400 () Unit!18741)

(assert (=> b!262805 (= lt!404400 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262805 (= lt!404399 (BitStream!11613 (buf!6867 w2!580) (currentByte!12713 w1!584) (currentBit!12708 w1!584)))))

(declare-fun res!219910 () Bool)

(assert (=> start!57346 (=> (not res!219910) (not e!183048))))

(assert (=> start!57346 (= res!219910 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57346 e!183048))

(declare-fun inv!12 (BitStream!11612) Bool)

(assert (=> start!57346 (and (inv!12 w1!584) e!183047)))

(assert (=> start!57346 (and (inv!12 w2!580) e!183046)))

(assert (= (and start!57346 res!219910) b!262805))

(assert (= (and b!262805 res!219909) b!262801))

(assert (= (and b!262805 (not res!219907)) b!262804))

(assert (= (and b!262804 (not res!219908)) b!262802))

(assert (= start!57346 b!262803))

(assert (= start!57346 b!262800))

(declare-fun m!392983 () Bool)

(assert (=> start!57346 m!392983))

(declare-fun m!392985 () Bool)

(assert (=> start!57346 m!392985))

(declare-fun m!392987 () Bool)

(assert (=> start!57346 m!392987))

(declare-fun m!392989 () Bool)

(assert (=> b!262803 m!392989))

(declare-fun m!392991 () Bool)

(assert (=> b!262800 m!392991))

(declare-fun m!392993 () Bool)

(assert (=> b!262805 m!392993))

(declare-fun m!392995 () Bool)

(assert (=> b!262805 m!392995))

(declare-fun m!392997 () Bool)

(assert (=> b!262805 m!392997))

(declare-fun m!392999 () Bool)

(assert (=> b!262805 m!392999))

(declare-fun m!393001 () Bool)

(assert (=> b!262805 m!393001))

(declare-fun m!393003 () Bool)

(assert (=> b!262805 m!393003))

(declare-fun m!393005 () Bool)

(assert (=> b!262801 m!393005))

(assert (=> b!262801 m!393005))

(declare-fun m!393007 () Bool)

(assert (=> b!262801 m!393007))

(declare-fun m!393009 () Bool)

(assert (=> b!262802 m!393009))

(push 1)

(assert (not b!262803))

(assert (not start!57346))

(assert (not b!262800))

(assert (not b!262802))

(assert (not b!262805))

(assert (not b!262801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88702 () Bool)

(assert (=> d!88702 (= (array_inv!6123 (buf!6867 w1!584)) (bvsge (size!6399 (buf!6867 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262803 d!88702))

(declare-fun b!262829 () Bool)

(declare-fun e!183070 () Bool)

(declare-fun e!183074 () Bool)

(assert (=> b!262829 (= e!183070 e!183074)))

(declare-fun c!11997 () Bool)

(declare-datatypes ((tuple4!318 0))(
  ( (tuple4!319 (_1!12139 (_ BitVec 32)) (_2!12139 (_ BitVec 32)) (_3!939 (_ BitVec 32)) (_4!159 (_ BitVec 32))) )
))
(declare-fun lt!404415 () tuple4!318)

(assert (=> b!262829 (= c!11997 (= (_3!939 lt!404415) (_4!159 lt!404415)))))

(declare-fun lt!404414 () (_ BitVec 32))

(declare-fun call!4028 () Bool)

(declare-fun lt!404416 () (_ BitVec 32))

(declare-fun bm!4025 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4025 (= call!4028 (byteRangesEq!0 (ite c!11997 (select (arr!7386 (buf!6867 w1!584)) (_3!939 lt!404415)) (select (arr!7386 (buf!6867 w1!584)) (_4!159 lt!404415))) (ite c!11997 (select (arr!7386 (buf!6867 w2!580)) (_3!939 lt!404415)) (select (arr!7386 (buf!6867 w2!580)) (_4!159 lt!404415))) (ite c!11997 lt!404416 #b00000000000000000000000000000000) lt!404414))))

(declare-fun d!88704 () Bool)

(declare-fun res!219934 () Bool)

(declare-fun e!183071 () Bool)

(assert (=> d!88704 (=> res!219934 e!183071)))

(assert (=> d!88704 (= res!219934 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584))))))

(assert (=> d!88704 (= (arrayBitRangesEq!0 (buf!6867 w1!584) (buf!6867 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584))) e!183071)))

(declare-fun b!262830 () Bool)

(declare-fun res!219930 () Bool)

(assert (=> b!262830 (= res!219930 (= lt!404414 #b00000000000000000000000000000000))))

(declare-fun e!183073 () Bool)

(assert (=> b!262830 (=> res!219930 e!183073)))

(declare-fun e!183072 () Bool)

(assert (=> b!262830 (= e!183072 e!183073)))

(declare-fun b!262831 () Bool)

(assert (=> b!262831 (= e!183073 call!4028)))

(declare-fun b!262832 () Bool)

(assert (=> b!262832 (= e!183074 call!4028)))

(declare-fun b!262833 () Bool)

(assert (=> b!262833 (= e!183074 e!183072)))

(declare-fun res!219932 () Bool)

(assert (=> b!262833 (= res!219932 (byteRangesEq!0 (select (arr!7386 (buf!6867 w1!584)) (_3!939 lt!404415)) (select (arr!7386 (buf!6867 w2!580)) (_3!939 lt!404415)) lt!404416 #b00000000000000000000000000001000))))

(assert (=> b!262833 (=> (not res!219932) (not e!183072))))

(declare-fun b!262834 () Bool)

(declare-fun e!183075 () Bool)

(declare-fun arrayRangesEq!995 (array!14661 array!14661 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262834 (= e!183075 (arrayRangesEq!995 (buf!6867 w1!584) (buf!6867 w2!580) (_1!12139 lt!404415) (_2!12139 lt!404415)))))

(declare-fun b!262835 () Bool)

(assert (=> b!262835 (= e!183071 e!183070)))

(declare-fun res!219933 () Bool)

(assert (=> b!262835 (=> (not res!219933) (not e!183070))))

(assert (=> b!262835 (= res!219933 e!183075)))

(declare-fun res!219931 () Bool)

(assert (=> b!262835 (=> res!219931 e!183075)))

(assert (=> b!262835 (= res!219931 (bvsge (_1!12139 lt!404415) (_2!12139 lt!404415)))))

(assert (=> b!262835 (= lt!404414 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262835 (= lt!404416 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!318)

(assert (=> b!262835 (= lt!404415 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584))))))

(assert (= (and d!88704 (not res!219934)) b!262835))

(assert (= (and b!262835 (not res!219931)) b!262834))

(assert (= (and b!262835 res!219933) b!262829))

(assert (= (and b!262829 c!11997) b!262832))

(assert (= (and b!262829 (not c!11997)) b!262833))

(assert (= (and b!262833 res!219932) b!262830))

(assert (= (and b!262830 (not res!219930)) b!262831))

(assert (= (or b!262832 b!262831) bm!4025))

(declare-fun m!393021 () Bool)

(assert (=> bm!4025 m!393021))

(declare-fun m!393023 () Bool)

(assert (=> bm!4025 m!393023))

(declare-fun m!393025 () Bool)

(assert (=> bm!4025 m!393025))

(declare-fun m!393027 () Bool)

(assert (=> bm!4025 m!393027))

(declare-fun m!393029 () Bool)

(assert (=> bm!4025 m!393029))

(assert (=> b!262833 m!393029))

(assert (=> b!262833 m!393023))

(assert (=> b!262833 m!393029))

(assert (=> b!262833 m!393023))

(declare-fun m!393031 () Bool)

(assert (=> b!262833 m!393031))

(declare-fun m!393033 () Bool)

(assert (=> b!262834 m!393033))

(assert (=> b!262835 m!393005))

(declare-fun m!393035 () Bool)

(assert (=> b!262835 m!393035))

(assert (=> b!262801 d!88704))

(declare-fun d!88724 () Bool)

(declare-fun e!183108 () Bool)

(assert (=> d!88724 e!183108))

(declare-fun res!219972 () Bool)

(assert (=> d!88724 (=> (not res!219972) (not e!183108))))

(declare-fun lt!404441 () (_ BitVec 64))

(declare-fun lt!404439 () (_ BitVec 64))

(declare-fun lt!404443 () (_ BitVec 64))

(assert (=> d!88724 (= res!219972 (= lt!404443 (bvsub lt!404439 lt!404441)))))

(assert (=> d!88724 (or (= (bvand lt!404439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404441 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404439 lt!404441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88724 (= lt!404441 (remainingBits!0 ((_ sign_extend 32) (size!6399 (buf!6867 w1!584))) ((_ sign_extend 32) (currentByte!12713 w1!584)) ((_ sign_extend 32) (currentBit!12708 w1!584))))))

(declare-fun lt!404438 () (_ BitVec 64))

(declare-fun lt!404440 () (_ BitVec 64))

(assert (=> d!88724 (= lt!404439 (bvmul lt!404438 lt!404440))))

(assert (=> d!88724 (or (= lt!404438 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404440 (bvsdiv (bvmul lt!404438 lt!404440) lt!404438)))))

(assert (=> d!88724 (= lt!404440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88724 (= lt!404438 ((_ sign_extend 32) (size!6399 (buf!6867 w1!584))))))

(assert (=> d!88724 (= lt!404443 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12713 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12708 w1!584))))))

(assert (=> d!88724 (invariant!0 (currentBit!12708 w1!584) (currentByte!12713 w1!584) (size!6399 (buf!6867 w1!584)))))

(assert (=> d!88724 (= (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584)) lt!404443)))

(declare-fun b!262879 () Bool)

(declare-fun res!219973 () Bool)

(assert (=> b!262879 (=> (not res!219973) (not e!183108))))

(assert (=> b!262879 (= res!219973 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404443))))

(declare-fun b!262880 () Bool)

(declare-fun lt!404442 () (_ BitVec 64))

(assert (=> b!262880 (= e!183108 (bvsle lt!404443 (bvmul lt!404442 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262880 (or (= lt!404442 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404442 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404442)))))

(assert (=> b!262880 (= lt!404442 ((_ sign_extend 32) (size!6399 (buf!6867 w1!584))))))

(assert (= (and d!88724 res!219972) b!262879))

(assert (= (and b!262879 res!219973) b!262880))

(declare-fun m!393065 () Bool)

(assert (=> d!88724 m!393065))

(assert (=> d!88724 m!393009))

(assert (=> b!262801 d!88724))

(declare-fun d!88744 () Bool)

(assert (=> d!88744 (= (invariant!0 (currentBit!12708 w1!584) (currentByte!12713 w1!584) (size!6399 (buf!6867 w1!584))) (and (bvsge (currentBit!12708 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12708 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12713 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12713 w1!584) (size!6399 (buf!6867 w1!584))) (and (= (currentBit!12708 w1!584) #b00000000000000000000000000000000) (= (currentByte!12713 w1!584) (size!6399 (buf!6867 w1!584)))))))))

(assert (=> b!262802 d!88744))

(declare-fun d!88746 () Bool)

(assert (=> d!88746 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404452 () Unit!18741)

(declare-fun choose!11 (BitStream!11612) Unit!18741)

(assert (=> d!88746 (= lt!404452 (choose!11 w2!580))))

(assert (=> d!88746 (= (lemmaIsPrefixRefl!0 w2!580) lt!404452)))

(declare-fun bs!22509 () Bool)

(assert (= bs!22509 d!88746))

(assert (=> bs!22509 m!393001))

(declare-fun m!393067 () Bool)

(assert (=> bs!22509 m!393067))

(assert (=> b!262805 d!88746))

(declare-fun d!88748 () Bool)

(assert (=> d!88748 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404453 () Unit!18741)

(assert (=> d!88748 (= lt!404453 (choose!11 w1!584))))

(assert (=> d!88748 (= (lemmaIsPrefixRefl!0 w1!584) lt!404453)))

(declare-fun bs!22510 () Bool)

(assert (= bs!22510 d!88748))

(assert (=> bs!22510 m!392999))

(declare-fun m!393069 () Bool)

(assert (=> bs!22510 m!393069))

(assert (=> b!262805 d!88748))

(declare-fun d!88750 () Bool)

(assert (=> d!88750 (isPrefixOf!0 lt!404399 lt!404399)))

(declare-fun lt!404454 () Unit!18741)

(assert (=> d!88750 (= lt!404454 (choose!11 lt!404399))))

(assert (=> d!88750 (= (lemmaIsPrefixRefl!0 lt!404399) lt!404454)))

(declare-fun bs!22511 () Bool)

(assert (= bs!22511 d!88750))

(assert (=> bs!22511 m!392997))

(declare-fun m!393071 () Bool)

(assert (=> bs!22511 m!393071))

(assert (=> b!262805 d!88750))

(declare-fun d!88752 () Bool)

(declare-fun res!220001 () Bool)

(declare-fun e!183134 () Bool)

(assert (=> d!88752 (=> (not res!220001) (not e!183134))))

(assert (=> d!88752 (= res!220001 (= (size!6399 (buf!6867 lt!404399)) (size!6399 (buf!6867 lt!404399))))))

(assert (=> d!88752 (= (isPrefixOf!0 lt!404399 lt!404399) e!183134)))

(declare-fun b!262914 () Bool)

(declare-fun res!220003 () Bool)

(assert (=> b!262914 (=> (not res!220003) (not e!183134))))

(assert (=> b!262914 (= res!220003 (bvsle (bitIndex!0 (size!6399 (buf!6867 lt!404399)) (currentByte!12713 lt!404399) (currentBit!12708 lt!404399)) (bitIndex!0 (size!6399 (buf!6867 lt!404399)) (currentByte!12713 lt!404399) (currentBit!12708 lt!404399))))))

(declare-fun b!262915 () Bool)

(declare-fun e!183135 () Bool)

(assert (=> b!262915 (= e!183134 e!183135)))

(declare-fun res!220002 () Bool)

(assert (=> b!262915 (=> res!220002 e!183135)))

(assert (=> b!262915 (= res!220002 (= (size!6399 (buf!6867 lt!404399)) #b00000000000000000000000000000000))))

(declare-fun b!262916 () Bool)

(assert (=> b!262916 (= e!183135 (arrayBitRangesEq!0 (buf!6867 lt!404399) (buf!6867 lt!404399) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6399 (buf!6867 lt!404399)) (currentByte!12713 lt!404399) (currentBit!12708 lt!404399))))))

(assert (= (and d!88752 res!220001) b!262914))

(assert (= (and b!262914 res!220003) b!262915))

(assert (= (and b!262915 (not res!220002)) b!262916))

(declare-fun m!393091 () Bool)

(assert (=> b!262914 m!393091))

(assert (=> b!262914 m!393091))

(assert (=> b!262916 m!393091))

(assert (=> b!262916 m!393091))

(declare-fun m!393097 () Bool)

(assert (=> b!262916 m!393097))

(assert (=> b!262805 d!88752))

(declare-fun d!88762 () Bool)

(declare-fun res!220007 () Bool)

(declare-fun e!183138 () Bool)

(assert (=> d!88762 (=> (not res!220007) (not e!183138))))

(assert (=> d!88762 (= res!220007 (= (size!6399 (buf!6867 w1!584)) (size!6399 (buf!6867 w1!584))))))

(assert (=> d!88762 (= (isPrefixOf!0 w1!584 w1!584) e!183138)))

(declare-fun b!262920 () Bool)

(declare-fun res!220009 () Bool)

(assert (=> b!262920 (=> (not res!220009) (not e!183138))))

(assert (=> b!262920 (= res!220009 (bvsle (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584)) (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584))))))

(declare-fun b!262921 () Bool)

(declare-fun e!183139 () Bool)

(assert (=> b!262921 (= e!183138 e!183139)))

(declare-fun res!220008 () Bool)

(assert (=> b!262921 (=> res!220008 e!183139)))

(assert (=> b!262921 (= res!220008 (= (size!6399 (buf!6867 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262922 () Bool)

(assert (=> b!262922 (= e!183139 (arrayBitRangesEq!0 (buf!6867 w1!584) (buf!6867 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6399 (buf!6867 w1!584)) (currentByte!12713 w1!584) (currentBit!12708 w1!584))))))

(assert (= (and d!88762 res!220007) b!262920))

(assert (= (and b!262920 res!220009) b!262921))

(assert (= (and b!262921 (not res!220008)) b!262922))

(assert (=> b!262920 m!393005))

(assert (=> b!262920 m!393005))

(assert (=> b!262922 m!393005))

(assert (=> b!262922 m!393005))

(declare-fun m!393105 () Bool)

(assert (=> b!262922 m!393105))

(assert (=> b!262805 d!88762))

(declare-fun d!88768 () Bool)

(declare-fun res!220013 () Bool)

(declare-fun e!183142 () Bool)

(assert (=> d!88768 (=> (not res!220013) (not e!183142))))

(assert (=> d!88768 (= res!220013 (= (size!6399 (buf!6867 w2!580)) (size!6399 (buf!6867 w2!580))))))

(assert (=> d!88768 (= (isPrefixOf!0 w2!580 w2!580) e!183142)))

(declare-fun b!262926 () Bool)

(declare-fun res!220015 () Bool)

(assert (=> b!262926 (=> (not res!220015) (not e!183142))))

(assert (=> b!262926 (= res!220015 (bvsle (bitIndex!0 (size!6399 (buf!6867 w2!580)) (currentByte!12713 w2!580) (currentBit!12708 w2!580)) (bitIndex!0 (size!6399 (buf!6867 w2!580)) (currentByte!12713 w2!580) (currentBit!12708 w2!580))))))

(declare-fun b!262927 () Bool)

(declare-fun e!183143 () Bool)

(assert (=> b!262927 (= e!183142 e!183143)))

(declare-fun res!220014 () Bool)

(assert (=> b!262927 (=> res!220014 e!183143)))

(assert (=> b!262927 (= res!220014 (= (size!6399 (buf!6867 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262928 () Bool)

(assert (=> b!262928 (= e!183143 (arrayBitRangesEq!0 (buf!6867 w2!580) (buf!6867 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6399 (buf!6867 w2!580)) (currentByte!12713 w2!580) (currentBit!12708 w2!580))))))

(assert (= (and d!88768 res!220013) b!262926))

(assert (= (and b!262926 res!220015) b!262927))

(assert (= (and b!262927 (not res!220014)) b!262928))

(declare-fun m!393107 () Bool)

(assert (=> b!262926 m!393107))

(assert (=> b!262926 m!393107))

(assert (=> b!262928 m!393107))

(assert (=> b!262928 m!393107))

(declare-fun m!393111 () Bool)

(assert (=> b!262928 m!393111))

(assert (=> b!262805 d!88768))

(declare-fun d!88772 () Bool)

(assert (=> d!88772 (= (array_inv!6123 (buf!6867 w2!580)) (bvsge (size!6399 (buf!6867 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262800 d!88772))

(declare-fun d!88774 () Bool)

(declare-fun res!220019 () Bool)

(declare-fun e!183146 () Bool)

(assert (=> d!88774 (=> (not res!220019) (not e!183146))))

(assert (=> d!88774 (= res!220019 (= (size!6399 (buf!6867 w1!584)) (size!6399 (buf!6867 w2!580))))))

(assert (=> d!88774 (= (isPrefixOf!0 w1!584 w2!580) e!183146)))

(declare-fun b!262932 () Bool)

