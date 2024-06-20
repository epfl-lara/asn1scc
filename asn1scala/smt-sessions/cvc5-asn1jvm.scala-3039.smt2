; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70570 () Bool)

(assert start!70570)

(declare-fun res!262572 () Bool)

(declare-fun e!229703 () Bool)

(assert (=> start!70570 (=> (not res!262572) (not e!229703))))

(declare-datatypes ((array!19975 0))(
  ( (array!19976 (arr!9796 (Array (_ BitVec 32) (_ BitVec 8))) (size!8704 (_ BitVec 32))) )
))
(declare-fun a2!726 () array!19975)

(declare-fun to!814 () (_ BitVec 64))

(declare-fun a1!726 () array!19975)

(declare-fun from!847 () (_ BitVec 64))

(assert (=> start!70570 (= res!262572 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!847) (bvslt from!847 to!814) (= (size!8704 a1!726) (size!8704 a2!726)) (bvsle to!814 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8704 a1!726))))))))

(assert (=> start!70570 e!229703))

(assert (=> start!70570 true))

(declare-fun array_inv!8256 (array!19975) Bool)

(assert (=> start!70570 (array_inv!8256 a1!726)))

(assert (=> start!70570 (array_inv!8256 a2!726)))

(declare-fun b!319570 () Bool)

(declare-fun res!262573 () Bool)

(assert (=> b!319570 (=> (not res!262573) (not e!229703))))

(declare-fun arrayBitRangesEq!0 (array!19975 array!19975 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319570 (= res!262573 (arrayBitRangesEq!0 a1!726 a2!726 from!847 to!814))))

(declare-fun b!319571 () Bool)

(assert (=> b!319571 (= e!229703 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!847)))))

(assert (= (and start!70570 res!262572) b!319570))

(assert (= (and b!319570 res!262573) b!319571))

(declare-fun m!457961 () Bool)

(assert (=> start!70570 m!457961))

(declare-fun m!457963 () Bool)

(assert (=> start!70570 m!457963))

(declare-fun m!457965 () Bool)

(assert (=> b!319570 m!457965))

(push 1)

(assert (not start!70570))

(assert (not b!319570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

