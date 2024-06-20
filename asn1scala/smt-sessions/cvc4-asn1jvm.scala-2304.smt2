; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58288 () Bool)

(assert start!58288)

(declare-fun res!223438 () Bool)

(declare-fun e!187907 () Bool)

(assert (=> start!58288 (=> (not res!223438) (not e!187907))))

(declare-datatypes ((array!14946 0))(
  ( (array!14947 (arr!7506 (Array (_ BitVec 32) (_ BitVec 8))) (size!6519 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11852 0))(
  ( (BitStream!11853 (buf!6987 array!14946) (currentByte!12893 (_ BitVec 32)) (currentBit!12888 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11852)

(declare-fun w2!587 () BitStream!11852)

(declare-fun isPrefixOf!0 (BitStream!11852 BitStream!11852) Bool)

(assert (=> start!58288 (= res!223438 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58288 e!187907))

(declare-fun e!187914 () Bool)

(declare-fun inv!12 (BitStream!11852) Bool)

(assert (=> start!58288 (and (inv!12 w1!591) e!187914)))

(declare-fun e!187911 () Bool)

(assert (=> start!58288 (and (inv!12 w2!587) e!187911)))

(declare-fun w3!25 () BitStream!11852)

(declare-fun e!187912 () Bool)

(assert (=> start!58288 (and (inv!12 w3!25) e!187912)))

(declare-fun b!267849 () Bool)

(declare-fun res!223436 () Bool)

(assert (=> b!267849 (=> (not res!223436) (not e!187907))))

(assert (=> b!267849 (= res!223436 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267850 () Bool)

(declare-fun array_inv!6243 (array!14946) Bool)

(assert (=> b!267850 (= e!187911 (array_inv!6243 (buf!6987 w2!587)))))

(declare-fun b!267851 () Bool)

(declare-fun e!187908 () Bool)

(assert (=> b!267851 (= e!187907 (not e!187908))))

(declare-fun res!223437 () Bool)

(assert (=> b!267851 (=> res!223437 e!187908)))

(assert (=> b!267851 (= res!223437 (or (bvsge (currentByte!12893 w1!591) (size!6519 (buf!6987 w1!591))) (bvsge (currentByte!12893 w1!591) (currentByte!12893 w2!587))))))

(declare-fun arrayRangesEq!1054 (array!14946 array!14946 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267851 (arrayRangesEq!1054 (buf!6987 w1!591) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591))))

(declare-datatypes ((Unit!19011 0))(
  ( (Unit!19012) )
))
(declare-fun lt!408082 () Unit!19011)

(declare-fun arrayRangesEqTransitive!329 (array!14946 array!14946 array!14946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19011)

(assert (=> b!267851 (= lt!408082 (arrayRangesEqTransitive!329 (buf!6987 w1!591) (buf!6987 w2!587) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591) (currentByte!12893 w2!587)))))

(declare-fun b!267852 () Bool)

(assert (=> b!267852 (= e!187912 (array_inv!6243 (buf!6987 w3!25)))))

(declare-fun b!267853 () Bool)

(assert (=> b!267853 (= e!187914 (array_inv!6243 (buf!6987 w1!591)))))

(declare-fun b!267854 () Bool)

(assert (=> b!267854 (= e!187908 (or (not (= ((_ sign_extend 24) (select (arr!7506 (buf!6987 w2!587)) (currentByte!12893 w1!591))) ((_ sign_extend 24) (select (arr!7506 (buf!6987 w3!25)) (currentByte!12893 w1!591))))) (and (bvsle #b00000000000000000000000000000000 (currentBit!12888 w1!591)) (bvsle (currentBit!12888 w1!591) #b00000000000000000000000000001000))))))

(assert (=> b!267854 (= (select (arr!7506 (buf!6987 w2!587)) (currentByte!12893 w1!591)) (select (arr!7506 (buf!6987 w3!25)) (currentByte!12893 w1!591)))))

(declare-fun lt!408083 () Unit!19011)

(declare-fun arrayRangesEqImpliesEq!147 (array!14946 array!14946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19011)

(assert (=> b!267854 (= lt!408083 (arrayRangesEqImpliesEq!147 (buf!6987 w2!587) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591) (currentByte!12893 w2!587)))))

(assert (= (and start!58288 res!223438) b!267849))

(assert (= (and b!267849 res!223436) b!267851))

(assert (= (and b!267851 (not res!223437)) b!267854))

(assert (= start!58288 b!267853))

(assert (= start!58288 b!267850))

(assert (= start!58288 b!267852))

(declare-fun m!399177 () Bool)

(assert (=> b!267849 m!399177))

(declare-fun m!399179 () Bool)

(assert (=> b!267851 m!399179))

(declare-fun m!399181 () Bool)

(assert (=> b!267851 m!399181))

(declare-fun m!399183 () Bool)

(assert (=> b!267852 m!399183))

(declare-fun m!399185 () Bool)

(assert (=> b!267850 m!399185))

(declare-fun m!399187 () Bool)

(assert (=> b!267854 m!399187))

(declare-fun m!399189 () Bool)

(assert (=> b!267854 m!399189))

(declare-fun m!399191 () Bool)

(assert (=> b!267854 m!399191))

(declare-fun m!399193 () Bool)

(assert (=> start!58288 m!399193))

(declare-fun m!399195 () Bool)

(assert (=> start!58288 m!399195))

(declare-fun m!399197 () Bool)

(assert (=> start!58288 m!399197))

(declare-fun m!399199 () Bool)

(assert (=> start!58288 m!399199))

(declare-fun m!399201 () Bool)

(assert (=> b!267853 m!399201))

(push 1)

(assert (not b!267849))

(assert (not b!267851))

(assert (not start!58288))

(assert (not b!267854))

(assert (not b!267853))

(assert (not b!267850))

(assert (not b!267852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90426 () Bool)

(assert (=> d!90426 (= (array_inv!6243 (buf!6987 w1!591)) (bvsge (size!6519 (buf!6987 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!267853 d!90426))

(declare-fun d!90428 () Bool)

(declare-fun res!223464 () Bool)

(declare-fun e!187932 () Bool)

(assert (=> d!90428 (=> (not res!223464) (not e!187932))))

(assert (=> d!90428 (= res!223464 (= (size!6519 (buf!6987 w2!587)) (size!6519 (buf!6987 w3!25))))))

(assert (=> d!90428 (= (isPrefixOf!0 w2!587 w3!25) e!187932)))

(declare-fun b!267879 () Bool)

(declare-fun res!223463 () Bool)

(assert (=> b!267879 (=> (not res!223463) (not e!187932))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!267879 (= res!223463 (bvsle (bitIndex!0 (size!6519 (buf!6987 w2!587)) (currentByte!12893 w2!587) (currentBit!12888 w2!587)) (bitIndex!0 (size!6519 (buf!6987 w3!25)) (currentByte!12893 w3!25) (currentBit!12888 w3!25))))))

(declare-fun b!267880 () Bool)

(declare-fun e!187931 () Bool)

(assert (=> b!267880 (= e!187932 e!187931)))

(declare-fun res!223465 () Bool)

(assert (=> b!267880 (=> res!223465 e!187931)))

(assert (=> b!267880 (= res!223465 (= (size!6519 (buf!6987 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!267881 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14946 array!14946 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!267881 (= e!187931 (arrayBitRangesEq!0 (buf!6987 w2!587) (buf!6987 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6519 (buf!6987 w2!587)) (currentByte!12893 w2!587) (currentBit!12888 w2!587))))))

(assert (= (and d!90428 res!223464) b!267879))

(assert (= (and b!267879 res!223463) b!267880))

(assert (= (and b!267880 (not res!223465)) b!267881))

(declare-fun m!399219 () Bool)

(assert (=> b!267879 m!399219))

(declare-fun m!399221 () Bool)

(assert (=> b!267879 m!399221))

(assert (=> b!267881 m!399219))

(assert (=> b!267881 m!399219))

(declare-fun m!399223 () Bool)

(assert (=> b!267881 m!399223))

(assert (=> b!267849 d!90428))

(declare-fun d!90444 () Bool)

(assert (=> d!90444 (and (bvsge (currentByte!12893 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!12893 w1!591) (size!6519 (buf!6987 w2!587))) (bvslt (currentByte!12893 w1!591) (size!6519 (buf!6987 w3!25))) (= (select (arr!7506 (buf!6987 w2!587)) (currentByte!12893 w1!591)) (select (arr!7506 (buf!6987 w3!25)) (currentByte!12893 w1!591))))))

(declare-fun lt!408089 () Unit!19011)

(declare-fun choose!366 (array!14946 array!14946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19011)

(assert (=> d!90444 (= lt!408089 (choose!366 (buf!6987 w2!587) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591) (currentByte!12893 w2!587)))))

(assert (=> d!90444 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12893 w2!587)))))

(assert (=> d!90444 (= (arrayRangesEqImpliesEq!147 (buf!6987 w2!587) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591) (currentByte!12893 w2!587)) lt!408089)))

(declare-fun bs!22981 () Bool)

(assert (= bs!22981 d!90444))

(assert (=> bs!22981 m!399187))

(assert (=> bs!22981 m!399189))

(declare-fun m!399233 () Bool)

(assert (=> bs!22981 m!399233))

(assert (=> b!267854 d!90444))

(declare-fun d!90452 () Bool)

(declare-fun res!223470 () Bool)

(declare-fun e!187936 () Bool)

(assert (=> d!90452 (=> (not res!223470) (not e!187936))))

(assert (=> d!90452 (= res!223470 (= (size!6519 (buf!6987 w1!591)) (size!6519 (buf!6987 w2!587))))))

(assert (=> d!90452 (= (isPrefixOf!0 w1!591 w2!587) e!187936)))

(declare-fun b!267885 () Bool)

(declare-fun res!223469 () Bool)

(assert (=> b!267885 (=> (not res!223469) (not e!187936))))

(assert (=> b!267885 (= res!223469 (bvsle (bitIndex!0 (size!6519 (buf!6987 w1!591)) (currentByte!12893 w1!591) (currentBit!12888 w1!591)) (bitIndex!0 (size!6519 (buf!6987 w2!587)) (currentByte!12893 w2!587) (currentBit!12888 w2!587))))))

(declare-fun b!267886 () Bool)

(declare-fun e!187935 () Bool)

(assert (=> b!267886 (= e!187936 e!187935)))

(declare-fun res!223471 () Bool)

(assert (=> b!267886 (=> res!223471 e!187935)))

(assert (=> b!267886 (= res!223471 (= (size!6519 (buf!6987 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!267887 () Bool)

(assert (=> b!267887 (= e!187935 (arrayBitRangesEq!0 (buf!6987 w1!591) (buf!6987 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6519 (buf!6987 w1!591)) (currentByte!12893 w1!591) (currentBit!12888 w1!591))))))

(assert (= (and d!90452 res!223470) b!267885))

(assert (= (and b!267885 res!223469) b!267886))

(assert (= (and b!267886 (not res!223471)) b!267887))

(declare-fun m!399235 () Bool)

(assert (=> b!267885 m!399235))

(assert (=> b!267885 m!399219))

(assert (=> b!267887 m!399235))

(assert (=> b!267887 m!399235))

(declare-fun m!399237 () Bool)

(assert (=> b!267887 m!399237))

(assert (=> start!58288 d!90452))

(declare-fun d!90454 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90454 (= (inv!12 w1!591) (invariant!0 (currentBit!12888 w1!591) (currentByte!12893 w1!591) (size!6519 (buf!6987 w1!591))))))

(declare-fun bs!22982 () Bool)

(assert (= bs!22982 d!90454))

(declare-fun m!399239 () Bool)

(assert (=> bs!22982 m!399239))

(assert (=> start!58288 d!90454))

(declare-fun d!90456 () Bool)

(assert (=> d!90456 (= (inv!12 w2!587) (invariant!0 (currentBit!12888 w2!587) (currentByte!12893 w2!587) (size!6519 (buf!6987 w2!587))))))

(declare-fun bs!22984 () Bool)

(assert (= bs!22984 d!90456))

(declare-fun m!399243 () Bool)

(assert (=> bs!22984 m!399243))

(assert (=> start!58288 d!90456))

(declare-fun d!90460 () Bool)

(assert (=> d!90460 (= (inv!12 w3!25) (invariant!0 (currentBit!12888 w3!25) (currentByte!12893 w3!25) (size!6519 (buf!6987 w3!25))))))

(declare-fun bs!22985 () Bool)

(assert (= bs!22985 d!90460))

(declare-fun m!399245 () Bool)

(assert (=> bs!22985 m!399245))

(assert (=> start!58288 d!90460))

(declare-fun d!90464 () Bool)

(assert (=> d!90464 (= (array_inv!6243 (buf!6987 w2!587)) (bvsge (size!6519 (buf!6987 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!267850 d!90464))

(declare-fun d!90466 () Bool)

(assert (=> d!90466 (= (array_inv!6243 (buf!6987 w3!25)) (bvsge (size!6519 (buf!6987 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!267852 d!90466))

(declare-fun d!90468 () Bool)

(declare-fun res!223485 () Bool)

(declare-fun e!187949 () Bool)

(assert (=> d!90468 (=> res!223485 e!187949)))

(assert (=> d!90468 (= res!223485 (= #b00000000000000000000000000000000 (currentByte!12893 w1!591)))))

(assert (=> d!90468 (= (arrayRangesEq!1054 (buf!6987 w1!591) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591)) e!187949)))

(declare-fun b!267901 () Bool)

(declare-fun e!187950 () Bool)

(assert (=> b!267901 (= e!187949 e!187950)))

(declare-fun res!223486 () Bool)

(assert (=> b!267901 (=> (not res!223486) (not e!187950))))

(assert (=> b!267901 (= res!223486 (= (select (arr!7506 (buf!6987 w1!591)) #b00000000000000000000000000000000) (select (arr!7506 (buf!6987 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!267902 () Bool)

(assert (=> b!267902 (= e!187950 (arrayRangesEq!1054 (buf!6987 w1!591) (buf!6987 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12893 w1!591)))))

(assert (= (and d!90468 (not res!223485)) b!267901))

(assert (= (and b!267901 res!223486) b!267902))

(declare-fun m!399263 () Bool)

(assert (=> b!267901 m!399263))

(declare-fun m!399265 () Bool)

(assert (=> b!267901 m!399265))

(declare-fun m!399267 () Bool)

(assert (=> b!267902 m!399267))

(assert (=> b!267851 d!90468))

(declare-fun d!90480 () Bool)

(assert (=> d!90480 (arrayRangesEq!1054 (buf!6987 w1!591) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591))))

(declare-fun lt!408098 () Unit!19011)

(declare-fun choose!370 (array!14946 array!14946 array!14946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19011)

(assert (=> d!90480 (= lt!408098 (choose!370 (buf!6987 w1!591) (buf!6987 w2!587) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591) (currentByte!12893 w2!587)))))

(assert (=> d!90480 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12893 w1!591)) (bvsle (currentByte!12893 w1!591) (currentByte!12893 w2!587)))))

(assert (=> d!90480 (= (arrayRangesEqTransitive!329 (buf!6987 w1!591) (buf!6987 w2!587) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591) (currentByte!12893 w2!587)) lt!408098)))

(declare-fun bs!22990 () Bool)

(assert (= bs!22990 d!90480))

(assert (=> bs!22990 m!399179))

(declare-fun m!399271 () Bool)

(assert (=> bs!22990 m!399271))

(assert (=> b!267851 d!90480))

(push 1)

(assert (not b!267885))

(assert (not b!267881))

(assert (not d!90460))

(assert (not d!90480))

(assert (not b!267902))

(assert (not b!267879))

(assert (not d!90456))

(assert (not b!267887))

(assert (not d!90454))

(assert (not d!90444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!267973 () Bool)

(declare-fun res!223545 () Bool)

(declare-fun lt!408151 () (_ BitVec 32))

(assert (=> b!267973 (= res!223545 (= lt!408151 #b00000000000000000000000000000000))))

(declare-fun e!188009 () Bool)

(assert (=> b!267973 (=> res!223545 e!188009)))

(declare-fun e!188010 () Bool)

(assert (=> b!267973 (= e!188010 e!188009)))

(declare-fun b!267974 () Bool)

(declare-fun e!188014 () Bool)

(declare-fun e!188013 () Bool)

(assert (=> b!267974 (= e!188014 e!188013)))

(declare-fun res!223544 () Bool)

(assert (=> b!267974 (=> (not res!223544) (not e!188013))))

(declare-fun e!188012 () Bool)

(assert (=> b!267974 (= res!223544 e!188012)))

(declare-fun res!223541 () Bool)

(assert (=> b!267974 (=> res!223541 e!188012)))

(declare-datatypes ((tuple4!406 0))(
  ( (tuple4!407 (_1!12186 (_ BitVec 32)) (_2!12186 (_ BitVec 32)) (_3!983 (_ BitVec 32)) (_4!203 (_ BitVec 32))) )
))
(declare-fun lt!408150 () tuple4!406)

(assert (=> b!267974 (= res!223541 (bvsge (_1!12186 lt!408150) (_2!12186 lt!408150)))))

(assert (=> b!267974 (= lt!408151 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6519 (buf!6987 w1!591)) (currentByte!12893 w1!591) (currentBit!12888 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408152 () (_ BitVec 32))

(assert (=> b!267974 (= lt!408152 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!406)

(assert (=> b!267974 (= lt!408150 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6519 (buf!6987 w1!591)) (currentByte!12893 w1!591) (currentBit!12888 w1!591))))))

(declare-fun b!267975 () Bool)

(declare-fun e!188011 () Bool)

(assert (=> b!267975 (= e!188011 e!188010)))

(declare-fun res!223542 () Bool)

(declare-fun call!4220 () Bool)

(assert (=> b!267975 (= res!223542 call!4220)))

(assert (=> b!267975 (=> (not res!223542) (not e!188010))))

(declare-fun b!267976 () Bool)

(assert (=> b!267976 (= e!188012 (arrayRangesEq!1054 (buf!6987 w1!591) (buf!6987 w2!587) (_1!12186 lt!408150) (_2!12186 lt!408150)))))

(declare-fun b!267977 () Bool)

(assert (=> b!267977 (= e!188011 call!4220)))

(declare-fun b!267978 () Bool)

(assert (=> b!267978 (= e!188013 e!188011)))

(declare-fun c!12351 () Bool)

(assert (=> b!267978 (= c!12351 (= (_3!983 lt!408150) (_4!203 lt!408150)))))

(declare-fun d!90504 () Bool)

(declare-fun res!223543 () Bool)

(assert (=> d!90504 (=> res!223543 e!188014)))

(assert (=> d!90504 (= res!223543 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6519 (buf!6987 w1!591)) (currentByte!12893 w1!591) (currentBit!12888 w1!591))))))

(assert (=> d!90504 (= (arrayBitRangesEq!0 (buf!6987 w1!591) (buf!6987 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6519 (buf!6987 w1!591)) (currentByte!12893 w1!591) (currentBit!12888 w1!591))) e!188014)))

(declare-fun bm!4217 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4217 (= call!4220 (byteRangesEq!0 (select (arr!7506 (buf!6987 w1!591)) (_3!983 lt!408150)) (select (arr!7506 (buf!6987 w2!587)) (_3!983 lt!408150)) lt!408152 (ite c!12351 lt!408151 #b00000000000000000000000000001000)))))

(declare-fun b!267979 () Bool)

(assert (=> b!267979 (= e!188009 (byteRangesEq!0 (select (arr!7506 (buf!6987 w1!591)) (_4!203 lt!408150)) (select (arr!7506 (buf!6987 w2!587)) (_4!203 lt!408150)) #b00000000000000000000000000000000 lt!408151))))

(assert (= (and d!90504 (not res!223543)) b!267974))

(assert (= (and b!267974 (not res!223541)) b!267976))

(assert (= (and b!267974 res!223544) b!267978))

(assert (= (and b!267978 c!12351) b!267977))

(assert (= (and b!267978 (not c!12351)) b!267975))

(assert (= (and b!267975 res!223542) b!267973))

(assert (= (and b!267973 (not res!223545)) b!267979))

(assert (= (or b!267977 b!267975) bm!4217))

(assert (=> b!267974 m!399235))

(declare-fun m!399317 () Bool)

(assert (=> b!267974 m!399317))

(declare-fun m!399321 () Bool)

(assert (=> b!267976 m!399321))

(declare-fun m!399325 () Bool)

(assert (=> bm!4217 m!399325))

(declare-fun m!399329 () Bool)

(assert (=> bm!4217 m!399329))

(assert (=> bm!4217 m!399325))

(assert (=> bm!4217 m!399329))

(declare-fun m!399331 () Bool)

(assert (=> bm!4217 m!399331))

(declare-fun m!399335 () Bool)

(assert (=> b!267979 m!399335))

(declare-fun m!399339 () Bool)

(assert (=> b!267979 m!399339))

(assert (=> b!267979 m!399335))

(assert (=> b!267979 m!399339))

(declare-fun m!399345 () Bool)

(assert (=> b!267979 m!399345))

(assert (=> b!267887 d!90504))

(declare-fun d!90512 () Bool)

(declare-fun e!188033 () Bool)

(assert (=> d!90512 e!188033))

(declare-fun res!223571 () Bool)

(assert (=> d!90512 (=> (not res!223571) (not e!188033))))

(declare-fun lt!408207 () (_ BitVec 64))

(declare-fun lt!408205 () (_ BitVec 64))

(declare-fun lt!408209 () (_ BitVec 64))

(assert (=> d!90512 (= res!223571 (= lt!408209 (bvsub lt!408205 lt!408207)))))

(assert (=> d!90512 (or (= (bvand lt!408205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408207 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408205 lt!408207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90512 (= lt!408207 (remainingBits!0 ((_ sign_extend 32) (size!6519 (buf!6987 w1!591))) ((_ sign_extend 32) (currentByte!12893 w1!591)) ((_ sign_extend 32) (currentBit!12888 w1!591))))))

(declare-fun lt!408206 () (_ BitVec 64))

(declare-fun lt!408208 () (_ BitVec 64))

(assert (=> d!90512 (= lt!408205 (bvmul lt!408206 lt!408208))))

(assert (=> d!90512 (or (= lt!408206 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408208 (bvsdiv (bvmul lt!408206 lt!408208) lt!408206)))))

(assert (=> d!90512 (= lt!408208 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90512 (= lt!408206 ((_ sign_extend 32) (size!6519 (buf!6987 w1!591))))))

(assert (=> d!90512 (= lt!408209 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12893 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12888 w1!591))))))

(assert (=> d!90512 (invariant!0 (currentBit!12888 w1!591) (currentByte!12893 w1!591) (size!6519 (buf!6987 w1!591)))))

(assert (=> d!90512 (= (bitIndex!0 (size!6519 (buf!6987 w1!591)) (currentByte!12893 w1!591) (currentBit!12888 w1!591)) lt!408209)))

(declare-fun b!268007 () Bool)

(declare-fun res!223572 () Bool)

(assert (=> b!268007 (=> (not res!223572) (not e!188033))))

(assert (=> b!268007 (= res!223572 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408209))))

(declare-fun b!268008 () Bool)

(declare-fun lt!408204 () (_ BitVec 64))

(assert (=> b!268008 (= e!188033 (bvsle lt!408209 (bvmul lt!408204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268008 (or (= lt!408204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408204)))))

(assert (=> b!268008 (= lt!408204 ((_ sign_extend 32) (size!6519 (buf!6987 w1!591))))))

(assert (= (and d!90512 res!223571) b!268007))

(assert (= (and b!268007 res!223572) b!268008))

(declare-fun m!399369 () Bool)

(assert (=> d!90512 m!399369))

(assert (=> d!90512 m!399239))

(assert (=> b!267887 d!90512))

(declare-fun b!268009 () Bool)

(declare-fun res!223577 () Bool)

(declare-fun lt!408211 () (_ BitVec 32))

(assert (=> b!268009 (= res!223577 (= lt!408211 #b00000000000000000000000000000000))))

(declare-fun e!188034 () Bool)

(assert (=> b!268009 (=> res!223577 e!188034)))

(declare-fun e!188035 () Bool)

(assert (=> b!268009 (= e!188035 e!188034)))

(declare-fun b!268010 () Bool)

(declare-fun e!188039 () Bool)

(declare-fun e!188038 () Bool)

(assert (=> b!268010 (= e!188039 e!188038)))

(declare-fun res!223576 () Bool)

(assert (=> b!268010 (=> (not res!223576) (not e!188038))))

(declare-fun e!188037 () Bool)

(assert (=> b!268010 (= res!223576 e!188037)))

(declare-fun res!223573 () Bool)

(assert (=> b!268010 (=> res!223573 e!188037)))

(declare-fun lt!408210 () tuple4!406)

(assert (=> b!268010 (= res!223573 (bvsge (_1!12186 lt!408210) (_2!12186 lt!408210)))))

(assert (=> b!268010 (= lt!408211 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6519 (buf!6987 w2!587)) (currentByte!12893 w2!587) (currentBit!12888 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408212 () (_ BitVec 32))

(assert (=> b!268010 (= lt!408212 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268010 (= lt!408210 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6519 (buf!6987 w2!587)) (currentByte!12893 w2!587) (currentBit!12888 w2!587))))))

(declare-fun b!268011 () Bool)

(declare-fun e!188036 () Bool)

(assert (=> b!268011 (= e!188036 e!188035)))

(declare-fun res!223574 () Bool)

(declare-fun call!4222 () Bool)

(assert (=> b!268011 (= res!223574 call!4222)))

(assert (=> b!268011 (=> (not res!223574) (not e!188035))))

(declare-fun b!268012 () Bool)

(assert (=> b!268012 (= e!188037 (arrayRangesEq!1054 (buf!6987 w2!587) (buf!6987 w3!25) (_1!12186 lt!408210) (_2!12186 lt!408210)))))

(declare-fun b!268013 () Bool)

(assert (=> b!268013 (= e!188036 call!4222)))

(declare-fun b!268014 () Bool)

(assert (=> b!268014 (= e!188038 e!188036)))

(declare-fun c!12353 () Bool)

(assert (=> b!268014 (= c!12353 (= (_3!983 lt!408210) (_4!203 lt!408210)))))

(declare-fun d!90528 () Bool)

(declare-fun res!223575 () Bool)

(assert (=> d!90528 (=> res!223575 e!188039)))

(assert (=> d!90528 (= res!223575 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6519 (buf!6987 w2!587)) (currentByte!12893 w2!587) (currentBit!12888 w2!587))))))

(assert (=> d!90528 (= (arrayBitRangesEq!0 (buf!6987 w2!587) (buf!6987 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6519 (buf!6987 w2!587)) (currentByte!12893 w2!587) (currentBit!12888 w2!587))) e!188039)))

(declare-fun bm!4219 () Bool)

(assert (=> bm!4219 (= call!4222 (byteRangesEq!0 (select (arr!7506 (buf!6987 w2!587)) (_3!983 lt!408210)) (select (arr!7506 (buf!6987 w3!25)) (_3!983 lt!408210)) lt!408212 (ite c!12353 lt!408211 #b00000000000000000000000000001000)))))

(declare-fun b!268015 () Bool)

(assert (=> b!268015 (= e!188034 (byteRangesEq!0 (select (arr!7506 (buf!6987 w2!587)) (_4!203 lt!408210)) (select (arr!7506 (buf!6987 w3!25)) (_4!203 lt!408210)) #b00000000000000000000000000000000 lt!408211))))

(assert (= (and d!90528 (not res!223575)) b!268010))

(assert (= (and b!268010 (not res!223573)) b!268012))

(assert (= (and b!268010 res!223576) b!268014))

(assert (= (and b!268014 c!12353) b!268013))

(assert (= (and b!268014 (not c!12353)) b!268011))

(assert (= (and b!268011 res!223574) b!268009))

(assert (= (and b!268009 (not res!223577)) b!268015))

(assert (= (or b!268013 b!268011) bm!4219))

(assert (=> b!268010 m!399219))

(declare-fun m!399371 () Bool)

(assert (=> b!268010 m!399371))

(declare-fun m!399373 () Bool)

(assert (=> b!268012 m!399373))

(declare-fun m!399375 () Bool)

(assert (=> bm!4219 m!399375))

(declare-fun m!399377 () Bool)

(assert (=> bm!4219 m!399377))

(assert (=> bm!4219 m!399375))

(assert (=> bm!4219 m!399377))

(declare-fun m!399379 () Bool)

(assert (=> bm!4219 m!399379))

(declare-fun m!399381 () Bool)

(assert (=> b!268015 m!399381))

(declare-fun m!399383 () Bool)

(assert (=> b!268015 m!399383))

(assert (=> b!268015 m!399381))

(assert (=> b!268015 m!399383))

(declare-fun m!399385 () Bool)

(assert (=> b!268015 m!399385))

(assert (=> b!267881 d!90528))

(declare-fun d!90530 () Bool)

(declare-fun e!188040 () Bool)

(assert (=> d!90530 e!188040))

(declare-fun res!223578 () Bool)

(assert (=> d!90530 (=> (not res!223578) (not e!188040))))

(declare-fun lt!408214 () (_ BitVec 64))

(declare-fun lt!408216 () (_ BitVec 64))

(declare-fun lt!408218 () (_ BitVec 64))

(assert (=> d!90530 (= res!223578 (= lt!408218 (bvsub lt!408214 lt!408216)))))

(assert (=> d!90530 (or (= (bvand lt!408214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408216 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408214 lt!408216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90530 (= lt!408216 (remainingBits!0 ((_ sign_extend 32) (size!6519 (buf!6987 w2!587))) ((_ sign_extend 32) (currentByte!12893 w2!587)) ((_ sign_extend 32) (currentBit!12888 w2!587))))))

(declare-fun lt!408215 () (_ BitVec 64))

(declare-fun lt!408217 () (_ BitVec 64))

(assert (=> d!90530 (= lt!408214 (bvmul lt!408215 lt!408217))))

(assert (=> d!90530 (or (= lt!408215 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408217 (bvsdiv (bvmul lt!408215 lt!408217) lt!408215)))))

(assert (=> d!90530 (= lt!408217 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90530 (= lt!408215 ((_ sign_extend 32) (size!6519 (buf!6987 w2!587))))))

(assert (=> d!90530 (= lt!408218 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12893 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12888 w2!587))))))

(assert (=> d!90530 (invariant!0 (currentBit!12888 w2!587) (currentByte!12893 w2!587) (size!6519 (buf!6987 w2!587)))))

(assert (=> d!90530 (= (bitIndex!0 (size!6519 (buf!6987 w2!587)) (currentByte!12893 w2!587) (currentBit!12888 w2!587)) lt!408218)))

(declare-fun b!268016 () Bool)

(declare-fun res!223579 () Bool)

(assert (=> b!268016 (=> (not res!223579) (not e!188040))))

(assert (=> b!268016 (= res!223579 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408218))))

(declare-fun b!268017 () Bool)

(declare-fun lt!408213 () (_ BitVec 64))

(assert (=> b!268017 (= e!188040 (bvsle lt!408218 (bvmul lt!408213 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268017 (or (= lt!408213 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408213 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408213)))))

(assert (=> b!268017 (= lt!408213 ((_ sign_extend 32) (size!6519 (buf!6987 w2!587))))))

(assert (= (and d!90530 res!223578) b!268016))

(assert (= (and b!268016 res!223579) b!268017))

(declare-fun m!399387 () Bool)

(assert (=> d!90530 m!399387))

(assert (=> d!90530 m!399243))

(assert (=> b!267881 d!90530))

(assert (=> b!267885 d!90512))

(assert (=> b!267885 d!90530))

(assert (=> b!267879 d!90530))

(declare-fun d!90536 () Bool)

(declare-fun e!188041 () Bool)

(assert (=> d!90536 e!188041))

(declare-fun res!223580 () Bool)

(assert (=> d!90536 (=> (not res!223580) (not e!188041))))

(declare-fun lt!408224 () (_ BitVec 64))

(declare-fun lt!408220 () (_ BitVec 64))

(declare-fun lt!408222 () (_ BitVec 64))

(assert (=> d!90536 (= res!223580 (= lt!408224 (bvsub lt!408220 lt!408222)))))

(assert (=> d!90536 (or (= (bvand lt!408220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408220 lt!408222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90536 (= lt!408222 (remainingBits!0 ((_ sign_extend 32) (size!6519 (buf!6987 w3!25))) ((_ sign_extend 32) (currentByte!12893 w3!25)) ((_ sign_extend 32) (currentBit!12888 w3!25))))))

(declare-fun lt!408221 () (_ BitVec 64))

(declare-fun lt!408223 () (_ BitVec 64))

(assert (=> d!90536 (= lt!408220 (bvmul lt!408221 lt!408223))))

(assert (=> d!90536 (or (= lt!408221 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408223 (bvsdiv (bvmul lt!408221 lt!408223) lt!408221)))))

(assert (=> d!90536 (= lt!408223 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90536 (= lt!408221 ((_ sign_extend 32) (size!6519 (buf!6987 w3!25))))))

(assert (=> d!90536 (= lt!408224 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12893 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12888 w3!25))))))

(assert (=> d!90536 (invariant!0 (currentBit!12888 w3!25) (currentByte!12893 w3!25) (size!6519 (buf!6987 w3!25)))))

(assert (=> d!90536 (= (bitIndex!0 (size!6519 (buf!6987 w3!25)) (currentByte!12893 w3!25) (currentBit!12888 w3!25)) lt!408224)))

(declare-fun b!268018 () Bool)

(declare-fun res!223581 () Bool)

(assert (=> b!268018 (=> (not res!223581) (not e!188041))))

(assert (=> b!268018 (= res!223581 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408224))))

(declare-fun b!268019 () Bool)

(declare-fun lt!408219 () (_ BitVec 64))

(assert (=> b!268019 (= e!188041 (bvsle lt!408224 (bvmul lt!408219 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268019 (or (= lt!408219 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408219 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408219)))))

(assert (=> b!268019 (= lt!408219 ((_ sign_extend 32) (size!6519 (buf!6987 w3!25))))))

(assert (= (and d!90536 res!223580) b!268018))

(assert (= (and b!268018 res!223581) b!268019))

(declare-fun m!399389 () Bool)

(assert (=> d!90536 m!399389))

(assert (=> d!90536 m!399245))

(assert (=> b!267879 d!90536))

(declare-fun d!90538 () Bool)

(assert (=> d!90538 (= (invariant!0 (currentBit!12888 w1!591) (currentByte!12893 w1!591) (size!6519 (buf!6987 w1!591))) (and (bvsge (currentBit!12888 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12888 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12893 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12893 w1!591) (size!6519 (buf!6987 w1!591))) (and (= (currentBit!12888 w1!591) #b00000000000000000000000000000000) (= (currentByte!12893 w1!591) (size!6519 (buf!6987 w1!591)))))))))

(assert (=> d!90454 d!90538))

(assert (=> d!90480 d!90468))

(declare-fun d!90540 () Bool)

(assert (=> d!90540 (arrayRangesEq!1054 (buf!6987 w1!591) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591))))

(assert (=> d!90540 true))

(declare-fun _$16!94 () Unit!19011)

(assert (=> d!90540 (= (choose!370 (buf!6987 w1!591) (buf!6987 w2!587) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591) (currentByte!12893 w2!587)) _$16!94)))

(declare-fun bs!22995 () Bool)

(assert (= bs!22995 d!90540))

(assert (=> bs!22995 m!399179))

(assert (=> d!90480 d!90540))

(declare-fun d!90544 () Bool)

(assert (=> d!90544 (= (select (arr!7506 (buf!6987 w2!587)) (currentByte!12893 w1!591)) (select (arr!7506 (buf!6987 w3!25)) (currentByte!12893 w1!591)))))

(assert (=> d!90544 true))

(declare-fun _$12!90 () Unit!19011)

(assert (=> d!90544 (= (choose!366 (buf!6987 w2!587) (buf!6987 w3!25) #b00000000000000000000000000000000 (currentByte!12893 w1!591) (currentByte!12893 w2!587)) _$12!90)))

(declare-fun bs!22997 () Bool)

(assert (= bs!22997 d!90544))

(assert (=> bs!22997 m!399187))

(assert (=> bs!22997 m!399189))

(assert (=> d!90444 d!90544))

(declare-fun d!90546 () Bool)

(assert (=> d!90546 (= (invariant!0 (currentBit!12888 w2!587) (currentByte!12893 w2!587) (size!6519 (buf!6987 w2!587))) (and (bvsge (currentBit!12888 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12888 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12893 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12893 w2!587) (size!6519 (buf!6987 w2!587))) (and (= (currentBit!12888 w2!587) #b00000000000000000000000000000000) (= (currentByte!12893 w2!587) (size!6519 (buf!6987 w2!587)))))))))

(assert (=> d!90456 d!90546))

(declare-fun d!90548 () Bool)

(declare-fun res!223587 () Bool)

(declare-fun e!188048 () Bool)

(assert (=> d!90548 (=> res!223587 e!188048)))

(assert (=> d!90548 (= res!223587 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12893 w1!591)))))

(assert (=> d!90548 (= (arrayRangesEq!1054 (buf!6987 w1!591) (buf!6987 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12893 w1!591)) e!188048)))

(declare-fun b!268027 () Bool)

(declare-fun e!188049 () Bool)

(assert (=> b!268027 (= e!188048 e!188049)))

(declare-fun res!223588 () Bool)

(assert (=> b!268027 (=> (not res!223588) (not e!188049))))

(assert (=> b!268027 (= res!223588 (= (select (arr!7506 (buf!6987 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7506 (buf!6987 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268028 () Bool)

(assert (=> b!268028 (= e!188049 (arrayRangesEq!1054 (buf!6987 w1!591) (buf!6987 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12893 w1!591)))))

(assert (= (and d!90548 (not res!223587)) b!268027))

(assert (= (and b!268027 res!223588) b!268028))

(declare-fun m!399407 () Bool)

(assert (=> b!268027 m!399407))

(declare-fun m!399409 () Bool)

(assert (=> b!268027 m!399409))

(declare-fun m!399411 () Bool)

(assert (=> b!268028 m!399411))

(assert (=> b!267902 d!90548))

(declare-fun d!90550 () Bool)

(assert (=> d!90550 (= (invariant!0 (currentBit!12888 w3!25) (currentByte!12893 w3!25) (size!6519 (buf!6987 w3!25))) (and (bvsge (currentBit!12888 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12888 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12893 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12893 w3!25) (size!6519 (buf!6987 w3!25))) (and (= (currentBit!12888 w3!25) #b00000000000000000000000000000000) (= (currentByte!12893 w3!25) (size!6519 (buf!6987 w3!25)))))))))

(assert (=> d!90460 d!90550))

(push 1)

(assert (not d!90530))

(assert (not d!90536))

(assert (not b!268012))

(assert (not bm!4219))

(assert (not b!267979))

(assert (not b!267974))

(assert (not b!268028))

(assert (not d!90540))

(assert (not b!268015))

(assert (not b!267976))

(assert (not b!268010))

(assert (not d!90512))

(assert (not bm!4217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

