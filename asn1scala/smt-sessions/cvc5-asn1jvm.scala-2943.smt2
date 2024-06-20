; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69820 () Bool)

(assert start!69820)

(declare-fun b!314761 () Bool)

(declare-fun res!257911 () Bool)

(declare-fun e!226424 () Bool)

(assert (=> b!314761 (=> (not res!257911) (not e!226424))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19384 0))(
  ( (array!19385 (arr!9496 (Array (_ BitVec 32) (_ BitVec 8))) (size!8416 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19384)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19384)

(declare-fun arrayBitRangesEq!0 (array!19384 array!19384 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314761 (= res!257911 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314762 () Bool)

(declare-fun e!226422 () Bool)

(assert (=> b!314762 (= e!226424 (not e!226422))))

(declare-fun res!257910 () Bool)

(assert (=> b!314762 (=> res!257910 e!226422)))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!314762 (= res!257910 (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))))

(declare-fun a3!79 () array!19384)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!314762 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21623 0))(
  ( (Unit!21624) )
))
(declare-fun lt!442565 () Unit!21623)

(declare-fun arrayBitRangesEqDrop1!0 (array!19384 array!19384 (_ BitVec 64) (_ BitVec 64)) Unit!21623)

(assert (=> b!314762 (= lt!442565 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314762 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442568 () Unit!21623)

(assert (=> b!314762 (= lt!442568 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314762 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442567 () Unit!21623)

(declare-fun arrayBitRangesEqAppend!0 (array!19384 array!19384 (_ BitVec 64) (_ BitVec 64)) Unit!21623)

(assert (=> b!314762 (= lt!442567 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314763 () Bool)

(declare-fun res!257913 () Bool)

(assert (=> b!314763 (=> (not res!257913) (not e!226424))))

(assert (=> b!314763 (= res!257913 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314764 () Bool)

(declare-fun res!257914 () Bool)

(assert (=> b!314764 (=> (not res!257914) (not e!226424))))

(assert (=> b!314764 (= res!257914 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314766 () Bool)

(declare-fun res!257908 () Bool)

(assert (=> b!314766 (=> (not res!257908) (not e!226424))))

(assert (=> b!314766 (= res!257908 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314767 () Bool)

(declare-fun res!257907 () Bool)

(assert (=> b!314767 (=> (not res!257907) (not e!226424))))

(assert (=> b!314767 (= res!257907 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314768 () Bool)

(assert (=> b!314768 (= e!226422 (bvsle (size!8416 a1!825) (size!8416 a3!79)))))

(assert (=> b!314768 (arrayBitRangesEq!0 a1!825 a3!79 from!878 mid!82)))

(declare-fun lt!442566 () Unit!21623)

(declare-fun rec!20 (array!19384 array!19384 array!19384 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!21623)

(assert (=> b!314768 (= lt!442566 (rec!20 a1!825 a2!825 a3!79 from!878 mid!82 to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)))))

(declare-fun b!314769 () Bool)

(declare-fun res!257909 () Bool)

(assert (=> b!314769 (=> (not res!257909) (not e!226424))))

(assert (=> b!314769 (= res!257909 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!257912 () Bool)

(assert (=> start!69820 (=> (not res!257912) (not e!226424))))

(assert (=> start!69820 (= res!257912 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8416 a1!825) (size!8416 a2!825)) (= (size!8416 a2!825) (size!8416 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8416 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8416 a2!825))))))))

(assert (=> start!69820 e!226424))

(assert (=> start!69820 true))

(declare-fun array_inv!7968 (array!19384) Bool)

(assert (=> start!69820 (array_inv!7968 a1!825)))

(assert (=> start!69820 (array_inv!7968 a3!79)))

(assert (=> start!69820 (array_inv!7968 a2!825)))

(declare-fun b!314765 () Bool)

(declare-fun res!257915 () Bool)

(assert (=> b!314765 (=> (not res!257915) (not e!226424))))

(assert (=> b!314765 (= res!257915 (not (= i!1020 mid!82)))))

(assert (= (and start!69820 res!257912) b!314761))

(assert (= (and b!314761 res!257911) b!314766))

(assert (= (and b!314766 res!257908) b!314763))

(assert (= (and b!314763 res!257913) b!314769))

(assert (= (and b!314769 res!257909) b!314767))

(assert (= (and b!314767 res!257907) b!314764))

(assert (= (and b!314764 res!257914) b!314765))

(assert (= (and b!314765 res!257915) b!314762))

(assert (= (and b!314762 (not res!257910)) b!314768))

(declare-fun m!452357 () Bool)

(assert (=> b!314769 m!452357))

(declare-fun m!452359 () Bool)

(assert (=> b!314768 m!452359))

(declare-fun m!452361 () Bool)

(assert (=> b!314768 m!452361))

(declare-fun m!452363 () Bool)

(assert (=> b!314764 m!452363))

(declare-fun m!452365 () Bool)

(assert (=> b!314762 m!452365))

(declare-fun m!452367 () Bool)

(assert (=> b!314762 m!452367))

(declare-fun m!452369 () Bool)

(assert (=> b!314762 m!452369))

(declare-fun m!452371 () Bool)

(assert (=> b!314762 m!452371))

(declare-fun m!452373 () Bool)

(assert (=> b!314762 m!452373))

(declare-fun m!452375 () Bool)

(assert (=> b!314762 m!452375))

(declare-fun m!452377 () Bool)

(assert (=> start!69820 m!452377))

(declare-fun m!452379 () Bool)

(assert (=> start!69820 m!452379))

(declare-fun m!452381 () Bool)

(assert (=> start!69820 m!452381))

(declare-fun m!452383 () Bool)

(assert (=> b!314766 m!452383))

(declare-fun m!452385 () Bool)

(assert (=> b!314767 m!452385))

(declare-fun m!452387 () Bool)

(assert (=> b!314761 m!452387))

(push 1)

(assert (not b!314768))

(assert (not b!314767))

(assert (not b!314762))

(assert (not b!314769))

(assert (not b!314761))

(assert (not b!314764))

(assert (not b!314766))

(assert (not start!69820))

(check-sat)

(pop 1)

(push 1)

(check-sat)

