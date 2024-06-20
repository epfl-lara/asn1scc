; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69748 () Bool)

(assert start!69748)

(declare-fun b!313895 () Bool)

(declare-fun res!257042 () Bool)

(declare-fun e!225989 () Bool)

(assert (=> b!313895 (=> (not res!257042) (not e!225989))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19312 0))(
  ( (array!19313 (arr!9460 (Array (_ BitVec 32) (_ BitVec 8))) (size!8380 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19312)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19312)

(declare-fun arrayBitRangesEq!0 (array!19312 array!19312 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313895 (= res!257042 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!313896 () Bool)

(assert (=> b!313896 (= e!225989 (not true))))

(declare-fun a3!79 () array!19312)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!313896 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21551 0))(
  ( (Unit!21552) )
))
(declare-fun lt!442343 () Unit!21551)

(declare-fun arrayBitRangesEqAppend!0 (array!19312 array!19312 (_ BitVec 64) (_ BitVec 64)) Unit!21551)

(assert (=> b!313896 (= lt!442343 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!313897 () Bool)

(declare-fun res!257046 () Bool)

(assert (=> b!313897 (=> (not res!257046) (not e!225989))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!313897 (= res!257046 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313898 () Bool)

(declare-fun res!257047 () Bool)

(assert (=> b!313898 (=> (not res!257047) (not e!225989))))

(assert (=> b!313898 (= res!257047 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313899 () Bool)

(declare-fun res!257043 () Bool)

(assert (=> b!313899 (=> (not res!257043) (not e!225989))))

(assert (=> b!313899 (= res!257043 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313900 () Bool)

(declare-fun res!257048 () Bool)

(assert (=> b!313900 (=> (not res!257048) (not e!225989))))

(assert (=> b!313900 (= res!257048 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!313902 () Bool)

(declare-fun res!257045 () Bool)

(assert (=> b!313902 (=> (not res!257045) (not e!225989))))

(assert (=> b!313902 (= res!257045 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!313901 () Bool)

(declare-fun res!257044 () Bool)

(assert (=> b!313901 (=> (not res!257044) (not e!225989))))

(assert (=> b!313901 (= res!257044 (not (= i!1020 mid!82)))))

(declare-fun res!257041 () Bool)

(assert (=> start!69748 (=> (not res!257041) (not e!225989))))

(assert (=> start!69748 (= res!257041 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8380 a1!825) (size!8380 a2!825)) (= (size!8380 a2!825) (size!8380 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8380 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8380 a2!825))))))))

(assert (=> start!69748 e!225989))

(assert (=> start!69748 true))

(declare-fun array_inv!7932 (array!19312) Bool)

(assert (=> start!69748 (array_inv!7932 a1!825)))

(assert (=> start!69748 (array_inv!7932 a3!79)))

(assert (=> start!69748 (array_inv!7932 a2!825)))

(assert (= (and start!69748 res!257041) b!313902))

(assert (= (and b!313902 res!257045) b!313897))

(assert (= (and b!313897 res!257046) b!313899))

(assert (= (and b!313899 res!257043) b!313895))

(assert (= (and b!313895 res!257042) b!313898))

(assert (= (and b!313898 res!257047) b!313900))

(assert (= (and b!313900 res!257048) b!313901))

(assert (= (and b!313901 res!257044) b!313896))

(declare-fun m!451493 () Bool)

(assert (=> b!313896 m!451493))

(declare-fun m!451495 () Bool)

(assert (=> b!313896 m!451495))

(declare-fun m!451497 () Bool)

(assert (=> b!313898 m!451497))

(declare-fun m!451499 () Bool)

(assert (=> b!313902 m!451499))

(declare-fun m!451501 () Bool)

(assert (=> b!313900 m!451501))

(declare-fun m!451503 () Bool)

(assert (=> start!69748 m!451503))

(declare-fun m!451505 () Bool)

(assert (=> start!69748 m!451505))

(declare-fun m!451507 () Bool)

(assert (=> start!69748 m!451507))

(declare-fun m!451509 () Bool)

(assert (=> b!313897 m!451509))

(declare-fun m!451511 () Bool)

(assert (=> b!313895 m!451511))

(push 1)

(assert (not b!313896))

(assert (not b!313898))

(assert (not start!69748))

(assert (not b!313902))

(assert (not b!313900))

(assert (not b!313897))

(assert (not b!313895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

