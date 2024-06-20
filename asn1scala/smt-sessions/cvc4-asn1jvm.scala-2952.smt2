; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69914 () Bool)

(assert start!69914)

(declare-fun b!315626 () Bool)

(declare-fun res!258731 () Bool)

(declare-fun e!226957 () Bool)

(assert (=> b!315626 (=> (not res!258731) (not e!226957))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19445 0))(
  ( (array!19446 (arr!9528 (Array (_ BitVec 32) (_ BitVec 8))) (size!8445 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19445)

(declare-fun from!878 () (_ BitVec 64))

(declare-fun a2!825 () array!19445)

(declare-fun arrayBitRangesEq!0 (array!19445 array!19445 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!315626 (= res!258731 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun b!315627 () Bool)

(assert (=> b!315627 (= e!226957 (not true))))

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a3!79 () array!19445)

(assert (=> b!315627 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-datatypes ((Unit!21645 0))(
  ( (Unit!21646) )
))
(declare-fun lt!442709 () Unit!21645)

(declare-fun arrayBitRangesEqAppend!0 (array!19445 array!19445 (_ BitVec 64) (_ BitVec 64)) Unit!21645)

(assert (=> b!315627 (= lt!442709 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315628 () Bool)

(declare-fun res!258733 () Bool)

(assert (=> b!315628 (=> (not res!258733) (not e!226957))))

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!315628 (= res!258733 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!315629 () Bool)

(declare-fun res!258732 () Bool)

(assert (=> b!315629 (=> (not res!258732) (not e!226957))))

(assert (=> b!315629 (= res!258732 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!315630 () Bool)

(declare-fun res!258730 () Bool)

(assert (=> b!315630 (=> (not res!258730) (not e!226957))))

(assert (=> b!315630 (= res!258730 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!315631 () Bool)

(declare-fun res!258736 () Bool)

(assert (=> b!315631 (=> (not res!258736) (not e!226957))))

(assert (=> b!315631 (= res!258736 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun res!258737 () Bool)

(assert (=> start!69914 (=> (not res!258737) (not e!226957))))

(assert (=> start!69914 (= res!258737 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8445 a1!825) (size!8445 a2!825)) (= (size!8445 a2!825) (size!8445 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8445 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8445 a2!825))))))))

(assert (=> start!69914 e!226957))

(assert (=> start!69914 true))

(declare-fun array_inv!7997 (array!19445) Bool)

(assert (=> start!69914 (array_inv!7997 a1!825)))

(assert (=> start!69914 (array_inv!7997 a3!79)))

(assert (=> start!69914 (array_inv!7997 a2!825)))

(declare-fun b!315632 () Bool)

(declare-fun res!258734 () Bool)

(assert (=> b!315632 (=> (not res!258734) (not e!226957))))

(assert (=> b!315632 (= res!258734 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!315633 () Bool)

(declare-fun res!258735 () Bool)

(assert (=> b!315633 (=> (not res!258735) (not e!226957))))

(assert (=> b!315633 (= res!258735 (not (= i!1020 mid!82)))))

(assert (= (and start!69914 res!258737) b!315626))

(assert (= (and b!315626 res!258731) b!315628))

(assert (= (and b!315628 res!258733) b!315632))

(assert (= (and b!315632 res!258734) b!315630))

(assert (= (and b!315630 res!258730) b!315631))

(assert (= (and b!315631 res!258736) b!315629))

(assert (= (and b!315629 res!258732) b!315633))

(assert (= (and b!315633 res!258735) b!315627))

(declare-fun m!453399 () Bool)

(assert (=> start!69914 m!453399))

(declare-fun m!453401 () Bool)

(assert (=> start!69914 m!453401))

(declare-fun m!453403 () Bool)

(assert (=> start!69914 m!453403))

(declare-fun m!453405 () Bool)

(assert (=> b!315626 m!453405))

(declare-fun m!453407 () Bool)

(assert (=> b!315627 m!453407))

(declare-fun m!453409 () Bool)

(assert (=> b!315627 m!453409))

(declare-fun m!453411 () Bool)

(assert (=> b!315630 m!453411))

(declare-fun m!453413 () Bool)

(assert (=> b!315631 m!453413))

(declare-fun m!453415 () Bool)

(assert (=> b!315628 m!453415))

(declare-fun m!453417 () Bool)

(assert (=> b!315629 m!453417))

(push 1)

(assert (not start!69914))

(assert (not b!315629))

(assert (not b!315631))

(assert (not b!315628))

(assert (not b!315627))

(assert (not b!315630))

(assert (not b!315626))

(check-sat)

