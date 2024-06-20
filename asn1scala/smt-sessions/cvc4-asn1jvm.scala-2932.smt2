; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69758 () Bool)

(assert start!69758)

(declare-fun b!314015 () Bool)

(declare-fun res!257163 () Bool)

(declare-fun e!226051 () Bool)

(assert (=> b!314015 (=> (not res!257163) (not e!226051))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun mid!82 () (_ BitVec 64))

(assert (=> b!314015 (= res!257163 (not (= i!1020 mid!82)))))

(declare-fun b!314016 () Bool)

(declare-fun res!257168 () Bool)

(assert (=> b!314016 (=> (not res!257168) (not e!226051))))

(declare-datatypes ((array!19322 0))(
  ( (array!19323 (arr!9465 (Array (_ BitVec 32) (_ BitVec 8))) (size!8385 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19322)

(declare-fun a3!79 () array!19322)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19322 array!19322 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!314016 (= res!257168 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314017 () Bool)

(declare-fun res!257165 () Bool)

(assert (=> b!314017 (=> (not res!257165) (not e!226051))))

(declare-fun a2!825 () array!19322)

(assert (=> b!314017 (= res!257165 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun res!257162 () Bool)

(assert (=> start!69758 (=> (not res!257162) (not e!226051))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> start!69758 (= res!257162 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8385 a1!825) (size!8385 a2!825)) (= (size!8385 a2!825) (size!8385 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8385 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8385 a2!825))))))))

(assert (=> start!69758 e!226051))

(assert (=> start!69758 true))

(declare-fun array_inv!7937 (array!19322) Bool)

(assert (=> start!69758 (array_inv!7937 a1!825)))

(assert (=> start!69758 (array_inv!7937 a3!79)))

(assert (=> start!69758 (array_inv!7937 a2!825)))

(declare-fun b!314018 () Bool)

(declare-fun res!257164 () Bool)

(assert (=> b!314018 (=> (not res!257164) (not e!226051))))

(assert (=> b!314018 (= res!257164 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!314019 () Bool)

(declare-fun res!257167 () Bool)

(assert (=> b!314019 (=> (not res!257167) (not e!226051))))

(assert (=> b!314019 (= res!257167 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!314020 () Bool)

(declare-fun res!257166 () Bool)

(assert (=> b!314020 (=> (not res!257166) (not e!226051))))

(assert (=> b!314020 (= res!257166 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun b!314021 () Bool)

(assert (=> b!314021 (= e!226051 (not true))))

(assert (=> b!314021 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21561 0))(
  ( (Unit!21562) )
))
(declare-fun lt!442358 () Unit!21561)

(declare-fun arrayBitRangesEqAppend!0 (array!19322 array!19322 (_ BitVec 64) (_ BitVec 64)) Unit!21561)

(assert (=> b!314021 (= lt!442358 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!314022 () Bool)

(declare-fun res!257161 () Bool)

(assert (=> b!314022 (=> (not res!257161) (not e!226051))))

(assert (=> b!314022 (= res!257161 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(assert (= (and start!69758 res!257162) b!314022))

(assert (= (and b!314022 res!257161) b!314018))

(assert (= (and b!314018 res!257164) b!314019))

(assert (= (and b!314019 res!257167) b!314017))

(assert (= (and b!314017 res!257165) b!314020))

(assert (= (and b!314020 res!257166) b!314016))

(assert (= (and b!314016 res!257168) b!314015))

(assert (= (and b!314015 res!257163) b!314021))

(declare-fun m!451593 () Bool)

(assert (=> b!314016 m!451593))

(declare-fun m!451595 () Bool)

(assert (=> b!314022 m!451595))

(declare-fun m!451597 () Bool)

(assert (=> b!314020 m!451597))

(declare-fun m!451599 () Bool)

(assert (=> b!314017 m!451599))

(declare-fun m!451601 () Bool)

(assert (=> b!314018 m!451601))

(declare-fun m!451603 () Bool)

(assert (=> start!69758 m!451603))

(declare-fun m!451605 () Bool)

(assert (=> start!69758 m!451605))

(declare-fun m!451607 () Bool)

(assert (=> start!69758 m!451607))

(declare-fun m!451609 () Bool)

(assert (=> b!314021 m!451609))

(declare-fun m!451611 () Bool)

(assert (=> b!314021 m!451611))

(push 1)

(assert (not b!314017))

(assert (not b!314021))

(assert (not b!314022))

(assert (not b!314020))

(assert (not b!314018))

(assert (not b!314016))

(assert (not start!69758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

