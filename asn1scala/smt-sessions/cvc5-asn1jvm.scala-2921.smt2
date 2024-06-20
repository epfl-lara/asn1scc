; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69676 () Bool)

(assert start!69676)

(declare-fun b!313442 () Bool)

(declare-fun res!256616 () Bool)

(declare-fun e!225559 () Bool)

(assert (=> b!313442 (=> (not res!256616) (not e!225559))))

(declare-datatypes ((array!19249 0))(
  ( (array!19250 (arr!9430 (Array (_ BitVec 32) (_ BitVec 8))) (size!8350 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19249)

(declare-fun a3!74 () array!19249)

(declare-fun from!870 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19249 array!19249 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313442 (= res!256616 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(declare-fun b!313441 () Bool)

(declare-fun res!256619 () Bool)

(assert (=> b!313441 (=> (not res!256619) (not e!225559))))

(declare-fun to!837 () (_ BitVec 64))

(declare-fun a2!799 () array!19249)

(assert (=> b!313441 (= res!256619 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313443 () Bool)

(assert (=> b!313443 (= e!225559 (not true))))

(declare-fun mid!77 () (_ BitVec 64))

(assert (=> b!313443 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-datatypes ((Unit!21539 0))(
  ( (Unit!21540) )
))
(declare-fun lt!442280 () Unit!21539)

(declare-fun rec!20 (array!19249 array!19249 array!19249 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21539)

(assert (=> b!313443 (= lt!442280 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(declare-fun b!313440 () Bool)

(declare-fun res!256617 () Bool)

(assert (=> b!313440 (=> (not res!256617) (not e!225559))))

(assert (=> b!313440 (= res!256617 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(declare-fun res!256618 () Bool)

(assert (=> start!69676 (=> (not res!256618) (not e!225559))))

(assert (=> start!69676 (= res!256618 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8350 a1!799) (size!8350 a2!799)) (= (size!8350 a2!799) (size!8350 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8350 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8350 a2!799))))))))

(assert (=> start!69676 e!225559))

(assert (=> start!69676 true))

(declare-fun array_inv!7902 (array!19249) Bool)

(assert (=> start!69676 (array_inv!7902 a1!799)))

(assert (=> start!69676 (array_inv!7902 a2!799)))

(assert (=> start!69676 (array_inv!7902 a3!74)))

(assert (= (and start!69676 res!256618) b!313440))

(assert (= (and b!313440 res!256617) b!313441))

(assert (= (and b!313441 res!256619) b!313442))

(assert (= (and b!313442 res!256616) b!313443))

(declare-fun m!450983 () Bool)

(assert (=> b!313440 m!450983))

(declare-fun m!450985 () Bool)

(assert (=> start!69676 m!450985))

(declare-fun m!450987 () Bool)

(assert (=> start!69676 m!450987))

(declare-fun m!450989 () Bool)

(assert (=> start!69676 m!450989))

(declare-fun m!450991 () Bool)

(assert (=> b!313441 m!450991))

(declare-fun m!450993 () Bool)

(assert (=> b!313442 m!450993))

(declare-fun m!450995 () Bool)

(assert (=> b!313443 m!450995))

(declare-fun m!450997 () Bool)

(assert (=> b!313443 m!450997))

(push 1)

(assert (not b!313443))

(assert (not b!313441))

(assert (not b!313440))

(assert (not b!313442))

(assert (not start!69676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

