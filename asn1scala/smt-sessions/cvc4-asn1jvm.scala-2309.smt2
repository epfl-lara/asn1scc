; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58564 () Bool)

(assert start!58564)

(declare-fun b!268873 () Bool)

(declare-datatypes ((Unit!19051 0))(
  ( (Unit!19052) )
))
(declare-fun e!188851 () Unit!19051)

(declare-fun Unit!19053 () Unit!19051)

(assert (=> b!268873 (= e!188851 Unit!19053)))

(declare-datatypes ((array!14988 0))(
  ( (array!14989 (arr!7521 (Array (_ BitVec 32) (_ BitVec 8))) (size!6534 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11882 0))(
  ( (BitStream!11883 (buf!7002 array!14988) (currentByte!12932 (_ BitVec 32)) (currentBit!12927 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11882)

(declare-fun lt!408731 () Unit!19051)

(declare-fun w2!587 () BitStream!11882)

(declare-fun w1!591 () BitStream!11882)

(declare-fun arrayRangesEqImpliesEq!156 (array!14988 array!14988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19051)

(assert (=> b!268873 (= lt!408731 (arrayRangesEqImpliesEq!156 (buf!7002 w2!587) (buf!7002 w3!25) #b00000000000000000000000000000000 (currentByte!12932 w1!591) (currentByte!12932 w2!587)))))

(declare-fun res!224199 () Bool)

(assert (=> b!268873 (= res!224199 (= (select (arr!7521 (buf!7002 w2!587)) (currentByte!12932 w1!591)) (select (arr!7521 (buf!7002 w3!25)) (currentByte!12932 w1!591))))))

(declare-fun e!188850 () Bool)

(assert (=> b!268873 (=> (not res!224199) (not e!188850))))

(assert (=> b!268873 e!188850))

(declare-fun b!268874 () Bool)

(declare-fun Unit!19054 () Unit!19051)

(assert (=> b!268874 (= e!188851 Unit!19054)))

(declare-fun b!268875 () Bool)

(declare-fun e!188848 () Bool)

(declare-fun array_inv!6258 (array!14988) Bool)

(assert (=> b!268875 (= e!188848 (array_inv!6258 (buf!7002 w3!25)))))

(declare-fun res!224197 () Bool)

(declare-fun e!188852 () Bool)

(assert (=> start!58564 (=> (not res!224197) (not e!188852))))

(declare-fun isPrefixOf!0 (BitStream!11882 BitStream!11882) Bool)

(assert (=> start!58564 (= res!224197 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58564 e!188852))

(declare-fun e!188855 () Bool)

(declare-fun inv!12 (BitStream!11882) Bool)

(assert (=> start!58564 (and (inv!12 w1!591) e!188855)))

(declare-fun e!188853 () Bool)

(assert (=> start!58564 (and (inv!12 w2!587) e!188853)))

(assert (=> start!58564 (and (inv!12 w3!25) e!188848)))

(declare-fun b!268876 () Bool)

(declare-fun e!188857 () Bool)

(assert (=> b!268876 (= e!188852 (not e!188857))))

(declare-fun res!224196 () Bool)

(assert (=> b!268876 (=> res!224196 e!188857)))

(assert (=> b!268876 (= res!224196 (bvsge (currentByte!12932 w1!591) (size!6534 (buf!7002 w1!591))))))

(declare-fun lt!408730 () Unit!19051)

(assert (=> b!268876 (= lt!408730 e!188851)))

(declare-fun c!12408 () Bool)

(assert (=> b!268876 (= c!12408 (and (bvslt (currentByte!12932 w1!591) (size!6534 (buf!7002 w1!591))) (bvslt (currentByte!12932 w1!591) (currentByte!12932 w2!587))))))

(declare-fun e!188858 () Bool)

(assert (=> b!268876 e!188858))

(declare-fun res!224198 () Bool)

(assert (=> b!268876 (=> (not res!224198) (not e!188858))))

(declare-fun arrayRangesEq!1069 (array!14988 array!14988 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268876 (= res!224198 (arrayRangesEq!1069 (buf!7002 w1!591) (buf!7002 w3!25) #b00000000000000000000000000000000 (currentByte!12932 w1!591)))))

(declare-fun lt!408729 () Unit!19051)

(declare-fun arrayRangesEqTransitive!344 (array!14988 array!14988 array!14988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19051)

(assert (=> b!268876 (= lt!408729 (arrayRangesEqTransitive!344 (buf!7002 w1!591) (buf!7002 w2!587) (buf!7002 w3!25) #b00000000000000000000000000000000 (currentByte!12932 w1!591) (currentByte!12932 w2!587)))))

(declare-fun b!268877 () Bool)

(declare-fun e!188856 () Bool)

(assert (=> b!268877 (= e!188858 e!188856)))

(declare-fun res!224195 () Bool)

(assert (=> b!268877 (=> res!224195 e!188856)))

(assert (=> b!268877 (= res!224195 (or (bvsge (currentByte!12932 w1!591) (size!6534 (buf!7002 w1!591))) (bvslt (currentByte!12932 w1!591) (currentByte!12932 w2!587))))))

(declare-fun b!268878 () Bool)

(assert (=> b!268878 (= e!188853 (array_inv!6258 (buf!7002 w2!587)))))

(declare-fun b!268879 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268879 (= e!188856 (byteRangesEq!0 (select (arr!7521 (buf!7002 w1!591)) (currentByte!12932 w1!591)) (select (arr!7521 (buf!7002 w3!25)) (currentByte!12932 w1!591)) #b00000000000000000000000000000000 (currentBit!12927 w1!591)))))

(declare-fun b!268880 () Bool)

(assert (=> b!268880 (= e!188857 (byteRangesEq!0 (select (arr!7521 (buf!7002 w1!591)) (currentByte!12932 w1!591)) (select (arr!7521 (buf!7002 w3!25)) (currentByte!12932 w1!591)) #b00000000000000000000000000000000 (currentBit!12927 w1!591)))))

(declare-fun b!268881 () Bool)

(assert (=> b!268881 (= e!188855 (array_inv!6258 (buf!7002 w1!591)))))

(declare-fun b!268882 () Bool)

(declare-fun res!224200 () Bool)

(assert (=> b!268882 (=> (not res!224200) (not e!188852))))

(assert (=> b!268882 (= res!224200 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268883 () Bool)

(assert (=> b!268883 (= e!188850 (byteRangesEq!0 (select (arr!7521 (buf!7002 w1!591)) (currentByte!12932 w1!591)) (select (arr!7521 (buf!7002 w3!25)) (currentByte!12932 w1!591)) #b00000000000000000000000000000000 (currentBit!12927 w1!591)))))

(assert (= (and start!58564 res!224197) b!268882))

(assert (= (and b!268882 res!224200) b!268876))

(assert (= (and b!268876 res!224198) b!268877))

(assert (= (and b!268877 (not res!224195)) b!268879))

(assert (= (and b!268876 c!12408) b!268873))

(assert (= (and b!268876 (not c!12408)) b!268874))

(assert (= (and b!268873 res!224199) b!268883))

(assert (= (and b!268876 (not res!224196)) b!268880))

(assert (= start!58564 b!268881))

(assert (= start!58564 b!268878))

(assert (= start!58564 b!268875))

(declare-fun m!400391 () Bool)

(assert (=> b!268875 m!400391))

(declare-fun m!400393 () Bool)

(assert (=> b!268873 m!400393))

(declare-fun m!400395 () Bool)

(assert (=> b!268873 m!400395))

(declare-fun m!400397 () Bool)

(assert (=> b!268873 m!400397))

(declare-fun m!400399 () Bool)

(assert (=> b!268878 m!400399))

(declare-fun m!400401 () Bool)

(assert (=> b!268882 m!400401))

(declare-fun m!400403 () Bool)

(assert (=> start!58564 m!400403))

(declare-fun m!400405 () Bool)

(assert (=> start!58564 m!400405))

(declare-fun m!400407 () Bool)

(assert (=> start!58564 m!400407))

(declare-fun m!400409 () Bool)

(assert (=> start!58564 m!400409))

(declare-fun m!400411 () Bool)

(assert (=> b!268879 m!400411))

(assert (=> b!268879 m!400397))

(assert (=> b!268879 m!400411))

(assert (=> b!268879 m!400397))

(declare-fun m!400413 () Bool)

(assert (=> b!268879 m!400413))

(assert (=> b!268880 m!400411))

(assert (=> b!268880 m!400397))

(assert (=> b!268880 m!400411))

(assert (=> b!268880 m!400397))

(assert (=> b!268880 m!400413))

(assert (=> b!268883 m!400411))

(assert (=> b!268883 m!400397))

(assert (=> b!268883 m!400411))

(assert (=> b!268883 m!400397))

(assert (=> b!268883 m!400413))

(declare-fun m!400415 () Bool)

(assert (=> b!268876 m!400415))

(declare-fun m!400417 () Bool)

(assert (=> b!268876 m!400417))

(declare-fun m!400419 () Bool)

(assert (=> b!268881 m!400419))

(push 1)

(assert (not b!268875))

(assert (not b!268882))

(assert (not b!268881))

(assert (not b!268880))

(assert (not start!58564))

(assert (not b!268883))

(assert (not b!268879))

(assert (not b!268873))

(assert (not b!268876))

(assert (not b!268878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

