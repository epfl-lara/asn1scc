; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57892 () Bool)

(assert start!57892)

(declare-fun res!221962 () Bool)

(declare-fun e!185649 () Bool)

(assert (=> start!57892 (=> (not res!221962) (not e!185649))))

(declare-datatypes ((array!14805 0))(
  ( (array!14806 (arr!7443 (Array (_ BitVec 32) (_ BitVec 8))) (size!6456 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11726 0))(
  ( (BitStream!11727 (buf!6924 array!14805) (currentByte!12809 (_ BitVec 32)) (currentBit!12804 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11726)

(declare-fun w2!580 () BitStream!11726)

(declare-fun isPrefixOf!0 (BitStream!11726 BitStream!11726) Bool)

(assert (=> start!57892 (= res!221962 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57892 e!185649))

(declare-fun e!185648 () Bool)

(declare-fun inv!12 (BitStream!11726) Bool)

(assert (=> start!57892 (and (inv!12 w1!584) e!185648)))

(declare-fun e!185650 () Bool)

(assert (=> start!57892 (and (inv!12 w2!580) e!185650)))

(declare-fun b!265644 () Bool)

(assert (=> b!265644 (= e!185649 (not (inv!12 w2!580)))))

(declare-fun b!265645 () Bool)

(declare-fun array_inv!6180 (array!14805) Bool)

(assert (=> b!265645 (= e!185648 (array_inv!6180 (buf!6924 w1!584)))))

(declare-fun b!265646 () Bool)

(assert (=> b!265646 (= e!185650 (array_inv!6180 (buf!6924 w2!580)))))

(assert (= (and start!57892 res!221962) b!265644))

(assert (= start!57892 b!265645))

(assert (= start!57892 b!265646))

(declare-fun m!396409 () Bool)

(assert (=> start!57892 m!396409))

(declare-fun m!396411 () Bool)

(assert (=> start!57892 m!396411))

(declare-fun m!396413 () Bool)

(assert (=> start!57892 m!396413))

(assert (=> b!265644 m!396413))

(declare-fun m!396415 () Bool)

(assert (=> b!265645 m!396415))

(declare-fun m!396417 () Bool)

(assert (=> b!265646 m!396417))

(push 1)

(assert (not b!265644))

(assert (not start!57892))

(assert (not b!265646))

(assert (not b!265645))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

