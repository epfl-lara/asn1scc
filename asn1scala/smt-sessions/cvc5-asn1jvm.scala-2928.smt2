; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69730 () Bool)

(assert start!69730)

(declare-fun b!313720 () Bool)

(declare-fun res!256871 () Bool)

(declare-fun e!225881 () Bool)

(assert (=> b!313720 (=> (not res!256871) (not e!225881))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19294 0))(
  ( (array!19295 (arr!9451 (Array (_ BitVec 32) (_ BitVec 8))) (size!8371 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19294)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19294)

(declare-fun arrayBitRangesEq!0 (array!19294 array!19294 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313720 (= res!256871 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!256870 () Bool)

(assert (=> start!69730 (=> (not res!256870) (not e!225881))))

(declare-fun a3!79 () array!19294)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69730 (= res!256870 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8371 a1!825) (size!8371 a2!825)) (= (size!8371 a2!825) (size!8371 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8371 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8371 a2!825))))))))

(assert (=> start!69730 e!225881))

(assert (=> start!69730 true))

(declare-fun array_inv!7923 (array!19294) Bool)

(assert (=> start!69730 (array_inv!7923 a1!825)))

(assert (=> start!69730 (array_inv!7923 a3!79)))

(assert (=> start!69730 (array_inv!7923 a2!825)))

(declare-fun b!313721 () Bool)

(declare-fun res!256867 () Bool)

(assert (=> b!313721 (=> (not res!256867) (not e!225881))))

(assert (=> b!313721 (= res!256867 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!313722 () Bool)

(declare-fun res!256869 () Bool)

(assert (=> b!313722 (=> (not res!256869) (not e!225881))))

(declare-fun i!1020 () (_ BitVec 64))

(assert (=> b!313722 (= res!256869 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!313723 () Bool)

(declare-fun res!256868 () Bool)

(assert (=> b!313723 (=> (not res!256868) (not e!225881))))

(assert (=> b!313723 (= res!256868 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!313724 () Bool)

(assert (=> b!313724 (= e!225881 (bvsgt (size!8371 a1!825) (size!8371 a3!79)))))

(declare-fun b!313725 () Bool)

(declare-fun res!256866 () Bool)

(assert (=> b!313725 (=> (not res!256866) (not e!225881))))

(assert (=> b!313725 (= res!256866 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69730 res!256870) b!313720))

(assert (= (and b!313720 res!256871) b!313721))

(assert (= (and b!313721 res!256867) b!313722))

(assert (= (and b!313722 res!256869) b!313725))

(assert (= (and b!313725 res!256866) b!313723))

(assert (= (and b!313723 res!256868) b!313724))

(declare-fun m!451361 () Bool)

(assert (=> b!313723 m!451361))

(declare-fun m!451363 () Bool)

(assert (=> b!313725 m!451363))

(declare-fun m!451365 () Bool)

(assert (=> b!313721 m!451365))

(declare-fun m!451367 () Bool)

(assert (=> b!313720 m!451367))

(declare-fun m!451369 () Bool)

(assert (=> start!69730 m!451369))

(declare-fun m!451371 () Bool)

(assert (=> start!69730 m!451371))

(declare-fun m!451373 () Bool)

(assert (=> start!69730 m!451373))

(push 1)

(assert (not b!313720))

(assert (not b!313723))

(assert (not b!313725))

(assert (not b!313721))

(assert (not start!69730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

