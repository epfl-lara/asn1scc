; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69846 () Bool)

(assert start!69846)

(declare-fun b!315071 () Bool)

(declare-fun res!258223 () Bool)

(declare-fun e!226597 () Bool)

(assert (=> b!315071 (=> (not res!258223) (not e!226597))))

(declare-datatypes ((array!19410 0))(
  ( (array!19411 (arr!9509 (Array (_ BitVec 32) (_ BitVec 8))) (size!8429 (_ BitVec 32))) )
))
(declare-fun a3!79 () array!19410)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19410)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19410 array!19410 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315071 (= res!258223 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315072 () Bool)

(declare-fun res!258219 () Bool)

(assert (=> b!315072 (=> (not res!258219) (not e!226597))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315072 (= res!258219 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun a1!825 () array!19410)

(declare-fun b!315073 () Bool)

(assert (=> b!315073 (= e!226597 (not (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))))

(declare-fun b!315075 () Bool)

(declare-fun res!258221 () Bool)

(assert (=> b!315075 (=> (not res!258221) (not e!226597))))

(assert (=> b!315075 (= res!258221 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315076 () Bool)

(declare-fun res!258217 () Bool)

(assert (=> b!315076 (=> (not res!258217) (not e!226597))))

(assert (=> b!315076 (= res!258217 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315077 () Bool)

(declare-fun res!258222 () Bool)

(assert (=> b!315077 (=> (not res!258222) (not e!226597))))

(assert (=> b!315077 (= res!258222 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315078 () Bool)

(declare-fun res!258220 () Bool)

(assert (=> b!315078 (=> (not res!258220) (not e!226597))))

(assert (=> b!315078 (= res!258220 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!258224 () Bool)

(assert (=> start!69846 (=> (not res!258224) (not e!226597))))

(assert (=> start!69846 (= res!258224 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8429 a1!825) (size!8429 a2!825)) (= (size!8429 a2!825) (size!8429 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8429 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8429 a2!825))))))))

(assert (=> start!69846 e!226597))

(assert (=> start!69846 true))

(declare-fun array_inv!7981 (array!19410) Bool)

(assert (=> start!69846 (array_inv!7981 a1!825)))

(assert (=> start!69846 (array_inv!7981 a3!79)))

(assert (=> start!69846 (array_inv!7981 a2!825)))

(declare-fun b!315074 () Bool)

(declare-fun res!258218 () Bool)

(assert (=> b!315074 (=> (not res!258218) (not e!226597))))

(assert (=> b!315074 (= res!258218 (= i!1020 mid!82))))

(assert (= (and start!69846 res!258224) b!315077))

(assert (= (and b!315077 res!258222) b!315075))

(assert (= (and b!315075 res!258221) b!315072))

(assert (= (and b!315072 res!258219) b!315076))

(assert (= (and b!315076 res!258217) b!315071))

(assert (= (and b!315071 res!258223) b!315078))

(assert (= (and b!315078 res!258220) b!315074))

(assert (= (and b!315074 res!258218) b!315073))

(declare-fun m!452663 () Bool)

(assert (=> b!315078 m!452663))

(declare-fun m!452665 () Bool)

(assert (=> b!315077 m!452665))

(declare-fun m!452667 () Bool)

(assert (=> b!315075 m!452667))

(declare-fun m!452669 () Bool)

(assert (=> b!315076 m!452669))

(declare-fun m!452671 () Bool)

(assert (=> start!69846 m!452671))

(declare-fun m!452673 () Bool)

(assert (=> start!69846 m!452673))

(declare-fun m!452675 () Bool)

(assert (=> start!69846 m!452675))

(declare-fun m!452677 () Bool)

(assert (=> b!315071 m!452677))

(declare-fun m!452679 () Bool)

(assert (=> b!315073 m!452679))

(check-sat (not b!315077) (not b!315071) (not b!315078) (not start!69846) (not b!315076) (not b!315075) (not b!315073))
