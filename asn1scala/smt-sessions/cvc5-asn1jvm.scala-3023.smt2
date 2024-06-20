; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70408 () Bool)

(assert start!70408)

(declare-fun b!318991 () Bool)

(declare-fun res!262045 () Bool)

(declare-fun e!229189 () Bool)

(assert (=> b!318991 (=> (not res!262045) (not e!229189))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((array!19873 0))(
  ( (array!19874 (arr!9745 (Array (_ BitVec 32) (_ BitVec 8))) (size!8656 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19873)

(declare-fun a2!909 () array!19873)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19873 array!19873 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318991 (= res!262045 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318990 () Bool)

(declare-fun res!262048 () Bool)

(assert (=> b!318990 (=> (not res!262048) (not e!229189))))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!318990 (= res!262048 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!318992 () Bool)

(assert (=> b!318992 (= e!229189 (and (not (= (bvand to!869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!869 i!1041) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!262047 () Bool)

(assert (=> start!70408 (=> (not res!262047) (not e!229189))))

(assert (=> start!70408 (= res!262047 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8656 a1!909) (size!8656 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8656 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70408 e!229189))

(assert (=> start!70408 true))

(declare-fun array_inv!8208 (array!19873) Bool)

(assert (=> start!70408 (array_inv!8208 a1!909)))

(assert (=> start!70408 (array_inv!8208 a2!909)))

(declare-fun b!318989 () Bool)

(declare-fun res!262046 () Bool)

(assert (=> b!318989 (=> (not res!262046) (not e!229189))))

(assert (=> b!318989 (= res!262046 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(assert (= (and start!70408 res!262047) b!318989))

(assert (= (and b!318989 res!262046) b!318990))

(assert (= (and b!318990 res!262048) b!318991))

(assert (= (and b!318991 res!262045) b!318992))

(declare-fun m!457217 () Bool)

(assert (=> b!318991 m!457217))

(declare-fun m!457219 () Bool)

(assert (=> start!70408 m!457219))

(declare-fun m!457221 () Bool)

(assert (=> start!70408 m!457221))

(declare-fun m!457223 () Bool)

(assert (=> b!318989 m!457223))

(push 1)

(assert (not start!70408))

(assert (not b!318991))

(assert (not b!318989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

