; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70296 () Bool)

(assert start!70296)

(declare-fun res!261605 () Bool)

(declare-fun e!228743 () Bool)

(assert (=> start!70296 (=> (not res!261605) (not e!228743))))

(declare-datatypes ((array!19794 0))(
  ( (array!19795 (arr!9704 (Array (_ BitVec 32) (_ BitVec 8))) (size!8618 (_ BitVec 32))) )
))
(declare-fun a2!721 () array!19794)

(declare-fun to!813 () (_ BitVec 64))

(declare-fun a1!721 () array!19794)

(declare-fun from!846 () (_ BitVec 64))

(assert (=> start!70296 (= res!261605 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 from!846) (bvsle from!846 to!813) (= (size!8618 a1!721) (size!8618 a2!721)) (bvsle to!813 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8618 a1!721))))))))

(assert (=> start!70296 e!228743))

(assert (=> start!70296 true))

(declare-fun array_inv!8170 (array!19794) Bool)

(assert (=> start!70296 (array_inv!8170 a1!721)))

(assert (=> start!70296 (array_inv!8170 a2!721)))

(declare-fun b!318524 () Bool)

(declare-fun res!261604 () Bool)

(assert (=> b!318524 (=> (not res!261604) (not e!228743))))

(declare-fun arrayBitRangesEq!0 (array!19794 array!19794 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318524 (= res!261604 (arrayBitRangesEq!0 a1!721 a2!721 from!846 to!813))))

(declare-fun b!318525 () Bool)

(assert (=> b!318525 (= e!228743 (and (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand from!846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub from!846 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!70296 res!261605) b!318524))

(assert (= (and b!318524 res!261604) b!318525))

(declare-fun m!456623 () Bool)

(assert (=> start!70296 m!456623))

(declare-fun m!456625 () Bool)

(assert (=> start!70296 m!456625))

(declare-fun m!456627 () Bool)

(assert (=> b!318524 m!456627))

(check-sat (not start!70296) (not b!318524))
(check-sat)
