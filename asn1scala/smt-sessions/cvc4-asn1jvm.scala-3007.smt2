; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70280 () Bool)

(assert start!70280)

(declare-fun res!261565 () Bool)

(declare-fun e!228682 () Bool)

(assert (=> start!70280 (=> (not res!261565) (not e!228682))))

(declare-fun to!813 () (_ BitVec 64))

(declare-datatypes ((array!19778 0))(
  ( (array!19779 (arr!9696 (Array (_ BitVec 32) (_ BitVec 8))) (size!8610 (_ BitVec 32))) )
))
(declare-fun a1!721 () array!19778)

(declare-fun from!846 () (_ BitVec 64))

(declare-fun a2!721 () array!19778)

(assert (=> start!70280 (= res!261565 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8610 a1!721) (size!8610 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8610 a1!721))))))))

(assert (=> start!70280 e!228682))

(assert (=> start!70280 true))

(declare-fun array_inv!8162 (array!19778) Bool)

(assert (=> start!70280 (array_inv!8162 a1!721)))

(assert (=> start!70280 (array_inv!8162 a2!721)))

(declare-fun b!318485 () Bool)

(declare-fun res!261566 () Bool)

(assert (=> b!318485 (=> (not res!261566) (not e!228682))))

(declare-fun arrayBitRangesEq!0 (array!19778 array!19778 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318485 (= res!261566 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318486 () Bool)

(assert (=> b!318486 (= e!228682 (bvsge (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8610 a2!721)))))))

(assert (= (and start!70280 res!261565) b!318485))

(assert (= (and b!318485 res!261566) b!318486))

(declare-fun m!456569 () Bool)

(assert (=> start!70280 m!456569))

(declare-fun m!456571 () Bool)

(assert (=> start!70280 m!456571))

(declare-fun m!456573 () Bool)

(assert (=> b!318485 m!456573))

(push 1)

(assert (not start!70280))

(assert (not b!318485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

