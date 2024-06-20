; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58562 () Bool)

(assert start!58562)

(declare-fun b!268840 () Bool)

(declare-fun e!188816 () Bool)

(declare-datatypes ((array!14986 0))(
  ( (array!14987 (arr!7520 (Array (_ BitVec 32) (_ BitVec 8))) (size!6533 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11880 0))(
  ( (BitStream!11881 (buf!7001 array!14986) (currentByte!12931 (_ BitVec 32)) (currentBit!12926 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11880)

(declare-fun w3!25 () BitStream!11880)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268840 (= e!188816 (byteRangesEq!0 (select (arr!7520 (buf!7001 w1!591)) (currentByte!12931 w1!591)) (select (arr!7520 (buf!7001 w3!25)) (currentByte!12931 w1!591)) #b00000000000000000000000000000000 (currentBit!12926 w1!591)))))

(declare-fun b!268841 () Bool)

(declare-fun e!188817 () Bool)

(assert (=> b!268841 (= e!188817 (byteRangesEq!0 (select (arr!7520 (buf!7001 w1!591)) (currentByte!12931 w1!591)) (select (arr!7520 (buf!7001 w3!25)) (currentByte!12931 w1!591)) #b00000000000000000000000000000000 (currentBit!12926 w1!591)))))

(declare-fun b!268842 () Bool)

(declare-fun e!188819 () Bool)

(assert (=> b!268842 (= e!188819 (not e!188816))))

(declare-fun res!224177 () Bool)

(assert (=> b!268842 (=> res!224177 e!188816)))

(assert (=> b!268842 (= res!224177 (bvsge (currentByte!12931 w1!591) (size!6533 (buf!7001 w1!591))))))

(declare-datatypes ((Unit!19047 0))(
  ( (Unit!19048) )
))
(declare-fun lt!408722 () Unit!19047)

(declare-fun e!188823 () Unit!19047)

(assert (=> b!268842 (= lt!408722 e!188823)))

(declare-fun c!12405 () Bool)

(declare-fun w2!587 () BitStream!11880)

(assert (=> b!268842 (= c!12405 (and (bvslt (currentByte!12931 w1!591) (size!6533 (buf!7001 w1!591))) (bvslt (currentByte!12931 w1!591) (currentByte!12931 w2!587))))))

(declare-fun e!188818 () Bool)

(assert (=> b!268842 e!188818))

(declare-fun res!224178 () Bool)

(assert (=> b!268842 (=> (not res!224178) (not e!188818))))

(declare-fun arrayRangesEq!1068 (array!14986 array!14986 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268842 (= res!224178 (arrayRangesEq!1068 (buf!7001 w1!591) (buf!7001 w3!25) #b00000000000000000000000000000000 (currentByte!12931 w1!591)))))

(declare-fun lt!408720 () Unit!19047)

(declare-fun arrayRangesEqTransitive!343 (array!14986 array!14986 array!14986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19047)

(assert (=> b!268842 (= lt!408720 (arrayRangesEqTransitive!343 (buf!7001 w1!591) (buf!7001 w2!587) (buf!7001 w3!25) #b00000000000000000000000000000000 (currentByte!12931 w1!591) (currentByte!12931 w2!587)))))

(declare-fun b!268843 () Bool)

(declare-fun Unit!19049 () Unit!19047)

(assert (=> b!268843 (= e!188823 Unit!19049)))

(declare-fun b!268844 () Bool)

(declare-fun res!224180 () Bool)

(assert (=> b!268844 (=> (not res!224180) (not e!188819))))

(declare-fun isPrefixOf!0 (BitStream!11880 BitStream!11880) Bool)

(assert (=> b!268844 (= res!224180 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268845 () Bool)

(declare-fun e!188815 () Bool)

(declare-fun array_inv!6257 (array!14986) Bool)

(assert (=> b!268845 (= e!188815 (array_inv!6257 (buf!7001 w1!591)))))

(declare-fun b!268846 () Bool)

(declare-fun Unit!19050 () Unit!19047)

(assert (=> b!268846 (= e!188823 Unit!19050)))

(declare-fun lt!408721 () Unit!19047)

(declare-fun arrayRangesEqImpliesEq!155 (array!14986 array!14986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19047)

(assert (=> b!268846 (= lt!408721 (arrayRangesEqImpliesEq!155 (buf!7001 w2!587) (buf!7001 w3!25) #b00000000000000000000000000000000 (currentByte!12931 w1!591) (currentByte!12931 w2!587)))))

(declare-fun res!224179 () Bool)

(assert (=> b!268846 (= res!224179 (= (select (arr!7520 (buf!7001 w2!587)) (currentByte!12931 w1!591)) (select (arr!7520 (buf!7001 w3!25)) (currentByte!12931 w1!591))))))

(assert (=> b!268846 (=> (not res!224179) (not e!188817))))

(assert (=> b!268846 e!188817))

(declare-fun b!268847 () Bool)

(declare-fun e!188814 () Bool)

(assert (=> b!268847 (= e!188814 (byteRangesEq!0 (select (arr!7520 (buf!7001 w1!591)) (currentByte!12931 w1!591)) (select (arr!7520 (buf!7001 w3!25)) (currentByte!12931 w1!591)) #b00000000000000000000000000000000 (currentBit!12926 w1!591)))))

(declare-fun b!268848 () Bool)

(assert (=> b!268848 (= e!188818 e!188814)))

(declare-fun res!224181 () Bool)

(assert (=> b!268848 (=> res!224181 e!188814)))

(assert (=> b!268848 (= res!224181 (or (bvsge (currentByte!12931 w1!591) (size!6533 (buf!7001 w1!591))) (bvslt (currentByte!12931 w1!591) (currentByte!12931 w2!587))))))

(declare-fun b!268849 () Bool)

(declare-fun e!188821 () Bool)

(assert (=> b!268849 (= e!188821 (array_inv!6257 (buf!7001 w2!587)))))

(declare-fun b!268850 () Bool)

(declare-fun e!188822 () Bool)

(assert (=> b!268850 (= e!188822 (array_inv!6257 (buf!7001 w3!25)))))

(declare-fun res!224182 () Bool)

(assert (=> start!58562 (=> (not res!224182) (not e!188819))))

(assert (=> start!58562 (= res!224182 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58562 e!188819))

(declare-fun inv!12 (BitStream!11880) Bool)

(assert (=> start!58562 (and (inv!12 w1!591) e!188815)))

(assert (=> start!58562 (and (inv!12 w2!587) e!188821)))

(assert (=> start!58562 (and (inv!12 w3!25) e!188822)))

(assert (= (and start!58562 res!224182) b!268844))

(assert (= (and b!268844 res!224180) b!268842))

(assert (= (and b!268842 res!224178) b!268848))

(assert (= (and b!268848 (not res!224181)) b!268847))

(assert (= (and b!268842 c!12405) b!268846))

(assert (= (and b!268842 (not c!12405)) b!268843))

(assert (= (and b!268846 res!224179) b!268841))

(assert (= (and b!268842 (not res!224177)) b!268840))

(assert (= start!58562 b!268845))

(assert (= start!58562 b!268849))

(assert (= start!58562 b!268850))

(declare-fun m!400361 () Bool)

(assert (=> b!268845 m!400361))

(declare-fun m!400363 () Bool)

(assert (=> b!268849 m!400363))

(declare-fun m!400365 () Bool)

(assert (=> b!268844 m!400365))

(declare-fun m!400367 () Bool)

(assert (=> b!268846 m!400367))

(declare-fun m!400369 () Bool)

(assert (=> b!268846 m!400369))

(declare-fun m!400371 () Bool)

(assert (=> b!268846 m!400371))

(declare-fun m!400373 () Bool)

(assert (=> b!268847 m!400373))

(assert (=> b!268847 m!400371))

(assert (=> b!268847 m!400373))

(assert (=> b!268847 m!400371))

(declare-fun m!400375 () Bool)

(assert (=> b!268847 m!400375))

(declare-fun m!400377 () Bool)

(assert (=> start!58562 m!400377))

(declare-fun m!400379 () Bool)

(assert (=> start!58562 m!400379))

(declare-fun m!400381 () Bool)

(assert (=> start!58562 m!400381))

(declare-fun m!400383 () Bool)

(assert (=> start!58562 m!400383))

(declare-fun m!400385 () Bool)

(assert (=> b!268850 m!400385))

(assert (=> b!268841 m!400373))

(assert (=> b!268841 m!400371))

(assert (=> b!268841 m!400373))

(assert (=> b!268841 m!400371))

(assert (=> b!268841 m!400375))

(declare-fun m!400387 () Bool)

(assert (=> b!268842 m!400387))

(declare-fun m!400389 () Bool)

(assert (=> b!268842 m!400389))

(assert (=> b!268840 m!400373))

(assert (=> b!268840 m!400371))

(assert (=> b!268840 m!400373))

(assert (=> b!268840 m!400371))

(assert (=> b!268840 m!400375))

(check-sat (not b!268849) (not b!268846) (not b!268840) (not b!268845) (not b!268842) (not b!268850) (not b!268841) (not b!268847) (not b!268844) (not start!58562))
