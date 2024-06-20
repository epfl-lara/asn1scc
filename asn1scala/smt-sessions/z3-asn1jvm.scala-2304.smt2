; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58286 () Bool)

(assert start!58286)

(declare-fun b!267831 () Bool)

(declare-fun e!187888 () Bool)

(declare-datatypes ((array!14944 0))(
  ( (array!14945 (arr!7505 (Array (_ BitVec 32) (_ BitVec 8))) (size!6518 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11850 0))(
  ( (BitStream!11851 (buf!6986 array!14944) (currentByte!12892 (_ BitVec 32)) (currentBit!12887 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11850)

(declare-fun array_inv!6242 (array!14944) Bool)

(assert (=> b!267831 (= e!187888 (array_inv!6242 (buf!6986 w3!25)))))

(declare-fun b!267832 () Bool)

(declare-fun e!187887 () Bool)

(declare-fun w1!591 () BitStream!11850)

(assert (=> b!267832 (= e!187887 (array_inv!6242 (buf!6986 w1!591)))))

(declare-fun b!267833 () Bool)

(declare-fun res!223429 () Bool)

(declare-fun e!187889 () Bool)

(assert (=> b!267833 (=> (not res!223429) (not e!187889))))

(declare-fun w2!587 () BitStream!11850)

(declare-fun isPrefixOf!0 (BitStream!11850 BitStream!11850) Bool)

(assert (=> b!267833 (= res!223429 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!223427 () Bool)

(assert (=> start!58286 (=> (not res!223427) (not e!187889))))

(assert (=> start!58286 (= res!223427 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58286 e!187889))

(declare-fun inv!12 (BitStream!11850) Bool)

(assert (=> start!58286 (and (inv!12 w1!591) e!187887)))

(declare-fun e!187890 () Bool)

(assert (=> start!58286 (and (inv!12 w2!587) e!187890)))

(assert (=> start!58286 (and (inv!12 w3!25) e!187888)))

(declare-fun b!267834 () Bool)

(declare-fun e!187883 () Bool)

(assert (=> b!267834 (= e!187883 (or (not (= ((_ sign_extend 24) (select (arr!7505 (buf!6986 w2!587)) (currentByte!12892 w1!591))) ((_ sign_extend 24) (select (arr!7505 (buf!6986 w3!25)) (currentByte!12892 w1!591))))) (and (bvsle #b00000000000000000000000000000000 (currentBit!12887 w1!591)) (bvsle (currentBit!12887 w1!591) #b00000000000000000000000000001000))))))

(assert (=> b!267834 (= (select (arr!7505 (buf!6986 w2!587)) (currentByte!12892 w1!591)) (select (arr!7505 (buf!6986 w3!25)) (currentByte!12892 w1!591)))))

(declare-datatypes ((Unit!19009 0))(
  ( (Unit!19010) )
))
(declare-fun lt!408077 () Unit!19009)

(declare-fun arrayRangesEqImpliesEq!146 (array!14944 array!14944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> b!267834 (= lt!408077 (arrayRangesEqImpliesEq!146 (buf!6986 w2!587) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591) (currentByte!12892 w2!587)))))

(declare-fun b!267835 () Bool)

(assert (=> b!267835 (= e!187890 (array_inv!6242 (buf!6986 w2!587)))))

(declare-fun b!267836 () Bool)

(assert (=> b!267836 (= e!187889 (not e!187883))))

(declare-fun res!223428 () Bool)

(assert (=> b!267836 (=> res!223428 e!187883)))

(assert (=> b!267836 (= res!223428 (or (bvsge (currentByte!12892 w1!591) (size!6518 (buf!6986 w1!591))) (bvsge (currentByte!12892 w1!591) (currentByte!12892 w2!587))))))

(declare-fun arrayRangesEq!1053 (array!14944 array!14944 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267836 (arrayRangesEq!1053 (buf!6986 w1!591) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591))))

(declare-fun lt!408076 () Unit!19009)

(declare-fun arrayRangesEqTransitive!328 (array!14944 array!14944 array!14944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> b!267836 (= lt!408076 (arrayRangesEqTransitive!328 (buf!6986 w1!591) (buf!6986 w2!587) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591) (currentByte!12892 w2!587)))))

(assert (= (and start!58286 res!223427) b!267833))

(assert (= (and b!267833 res!223429) b!267836))

(assert (= (and b!267836 (not res!223428)) b!267834))

(assert (= start!58286 b!267832))

(assert (= start!58286 b!267835))

(assert (= start!58286 b!267831))

(declare-fun m!399151 () Bool)

(assert (=> b!267832 m!399151))

(declare-fun m!399153 () Bool)

(assert (=> b!267835 m!399153))

(declare-fun m!399155 () Bool)

(assert (=> b!267836 m!399155))

(declare-fun m!399157 () Bool)

(assert (=> b!267836 m!399157))

(declare-fun m!399159 () Bool)

(assert (=> b!267831 m!399159))

(declare-fun m!399161 () Bool)

(assert (=> start!58286 m!399161))

(declare-fun m!399163 () Bool)

(assert (=> start!58286 m!399163))

(declare-fun m!399165 () Bool)

(assert (=> start!58286 m!399165))

(declare-fun m!399167 () Bool)

(assert (=> start!58286 m!399167))

(declare-fun m!399169 () Bool)

(assert (=> b!267833 m!399169))

(declare-fun m!399171 () Bool)

(assert (=> b!267834 m!399171))

(declare-fun m!399173 () Bool)

(assert (=> b!267834 m!399173))

(declare-fun m!399175 () Bool)

(assert (=> b!267834 m!399175))

(check-sat (not b!267834) (not b!267833) (not b!267835) (not b!267836) (not b!267831) (not start!58286) (not b!267832))
(check-sat)
(get-model)

(declare-fun d!90420 () Bool)

(assert (=> d!90420 (= (array_inv!6242 (buf!6986 w2!587)) (bvsge (size!6518 (buf!6986 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!267835 d!90420))

(declare-fun d!90422 () Bool)

(declare-fun res!223466 () Bool)

(declare-fun e!187933 () Bool)

(assert (=> d!90422 (=> (not res!223466) (not e!187933))))

(assert (=> d!90422 (= res!223466 (= (size!6518 (buf!6986 w2!587)) (size!6518 (buf!6986 w3!25))))))

(assert (=> d!90422 (= (isPrefixOf!0 w2!587 w3!25) e!187933)))

(declare-fun b!267882 () Bool)

(declare-fun res!223468 () Bool)

(assert (=> b!267882 (=> (not res!223468) (not e!187933))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!267882 (= res!223468 (bvsle (bitIndex!0 (size!6518 (buf!6986 w2!587)) (currentByte!12892 w2!587) (currentBit!12887 w2!587)) (bitIndex!0 (size!6518 (buf!6986 w3!25)) (currentByte!12892 w3!25) (currentBit!12887 w3!25))))))

(declare-fun b!267883 () Bool)

(declare-fun e!187934 () Bool)

(assert (=> b!267883 (= e!187933 e!187934)))

(declare-fun res!223467 () Bool)

(assert (=> b!267883 (=> res!223467 e!187934)))

(assert (=> b!267883 (= res!223467 (= (size!6518 (buf!6986 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!267884 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14944 array!14944 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!267884 (= e!187934 (arrayBitRangesEq!0 (buf!6986 w2!587) (buf!6986 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6518 (buf!6986 w2!587)) (currentByte!12892 w2!587) (currentBit!12887 w2!587))))))

(assert (= (and d!90422 res!223466) b!267882))

(assert (= (and b!267882 res!223468) b!267883))

(assert (= (and b!267883 (not res!223467)) b!267884))

(declare-fun m!399225 () Bool)

(assert (=> b!267882 m!399225))

(declare-fun m!399227 () Bool)

(assert (=> b!267882 m!399227))

(assert (=> b!267884 m!399225))

(assert (=> b!267884 m!399225))

(declare-fun m!399229 () Bool)

(assert (=> b!267884 m!399229))

(assert (=> b!267833 d!90422))

(declare-fun d!90446 () Bool)

(assert (=> d!90446 (and (bvsge (currentByte!12892 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!12892 w1!591) (size!6518 (buf!6986 w2!587))) (bvslt (currentByte!12892 w1!591) (size!6518 (buf!6986 w3!25))) (= (select (arr!7505 (buf!6986 w2!587)) (currentByte!12892 w1!591)) (select (arr!7505 (buf!6986 w3!25)) (currentByte!12892 w1!591))))))

(declare-fun lt!408092 () Unit!19009)

(declare-fun choose!368 (array!14944 array!14944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> d!90446 (= lt!408092 (choose!368 (buf!6986 w2!587) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591) (currentByte!12892 w2!587)))))

(assert (=> d!90446 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12892 w2!587)))))

(assert (=> d!90446 (= (arrayRangesEqImpliesEq!146 (buf!6986 w2!587) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591) (currentByte!12892 w2!587)) lt!408092)))

(declare-fun bs!22983 () Bool)

(assert (= bs!22983 d!90446))

(assert (=> bs!22983 m!399171))

(assert (=> bs!22983 m!399173))

(declare-fun m!399241 () Bool)

(assert (=> bs!22983 m!399241))

(assert (=> b!267834 d!90446))

(declare-fun d!90458 () Bool)

(assert (=> d!90458 (= (array_inv!6242 (buf!6986 w1!591)) (bvsge (size!6518 (buf!6986 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!267832 d!90458))

(declare-fun d!90462 () Bool)

(declare-fun res!223478 () Bool)

(declare-fun e!187943 () Bool)

(assert (=> d!90462 (=> (not res!223478) (not e!187943))))

(assert (=> d!90462 (= res!223478 (= (size!6518 (buf!6986 w1!591)) (size!6518 (buf!6986 w2!587))))))

(assert (=> d!90462 (= (isPrefixOf!0 w1!591 w2!587) e!187943)))

(declare-fun b!267894 () Bool)

(declare-fun res!223480 () Bool)

(assert (=> b!267894 (=> (not res!223480) (not e!187943))))

(assert (=> b!267894 (= res!223480 (bvsle (bitIndex!0 (size!6518 (buf!6986 w1!591)) (currentByte!12892 w1!591) (currentBit!12887 w1!591)) (bitIndex!0 (size!6518 (buf!6986 w2!587)) (currentByte!12892 w2!587) (currentBit!12887 w2!587))))))

(declare-fun b!267895 () Bool)

(declare-fun e!187944 () Bool)

(assert (=> b!267895 (= e!187943 e!187944)))

(declare-fun res!223479 () Bool)

(assert (=> b!267895 (=> res!223479 e!187944)))

(assert (=> b!267895 (= res!223479 (= (size!6518 (buf!6986 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!267896 () Bool)

(assert (=> b!267896 (= e!187944 (arrayBitRangesEq!0 (buf!6986 w1!591) (buf!6986 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6518 (buf!6986 w1!591)) (currentByte!12892 w1!591) (currentBit!12887 w1!591))))))

(assert (= (and d!90462 res!223478) b!267894))

(assert (= (and b!267894 res!223480) b!267895))

(assert (= (and b!267895 (not res!223479)) b!267896))

(declare-fun m!399253 () Bool)

(assert (=> b!267894 m!399253))

(assert (=> b!267894 m!399225))

(assert (=> b!267896 m!399253))

(assert (=> b!267896 m!399253))

(declare-fun m!399255 () Bool)

(assert (=> b!267896 m!399255))

(assert (=> start!58286 d!90462))

(declare-fun d!90472 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!90472 (= (inv!12 w1!591) (invariant!0 (currentBit!12887 w1!591) (currentByte!12892 w1!591) (size!6518 (buf!6986 w1!591))))))

(declare-fun bs!22986 () Bool)

(assert (= bs!22986 d!90472))

(declare-fun m!399257 () Bool)

(assert (=> bs!22986 m!399257))

(assert (=> start!58286 d!90472))

(declare-fun d!90474 () Bool)

(assert (=> d!90474 (= (inv!12 w2!587) (invariant!0 (currentBit!12887 w2!587) (currentByte!12892 w2!587) (size!6518 (buf!6986 w2!587))))))

(declare-fun bs!22987 () Bool)

(assert (= bs!22987 d!90474))

(declare-fun m!399259 () Bool)

(assert (=> bs!22987 m!399259))

(assert (=> start!58286 d!90474))

(declare-fun d!90476 () Bool)

(assert (=> d!90476 (= (inv!12 w3!25) (invariant!0 (currentBit!12887 w3!25) (currentByte!12892 w3!25) (size!6518 (buf!6986 w3!25))))))

(declare-fun bs!22988 () Bool)

(assert (= bs!22988 d!90476))

(declare-fun m!399261 () Bool)

(assert (=> bs!22988 m!399261))

(assert (=> start!58286 d!90476))

(declare-fun d!90478 () Bool)

(declare-fun res!223491 () Bool)

(declare-fun e!187955 () Bool)

(assert (=> d!90478 (=> res!223491 e!187955)))

(assert (=> d!90478 (= res!223491 (= #b00000000000000000000000000000000 (currentByte!12892 w1!591)))))

(assert (=> d!90478 (= (arrayRangesEq!1053 (buf!6986 w1!591) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591)) e!187955)))

(declare-fun b!267907 () Bool)

(declare-fun e!187956 () Bool)

(assert (=> b!267907 (= e!187955 e!187956)))

(declare-fun res!223492 () Bool)

(assert (=> b!267907 (=> (not res!223492) (not e!187956))))

(assert (=> b!267907 (= res!223492 (= (select (arr!7505 (buf!6986 w1!591)) #b00000000000000000000000000000000) (select (arr!7505 (buf!6986 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!267908 () Bool)

(assert (=> b!267908 (= e!187956 (arrayRangesEq!1053 (buf!6986 w1!591) (buf!6986 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12892 w1!591)))))

(assert (= (and d!90478 (not res!223491)) b!267907))

(assert (= (and b!267907 res!223492) b!267908))

(declare-fun m!399273 () Bool)

(assert (=> b!267907 m!399273))

(declare-fun m!399275 () Bool)

(assert (=> b!267907 m!399275))

(declare-fun m!399277 () Bool)

(assert (=> b!267908 m!399277))

(assert (=> b!267836 d!90478))

(declare-fun d!90482 () Bool)

(assert (=> d!90482 (arrayRangesEq!1053 (buf!6986 w1!591) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591))))

(declare-fun lt!408101 () Unit!19009)

(declare-fun choose!371 (array!14944 array!14944 array!14944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19009)

(assert (=> d!90482 (= lt!408101 (choose!371 (buf!6986 w1!591) (buf!6986 w2!587) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591) (currentByte!12892 w2!587)))))

(assert (=> d!90482 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12892 w1!591)) (bvsle (currentByte!12892 w1!591) (currentByte!12892 w2!587)))))

(assert (=> d!90482 (= (arrayRangesEqTransitive!328 (buf!6986 w1!591) (buf!6986 w2!587) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591) (currentByte!12892 w2!587)) lt!408101)))

(declare-fun bs!22991 () Bool)

(assert (= bs!22991 d!90482))

(assert (=> bs!22991 m!399155))

(declare-fun m!399279 () Bool)

(assert (=> bs!22991 m!399279))

(assert (=> b!267836 d!90482))

(declare-fun d!90484 () Bool)

(assert (=> d!90484 (= (array_inv!6242 (buf!6986 w3!25)) (bvsge (size!6518 (buf!6986 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!267831 d!90484))

(check-sat (not b!267894) (not b!267908) (not b!267896) (not d!90472) (not d!90476) (not b!267882) (not b!267884) (not d!90446) (not d!90482) (not d!90474))
(check-sat)
(get-model)

(declare-fun d!90486 () Bool)

(assert (=> d!90486 (= (invariant!0 (currentBit!12887 w1!591) (currentByte!12892 w1!591) (size!6518 (buf!6986 w1!591))) (and (bvsge (currentBit!12887 w1!591) #b00000000000000000000000000000000) (bvslt (currentBit!12887 w1!591) #b00000000000000000000000000001000) (bvsge (currentByte!12892 w1!591) #b00000000000000000000000000000000) (or (bvslt (currentByte!12892 w1!591) (size!6518 (buf!6986 w1!591))) (and (= (currentBit!12887 w1!591) #b00000000000000000000000000000000) (= (currentByte!12892 w1!591) (size!6518 (buf!6986 w1!591)))))))))

(assert (=> d!90472 d!90486))

(declare-fun b!267931 () Bool)

(declare-fun e!187976 () Bool)

(declare-fun e!187975 () Bool)

(assert (=> b!267931 (= e!187976 e!187975)))

(declare-fun res!223511 () Bool)

(assert (=> b!267931 (=> (not res!223511) (not e!187975))))

(declare-fun e!187977 () Bool)

(assert (=> b!267931 (= res!223511 e!187977)))

(declare-fun res!223513 () Bool)

(assert (=> b!267931 (=> res!223513 e!187977)))

(declare-datatypes ((tuple4!404 0))(
  ( (tuple4!405 (_1!12185 (_ BitVec 32)) (_2!12185 (_ BitVec 32)) (_3!982 (_ BitVec 32)) (_4!202 (_ BitVec 32))) )
))
(declare-fun lt!408134 () tuple4!404)

(assert (=> b!267931 (= res!223513 (bvsge (_1!12185 lt!408134) (_2!12185 lt!408134)))))

(declare-fun lt!408132 () (_ BitVec 32))

(assert (=> b!267931 (= lt!408132 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6518 (buf!6986 w2!587)) (currentByte!12892 w2!587) (currentBit!12887 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408133 () (_ BitVec 32))

(assert (=> b!267931 (= lt!408133 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!404)

(assert (=> b!267931 (= lt!408134 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6518 (buf!6986 w2!587)) (currentByte!12892 w2!587) (currentBit!12887 w2!587))))))

(declare-fun b!267932 () Bool)

(declare-fun res!223512 () Bool)

(assert (=> b!267932 (= res!223512 (= lt!408132 #b00000000000000000000000000000000))))

(declare-fun e!187978 () Bool)

(assert (=> b!267932 (=> res!223512 e!187978)))

(declare-fun e!187973 () Bool)

(assert (=> b!267932 (= e!187973 e!187978)))

(declare-fun b!267933 () Bool)

(declare-fun e!187974 () Bool)

(assert (=> b!267933 (= e!187974 e!187973)))

(declare-fun res!223515 () Bool)

(declare-fun call!4214 () Bool)

(assert (=> b!267933 (= res!223515 call!4214)))

(assert (=> b!267933 (=> (not res!223515) (not e!187973))))

(declare-fun c!12345 () Bool)

(declare-fun bm!4211 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4211 (= call!4214 (byteRangesEq!0 (select (arr!7505 (buf!6986 w2!587)) (_3!982 lt!408134)) (select (arr!7505 (buf!6986 w3!25)) (_3!982 lt!408134)) lt!408133 (ite c!12345 lt!408132 #b00000000000000000000000000001000)))))

(declare-fun b!267935 () Bool)

(assert (=> b!267935 (= e!187975 e!187974)))

(assert (=> b!267935 (= c!12345 (= (_3!982 lt!408134) (_4!202 lt!408134)))))

(declare-fun b!267934 () Bool)

(assert (=> b!267934 (= e!187977 (arrayRangesEq!1053 (buf!6986 w2!587) (buf!6986 w3!25) (_1!12185 lt!408134) (_2!12185 lt!408134)))))

(declare-fun d!90490 () Bool)

(declare-fun res!223514 () Bool)

(assert (=> d!90490 (=> res!223514 e!187976)))

(assert (=> d!90490 (= res!223514 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6518 (buf!6986 w2!587)) (currentByte!12892 w2!587) (currentBit!12887 w2!587))))))

(assert (=> d!90490 (= (arrayBitRangesEq!0 (buf!6986 w2!587) (buf!6986 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6518 (buf!6986 w2!587)) (currentByte!12892 w2!587) (currentBit!12887 w2!587))) e!187976)))

(declare-fun b!267936 () Bool)

(assert (=> b!267936 (= e!187978 (byteRangesEq!0 (select (arr!7505 (buf!6986 w2!587)) (_4!202 lt!408134)) (select (arr!7505 (buf!6986 w3!25)) (_4!202 lt!408134)) #b00000000000000000000000000000000 lt!408132))))

(declare-fun b!267937 () Bool)

(assert (=> b!267937 (= e!187974 call!4214)))

(assert (= (and d!90490 (not res!223514)) b!267931))

(assert (= (and b!267931 (not res!223513)) b!267934))

(assert (= (and b!267931 res!223511) b!267935))

(assert (= (and b!267935 c!12345) b!267937))

(assert (= (and b!267935 (not c!12345)) b!267933))

(assert (= (and b!267933 res!223515) b!267932))

(assert (= (and b!267932 (not res!223512)) b!267936))

(assert (= (or b!267937 b!267933) bm!4211))

(assert (=> b!267931 m!399225))

(declare-fun m!399285 () Bool)

(assert (=> b!267931 m!399285))

(declare-fun m!399287 () Bool)

(assert (=> bm!4211 m!399287))

(declare-fun m!399289 () Bool)

(assert (=> bm!4211 m!399289))

(assert (=> bm!4211 m!399287))

(assert (=> bm!4211 m!399289))

(declare-fun m!399291 () Bool)

(assert (=> bm!4211 m!399291))

(declare-fun m!399293 () Bool)

(assert (=> b!267934 m!399293))

(declare-fun m!399295 () Bool)

(assert (=> b!267936 m!399295))

(declare-fun m!399297 () Bool)

(assert (=> b!267936 m!399297))

(assert (=> b!267936 m!399295))

(assert (=> b!267936 m!399297))

(declare-fun m!399299 () Bool)

(assert (=> b!267936 m!399299))

(assert (=> b!267884 d!90490))

(declare-fun d!90506 () Bool)

(declare-fun e!188026 () Bool)

(assert (=> d!90506 e!188026))

(declare-fun res!223560 () Bool)

(assert (=> d!90506 (=> (not res!223560) (not e!188026))))

(declare-fun lt!408175 () (_ BitVec 64))

(declare-fun lt!408179 () (_ BitVec 64))

(declare-fun lt!408176 () (_ BitVec 64))

(assert (=> d!90506 (= res!223560 (= lt!408179 (bvsub lt!408175 lt!408176)))))

(assert (=> d!90506 (or (= (bvand lt!408175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408176 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408175 lt!408176) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!90506 (= lt!408176 (remainingBits!0 ((_ sign_extend 32) (size!6518 (buf!6986 w2!587))) ((_ sign_extend 32) (currentByte!12892 w2!587)) ((_ sign_extend 32) (currentBit!12887 w2!587))))))

(declare-fun lt!408177 () (_ BitVec 64))

(declare-fun lt!408174 () (_ BitVec 64))

(assert (=> d!90506 (= lt!408175 (bvmul lt!408177 lt!408174))))

(assert (=> d!90506 (or (= lt!408177 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408174 (bvsdiv (bvmul lt!408177 lt!408174) lt!408177)))))

(assert (=> d!90506 (= lt!408174 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90506 (= lt!408177 ((_ sign_extend 32) (size!6518 (buf!6986 w2!587))))))

(assert (=> d!90506 (= lt!408179 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12892 w2!587)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12887 w2!587))))))

(assert (=> d!90506 (invariant!0 (currentBit!12887 w2!587) (currentByte!12892 w2!587) (size!6518 (buf!6986 w2!587)))))

(assert (=> d!90506 (= (bitIndex!0 (size!6518 (buf!6986 w2!587)) (currentByte!12892 w2!587) (currentBit!12887 w2!587)) lt!408179)))

(declare-fun b!267995 () Bool)

(declare-fun res!223559 () Bool)

(assert (=> b!267995 (=> (not res!223559) (not e!188026))))

(assert (=> b!267995 (= res!223559 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408179))))

(declare-fun b!267996 () Bool)

(declare-fun lt!408178 () (_ BitVec 64))

(assert (=> b!267996 (= e!188026 (bvsle lt!408179 (bvmul lt!408178 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267996 (or (= lt!408178 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408178 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408178)))))

(assert (=> b!267996 (= lt!408178 ((_ sign_extend 32) (size!6518 (buf!6986 w2!587))))))

(assert (= (and d!90506 res!223560) b!267995))

(assert (= (and b!267995 res!223559) b!267996))

(declare-fun m!399357 () Bool)

(assert (=> d!90506 m!399357))

(assert (=> d!90506 m!399259))

(assert (=> b!267884 d!90506))

(declare-fun d!90518 () Bool)

(assert (=> d!90518 (= (invariant!0 (currentBit!12887 w2!587) (currentByte!12892 w2!587) (size!6518 (buf!6986 w2!587))) (and (bvsge (currentBit!12887 w2!587) #b00000000000000000000000000000000) (bvslt (currentBit!12887 w2!587) #b00000000000000000000000000001000) (bvsge (currentByte!12892 w2!587) #b00000000000000000000000000000000) (or (bvslt (currentByte!12892 w2!587) (size!6518 (buf!6986 w2!587))) (and (= (currentBit!12887 w2!587) #b00000000000000000000000000000000) (= (currentByte!12892 w2!587) (size!6518 (buf!6986 w2!587)))))))))

(assert (=> d!90474 d!90518))

(declare-fun d!90520 () Bool)

(declare-fun e!188027 () Bool)

(assert (=> d!90520 e!188027))

(declare-fun res!223562 () Bool)

(assert (=> d!90520 (=> (not res!223562) (not e!188027))))

(declare-fun lt!408181 () (_ BitVec 64))

(declare-fun lt!408185 () (_ BitVec 64))

(declare-fun lt!408182 () (_ BitVec 64))

(assert (=> d!90520 (= res!223562 (= lt!408185 (bvsub lt!408181 lt!408182)))))

(assert (=> d!90520 (or (= (bvand lt!408181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408181 lt!408182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90520 (= lt!408182 (remainingBits!0 ((_ sign_extend 32) (size!6518 (buf!6986 w1!591))) ((_ sign_extend 32) (currentByte!12892 w1!591)) ((_ sign_extend 32) (currentBit!12887 w1!591))))))

(declare-fun lt!408183 () (_ BitVec 64))

(declare-fun lt!408180 () (_ BitVec 64))

(assert (=> d!90520 (= lt!408181 (bvmul lt!408183 lt!408180))))

(assert (=> d!90520 (or (= lt!408183 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408180 (bvsdiv (bvmul lt!408183 lt!408180) lt!408183)))))

(assert (=> d!90520 (= lt!408180 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90520 (= lt!408183 ((_ sign_extend 32) (size!6518 (buf!6986 w1!591))))))

(assert (=> d!90520 (= lt!408185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12892 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12887 w1!591))))))

(assert (=> d!90520 (invariant!0 (currentBit!12887 w1!591) (currentByte!12892 w1!591) (size!6518 (buf!6986 w1!591)))))

(assert (=> d!90520 (= (bitIndex!0 (size!6518 (buf!6986 w1!591)) (currentByte!12892 w1!591) (currentBit!12887 w1!591)) lt!408185)))

(declare-fun b!267997 () Bool)

(declare-fun res!223561 () Bool)

(assert (=> b!267997 (=> (not res!223561) (not e!188027))))

(assert (=> b!267997 (= res!223561 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408185))))

(declare-fun b!267998 () Bool)

(declare-fun lt!408184 () (_ BitVec 64))

(assert (=> b!267998 (= e!188027 (bvsle lt!408185 (bvmul lt!408184 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!267998 (or (= lt!408184 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408184 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408184)))))

(assert (=> b!267998 (= lt!408184 ((_ sign_extend 32) (size!6518 (buf!6986 w1!591))))))

(assert (= (and d!90520 res!223562) b!267997))

(assert (= (and b!267997 res!223561) b!267998))

(declare-fun m!399359 () Bool)

(assert (=> d!90520 m!399359))

(assert (=> d!90520 m!399257))

(assert (=> b!267894 d!90520))

(assert (=> b!267894 d!90506))

(declare-fun d!90522 () Bool)

(declare-fun res!223567 () Bool)

(declare-fun e!188030 () Bool)

(assert (=> d!90522 (=> res!223567 e!188030)))

(assert (=> d!90522 (= res!223567 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12892 w1!591)))))

(assert (=> d!90522 (= (arrayRangesEq!1053 (buf!6986 w1!591) (buf!6986 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12892 w1!591)) e!188030)))

(declare-fun b!268003 () Bool)

(declare-fun e!188031 () Bool)

(assert (=> b!268003 (= e!188030 e!188031)))

(declare-fun res!223568 () Bool)

(assert (=> b!268003 (=> (not res!223568) (not e!188031))))

(assert (=> b!268003 (= res!223568 (= (select (arr!7505 (buf!6986 w1!591)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7505 (buf!6986 w3!25)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!268004 () Bool)

(assert (=> b!268004 (= e!188031 (arrayRangesEq!1053 (buf!6986 w1!591) (buf!6986 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12892 w1!591)))))

(assert (= (and d!90522 (not res!223567)) b!268003))

(assert (= (and b!268003 res!223568) b!268004))

(declare-fun m!399361 () Bool)

(assert (=> b!268003 m!399361))

(declare-fun m!399363 () Bool)

(assert (=> b!268003 m!399363))

(declare-fun m!399365 () Bool)

(assert (=> b!268004 m!399365))

(assert (=> b!267908 d!90522))

(assert (=> b!267882 d!90506))

(declare-fun d!90524 () Bool)

(declare-fun e!188032 () Bool)

(assert (=> d!90524 e!188032))

(declare-fun res!223570 () Bool)

(assert (=> d!90524 (=> (not res!223570) (not e!188032))))

(declare-fun lt!408200 () (_ BitVec 64))

(declare-fun lt!408199 () (_ BitVec 64))

(declare-fun lt!408203 () (_ BitVec 64))

(assert (=> d!90524 (= res!223570 (= lt!408203 (bvsub lt!408199 lt!408200)))))

(assert (=> d!90524 (or (= (bvand lt!408199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!408200 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408199 lt!408200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!90524 (= lt!408200 (remainingBits!0 ((_ sign_extend 32) (size!6518 (buf!6986 w3!25))) ((_ sign_extend 32) (currentByte!12892 w3!25)) ((_ sign_extend 32) (currentBit!12887 w3!25))))))

(declare-fun lt!408201 () (_ BitVec 64))

(declare-fun lt!408198 () (_ BitVec 64))

(assert (=> d!90524 (= lt!408199 (bvmul lt!408201 lt!408198))))

(assert (=> d!90524 (or (= lt!408201 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!408198 (bvsdiv (bvmul lt!408201 lt!408198) lt!408201)))))

(assert (=> d!90524 (= lt!408198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!90524 (= lt!408201 ((_ sign_extend 32) (size!6518 (buf!6986 w3!25))))))

(assert (=> d!90524 (= lt!408203 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12892 w3!25)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12887 w3!25))))))

(assert (=> d!90524 (invariant!0 (currentBit!12887 w3!25) (currentByte!12892 w3!25) (size!6518 (buf!6986 w3!25)))))

(assert (=> d!90524 (= (bitIndex!0 (size!6518 (buf!6986 w3!25)) (currentByte!12892 w3!25) (currentBit!12887 w3!25)) lt!408203)))

(declare-fun b!268005 () Bool)

(declare-fun res!223569 () Bool)

(assert (=> b!268005 (=> (not res!223569) (not e!188032))))

(assert (=> b!268005 (= res!223569 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!408203))))

(declare-fun b!268006 () Bool)

(declare-fun lt!408202 () (_ BitVec 64))

(assert (=> b!268006 (= e!188032 (bvsle lt!408203 (bvmul lt!408202 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268006 (or (= lt!408202 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!408202 #b0000000000000000000000000000000000000000000000000000000000001000) lt!408202)))))

(assert (=> b!268006 (= lt!408202 ((_ sign_extend 32) (size!6518 (buf!6986 w3!25))))))

(assert (= (and d!90524 res!223570) b!268005))

(assert (= (and b!268005 res!223569) b!268006))

(declare-fun m!399367 () Bool)

(assert (=> d!90524 m!399367))

(assert (=> d!90524 m!399261))

(assert (=> b!267882 d!90524))

(declare-fun d!90526 () Bool)

(assert (=> d!90526 (= (select (arr!7505 (buf!6986 w2!587)) (currentByte!12892 w1!591)) (select (arr!7505 (buf!6986 w3!25)) (currentByte!12892 w1!591)))))

(assert (=> d!90526 true))

(declare-fun _$12!87 () Unit!19009)

(assert (=> d!90526 (= (choose!368 (buf!6986 w2!587) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591) (currentByte!12892 w2!587)) _$12!87)))

(declare-fun bs!22994 () Bool)

(assert (= bs!22994 d!90526))

(assert (=> bs!22994 m!399171))

(assert (=> bs!22994 m!399173))

(assert (=> d!90446 d!90526))

(declare-fun d!90532 () Bool)

(assert (=> d!90532 (= (invariant!0 (currentBit!12887 w3!25) (currentByte!12892 w3!25) (size!6518 (buf!6986 w3!25))) (and (bvsge (currentBit!12887 w3!25) #b00000000000000000000000000000000) (bvslt (currentBit!12887 w3!25) #b00000000000000000000000000001000) (bvsge (currentByte!12892 w3!25) #b00000000000000000000000000000000) (or (bvslt (currentByte!12892 w3!25) (size!6518 (buf!6986 w3!25))) (and (= (currentBit!12887 w3!25) #b00000000000000000000000000000000) (= (currentByte!12892 w3!25) (size!6518 (buf!6986 w3!25)))))))))

(assert (=> d!90476 d!90532))

(declare-fun b!268020 () Bool)

(declare-fun e!188045 () Bool)

(declare-fun e!188044 () Bool)

(assert (=> b!268020 (= e!188045 e!188044)))

(declare-fun res!223582 () Bool)

(assert (=> b!268020 (=> (not res!223582) (not e!188044))))

(declare-fun e!188046 () Bool)

(assert (=> b!268020 (= res!223582 e!188046)))

(declare-fun res!223584 () Bool)

(assert (=> b!268020 (=> res!223584 e!188046)))

(declare-fun lt!408227 () tuple4!404)

(assert (=> b!268020 (= res!223584 (bvsge (_1!12185 lt!408227) (_2!12185 lt!408227)))))

(declare-fun lt!408225 () (_ BitVec 32))

(assert (=> b!268020 (= lt!408225 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6518 (buf!6986 w1!591)) (currentByte!12892 w1!591) (currentBit!12887 w1!591)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!408226 () (_ BitVec 32))

(assert (=> b!268020 (= lt!408226 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!268020 (= lt!408227 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6518 (buf!6986 w1!591)) (currentByte!12892 w1!591) (currentBit!12887 w1!591))))))

(declare-fun b!268021 () Bool)

(declare-fun res!223583 () Bool)

(assert (=> b!268021 (= res!223583 (= lt!408225 #b00000000000000000000000000000000))))

(declare-fun e!188047 () Bool)

(assert (=> b!268021 (=> res!223583 e!188047)))

(declare-fun e!188042 () Bool)

(assert (=> b!268021 (= e!188042 e!188047)))

(declare-fun b!268022 () Bool)

(declare-fun e!188043 () Bool)

(assert (=> b!268022 (= e!188043 e!188042)))

(declare-fun res!223586 () Bool)

(declare-fun call!4223 () Bool)

(assert (=> b!268022 (= res!223586 call!4223)))

(assert (=> b!268022 (=> (not res!223586) (not e!188042))))

(declare-fun c!12354 () Bool)

(declare-fun bm!4220 () Bool)

(assert (=> bm!4220 (= call!4223 (byteRangesEq!0 (select (arr!7505 (buf!6986 w1!591)) (_3!982 lt!408227)) (select (arr!7505 (buf!6986 w2!587)) (_3!982 lt!408227)) lt!408226 (ite c!12354 lt!408225 #b00000000000000000000000000001000)))))

(declare-fun b!268024 () Bool)

(assert (=> b!268024 (= e!188044 e!188043)))

(assert (=> b!268024 (= c!12354 (= (_3!982 lt!408227) (_4!202 lt!408227)))))

(declare-fun b!268023 () Bool)

(assert (=> b!268023 (= e!188046 (arrayRangesEq!1053 (buf!6986 w1!591) (buf!6986 w2!587) (_1!12185 lt!408227) (_2!12185 lt!408227)))))

(declare-fun d!90534 () Bool)

(declare-fun res!223585 () Bool)

(assert (=> d!90534 (=> res!223585 e!188045)))

(assert (=> d!90534 (= res!223585 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6518 (buf!6986 w1!591)) (currentByte!12892 w1!591) (currentBit!12887 w1!591))))))

(assert (=> d!90534 (= (arrayBitRangesEq!0 (buf!6986 w1!591) (buf!6986 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6518 (buf!6986 w1!591)) (currentByte!12892 w1!591) (currentBit!12887 w1!591))) e!188045)))

(declare-fun b!268025 () Bool)

(assert (=> b!268025 (= e!188047 (byteRangesEq!0 (select (arr!7505 (buf!6986 w1!591)) (_4!202 lt!408227)) (select (arr!7505 (buf!6986 w2!587)) (_4!202 lt!408227)) #b00000000000000000000000000000000 lt!408225))))

(declare-fun b!268026 () Bool)

(assert (=> b!268026 (= e!188043 call!4223)))

(assert (= (and d!90534 (not res!223585)) b!268020))

(assert (= (and b!268020 (not res!223584)) b!268023))

(assert (= (and b!268020 res!223582) b!268024))

(assert (= (and b!268024 c!12354) b!268026))

(assert (= (and b!268024 (not c!12354)) b!268022))

(assert (= (and b!268022 res!223586) b!268021))

(assert (= (and b!268021 (not res!223583)) b!268025))

(assert (= (or b!268026 b!268022) bm!4220))

(assert (=> b!268020 m!399253))

(declare-fun m!399391 () Bool)

(assert (=> b!268020 m!399391))

(declare-fun m!399393 () Bool)

(assert (=> bm!4220 m!399393))

(declare-fun m!399395 () Bool)

(assert (=> bm!4220 m!399395))

(assert (=> bm!4220 m!399393))

(assert (=> bm!4220 m!399395))

(declare-fun m!399397 () Bool)

(assert (=> bm!4220 m!399397))

(declare-fun m!399399 () Bool)

(assert (=> b!268023 m!399399))

(declare-fun m!399401 () Bool)

(assert (=> b!268025 m!399401))

(declare-fun m!399403 () Bool)

(assert (=> b!268025 m!399403))

(assert (=> b!268025 m!399401))

(assert (=> b!268025 m!399403))

(declare-fun m!399405 () Bool)

(assert (=> b!268025 m!399405))

(assert (=> b!267896 d!90534))

(assert (=> b!267896 d!90520))

(assert (=> d!90482 d!90478))

(declare-fun d!90542 () Bool)

(assert (=> d!90542 (arrayRangesEq!1053 (buf!6986 w1!591) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591))))

(assert (=> d!90542 true))

(declare-fun _$16!95 () Unit!19009)

(assert (=> d!90542 (= (choose!371 (buf!6986 w1!591) (buf!6986 w2!587) (buf!6986 w3!25) #b00000000000000000000000000000000 (currentByte!12892 w1!591) (currentByte!12892 w2!587)) _$16!95)))

(declare-fun bs!22996 () Bool)

(assert (= bs!22996 d!90542))

(assert (=> bs!22996 m!399155))

(assert (=> d!90482 d!90542))

(check-sat (not d!90506) (not b!268023) (not bm!4220) (not d!90524) (not d!90520) (not bm!4211) (not b!268004) (not b!268020) (not b!267931) (not d!90542) (not b!267934) (not b!268025) (not b!267936))
