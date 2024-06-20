; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70402 () Bool)

(assert start!70402)

(declare-fun b!318939 () Bool)

(declare-fun res!262000 () Bool)

(declare-fun e!229164 () Bool)

(assert (=> b!318939 (=> (not res!262000) (not e!229164))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!318939 (= res!262000 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!318940 () Bool)

(declare-fun res!261997 () Bool)

(assert (=> b!318940 (=> (not res!261997) (not e!229164))))

(declare-datatypes ((array!19867 0))(
  ( (array!19868 (arr!9742 (Array (_ BitVec 32) (_ BitVec 8))) (size!8653 (_ BitVec 32))) )
))
(declare-fun a2!909 () array!19867)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun a1!909 () array!19867)

(declare-fun arrayBitRangesEq!0 (array!19867 array!19867 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!318940 (= res!261997 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!318941 () Bool)

(assert (=> b!318941 (= e!229164 (not (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!309) (bvslt at!309 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8653 a2!909)))))))))

(declare-fun bitAt!0 (array!19867 (_ BitVec 64)) Bool)

(assert (=> b!318941 (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))

(declare-datatypes ((Unit!21899 0))(
  ( (Unit!21900) )
))
(declare-fun lt!443477 () Unit!21899)

(declare-fun rec!22 (array!19867 array!19867 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21899)

(assert (=> b!318941 (= lt!443477 (rec!22 a1!909 a2!909 at!309 from!902 to!869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)))))

(declare-fun b!318942 () Bool)

(declare-fun res!261998 () Bool)

(assert (=> b!318942 (=> (not res!261998) (not e!229164))))

(assert (=> b!318942 (= res!261998 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!318943 () Bool)

(declare-fun res!261995 () Bool)

(assert (=> b!318943 (=> (not res!261995) (not e!229164))))

(assert (=> b!318943 (= res!261995 (and (not (= i!1041 at!309)) (bvsle from!902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041)) (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) at!309)))))

(declare-fun b!318944 () Bool)

(declare-fun res!261999 () Bool)

(assert (=> b!318944 (=> (not res!261999) (not e!229164))))

(assert (=> b!318944 (= res!261999 (arrayBitRangesEq!0 a1!909 a2!909 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1041) to!869))))

(declare-fun res!261996 () Bool)

(assert (=> start!70402 (=> (not res!261996) (not e!229164))))

(assert (=> start!70402 (= res!261996 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8653 a1!909) (size!8653 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8653 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70402 e!229164))

(assert (=> start!70402 true))

(declare-fun array_inv!8205 (array!19867) Bool)

(assert (=> start!70402 (array_inv!8205 a1!909)))

(assert (=> start!70402 (array_inv!8205 a2!909)))

(assert (= (and start!70402 res!261996) b!318940))

(assert (= (and b!318940 res!261997) b!318939))

(assert (= (and b!318939 res!262000) b!318942))

(assert (= (and b!318942 res!261998) b!318943))

(assert (= (and b!318943 res!261995) b!318944))

(assert (= (and b!318944 res!261999) b!318941))

(declare-fun m!457169 () Bool)

(assert (=> b!318944 m!457169))

(declare-fun m!457171 () Bool)

(assert (=> b!318941 m!457171))

(declare-fun m!457173 () Bool)

(assert (=> b!318941 m!457173))

(declare-fun m!457175 () Bool)

(assert (=> b!318941 m!457175))

(declare-fun m!457177 () Bool)

(assert (=> b!318940 m!457177))

(declare-fun m!457179 () Bool)

(assert (=> b!318942 m!457179))

(declare-fun m!457181 () Bool)

(assert (=> start!70402 m!457181))

(declare-fun m!457183 () Bool)

(assert (=> start!70402 m!457183))

(push 1)

(assert (not b!318940))

(assert (not b!318942))

(assert (not start!70402))

(assert (not b!318944))

(assert (not b!318941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

