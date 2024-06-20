; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58264 () Bool)

(assert start!58264)

(declare-fun b!267661 () Bool)

(declare-fun res!223357 () Bool)

(declare-fun e!187649 () Bool)

(assert (=> b!267661 (=> (not res!223357) (not e!187649))))

(declare-datatypes ((array!14922 0))(
  ( (array!14923 (arr!7494 (Array (_ BitVec 32) (_ BitVec 8))) (size!6507 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11828 0))(
  ( (BitStream!11829 (buf!6975 array!14922) (currentByte!12881 (_ BitVec 32)) (currentBit!12876 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11828)

(declare-fun w3!25 () BitStream!11828)

(declare-fun isPrefixOf!0 (BitStream!11828 BitStream!11828) Bool)

(assert (=> b!267661 (= res!223357 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267662 () Bool)

(declare-fun e!187651 () Bool)

(declare-fun w1!591 () BitStream!11828)

(declare-fun array_inv!6231 (array!14922) Bool)

(assert (=> b!267662 (= e!187651 (array_inv!6231 (buf!6975 w1!591)))))

(declare-fun b!267663 () Bool)

(declare-fun e!187647 () Bool)

(assert (=> b!267663 (= e!187647 (array_inv!6231 (buf!6975 w2!587)))))

(declare-fun res!223356 () Bool)

(assert (=> start!58264 (=> (not res!223356) (not e!187649))))

(assert (=> start!58264 (= res!223356 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58264 e!187649))

(declare-fun inv!12 (BitStream!11828) Bool)

(assert (=> start!58264 (and (inv!12 w1!591) e!187651)))

(assert (=> start!58264 (and (inv!12 w2!587) e!187647)))

(declare-fun e!187653 () Bool)

(assert (=> start!58264 (and (inv!12 w3!25) e!187653)))

(declare-fun b!267664 () Bool)

(assert (=> b!267664 (= e!187653 (array_inv!6231 (buf!6975 w3!25)))))

(declare-fun b!267665 () Bool)

(assert (=> b!267665 (= e!187649 (not true))))

(declare-fun arrayRangesEq!1042 (array!14922 array!14922 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267665 (arrayRangesEq!1042 (buf!6975 w1!591) (buf!6975 w3!25) #b00000000000000000000000000000000 (currentByte!12881 w1!591))))

(declare-datatypes ((Unit!18987 0))(
  ( (Unit!18988) )
))
(declare-fun lt!408038 () Unit!18987)

(declare-fun arrayRangesEqTransitive!317 (array!14922 array!14922 array!14922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18987)

(assert (=> b!267665 (= lt!408038 (arrayRangesEqTransitive!317 (buf!6975 w1!591) (buf!6975 w2!587) (buf!6975 w3!25) #b00000000000000000000000000000000 (currentByte!12881 w1!591) (currentByte!12881 w2!587)))))

(assert (= (and start!58264 res!223356) b!267661))

(assert (= (and b!267661 res!223357) b!267665))

(assert (= start!58264 b!267662))

(assert (= start!58264 b!267663))

(assert (= start!58264 b!267664))

(declare-fun m!398925 () Bool)

(assert (=> b!267663 m!398925))

(declare-fun m!398927 () Bool)

(assert (=> b!267665 m!398927))

(declare-fun m!398929 () Bool)

(assert (=> b!267665 m!398929))

(declare-fun m!398931 () Bool)

(assert (=> b!267662 m!398931))

(declare-fun m!398933 () Bool)

(assert (=> start!58264 m!398933))

(declare-fun m!398935 () Bool)

(assert (=> start!58264 m!398935))

(declare-fun m!398937 () Bool)

(assert (=> start!58264 m!398937))

(declare-fun m!398939 () Bool)

(assert (=> start!58264 m!398939))

(declare-fun m!398941 () Bool)

(assert (=> b!267664 m!398941))

(declare-fun m!398943 () Bool)

(assert (=> b!267661 m!398943))

(push 1)

(assert (not b!267661))

(assert (not b!267662))

(assert (not b!267665))

(assert (not b!267664))

(assert (not start!58264))

(assert (not b!267663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

