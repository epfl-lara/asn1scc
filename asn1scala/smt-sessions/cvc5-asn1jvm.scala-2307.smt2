; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58494 () Bool)

(assert start!58494)

(declare-fun res!223960 () Bool)

(declare-fun e!188505 () Bool)

(assert (=> start!58494 (=> (not res!223960) (not e!188505))))

(declare-datatypes ((array!14969 0))(
  ( (array!14970 (arr!7513 (Array (_ BitVec 32) (_ BitVec 8))) (size!6526 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11866 0))(
  ( (BitStream!11867 (buf!6994 array!14969) (currentByte!12918 (_ BitVec 32)) (currentBit!12913 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11866)

(declare-fun w2!587 () BitStream!11866)

(declare-fun isPrefixOf!0 (BitStream!11866 BitStream!11866) Bool)

(assert (=> start!58494 (= res!223960 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58494 e!188505))

(declare-fun e!188504 () Bool)

(declare-fun inv!12 (BitStream!11866) Bool)

(assert (=> start!58494 (and (inv!12 w1!591) e!188504)))

(declare-fun e!188501 () Bool)

(assert (=> start!58494 (and (inv!12 w2!587) e!188501)))

(declare-fun w3!25 () BitStream!11866)

(declare-fun e!188499 () Bool)

(assert (=> start!58494 (and (inv!12 w3!25) e!188499)))

(declare-fun b!268524 () Bool)

(declare-fun array_inv!6250 (array!14969) Bool)

(assert (=> b!268524 (= e!188499 (array_inv!6250 (buf!6994 w3!25)))))

(declare-fun e!188503 () Bool)

(declare-fun b!268525 () Bool)

(assert (=> b!268525 (= e!188503 (= ((_ sign_extend 24) (select (arr!7513 (buf!6994 w2!587)) (currentByte!12918 w1!591))) ((_ sign_extend 24) (select (arr!7513 (buf!6994 w3!25)) (currentByte!12918 w1!591)))))))

(assert (=> b!268525 (= (select (arr!7513 (buf!6994 w2!587)) (currentByte!12918 w1!591)) (select (arr!7513 (buf!6994 w3!25)) (currentByte!12918 w1!591)))))

(declare-datatypes ((Unit!19031 0))(
  ( (Unit!19032) )
))
(declare-fun lt!408547 () Unit!19031)

(declare-fun arrayRangesEqImpliesEq!151 (array!14969 array!14969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19031)

(assert (=> b!268525 (= lt!408547 (arrayRangesEqImpliesEq!151 (buf!6994 w2!587) (buf!6994 w3!25) #b00000000000000000000000000000000 (currentByte!12918 w1!591) (currentByte!12918 w2!587)))))

(declare-fun b!268526 () Bool)

(assert (=> b!268526 (= e!188504 (array_inv!6250 (buf!6994 w1!591)))))

(declare-fun b!268527 () Bool)

(assert (=> b!268527 (= e!188505 (not e!188503))))

(declare-fun res!223959 () Bool)

(assert (=> b!268527 (=> res!223959 e!188503)))

(assert (=> b!268527 (= res!223959 (or (bvsge (currentByte!12918 w1!591) (size!6526 (buf!6994 w1!591))) (bvsge (currentByte!12918 w1!591) (currentByte!12918 w2!587))))))

(declare-fun arrayRangesEq!1061 (array!14969 array!14969 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268527 (arrayRangesEq!1061 (buf!6994 w1!591) (buf!6994 w3!25) #b00000000000000000000000000000000 (currentByte!12918 w1!591))))

(declare-fun lt!408548 () Unit!19031)

(declare-fun arrayRangesEqTransitive!336 (array!14969 array!14969 array!14969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19031)

(assert (=> b!268527 (= lt!408548 (arrayRangesEqTransitive!336 (buf!6994 w1!591) (buf!6994 w2!587) (buf!6994 w3!25) #b00000000000000000000000000000000 (currentByte!12918 w1!591) (currentByte!12918 w2!587)))))

(declare-fun b!268528 () Bool)

(declare-fun res!223958 () Bool)

(assert (=> b!268528 (=> (not res!223958) (not e!188505))))

(assert (=> b!268528 (= res!223958 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268529 () Bool)

(assert (=> b!268529 (= e!188501 (array_inv!6250 (buf!6994 w2!587)))))

(assert (= (and start!58494 res!223960) b!268528))

(assert (= (and b!268528 res!223958) b!268527))

(assert (= (and b!268527 (not res!223959)) b!268525))

(assert (= start!58494 b!268526))

(assert (= start!58494 b!268529))

(assert (= start!58494 b!268524))

(declare-fun m!399989 () Bool)

(assert (=> b!268529 m!399989))

(declare-fun m!399991 () Bool)

(assert (=> b!268526 m!399991))

(declare-fun m!399993 () Bool)

(assert (=> start!58494 m!399993))

(declare-fun m!399995 () Bool)

(assert (=> start!58494 m!399995))

(declare-fun m!399997 () Bool)

(assert (=> start!58494 m!399997))

(declare-fun m!399999 () Bool)

(assert (=> start!58494 m!399999))

(declare-fun m!400001 () Bool)

(assert (=> b!268525 m!400001))

(declare-fun m!400003 () Bool)

(assert (=> b!268525 m!400003))

(declare-fun m!400005 () Bool)

(assert (=> b!268525 m!400005))

(declare-fun m!400007 () Bool)

(assert (=> b!268527 m!400007))

(declare-fun m!400009 () Bool)

(assert (=> b!268527 m!400009))

(declare-fun m!400011 () Bool)

(assert (=> b!268524 m!400011))

(declare-fun m!400013 () Bool)

(assert (=> b!268528 m!400013))

(push 1)

(assert (not b!268529))

(assert (not start!58494))

(assert (not b!268524))

(assert (not b!268526))

(assert (not b!268528))

(assert (not b!268525))

(assert (not b!268527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

