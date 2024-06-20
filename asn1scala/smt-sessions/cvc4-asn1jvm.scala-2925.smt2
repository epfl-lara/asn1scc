; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69716 () Bool)

(assert start!69716)

(declare-fun b!313634 () Bool)

(declare-fun res!256780 () Bool)

(declare-fun e!225798 () Bool)

(assert (=> b!313634 (=> (not res!256780) (not e!225798))))

(declare-datatypes ((array!19280 0))(
  ( (array!19281 (arr!9444 (Array (_ BitVec 32) (_ BitVec 8))) (size!8364 (_ BitVec 32))) )
))
(declare-fun a1!799 () array!19280)

(declare-fun a3!74 () array!19280)

(declare-fun from!870 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19280 array!19280 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313634 (= res!256780 (arrayBitRangesEq!0 a1!799 a3!74 from!870 from!870))))

(declare-fun b!313633 () Bool)

(declare-fun res!256781 () Bool)

(assert (=> b!313633 (=> (not res!256781) (not e!225798))))

(declare-fun to!837 () (_ BitVec 64))

(declare-fun a2!799 () array!19280)

(assert (=> b!313633 (= res!256781 (arrayBitRangesEq!0 a2!799 a3!74 from!870 to!837))))

(declare-fun b!313635 () Bool)

(assert (=> b!313635 (= e!225798 (not true))))

(declare-fun mid!77 () (_ BitVec 64))

(assert (=> b!313635 (arrayBitRangesEq!0 a1!799 a3!74 from!870 mid!77)))

(declare-datatypes ((Unit!21549 0))(
  ( (Unit!21550) )
))
(declare-fun lt!442340 () Unit!21549)

(declare-fun rec!20 (array!19280 array!19280 array!19280 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21549)

(assert (=> b!313635 (= lt!442340 (rec!20 a1!799 a2!799 a3!74 from!870 mid!77 to!837 from!870))))

(declare-fun res!256779 () Bool)

(assert (=> start!69716 (=> (not res!256779) (not e!225798))))

(assert (=> start!69716 (= res!256779 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!870) (bvsle from!870 mid!77) (bvsle mid!77 to!837) (= (size!8364 a1!799) (size!8364 a2!799)) (= (size!8364 a2!799) (size!8364 a3!74)) (bvsle mid!77 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8364 a1!799)))) (bvsle to!837 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8364 a2!799))))))))

(assert (=> start!69716 e!225798))

(assert (=> start!69716 true))

(declare-fun array_inv!7916 (array!19280) Bool)

(assert (=> start!69716 (array_inv!7916 a1!799)))

(assert (=> start!69716 (array_inv!7916 a2!799)))

(assert (=> start!69716 (array_inv!7916 a3!74)))

(declare-fun b!313632 () Bool)

(declare-fun res!256778 () Bool)

(assert (=> b!313632 (=> (not res!256778) (not e!225798))))

(assert (=> b!313632 (= res!256778 (arrayBitRangesEq!0 a1!799 a2!799 from!870 mid!77))))

(assert (= (and start!69716 res!256779) b!313632))

(assert (= (and b!313632 res!256778) b!313633))

(assert (= (and b!313633 res!256781) b!313634))

(assert (= (and b!313634 res!256780) b!313635))

(declare-fun m!451279 () Bool)

(assert (=> b!313632 m!451279))

(declare-fun m!451281 () Bool)

(assert (=> b!313635 m!451281))

(declare-fun m!451283 () Bool)

(assert (=> b!313635 m!451283))

(declare-fun m!451285 () Bool)

(assert (=> start!69716 m!451285))

(declare-fun m!451287 () Bool)

(assert (=> start!69716 m!451287))

(declare-fun m!451289 () Bool)

(assert (=> start!69716 m!451289))

(declare-fun m!451291 () Bool)

(assert (=> b!313634 m!451291))

(declare-fun m!451293 () Bool)

(assert (=> b!313633 m!451293))

(push 1)

(assert (not b!313635))

(assert (not start!69716))

(assert (not b!313633))

(assert (not b!313632))

(assert (not b!313634))

(check-sat)

