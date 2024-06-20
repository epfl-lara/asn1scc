; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70412 () Bool)

(assert start!70412)

(declare-fun b!319015 () Bool)

(declare-fun res!262069 () Bool)

(declare-fun e!229207 () Bool)

(assert (=> b!319015 (=> (not res!262069) (not e!229207))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-datatypes ((array!19877 0))(
  ( (array!19878 (arr!9747 (Array (_ BitVec 32) (_ BitVec 8))) (size!8658 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19877)

(declare-fun a2!909 () array!19877)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19877 array!19877 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319015 (= res!262069 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun b!319016 () Bool)

(assert (=> b!319016 (= e!229207 (and (not (= (bvand to!869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!1041 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!869 i!1041) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!319014 () Bool)

(declare-fun res!262070 () Bool)

(assert (=> b!319014 (=> (not res!262070) (not e!229207))))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!319014 (= res!262070 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun res!262071 () Bool)

(assert (=> start!70412 (=> (not res!262071) (not e!229207))))

(assert (=> start!70412 (= res!262071 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8658 a1!909) (size!8658 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8658 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70412 e!229207))

(assert (=> start!70412 true))

(declare-fun array_inv!8210 (array!19877) Bool)

(assert (=> start!70412 (array_inv!8210 a1!909)))

(assert (=> start!70412 (array_inv!8210 a2!909)))

(declare-fun b!319013 () Bool)

(declare-fun res!262072 () Bool)

(assert (=> b!319013 (=> (not res!262072) (not e!229207))))

(assert (=> b!319013 (= res!262072 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(assert (= (and start!70412 res!262071) b!319013))

(assert (= (and b!319013 res!262072) b!319014))

(assert (= (and b!319014 res!262070) b!319015))

(assert (= (and b!319015 res!262069) b!319016))

(declare-fun m!457233 () Bool)

(assert (=> b!319015 m!457233))

(declare-fun m!457235 () Bool)

(assert (=> start!70412 m!457235))

(declare-fun m!457237 () Bool)

(assert (=> start!70412 m!457237))

(declare-fun m!457239 () Bool)

(assert (=> b!319013 m!457239))

(push 1)

(assert (not b!319015))

(assert (not start!70412))

(assert (not b!319013))

(check-sat)

(pop 1)

(push 1)

(check-sat)

