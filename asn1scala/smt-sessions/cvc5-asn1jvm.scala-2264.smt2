; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57342 () Bool)

(assert start!57342)

(declare-fun b!262764 () Bool)

(declare-fun e!183004 () Bool)

(declare-datatypes ((array!14657 0))(
  ( (array!14658 (arr!7384 (Array (_ BitVec 32) (_ BitVec 8))) (size!6397 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11608 0))(
  ( (BitStream!11609 (buf!6865 array!14657) (currentByte!12711 (_ BitVec 32)) (currentBit!12706 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11608)

(declare-fun w2!580 () BitStream!11608)

(declare-fun arrayBitRangesEq!0 (array!14657 array!14657 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262764 (= e!183004 (not (arrayBitRangesEq!0 (buf!6865 w1!584) (buf!6865 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584)))))))

(declare-fun b!262765 () Bool)

(declare-fun e!183008 () Bool)

(declare-fun array_inv!6121 (array!14657) Bool)

(assert (=> b!262765 (= e!183008 (array_inv!6121 (buf!6865 w2!580)))))

(declare-fun b!262766 () Bool)

(declare-fun res!219886 () Bool)

(declare-fun e!183009 () Bool)

(assert (=> b!262766 (=> res!219886 e!183009)))

(assert (=> b!262766 (= res!219886 (= (size!6397 (buf!6865 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262767 () Bool)

(declare-fun e!183005 () Bool)

(assert (=> b!262767 (= e!183005 (array_inv!6121 (buf!6865 w1!584)))))

(declare-fun b!262768 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262768 (= e!183009 (invariant!0 (currentBit!12706 w1!584) (currentByte!12711 w1!584) (size!6397 (buf!6865 w1!584))))))

(declare-fun res!219883 () Bool)

(declare-fun e!183003 () Bool)

(assert (=> start!57342 (=> (not res!219883) (not e!183003))))

(declare-fun isPrefixOf!0 (BitStream!11608 BitStream!11608) Bool)

(assert (=> start!57342 (= res!219883 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57342 e!183003))

(declare-fun inv!12 (BitStream!11608) Bool)

(assert (=> start!57342 (and (inv!12 w1!584) e!183005)))

(assert (=> start!57342 (and (inv!12 w2!580) e!183008)))

(declare-fun b!262769 () Bool)

(assert (=> b!262769 (= e!183003 (not e!183009))))

(declare-fun res!219885 () Bool)

(assert (=> b!262769 (=> res!219885 e!183009)))

(assert (=> b!262769 (= res!219885 e!183004)))

(declare-fun res!219884 () Bool)

(assert (=> b!262769 (=> (not res!219884) (not e!183004))))

(assert (=> b!262769 (= res!219884 (not (= (size!6397 (buf!6865 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!262769 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18737 0))(
  ( (Unit!18738) )
))
(declare-fun lt!404377 () Unit!18737)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11608) Unit!18737)

(assert (=> b!262769 (= lt!404377 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404378 () BitStream!11608)

(assert (=> b!262769 (isPrefixOf!0 lt!404378 lt!404378)))

(declare-fun lt!404376 () Unit!18737)

(assert (=> b!262769 (= lt!404376 (lemmaIsPrefixRefl!0 lt!404378))))

(assert (=> b!262769 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404375 () Unit!18737)

(assert (=> b!262769 (= lt!404375 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262769 (= lt!404378 (BitStream!11609 (buf!6865 w2!580) (currentByte!12711 w1!584) (currentBit!12706 w1!584)))))

(assert (= (and start!57342 res!219883) b!262769))

(assert (= (and b!262769 res!219884) b!262764))

(assert (= (and b!262769 (not res!219885)) b!262766))

(assert (= (and b!262766 (not res!219886)) b!262768))

(assert (= start!57342 b!262767))

(assert (= start!57342 b!262765))

(declare-fun m!392927 () Bool)

(assert (=> start!57342 m!392927))

(declare-fun m!392929 () Bool)

(assert (=> start!57342 m!392929))

(declare-fun m!392931 () Bool)

(assert (=> start!57342 m!392931))

(declare-fun m!392933 () Bool)

(assert (=> b!262765 m!392933))

(declare-fun m!392935 () Bool)

(assert (=> b!262768 m!392935))

(declare-fun m!392937 () Bool)

(assert (=> b!262767 m!392937))

(declare-fun m!392939 () Bool)

(assert (=> b!262769 m!392939))

(declare-fun m!392941 () Bool)

(assert (=> b!262769 m!392941))

(declare-fun m!392943 () Bool)

(assert (=> b!262769 m!392943))

(declare-fun m!392945 () Bool)

(assert (=> b!262769 m!392945))

(declare-fun m!392947 () Bool)

(assert (=> b!262769 m!392947))

(declare-fun m!392949 () Bool)

(assert (=> b!262769 m!392949))

(declare-fun m!392951 () Bool)

(assert (=> b!262764 m!392951))

(assert (=> b!262764 m!392951))

(declare-fun m!392953 () Bool)

(assert (=> b!262764 m!392953))

(push 1)

(assert (not start!57342))

(assert (not b!262768))

(assert (not b!262765))

(assert (not b!262769))

(assert (not b!262767))

(assert (not b!262764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88706 () Bool)

(declare-fun res!219917 () Bool)

(declare-fun e!183056 () Bool)

(assert (=> d!88706 (=> (not res!219917) (not e!183056))))

(assert (=> d!88706 (= res!219917 (= (size!6397 (buf!6865 w1!584)) (size!6397 (buf!6865 w2!580))))))

(assert (=> d!88706 (= (isPrefixOf!0 w1!584 w2!580) e!183056)))

(declare-fun b!262812 () Bool)

(declare-fun res!219918 () Bool)

(assert (=> b!262812 (=> (not res!219918) (not e!183056))))

(assert (=> b!262812 (= res!219918 (bvsle (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584)) (bitIndex!0 (size!6397 (buf!6865 w2!580)) (currentByte!12711 w2!580) (currentBit!12706 w2!580))))))

(declare-fun b!262813 () Bool)

(declare-fun e!183057 () Bool)

(assert (=> b!262813 (= e!183056 e!183057)))

(declare-fun res!219919 () Bool)

(assert (=> b!262813 (=> res!219919 e!183057)))

(assert (=> b!262813 (= res!219919 (= (size!6397 (buf!6865 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262814 () Bool)

(assert (=> b!262814 (= e!183057 (arrayBitRangesEq!0 (buf!6865 w1!584) (buf!6865 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584))))))

(assert (= (and d!88706 res!219917) b!262812))

(assert (= (and b!262812 res!219918) b!262813))

(assert (= (and b!262813 (not res!219919)) b!262814))

(assert (=> b!262812 m!392951))

(declare-fun m!393011 () Bool)

(assert (=> b!262812 m!393011))

(assert (=> b!262814 m!392951))

(assert (=> b!262814 m!392951))

(assert (=> b!262814 m!392953))

(assert (=> start!57342 d!88706))

(declare-fun d!88708 () Bool)

(assert (=> d!88708 (= (inv!12 w1!584) (invariant!0 (currentBit!12706 w1!584) (currentByte!12711 w1!584) (size!6397 (buf!6865 w1!584))))))

(declare-fun bs!22500 () Bool)

(assert (= bs!22500 d!88708))

(assert (=> bs!22500 m!392935))

(assert (=> start!57342 d!88708))

(declare-fun d!88712 () Bool)

(assert (=> d!88712 (= (inv!12 w2!580) (invariant!0 (currentBit!12706 w2!580) (currentByte!12711 w2!580) (size!6397 (buf!6865 w2!580))))))

(declare-fun bs!22501 () Bool)

(assert (= bs!22501 d!88712))

(declare-fun m!393013 () Bool)

(assert (=> bs!22501 m!393013))

(assert (=> start!57342 d!88712))

(declare-fun d!88714 () Bool)

(assert (=> d!88714 (= (array_inv!6121 (buf!6865 w2!580)) (bvsge (size!6397 (buf!6865 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262765 d!88714))

(declare-fun b!262868 () Bool)

(declare-fun res!219963 () Bool)

(declare-fun lt!404425 () (_ BitVec 32))

(assert (=> b!262868 (= res!219963 (= lt!404425 #b00000000000000000000000000000000))))

(declare-fun e!183103 () Bool)

(assert (=> b!262868 (=> res!219963 e!183103)))

(declare-fun e!183101 () Bool)

(assert (=> b!262868 (= e!183101 e!183103)))

(declare-fun b!262869 () Bool)

(declare-fun e!183102 () Bool)

(declare-fun e!183105 () Bool)

(assert (=> b!262869 (= e!183102 e!183105)))

(declare-fun c!12000 () Bool)

(declare-datatypes ((tuple4!320 0))(
  ( (tuple4!321 (_1!12140 (_ BitVec 32)) (_2!12140 (_ BitVec 32)) (_3!940 (_ BitVec 32)) (_4!160 (_ BitVec 32))) )
))
(declare-fun lt!404424 () tuple4!320)

(assert (=> b!262869 (= c!12000 (= (_3!940 lt!404424) (_4!160 lt!404424)))))

(declare-fun b!262870 () Bool)

(assert (=> b!262870 (= e!183105 e!183101)))

(declare-fun res!219966 () Bool)

(declare-fun lt!404423 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262870 (= res!219966 (byteRangesEq!0 (select (arr!7384 (buf!6865 w1!584)) (_3!940 lt!404424)) (select (arr!7384 (buf!6865 w2!580)) (_3!940 lt!404424)) lt!404423 #b00000000000000000000000000001000))))

(assert (=> b!262870 (=> (not res!219966) (not e!183101))))

(declare-fun call!4031 () Bool)

(declare-fun bm!4028 () Bool)

(assert (=> bm!4028 (= call!4031 (byteRangesEq!0 (ite c!12000 (select (arr!7384 (buf!6865 w1!584)) (_3!940 lt!404424)) (select (arr!7384 (buf!6865 w1!584)) (_4!160 lt!404424))) (ite c!12000 (select (arr!7384 (buf!6865 w2!580)) (_3!940 lt!404424)) (select (arr!7384 (buf!6865 w2!580)) (_4!160 lt!404424))) (ite c!12000 lt!404423 #b00000000000000000000000000000000) lt!404425))))

(declare-fun d!88716 () Bool)

(declare-fun res!219967 () Bool)

(declare-fun e!183100 () Bool)

(assert (=> d!88716 (=> res!219967 e!183100)))

(assert (=> d!88716 (= res!219967 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584))))))

(assert (=> d!88716 (= (arrayBitRangesEq!0 (buf!6865 w1!584) (buf!6865 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584))) e!183100)))

(declare-fun b!262871 () Bool)

(declare-fun e!183104 () Bool)

(declare-fun arrayRangesEq!996 (array!14657 array!14657 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262871 (= e!183104 (arrayRangesEq!996 (buf!6865 w1!584) (buf!6865 w2!580) (_1!12140 lt!404424) (_2!12140 lt!404424)))))

(declare-fun b!262872 () Bool)

(assert (=> b!262872 (= e!183100 e!183102)))

(declare-fun res!219964 () Bool)

(assert (=> b!262872 (=> (not res!219964) (not e!183102))))

(assert (=> b!262872 (= res!219964 e!183104)))

(declare-fun res!219965 () Bool)

(assert (=> b!262872 (=> res!219965 e!183104)))

(assert (=> b!262872 (= res!219965 (bvsge (_1!12140 lt!404424) (_2!12140 lt!404424)))))

(assert (=> b!262872 (= lt!404425 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262872 (= lt!404423 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!320)

(assert (=> b!262872 (= lt!404424 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584))))))

(declare-fun b!262873 () Bool)

(assert (=> b!262873 (= e!183103 call!4031)))

(declare-fun b!262874 () Bool)

(assert (=> b!262874 (= e!183105 call!4031)))

(assert (= (and d!88716 (not res!219967)) b!262872))

(assert (= (and b!262872 (not res!219965)) b!262871))

(assert (= (and b!262872 res!219964) b!262869))

(assert (= (and b!262869 c!12000) b!262874))

(assert (= (and b!262869 (not c!12000)) b!262870))

(assert (= (and b!262870 res!219966) b!262868))

(assert (= (and b!262868 (not res!219963)) b!262873))

(assert (= (or b!262874 b!262873) bm!4028))

(declare-fun m!393049 () Bool)

(assert (=> b!262870 m!393049))

(declare-fun m!393051 () Bool)

(assert (=> b!262870 m!393051))

(assert (=> b!262870 m!393049))

(assert (=> b!262870 m!393051))

(declare-fun m!393053 () Bool)

(assert (=> b!262870 m!393053))

(assert (=> bm!4028 m!393051))

(assert (=> bm!4028 m!393049))

(declare-fun m!393055 () Bool)

(assert (=> bm!4028 m!393055))

(declare-fun m!393057 () Bool)

(assert (=> bm!4028 m!393057))

(declare-fun m!393059 () Bool)

(assert (=> bm!4028 m!393059))

(declare-fun m!393061 () Bool)

(assert (=> b!262871 m!393061))

(assert (=> b!262872 m!392951))

(declare-fun m!393063 () Bool)

(assert (=> b!262872 m!393063))

(assert (=> b!262764 d!88716))

(declare-fun d!88742 () Bool)

(declare-fun e!183131 () Bool)

(assert (=> d!88742 e!183131))

(declare-fun res!219998 () Bool)

(assert (=> d!88742 (=> (not res!219998) (not e!183131))))

(declare-fun lt!404473 () (_ BitVec 64))

(declare-fun lt!404474 () (_ BitVec 64))

(declare-fun lt!404475 () (_ BitVec 64))

(assert (=> d!88742 (= res!219998 (= lt!404475 (bvsub lt!404474 lt!404473)))))

(assert (=> d!88742 (or (= (bvand lt!404474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404473 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404474 lt!404473) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88742 (= lt!404473 (remainingBits!0 ((_ sign_extend 32) (size!6397 (buf!6865 w1!584))) ((_ sign_extend 32) (currentByte!12711 w1!584)) ((_ sign_extend 32) (currentBit!12706 w1!584))))))

(declare-fun lt!404472 () (_ BitVec 64))

(declare-fun lt!404470 () (_ BitVec 64))

(assert (=> d!88742 (= lt!404474 (bvmul lt!404472 lt!404470))))

(assert (=> d!88742 (or (= lt!404472 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404470 (bvsdiv (bvmul lt!404472 lt!404470) lt!404472)))))

(assert (=> d!88742 (= lt!404470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88742 (= lt!404472 ((_ sign_extend 32) (size!6397 (buf!6865 w1!584))))))

(assert (=> d!88742 (= lt!404475 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12711 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12706 w1!584))))))

(assert (=> d!88742 (invariant!0 (currentBit!12706 w1!584) (currentByte!12711 w1!584) (size!6397 (buf!6865 w1!584)))))

(assert (=> d!88742 (= (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584)) lt!404475)))

(declare-fun b!262908 () Bool)

(declare-fun res!219997 () Bool)

(assert (=> b!262908 (=> (not res!219997) (not e!183131))))

(assert (=> b!262908 (= res!219997 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404475))))

(declare-fun b!262909 () Bool)

(declare-fun lt!404471 () (_ BitVec 64))

(assert (=> b!262909 (= e!183131 (bvsle lt!404475 (bvmul lt!404471 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262909 (or (= lt!404471 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404471 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404471)))))

(assert (=> b!262909 (= lt!404471 ((_ sign_extend 32) (size!6397 (buf!6865 w1!584))))))

(assert (= (and d!88742 res!219998) b!262908))

(assert (= (and b!262908 res!219997) b!262909))

(declare-fun m!393089 () Bool)

(assert (=> d!88742 m!393089))

(assert (=> d!88742 m!392935))

(assert (=> b!262764 d!88742))

(declare-fun d!88756 () Bool)

(assert (=> d!88756 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404478 () Unit!18737)

(declare-fun choose!11 (BitStream!11608) Unit!18737)

(assert (=> d!88756 (= lt!404478 (choose!11 w2!580))))

(assert (=> d!88756 (= (lemmaIsPrefixRefl!0 w2!580) lt!404478)))

(declare-fun bs!22513 () Bool)

(assert (= bs!22513 d!88756))

(assert (=> bs!22513 m!392947))

(declare-fun m!393093 () Bool)

(assert (=> bs!22513 m!393093))

(assert (=> b!262769 d!88756))

(declare-fun d!88758 () Bool)

(assert (=> d!88758 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404479 () Unit!18737)

(assert (=> d!88758 (= lt!404479 (choose!11 w1!584))))

(assert (=> d!88758 (= (lemmaIsPrefixRefl!0 w1!584) lt!404479)))

(declare-fun bs!22514 () Bool)

(assert (= bs!22514 d!88758))

(assert (=> bs!22514 m!392945))

(declare-fun m!393095 () Bool)

(assert (=> bs!22514 m!393095))

(assert (=> b!262769 d!88758))

(declare-fun d!88760 () Bool)

(declare-fun res!220004 () Bool)

(declare-fun e!183136 () Bool)

(assert (=> d!88760 (=> (not res!220004) (not e!183136))))

(assert (=> d!88760 (= res!220004 (= (size!6397 (buf!6865 lt!404378)) (size!6397 (buf!6865 lt!404378))))))

(assert (=> d!88760 (= (isPrefixOf!0 lt!404378 lt!404378) e!183136)))

(declare-fun b!262917 () Bool)

(declare-fun res!220005 () Bool)

(assert (=> b!262917 (=> (not res!220005) (not e!183136))))

(assert (=> b!262917 (= res!220005 (bvsle (bitIndex!0 (size!6397 (buf!6865 lt!404378)) (currentByte!12711 lt!404378) (currentBit!12706 lt!404378)) (bitIndex!0 (size!6397 (buf!6865 lt!404378)) (currentByte!12711 lt!404378) (currentBit!12706 lt!404378))))))

(declare-fun b!262918 () Bool)

(declare-fun e!183137 () Bool)

(assert (=> b!262918 (= e!183136 e!183137)))

(declare-fun res!220006 () Bool)

(assert (=> b!262918 (=> res!220006 e!183137)))

(assert (=> b!262918 (= res!220006 (= (size!6397 (buf!6865 lt!404378)) #b00000000000000000000000000000000))))

(declare-fun b!262919 () Bool)

(assert (=> b!262919 (= e!183137 (arrayBitRangesEq!0 (buf!6865 lt!404378) (buf!6865 lt!404378) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6397 (buf!6865 lt!404378)) (currentByte!12711 lt!404378) (currentBit!12706 lt!404378))))))

(assert (= (and d!88760 res!220004) b!262917))

(assert (= (and b!262917 res!220005) b!262918))

(assert (= (and b!262918 (not res!220006)) b!262919))

(declare-fun m!393099 () Bool)

(assert (=> b!262917 m!393099))

(assert (=> b!262917 m!393099))

(assert (=> b!262919 m!393099))

(assert (=> b!262919 m!393099))

(declare-fun m!393101 () Bool)

(assert (=> b!262919 m!393101))

(assert (=> b!262769 d!88760))

(declare-fun d!88764 () Bool)

(assert (=> d!88764 (isPrefixOf!0 lt!404378 lt!404378)))

(declare-fun lt!404480 () Unit!18737)

(assert (=> d!88764 (= lt!404480 (choose!11 lt!404378))))

(assert (=> d!88764 (= (lemmaIsPrefixRefl!0 lt!404378) lt!404480)))

(declare-fun bs!22515 () Bool)

(assert (= bs!22515 d!88764))

(assert (=> bs!22515 m!392939))

(declare-fun m!393103 () Bool)

(assert (=> bs!22515 m!393103))

(assert (=> b!262769 d!88764))

(declare-fun d!88766 () Bool)

(declare-fun res!220010 () Bool)

(declare-fun e!183140 () Bool)

(assert (=> d!88766 (=> (not res!220010) (not e!183140))))

(assert (=> d!88766 (= res!220010 (= (size!6397 (buf!6865 w1!584)) (size!6397 (buf!6865 w1!584))))))

(assert (=> d!88766 (= (isPrefixOf!0 w1!584 w1!584) e!183140)))

(declare-fun b!262923 () Bool)

(declare-fun res!220011 () Bool)

(assert (=> b!262923 (=> (not res!220011) (not e!183140))))

(assert (=> b!262923 (= res!220011 (bvsle (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584)) (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584))))))

(declare-fun b!262924 () Bool)

(declare-fun e!183141 () Bool)

(assert (=> b!262924 (= e!183140 e!183141)))

(declare-fun res!220012 () Bool)

(assert (=> b!262924 (=> res!220012 e!183141)))

(assert (=> b!262924 (= res!220012 (= (size!6397 (buf!6865 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262925 () Bool)

(assert (=> b!262925 (= e!183141 (arrayBitRangesEq!0 (buf!6865 w1!584) (buf!6865 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6397 (buf!6865 w1!584)) (currentByte!12711 w1!584) (currentBit!12706 w1!584))))))

(assert (= (and d!88766 res!220010) b!262923))

(assert (= (and b!262923 res!220011) b!262924))

(assert (= (and b!262924 (not res!220012)) b!262925))

(assert (=> b!262923 m!392951))

(assert (=> b!262923 m!392951))

(assert (=> b!262925 m!392951))

(assert (=> b!262925 m!392951))

(declare-fun m!393109 () Bool)

(assert (=> b!262925 m!393109))

(assert (=> b!262769 d!88766))

(declare-fun d!88770 () Bool)

(declare-fun res!220016 () Bool)

(declare-fun e!183144 () Bool)

(assert (=> d!88770 (=> (not res!220016) (not e!183144))))

(assert (=> d!88770 (= res!220016 (= (size!6397 (buf!6865 w2!580)) (size!6397 (buf!6865 w2!580))))))

(assert (=> d!88770 (= (isPrefixOf!0 w2!580 w2!580) e!183144)))

(declare-fun b!262929 () Bool)

(declare-fun res!220017 () Bool)

(assert (=> b!262929 (=> (not res!220017) (not e!183144))))

(assert (=> b!262929 (= res!220017 (bvsle (bitIndex!0 (size!6397 (buf!6865 w2!580)) (currentByte!12711 w2!580) (currentBit!12706 w2!580)) (bitIndex!0 (size!6397 (buf!6865 w2!580)) (currentByte!12711 w2!580) (currentBit!12706 w2!580))))))

(declare-fun b!262930 () Bool)

(declare-fun e!183145 () Bool)

(assert (=> b!262930 (= e!183144 e!183145)))

(declare-fun res!220018 () Bool)

(assert (=> b!262930 (=> res!220018 e!183145)))

(assert (=> b!262930 (= res!220018 (= (size!6397 (buf!6865 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262931 () Bool)

(assert (=> b!262931 (= e!183145 (arrayBitRangesEq!0 (buf!6865 w2!580) (buf!6865 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6397 (buf!6865 w2!580)) (currentByte!12711 w2!580) (currentBit!12706 w2!580))))))

(assert (= (and d!88770 res!220016) b!262929))

(assert (= (and b!262929 res!220017) b!262930))

(assert (= (and b!262930 (not res!220018)) b!262931))

(assert (=> b!262929 m!393011))

(assert (=> b!262929 m!393011))

(assert (=> b!262931 m!393011))

(assert (=> b!262931 m!393011))

(declare-fun m!393113 () Bool)

(assert (=> b!262931 m!393113))

(assert (=> b!262769 d!88770))

(declare-fun d!88776 () Bool)

(assert (=> d!88776 (= (array_inv!6121 (buf!6865 w1!584)) (bvsge (size!6397 (buf!6865 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262767 d!88776))

(declare-fun d!88778 () Bool)

(assert (=> d!88778 (= (invariant!0 (currentBit!12706 w1!584) (currentByte!12711 w1!584) (size!6397 (buf!6865 w1!584))) (and (bvsge (currentBit!12706 w1!584) #b00000000000000000000000000000000) (bvslt (currentBit!12706 w1!584) #b00000000000000000000000000001000) (bvsge (currentByte!12711 w1!584) #b00000000000000000000000000000000) (or (bvslt (currentByte!12711 w1!584) (size!6397 (buf!6865 w1!584))) (and (= (currentBit!12706 w1!584) #b00000000000000000000000000000000) (= (currentByte!12711 w1!584) (size!6397 (buf!6865 w1!584)))))))))

(assert (=> b!262768 d!88778))

(push 1)

(assert (not d!88712))

(assert (not b!262812))

(assert (not d!88756))

(assert (not b!262871))

(assert (not d!88742))

(assert (not b!262870))

(assert (not b!262925))

(assert (not b!262923))

(assert (not b!262929))

(assert (not b!262872))

(assert (not d!88708))

(assert (not bm!4028))

(assert (not b!262917))

(assert (not d!88758))

(assert (not b!262919))

(assert (not d!88764))

(assert (not b!262814))

(assert (not b!262931))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

