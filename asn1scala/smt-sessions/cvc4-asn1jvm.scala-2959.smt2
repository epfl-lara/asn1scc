; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69956 () Bool)

(assert start!69956)

(declare-fun b!316131 () Bool)

(declare-fun e!227207 () Bool)

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!316131 (= e!227207 (not (or (not (= (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((array!19487 0))(
  ( (array!19488 (arr!9549 (Array (_ BitVec 32) (_ BitVec 8))) (size!8466 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19487)

(declare-fun a2!825 () array!19487)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19487 array!19487 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316131 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21687 0))(
  ( (Unit!21688) )
))
(declare-fun lt!442824 () Unit!21687)

(declare-fun arrayBitRangesEqDrop1!0 (array!19487 array!19487 (_ BitVec 64) (_ BitVec 64)) Unit!21687)

(assert (=> b!316131 (= lt!442824 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun a1!825 () array!19487)

(assert (=> b!316131 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442826 () Unit!21687)

(assert (=> b!316131 (= lt!442826 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316131 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442825 () Unit!21687)

(declare-fun arrayBitRangesEqAppend!0 (array!19487 array!19487 (_ BitVec 64) (_ BitVec 64)) Unit!21687)

(assert (=> b!316131 (= lt!442825 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316132 () Bool)

(declare-fun res!259234 () Bool)

(assert (=> b!316132 (=> (not res!259234) (not e!227207))))

(assert (=> b!316132 (= res!259234 (not (= i!1020 mid!82)))))

(declare-fun b!316133 () Bool)

(declare-fun res!259237 () Bool)

(assert (=> b!316133 (=> (not res!259237) (not e!227207))))

(assert (=> b!316133 (= res!259237 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316134 () Bool)

(declare-fun res!259240 () Bool)

(assert (=> b!316134 (=> (not res!259240) (not e!227207))))

(assert (=> b!316134 (= res!259240 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316135 () Bool)

(declare-fun res!259236 () Bool)

(assert (=> b!316135 (=> (not res!259236) (not e!227207))))

(assert (=> b!316135 (= res!259236 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316130 () Bool)

(declare-fun res!259235 () Bool)

(assert (=> b!316130 (=> (not res!259235) (not e!227207))))

(assert (=> b!316130 (= res!259235 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!259238 () Bool)

(assert (=> start!69956 (=> (not res!259238) (not e!227207))))

(assert (=> start!69956 (= res!259238 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8466 a1!825) (size!8466 a2!825)) (= (size!8466 a2!825) (size!8466 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8466 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8466 a2!825))))))))

(assert (=> start!69956 e!227207))

(assert (=> start!69956 true))

(declare-fun array_inv!8018 (array!19487) Bool)

(assert (=> start!69956 (array_inv!8018 a1!825)))

(assert (=> start!69956 (array_inv!8018 a3!79)))

(assert (=> start!69956 (array_inv!8018 a2!825)))

(declare-fun b!316136 () Bool)

(declare-fun res!259239 () Bool)

(assert (=> b!316136 (=> (not res!259239) (not e!227207))))

(assert (=> b!316136 (= res!259239 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316137 () Bool)

(declare-fun res!259241 () Bool)

(assert (=> b!316137 (=> (not res!259241) (not e!227207))))

(assert (=> b!316137 (= res!259241 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69956 res!259238) b!316135))

(assert (= (and b!316135 res!259236) b!316130))

(assert (= (and b!316130 res!259235) b!316133))

(assert (= (and b!316133 res!259237) b!316137))

(assert (= (and b!316137 res!259241) b!316136))

(assert (= (and b!316136 res!259239) b!316134))

(assert (= (and b!316134 res!259240) b!316132))

(assert (= (and b!316132 res!259234) b!316131))

(declare-fun m!453883 () Bool)

(assert (=> b!316134 m!453883))

(declare-fun m!453885 () Bool)

(assert (=> b!316131 m!453885))

(declare-fun m!453887 () Bool)

(assert (=> b!316131 m!453887))

(declare-fun m!453889 () Bool)

(assert (=> b!316131 m!453889))

(declare-fun m!453891 () Bool)

(assert (=> b!316131 m!453891))

(declare-fun m!453893 () Bool)

(assert (=> b!316131 m!453893))

(declare-fun m!453895 () Bool)

(assert (=> b!316131 m!453895))

(declare-fun m!453897 () Bool)

(assert (=> b!316135 m!453897))

(declare-fun m!453899 () Bool)

(assert (=> b!316130 m!453899))

(declare-fun m!453901 () Bool)

(assert (=> start!69956 m!453901))

(declare-fun m!453903 () Bool)

(assert (=> start!69956 m!453903))

(declare-fun m!453905 () Bool)

(assert (=> start!69956 m!453905))

(declare-fun m!453907 () Bool)

(assert (=> b!316136 m!453907))

(declare-fun m!453909 () Bool)

(assert (=> b!316137 m!453909))

(push 1)

(assert (not b!316131))

(assert (not b!316134))

(assert (not b!316136))

(assert (not start!69956))

(assert (not b!316137))

(assert (not b!316130))

(assert (not b!316135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

