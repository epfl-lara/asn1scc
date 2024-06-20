; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69950 () Bool)

(assert start!69950)

(declare-fun b!316058 () Bool)

(declare-fun res!259167 () Bool)

(declare-fun e!227173 () Bool)

(assert (=> b!316058 (=> (not res!259167) (not e!227173))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!316058 (= res!259167 (not (= i!1020 mid!82)))))

(declare-fun b!316059 () Bool)

(declare-fun res!259165 () Bool)

(assert (=> b!316059 (=> (not res!259165) (not e!227173))))

(declare-datatypes ((array!19481 0))(
  ( (array!19482 (arr!9546 (Array (_ BitVec 32) (_ BitVec 8))) (size!8463 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19481)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19481)

(declare-fun arrayBitRangesEq!0 (array!19481 array!19481 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316059 (= res!259165 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316060 () Bool)

(declare-fun res!259162 () Bool)

(assert (=> b!316060 (=> (not res!259162) (not e!227173))))

(assert (=> b!316060 (= res!259162 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun res!259166 () Bool)

(assert (=> start!69950 (=> (not res!259166) (not e!227173))))

(declare-fun a3!79 () array!19481)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69950 (= res!259166 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8463 a1!825) (size!8463 a2!825)) (= (size!8463 a2!825) (size!8463 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8463 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8463 a2!825))))))))

(assert (=> start!69950 e!227173))

(assert (=> start!69950 true))

(declare-fun array_inv!8015 (array!19481) Bool)

(assert (=> start!69950 (array_inv!8015 a1!825)))

(assert (=> start!69950 (array_inv!8015 a3!79)))

(assert (=> start!69950 (array_inv!8015 a2!825)))

(declare-fun b!316061 () Bool)

(declare-fun res!259163 () Bool)

(assert (=> b!316061 (=> (not res!259163) (not e!227173))))

(assert (=> b!316061 (= res!259163 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316062 () Bool)

(declare-fun res!259169 () Bool)

(assert (=> b!316062 (=> (not res!259169) (not e!227173))))

(assert (=> b!316062 (= res!259169 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316063 () Bool)

(assert (=> b!316063 (= e!227173 (not true))))

(assert (=> b!316063 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21681 0))(
  ( (Unit!21682) )
))
(declare-fun lt!442798 () Unit!21681)

(declare-fun arrayBitRangesEqDrop1!0 (array!19481 array!19481 (_ BitVec 64) (_ BitVec 64)) Unit!21681)

(assert (=> b!316063 (= lt!442798 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316063 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442799 () Unit!21681)

(declare-fun arrayBitRangesEqAppend!0 (array!19481 array!19481 (_ BitVec 64) (_ BitVec 64)) Unit!21681)

(assert (=> b!316063 (= lt!442799 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316064 () Bool)

(declare-fun res!259168 () Bool)

(assert (=> b!316064 (=> (not res!259168) (not e!227173))))

(assert (=> b!316064 (= res!259168 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316065 () Bool)

(declare-fun res!259164 () Bool)

(assert (=> b!316065 (=> (not res!259164) (not e!227173))))

(assert (=> b!316065 (= res!259164 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(assert (= (and start!69950 res!259166) b!316059))

(assert (= (and b!316059 res!259165) b!316062))

(assert (= (and b!316062 res!259169) b!316060))

(assert (= (and b!316060 res!259162) b!316061))

(assert (= (and b!316061 res!259163) b!316065))

(assert (= (and b!316065 res!259164) b!316064))

(assert (= (and b!316064 res!259168) b!316058))

(assert (= (and b!316058 res!259167) b!316063))

(declare-fun m!453803 () Bool)

(assert (=> b!316061 m!453803))

(declare-fun m!453805 () Bool)

(assert (=> b!316062 m!453805))

(declare-fun m!453807 () Bool)

(assert (=> b!316059 m!453807))

(declare-fun m!453809 () Bool)

(assert (=> b!316064 m!453809))

(declare-fun m!453811 () Bool)

(assert (=> b!316063 m!453811))

(declare-fun m!453813 () Bool)

(assert (=> b!316063 m!453813))

(declare-fun m!453815 () Bool)

(assert (=> b!316063 m!453815))

(declare-fun m!453817 () Bool)

(assert (=> b!316063 m!453817))

(declare-fun m!453819 () Bool)

(assert (=> start!69950 m!453819))

(declare-fun m!453821 () Bool)

(assert (=> start!69950 m!453821))

(declare-fun m!453823 () Bool)

(assert (=> start!69950 m!453823))

(declare-fun m!453825 () Bool)

(assert (=> b!316065 m!453825))

(push 1)

(assert (not b!316065))

(assert (not b!316061))

(assert (not start!69950))

(assert (not b!316064))

(assert (not b!316059))

(assert (not b!316063))

(assert (not b!316062))

(check-sat)

