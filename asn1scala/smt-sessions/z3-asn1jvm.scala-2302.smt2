; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58274 () Bool)

(assert start!58274)

(declare-fun b!267736 () Bool)

(declare-fun e!187754 () Bool)

(declare-datatypes ((array!14932 0))(
  ( (array!14933 (arr!7499 (Array (_ BitVec 32) (_ BitVec 8))) (size!6512 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11838 0))(
  ( (BitStream!11839 (buf!6980 array!14932) (currentByte!12886 (_ BitVec 32)) (currentBit!12881 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11838)

(declare-fun array_inv!6236 (array!14932) Bool)

(assert (=> b!267736 (= e!187754 (array_inv!6236 (buf!6980 w2!587)))))

(declare-fun b!267737 () Bool)

(declare-fun e!187752 () Bool)

(assert (=> b!267737 (= e!187752 (not true))))

(declare-fun w1!591 () BitStream!11838)

(declare-fun w3!25 () BitStream!11838)

(declare-fun arrayRangesEq!1047 (array!14932 array!14932 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267737 (arrayRangesEq!1047 (buf!6980 w1!591) (buf!6980 w3!25) #b00000000000000000000000000000000 (currentByte!12886 w1!591))))

(declare-datatypes ((Unit!18997 0))(
  ( (Unit!18998) )
))
(declare-fun lt!408053 () Unit!18997)

(declare-fun arrayRangesEqTransitive!322 (array!14932 array!14932 array!14932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18997)

(assert (=> b!267737 (= lt!408053 (arrayRangesEqTransitive!322 (buf!6980 w1!591) (buf!6980 w2!587) (buf!6980 w3!25) #b00000000000000000000000000000000 (currentByte!12886 w1!591) (currentByte!12886 w2!587)))))

(declare-fun b!267739 () Bool)

(declare-fun e!187758 () Bool)

(assert (=> b!267739 (= e!187758 (array_inv!6236 (buf!6980 w1!591)))))

(declare-fun b!267740 () Bool)

(declare-fun res!223387 () Bool)

(assert (=> b!267740 (=> (not res!223387) (not e!187752))))

(declare-fun isPrefixOf!0 (BitStream!11838 BitStream!11838) Bool)

(assert (=> b!267740 (= res!223387 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267738 () Bool)

(declare-fun e!187757 () Bool)

(assert (=> b!267738 (= e!187757 (array_inv!6236 (buf!6980 w3!25)))))

(declare-fun res!223386 () Bool)

(assert (=> start!58274 (=> (not res!223386) (not e!187752))))

(assert (=> start!58274 (= res!223386 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58274 e!187752))

(declare-fun inv!12 (BitStream!11838) Bool)

(assert (=> start!58274 (and (inv!12 w1!591) e!187758)))

(assert (=> start!58274 (and (inv!12 w2!587) e!187754)))

(assert (=> start!58274 (and (inv!12 w3!25) e!187757)))

(assert (= (and start!58274 res!223386) b!267740))

(assert (= (and b!267740 res!223387) b!267737))

(assert (= start!58274 b!267739))

(assert (= start!58274 b!267736))

(assert (= start!58274 b!267738))

(declare-fun m!399025 () Bool)

(assert (=> b!267738 m!399025))

(declare-fun m!399027 () Bool)

(assert (=> start!58274 m!399027))

(declare-fun m!399029 () Bool)

(assert (=> start!58274 m!399029))

(declare-fun m!399031 () Bool)

(assert (=> start!58274 m!399031))

(declare-fun m!399033 () Bool)

(assert (=> start!58274 m!399033))

(declare-fun m!399035 () Bool)

(assert (=> b!267740 m!399035))

(declare-fun m!399037 () Bool)

(assert (=> b!267739 m!399037))

(declare-fun m!399039 () Bool)

(assert (=> b!267737 m!399039))

(declare-fun m!399041 () Bool)

(assert (=> b!267737 m!399041))

(declare-fun m!399043 () Bool)

(assert (=> b!267736 m!399043))

(check-sat (not b!267738) (not b!267739) (not b!267736) (not b!267740) (not b!267737) (not start!58274))
