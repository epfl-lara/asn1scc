; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69812 () Bool)

(assert start!69812)

(declare-fun res!257814 () Bool)

(declare-fun e!226373 () Bool)

(assert (=> start!69812 (=> (not res!257814) (not e!226373))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19376 0))(
  ( (array!19377 (arr!9492 (Array (_ BitVec 32) (_ BitVec 8))) (size!8412 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19376)

(declare-fun a3!79 () array!19376)

(declare-fun to!845 () (_ BitVec 64))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19376)

(assert (=> start!69812 (= res!257814 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8412 a1!825) (size!8412 a2!825)) (= (size!8412 a2!825) (size!8412 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8412 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8412 a2!825))))))))

(assert (=> start!69812 e!226373))

(assert (=> start!69812 true))

(declare-fun array_inv!7964 (array!19376) Bool)

(assert (=> start!69812 (array_inv!7964 a1!825)))

(assert (=> start!69812 (array_inv!7964 a3!79)))

(assert (=> start!69812 (array_inv!7964 a2!825)))

(declare-fun b!314663 () Bool)

(declare-fun res!257813 () Bool)

(assert (=> b!314663 (=> (not res!257813) (not e!226373))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19376 array!19376 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314663 (= res!257813 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314664 () Bool)

(declare-fun res!257815 () Bool)

(assert (=> b!314664 (=> (not res!257815) (not e!226373))))

(assert (=> b!314664 (= res!257815 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314665 () Bool)

(declare-fun res!257810 () Bool)

(assert (=> b!314665 (=> (not res!257810) (not e!226373))))

(assert (=> b!314665 (= res!257810 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!314666 () Bool)

(declare-fun res!257811 () Bool)

(assert (=> b!314666 (=> (not res!257811) (not e!226373))))

(assert (=> b!314666 (= res!257811 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314667 () Bool)

(declare-fun res!257816 () Bool)

(assert (=> b!314667 (=> (not res!257816) (not e!226373))))

(assert (=> b!314667 (= res!257816 (not (= i!1020 mid!82)))))

(declare-fun b!314668 () Bool)

(assert (=> b!314668 (= e!226373 (not true))))

(assert (=> b!314668 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21615 0))(
  ( (Unit!21616) )
))
(declare-fun lt!442529 () Unit!21615)

(declare-fun arrayBitRangesEqDrop1!0 (array!19376 array!19376 (_ BitVec 64) (_ BitVec 64)) Unit!21615)

(assert (=> b!314668 (= lt!442529 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!314668 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442528 () Unit!21615)

(assert (=> b!314668 (= lt!442528 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!314668 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442527 () Unit!21615)

(declare-fun arrayBitRangesEqAppend!0 (array!19376 array!19376 (_ BitVec 64) (_ BitVec 64)) Unit!21615)

(assert (=> b!314668 (= lt!442527 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314669 () Bool)

(declare-fun res!257812 () Bool)

(assert (=> b!314669 (=> (not res!257812) (not e!226373))))

(assert (=> b!314669 (= res!257812 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314670 () Bool)

(declare-fun res!257809 () Bool)

(assert (=> b!314670 (=> (not res!257809) (not e!226373))))

(assert (=> b!314670 (= res!257809 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69812 res!257814) b!314670))

(assert (= (and b!314670 res!257809) b!314669))

(assert (= (and b!314669 res!257812) b!314666))

(assert (= (and b!314666 res!257811) b!314665))

(assert (= (and b!314665 res!257810) b!314664))

(assert (= (and b!314664 res!257815) b!314663))

(assert (= (and b!314663 res!257813) b!314667))

(assert (= (and b!314667 res!257816) b!314668))

(declare-fun m!452245 () Bool)

(assert (=> b!314669 m!452245))

(declare-fun m!452247 () Bool)

(assert (=> b!314665 m!452247))

(declare-fun m!452249 () Bool)

(assert (=> start!69812 m!452249))

(declare-fun m!452251 () Bool)

(assert (=> start!69812 m!452251))

(declare-fun m!452253 () Bool)

(assert (=> start!69812 m!452253))

(declare-fun m!452255 () Bool)

(assert (=> b!314664 m!452255))

(declare-fun m!452257 () Bool)

(assert (=> b!314668 m!452257))

(declare-fun m!452259 () Bool)

(assert (=> b!314668 m!452259))

(declare-fun m!452261 () Bool)

(assert (=> b!314668 m!452261))

(declare-fun m!452263 () Bool)

(assert (=> b!314668 m!452263))

(declare-fun m!452265 () Bool)

(assert (=> b!314668 m!452265))

(declare-fun m!452267 () Bool)

(assert (=> b!314668 m!452267))

(declare-fun m!452269 () Bool)

(assert (=> b!314663 m!452269))

(declare-fun m!452271 () Bool)

(assert (=> b!314670 m!452271))

(push 1)

(assert (not start!69812))

