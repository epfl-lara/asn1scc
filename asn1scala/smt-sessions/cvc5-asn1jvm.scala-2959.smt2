; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69952 () Bool)

(assert start!69952)

(declare-fun b!316082 () Bool)

(declare-fun res!259188 () Bool)

(declare-fun e!227183 () Bool)

(assert (=> b!316082 (=> (not res!259188) (not e!227183))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!316082 (= res!259188 (not (= i!1020 mid!82)))))

(declare-fun b!316083 () Bool)

(declare-fun res!259191 () Bool)

(assert (=> b!316083 (=> (not res!259191) (not e!227183))))

(declare-datatypes ((array!19483 0))(
  ( (array!19484 (arr!9547 (Array (_ BitVec 32) (_ BitVec 8))) (size!8464 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19483)

(declare-fun a2!825 () array!19483)

(declare-fun arrayBitRangesEq!0 (array!19483 array!19483 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316083 (= res!259191 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316084 () Bool)

(declare-fun res!259187 () Bool)

(assert (=> b!316084 (=> (not res!259187) (not e!227183))))

(declare-fun a3!79 () array!19483)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!316084 (= res!259187 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316085 () Bool)

(declare-fun res!259193 () Bool)

(assert (=> b!316085 (=> (not res!259193) (not e!227183))))

(assert (=> b!316085 (= res!259193 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun res!259186 () Bool)

(assert (=> start!69952 (=> (not res!259186) (not e!227183))))

(assert (=> start!69952 (= res!259186 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8464 a1!825) (size!8464 a2!825)) (= (size!8464 a2!825) (size!8464 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8464 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8464 a2!825))))))))

(assert (=> start!69952 e!227183))

(assert (=> start!69952 true))

(declare-fun array_inv!8016 (array!19483) Bool)

(assert (=> start!69952 (array_inv!8016 a1!825)))

(assert (=> start!69952 (array_inv!8016 a3!79)))

(assert (=> start!69952 (array_inv!8016 a2!825)))

(declare-fun b!316086 () Bool)

(declare-fun res!259192 () Bool)

(assert (=> b!316086 (=> (not res!259192) (not e!227183))))

(assert (=> b!316086 (= res!259192 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!316087 () Bool)

(declare-fun res!259189 () Bool)

(assert (=> b!316087 (=> (not res!259189) (not e!227183))))

(assert (=> b!316087 (= res!259189 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316088 () Bool)

(declare-fun res!259190 () Bool)

(assert (=> b!316088 (=> (not res!259190) (not e!227183))))

(assert (=> b!316088 (= res!259190 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!316089 () Bool)

(assert (=> b!316089 (= e!227183 (not (or (not (= (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand i!1020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!316089 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21683 0))(
  ( (Unit!21684) )
))
(declare-fun lt!442806 () Unit!21683)

(declare-fun arrayBitRangesEqDrop1!0 (array!19483 array!19483 (_ BitVec 64) (_ BitVec 64)) Unit!21683)

(assert (=> b!316089 (= lt!442806 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316089 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442808 () Unit!21683)

(assert (=> b!316089 (= lt!442808 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316089 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442807 () Unit!21683)

(declare-fun arrayBitRangesEqAppend!0 (array!19483 array!19483 (_ BitVec 64) (_ BitVec 64)) Unit!21683)

(assert (=> b!316089 (= lt!442807 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(assert (= (and start!69952 res!259186) b!316088))

(assert (= (and b!316088 res!259190) b!316084))

(assert (= (and b!316084 res!259187) b!316087))

(assert (= (and b!316087 res!259189) b!316083))

(assert (= (and b!316083 res!259191) b!316086))

(assert (= (and b!316086 res!259192) b!316085))

(assert (= (and b!316085 res!259193) b!316082))

(assert (= (and b!316082 res!259188) b!316089))

(declare-fun m!453827 () Bool)

(assert (=> b!316083 m!453827))

(declare-fun m!453829 () Bool)

(assert (=> b!316088 m!453829))

(declare-fun m!453831 () Bool)

(assert (=> b!316084 m!453831))

(declare-fun m!453833 () Bool)

(assert (=> start!69952 m!453833))

(declare-fun m!453835 () Bool)

(assert (=> start!69952 m!453835))

(declare-fun m!453837 () Bool)

(assert (=> start!69952 m!453837))

(declare-fun m!453839 () Bool)

(assert (=> b!316085 m!453839))

(declare-fun m!453841 () Bool)

(assert (=> b!316086 m!453841))

(declare-fun m!453843 () Bool)

(assert (=> b!316089 m!453843))

(declare-fun m!453845 () Bool)

(assert (=> b!316089 m!453845))

(declare-fun m!453847 () Bool)

(assert (=> b!316089 m!453847))

(declare-fun m!453849 () Bool)

(assert (=> b!316089 m!453849))

(declare-fun m!453851 () Bool)

(assert (=> b!316089 m!453851))

(declare-fun m!453853 () Bool)

(assert (=> b!316089 m!453853))

(push 1)

(assert (not b!316088))

(assert (not b!316089))

(assert (not b!316085))

(assert (not b!316086))

(assert (not start!69952))

(assert (not b!316084))

(assert (not b!316083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

