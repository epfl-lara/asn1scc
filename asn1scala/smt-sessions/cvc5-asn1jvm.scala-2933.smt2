; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69760 () Bool)

(assert start!69760)

(declare-fun b!314039 () Bool)

(declare-fun res!257186 () Bool)

(declare-fun e!226063 () Bool)

(assert (=> b!314039 (=> (not res!257186) (not e!226063))))

(declare-datatypes ((array!19324 0))(
  ( (array!19325 (arr!9466 (Array (_ BitVec 32) (_ BitVec 8))) (size!8386 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19324)

(declare-fun a3!79 () array!19324)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19324 array!19324 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314039 (= res!257186 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!257189 () Bool)

(assert (=> start!69760 (=> (not res!257189) (not e!226063))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-fun to!845 () (_ BitVec 64))

(declare-fun a2!825 () array!19324)

(assert (=> start!69760 (= res!257189 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8386 a1!825) (size!8386 a2!825)) (= (size!8386 a2!825) (size!8386 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8386 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8386 a2!825))))))))

(assert (=> start!69760 e!226063))

(assert (=> start!69760 true))

(declare-fun array_inv!7938 (array!19324) Bool)

(assert (=> start!69760 (array_inv!7938 a1!825)))

(assert (=> start!69760 (array_inv!7938 a3!79)))

(assert (=> start!69760 (array_inv!7938 a2!825)))

(declare-fun b!314040 () Bool)

(declare-fun res!257187 () Bool)

(assert (=> b!314040 (=> (not res!257187) (not e!226063))))

(assert (=> b!314040 (= res!257187 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314041 () Bool)

(declare-fun res!257192 () Bool)

(assert (=> b!314041 (=> (not res!257192) (not e!226063))))

(assert (=> b!314041 (= res!257192 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!314042 () Bool)

(assert (=> b!314042 (= e!226063 (not true))))

(assert (=> b!314042 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21563 0))(
  ( (Unit!21564) )
))
(declare-fun lt!442361 () Unit!21563)

(declare-fun arrayBitRangesEqAppend!0 (array!19324 array!19324 (_ BitVec 64) (_ BitVec 64)) Unit!21563)

(assert (=> b!314042 (= lt!442361 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314043 () Bool)

(declare-fun res!257191 () Bool)

(assert (=> b!314043 (=> (not res!257191) (not e!226063))))

(assert (=> b!314043 (= res!257191 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314044 () Bool)

(declare-fun res!257185 () Bool)

(assert (=> b!314044 (=> (not res!257185) (not e!226063))))

(assert (=> b!314044 (= res!257185 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314045 () Bool)

(declare-fun res!257188 () Bool)

(assert (=> b!314045 (=> (not res!257188) (not e!226063))))

(assert (=> b!314045 (= res!257188 (not (= i!1020 mid!82)))))

(declare-fun b!314046 () Bool)

(declare-fun res!257190 () Bool)

(assert (=> b!314046 (=> (not res!257190) (not e!226063))))

(assert (=> b!314046 (= res!257190 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(assert (= (and start!69760 res!257189) b!314041))

(assert (= (and b!314041 res!257192) b!314046))

(assert (= (and b!314046 res!257190) b!314043))

(assert (= (and b!314043 res!257191) b!314040))

(assert (= (and b!314040 res!257187) b!314044))

(assert (= (and b!314044 res!257185) b!314039))

(assert (= (and b!314039 res!257186) b!314045))

(assert (= (and b!314045 res!257188) b!314042))

(declare-fun m!451613 () Bool)

(assert (=> b!314044 m!451613))

(declare-fun m!451615 () Bool)

(assert (=> start!69760 m!451615))

(declare-fun m!451617 () Bool)

(assert (=> start!69760 m!451617))

(declare-fun m!451619 () Bool)

(assert (=> start!69760 m!451619))

(declare-fun m!451621 () Bool)

(assert (=> b!314046 m!451621))

(declare-fun m!451623 () Bool)

(assert (=> b!314041 m!451623))

(declare-fun m!451625 () Bool)

(assert (=> b!314040 m!451625))

(declare-fun m!451627 () Bool)

(assert (=> b!314039 m!451627))

(declare-fun m!451629 () Bool)

(assert (=> b!314042 m!451629))

(declare-fun m!451631 () Bool)

(assert (=> b!314042 m!451631))

(push 1)

(assert (not b!314044))

(assert (not b!314042))

(assert (not b!314039))

(assert (not b!314041))

(assert (not start!69760))

(assert (not b!314046))

(assert (not b!314040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

