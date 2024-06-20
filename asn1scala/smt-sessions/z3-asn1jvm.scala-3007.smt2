; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70278 () Bool)

(assert start!70278)

(declare-fun res!261560 () Bool)

(declare-fun e!228673 () Bool)

(assert (=> start!70278 (=> (not res!261560) (not e!228673))))

(declare-datatypes ((array!19776 0))(
  ( (array!19777 (arr!9695 (Array (_ BitVec 32) (_ BitVec 8))) (size!8609 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19776)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun from!846 () (_ BitVec 64))

(declare-fun a1!721 () array!19776)

(assert (=> start!70278 (= res!261560 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8609 a1!721) (size!8609 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8609 a1!721))))))))

(assert (=> start!70278 e!228673))

(assert (=> start!70278 true))

(declare-fun array_inv!8161 (array!19776) Bool)

(assert (=> start!70278 (array_inv!8161 a1!721)))

(assert (=> start!70278 (array_inv!8161 a2!721)))

(declare-fun b!318479 () Bool)

(declare-fun res!261559 () Bool)

(assert (=> b!318479 (=> (not res!261559) (not e!228673))))

(declare-fun arrayBitRangesEq!0 (array!19776 array!19776 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318479 (= res!261559 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318480 () Bool)

(assert (=> b!318480 (= e!228673 (bvsge (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8609 a2!721)))))))

(assert (= (and start!70278 res!261560) b!318479))

(assert (= (and b!318479 res!261559) b!318480))

(declare-fun m!456563 () Bool)

(assert (=> start!70278 m!456563))

(declare-fun m!456565 () Bool)

(assert (=> start!70278 m!456565))

(declare-fun m!456567 () Bool)

(assert (=> b!318479 m!456567))

(check-sat (not start!70278) (not b!318479))
(check-sat)
