; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69938 () Bool)

(assert start!69938)

(declare-fun b!315914 () Bool)

(declare-fun e!227100 () Bool)

(assert (=> b!315914 (= e!227100 (not true))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19469 0))(
  ( (array!19470 (arr!9540 (Array (_ BitVec 32) (_ BitVec 8))) (size!8457 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19469)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19469)

(declare-fun arrayBitRangesEq!0 (array!19469 array!19469 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315914 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-datatypes ((Unit!21669 0))(
  ( (Unit!21670) )
))
(declare-fun lt!442763 () Unit!21669)

(declare-fun arrayBitRangesEqDrop1!0 (array!19469 array!19469 (_ BitVec 64) (_ BitVec 64)) Unit!21669)

(assert (=> b!315914 (= lt!442763 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun a3!79 () array!19469)

(declare-fun from!878 () (_ BitVec 64))

(assert (=> b!315914 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442762 () Unit!21669)

(declare-fun arrayBitRangesEqAppend!0 (array!19469 array!19469 (_ BitVec 64) (_ BitVec 64)) Unit!21669)

(assert (=> b!315914 (= lt!442762 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315915 () Bool)

(declare-fun res!259025 () Bool)

(assert (=> b!315915 (=> (not res!259025) (not e!227100))))

(assert (=> b!315915 (= res!259025 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315916 () Bool)

(declare-fun res!259020 () Bool)

(assert (=> b!315916 (=> (not res!259020) (not e!227100))))

(assert (=> b!315916 (= res!259020 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315917 () Bool)

(declare-fun res!259018 () Bool)

(assert (=> b!315917 (=> (not res!259018) (not e!227100))))

(assert (=> b!315917 (= res!259018 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315918 () Bool)

(declare-fun res!259023 () Bool)

(assert (=> b!315918 (=> (not res!259023) (not e!227100))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315918 (= res!259023 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun res!259022 () Bool)

(assert (=> start!69938 (=> (not res!259022) (not e!227100))))

(assert (=> start!69938 (= res!259022 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8457 a1!825) (size!8457 a2!825)) (= (size!8457 a2!825) (size!8457 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8457 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8457 a2!825))))))))

(assert (=> start!69938 e!227100))

(assert (=> start!69938 true))

(declare-fun array_inv!8009 (array!19469) Bool)

(assert (=> start!69938 (array_inv!8009 a1!825)))

(assert (=> start!69938 (array_inv!8009 a3!79)))

(assert (=> start!69938 (array_inv!8009 a2!825)))

(declare-fun b!315919 () Bool)

(declare-fun res!259024 () Bool)

(assert (=> b!315919 (=> (not res!259024) (not e!227100))))

(assert (=> b!315919 (= res!259024 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!315920 () Bool)

(declare-fun res!259021 () Bool)

(assert (=> b!315920 (=> (not res!259021) (not e!227100))))

(assert (=> b!315920 (= res!259021 (not (= i!1020 mid!82)))))

(declare-fun b!315921 () Bool)

(declare-fun res!259019 () Bool)

(assert (=> b!315921 (=> (not res!259019) (not e!227100))))

(assert (=> b!315921 (= res!259019 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(assert (= (and start!69938 res!259022) b!315916))

(assert (= (and b!315916 res!259020) b!315918))

(assert (= (and b!315918 res!259023) b!315915))

(assert (= (and b!315915 res!259025) b!315921))

(assert (= (and b!315921 res!259019) b!315919))

(assert (= (and b!315919 res!259024) b!315917))

(assert (= (and b!315917 res!259018) b!315920))

(assert (= (and b!315920 res!259021) b!315914))

(declare-fun m!453659 () Bool)

(assert (=> start!69938 m!453659))

(declare-fun m!453661 () Bool)

(assert (=> start!69938 m!453661))

(declare-fun m!453663 () Bool)

(assert (=> start!69938 m!453663))

(declare-fun m!453665 () Bool)

(assert (=> b!315917 m!453665))

(declare-fun m!453667 () Bool)

(assert (=> b!315919 m!453667))

(declare-fun m!453669 () Bool)

(assert (=> b!315914 m!453669))

(declare-fun m!453671 () Bool)

(assert (=> b!315914 m!453671))

(declare-fun m!453673 () Bool)

(assert (=> b!315914 m!453673))

(declare-fun m!453675 () Bool)

(assert (=> b!315914 m!453675))

(declare-fun m!453677 () Bool)

(assert (=> b!315916 m!453677))

(declare-fun m!453679 () Bool)

(assert (=> b!315921 m!453679))

(declare-fun m!453681 () Bool)

(assert (=> b!315918 m!453681))

(push 1)

(assert (not b!315919))

(assert (not b!315916))

(assert (not b!315914))

(assert (not start!69938))

(assert (not b!315921))

(assert (not b!315918))

(assert (not b!315917))

(check-sat)

