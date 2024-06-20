; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57566 () Bool)

(assert start!57566)

(declare-fun res!220703 () Bool)

(declare-fun e!184050 () Bool)

(assert (=> start!57566 (=> (not res!220703) (not e!184050))))

(declare-datatypes ((array!14719 0))(
  ( (array!14720 (arr!7409 (Array (_ BitVec 32) (_ BitVec 8))) (size!6422 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11658 0))(
  ( (BitStream!11659 (buf!6890 array!14719) (currentByte!12754 (_ BitVec 32)) (currentBit!12749 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11658)

(declare-fun w2!580 () BitStream!11658)

(declare-fun isPrefixOf!0 (BitStream!11658 BitStream!11658) Bool)

(assert (=> start!57566 (= res!220703 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57566 e!184050))

(declare-fun e!184052 () Bool)

(declare-fun inv!12 (BitStream!11658) Bool)

(assert (=> start!57566 (and (inv!12 w1!584) e!184052)))

(declare-fun e!184055 () Bool)

(assert (=> start!57566 (and (inv!12 w2!580) e!184055)))

(declare-fun b!263886 () Bool)

(declare-datatypes ((Unit!18797 0))(
  ( (Unit!18798) )
))
(declare-fun e!184051 () Unit!18797)

(declare-fun Unit!18799 () Unit!18797)

(assert (=> b!263886 (= e!184051 Unit!18799)))

(declare-fun b!263887 () Bool)

(declare-fun e!184048 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14719 array!14719 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263887 (= e!184048 (not (arrayBitRangesEq!0 (buf!6890 w2!580) (buf!6890 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6422 (buf!6890 w1!584)) (currentByte!12754 w1!584) (currentBit!12749 w1!584)))))))

(declare-fun b!263888 () Bool)

(declare-fun array_inv!6146 (array!14719) Bool)

(assert (=> b!263888 (= e!184052 (array_inv!6146 (buf!6890 w1!584)))))

(declare-fun b!263889 () Bool)

(declare-fun lt!405268 () Unit!18797)

(assert (=> b!263889 (= e!184051 lt!405268)))

(declare-fun lt!405271 () (_ BitVec 64))

(assert (=> b!263889 (= lt!405271 (bitIndex!0 (size!6422 (buf!6890 w1!584)) (currentByte!12754 w1!584) (currentBit!12749 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14719 array!14719 (_ BitVec 64) (_ BitVec 64)) Unit!18797)

(assert (=> b!263889 (= lt!405268 (arrayBitRangesEqSymmetric!0 (buf!6890 w1!584) (buf!6890 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405271))))

(assert (=> b!263889 (arrayBitRangesEq!0 (buf!6890 w2!580) (buf!6890 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405271)))

(declare-fun b!263890 () Bool)

(declare-fun e!184054 () Bool)

(assert (=> b!263890 (= e!184054 true)))

(declare-fun lt!405272 () Bool)

(declare-fun lt!405275 () BitStream!11658)

(assert (=> b!263890 (= lt!405272 (isPrefixOf!0 lt!405275 w1!584))))

(declare-fun b!263891 () Bool)

(declare-fun e!184056 () Bool)

(assert (=> b!263891 (= e!184056 (not (arrayBitRangesEq!0 (buf!6890 w1!584) (buf!6890 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6422 (buf!6890 w1!584)) (currentByte!12754 w1!584) (currentBit!12749 w1!584)))))))

(declare-fun b!263892 () Bool)

(declare-fun e!184053 () Bool)

(assert (=> b!263892 (= e!184053 e!184054)))

(declare-fun res!220704 () Bool)

(assert (=> b!263892 (=> res!220704 e!184054)))

(assert (=> b!263892 (= res!220704 e!184048)))

(declare-fun res!220705 () Bool)

(assert (=> b!263892 (=> (not res!220705) (not e!184048))))

(assert (=> b!263892 (= res!220705 (not (= (size!6422 (buf!6890 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405273 () Unit!18797)

(assert (=> b!263892 (= lt!405273 e!184051)))

(declare-fun c!12072 () Bool)

(assert (=> b!263892 (= c!12072 (not (= (size!6422 (buf!6890 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263893 () Bool)

(assert (=> b!263893 (= e!184055 (array_inv!6146 (buf!6890 w2!580)))))

(declare-fun b!263894 () Bool)

(assert (=> b!263894 (= e!184050 (not e!184053))))

(declare-fun res!220702 () Bool)

(assert (=> b!263894 (=> res!220702 e!184053)))

(assert (=> b!263894 (= res!220702 e!184056)))

(declare-fun res!220701 () Bool)

(assert (=> b!263894 (=> (not res!220701) (not e!184056))))

(assert (=> b!263894 (= res!220701 (not (= (size!6422 (buf!6890 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263894 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405270 () Unit!18797)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11658) Unit!18797)

(assert (=> b!263894 (= lt!405270 (lemmaIsPrefixRefl!0 w2!580))))

(assert (=> b!263894 (isPrefixOf!0 lt!405275 lt!405275)))

(declare-fun lt!405269 () Unit!18797)

(assert (=> b!263894 (= lt!405269 (lemmaIsPrefixRefl!0 lt!405275))))

(assert (=> b!263894 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405274 () Unit!18797)

(assert (=> b!263894 (= lt!405274 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263894 (= lt!405275 (BitStream!11659 (buf!6890 w2!580) (currentByte!12754 w1!584) (currentBit!12749 w1!584)))))

(assert (= (and start!57566 res!220703) b!263894))

(assert (= (and b!263894 res!220701) b!263891))

(assert (= (and b!263894 (not res!220702)) b!263892))

(assert (= (and b!263892 c!12072) b!263889))

(assert (= (and b!263892 (not c!12072)) b!263886))

(assert (= (and b!263892 res!220705) b!263887))

(assert (= (and b!263892 (not res!220704)) b!263890))

(assert (= start!57566 b!263888))

(assert (= start!57566 b!263893))

(declare-fun m!394239 () Bool)

(assert (=> b!263890 m!394239))

(declare-fun m!394241 () Bool)

(assert (=> b!263888 m!394241))

(declare-fun m!394243 () Bool)

(assert (=> b!263893 m!394243))

(declare-fun m!394245 () Bool)

(assert (=> b!263887 m!394245))

(assert (=> b!263887 m!394245))

(declare-fun m!394247 () Bool)

(assert (=> b!263887 m!394247))

(declare-fun m!394249 () Bool)

(assert (=> start!57566 m!394249))

(declare-fun m!394251 () Bool)

(assert (=> start!57566 m!394251))

(declare-fun m!394253 () Bool)

(assert (=> start!57566 m!394253))

(assert (=> b!263891 m!394245))

(assert (=> b!263891 m!394245))

(declare-fun m!394255 () Bool)

(assert (=> b!263891 m!394255))

(assert (=> b!263889 m!394245))

(declare-fun m!394257 () Bool)

(assert (=> b!263889 m!394257))

(declare-fun m!394259 () Bool)

(assert (=> b!263889 m!394259))

(declare-fun m!394261 () Bool)

(assert (=> b!263894 m!394261))

(declare-fun m!394263 () Bool)

(assert (=> b!263894 m!394263))

(declare-fun m!394265 () Bool)

(assert (=> b!263894 m!394265))

(declare-fun m!394267 () Bool)

(assert (=> b!263894 m!394267))

(declare-fun m!394269 () Bool)

(assert (=> b!263894 m!394269))

(declare-fun m!394271 () Bool)

(assert (=> b!263894 m!394271))

(check-sat (not b!263894) (not start!57566) (not b!263893) (not b!263890) (not b!263889) (not b!263887) (not b!263891) (not b!263888))
