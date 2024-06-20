; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70302 () Bool)

(assert start!70302)

(declare-fun res!261623 () Bool)

(declare-fun e!228772 () Bool)

(assert (=> start!70302 (=> (not res!261623) (not e!228772))))

(declare-datatypes ((array!19800 0))(
  ( (array!19801 (arr!9707 (Array (_ BitVec 32) (_ BitVec 8))) (size!8621 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19800)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19800)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70302 (= res!261623 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8621 a1!721) (size!8621 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8621 a1!721))))))))

(assert (=> start!70302 e!228772))

(assert (=> start!70302 true))

(declare-fun array_inv!8173 (array!19800) Bool)

(assert (=> start!70302 (array_inv!8173 a1!721)))

(assert (=> start!70302 (array_inv!8173 a2!721)))

(declare-fun b!318542 () Bool)

(declare-fun res!261622 () Bool)

(assert (=> b!318542 (=> (not res!261622) (not e!228772))))

(declare-fun arrayBitRangesEq!0 (array!19800 array!19800 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318542 (= res!261622 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318543 () Bool)

(assert (=> b!318543 (= e!228772 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70302 res!261623) b!318542))

(assert (= (and b!318542 res!261622) b!318543))

(declare-fun m!456641 () Bool)

(assert (=> start!70302 m!456641))

(declare-fun m!456643 () Bool)

(assert (=> start!70302 m!456643))

(declare-fun m!456645 () Bool)

(assert (=> b!318542 m!456645))

(check-sat (not start!70302) (not b!318542))
(check-sat)
